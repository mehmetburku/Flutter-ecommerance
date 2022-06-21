


import 'package:flutter/widgets.dart';

class OrderAttr with  ChangeNotifier{
  final String orderId;
  final String userId;
  final String productId;
  final String title;
  final String price;
  final String imageUrl;
  final String quantity;

  OrderAttr({
    required this.orderId, 
    required this.userId, 
    required this.productId, 
    required this.title, 
    required this.price, 
    required this.imageUrl, 
    required this.quantity, 
    });



}