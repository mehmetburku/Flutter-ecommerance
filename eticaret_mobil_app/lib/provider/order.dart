import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eticaret_mobil_app/const.dart';
import 'package:eticaret_mobil_app/models/order_attr.dart';
import 'package:flutter/cupertino.dart';
final _orders = firebaseAuth.currentUser!.uid;

class Orders with ChangeNotifier{
List<OrderAttr> _orders = [];
  List<OrderAttr> get getOrders {
    return _orders;
  }

  Future<void> fetchOrders() async {
    await FirebaseFirestore.instance
        .collection('orders')
        .where('userId', isEqualTo: firebaseAuth.currentUser!.uid)
        .get()
        .then((QuerySnapshot orderSnapshot) {
      _orders.clear();
      orderSnapshot.docs.forEach((element) {
        _orders.insert(
          0,
          OrderAttr(
            orderId: element.get('orderId'),
            userId: element.get('userId'),
            productId: element.get('productId'),
            title: element.get('title'),
            price: element.get('price').toString(),
            imageUrl: element.get('imageUrl'),
            quantity: element.get('quantity').toString(), 
            orderDate: element.get('orderDate'),
          ),
        );
        notifyListeners();
      });
    });
  }
  }