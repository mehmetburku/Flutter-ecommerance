


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import '../models/products.dart';

class Products with ChangeNotifier{
List<Product> _products=[];

  Future<void> fetchProducts()async{
    await FirebaseFirestore.instance
    .collection('products')
    .get()
    .then((QuerySnapshot productSnapShot) {
       _products=[];
  productSnapShot.docs.forEach((element) { 
      _products.insert(
        0, 
        Product(
          id: element.get('id'), 
          title: element.get('title'), 
          description: element.get('description'), 
          price: double.parse(element.get('price')), 
          imageUrl: element.get('imageUrl'), 
          productCategoryname: element.get('productCategoryname'), 
          quantity: int.parse(element.get('quantity'),
          )));
         notifyListeners();
      });
    });
  }
  Product findById(String productId){
    return _products.firstWhere((element) => element.id==productId,);
  }
  List<Product>get products{
    return  _products;
  }

  List<Product> findByCategory(String categoryName){
    List _categoryList =_products.where((element) => element.productCategoryname.toLowerCase().contains(categoryName.toLowerCase())).toList();
    return [..._categoryList]; 
  }
  notifyListeners();
}