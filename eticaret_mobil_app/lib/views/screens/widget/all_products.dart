


import 'package:eticaret_mobil_app/models/clothes.dart';
import 'package:eticaret_mobil_app/views/screens/widget/products.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../models/products.dart';
import '../../../provider/products.dart';

class AllProduct extends StatelessWidget {
  final clotheList =Clothes.generateClothes();
  @override
  Widget build(BuildContext context) {
    final _productsProvider = Provider.of<Products>(context);
    List<Product> _productList = _productsProvider.products;
    return Container(
      child: Column(children: [
        Container(
          height: 280,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => ChangeNotifierProvider.value(
              value: _productList[index],
              child: ProductsItem(
               
                index: index,
                ),
            ), 
            separatorBuilder: (_,index)=>SizedBox(width: 8,),
            itemCount: _productList.length,
            ), 
            ),
          ],
      ),
    );
  }
}