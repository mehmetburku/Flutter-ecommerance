
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eticaret_mobil_app/const.dart';
import 'package:eticaret_mobil_app/provider/cart_provider.dart';
import 'package:eticaret_mobil_app/views/screens/widget/cart_empty.dart';
import 'package:eticaret_mobil_app/views/screens/widget/cart_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

class CartScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var uuid = Uuid();
    final _cartProvider=Provider.of<CartProvider>(context);
    return _cartProvider.getCartItem.isNotEmpty? Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white70,
        title: Text(
          'Cart (${_cartProvider.getCartItem.length})',
          style: TextStyle(
            color: Colors.black,
            fontSize: 17,
            fontWeight: FontWeight.w500,
        ),
       ),
       actions: [
        IconButton(onPressed: (){
          _cartProvider.clearCartData();
        }, 
        icon: Icon(CupertinoIcons.trash,),),
       ],
      ),
      body: ListView.builder(
        itemCount: _cartProvider.getCartItem.length,
        itemBuilder: (BuildContext context, int index){
        return ChangeNotifierProvider.value(
          value: _cartProvider.getCartItem.values.toList()[index],
          child: CartItem(
            productId: _cartProvider.getCartItem.keys.toList()[index],
          ),
          );
      }),
      bottomSheet: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            Expanded(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8,
                  ),
                  ),
                  primary: Colors.black,
                ),
                onPressed: () async {

                  _cartProvider.getCartItem.forEach((key, orderValue) async{
                    final orderId =uuid.v4();
                    await firebaseStore
                    .collection('orders')
                    .doc(orderId)
                    .set({
                      'orderId': orderId,
                      'userId' : firebaseAuth.currentUser!.uid,
                      'title' : orderValue.title,
                      'price' : orderValue.price,
                      'imageUrl' : orderValue.imageUrl,
                      'quantity': orderValue.quantity,
                      'orderDate' :Timestamp.now()
                    });
                  });
                }, 
                child: Text(
                  'Checout',
                style: TextStyle(fontWeight: FontWeight.w500,),
                ),
               ),
              ),
              Spacer(),
              Text(
                'Toplam:',
                style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold,),
              ),
              SizedBox(width: 5,),
              Text(
                '${_cartProvider.totalAmount.toStringAsFixed(3)}TL',
                style: TextStyle(fontWeight: FontWeight.w700,),
               ), 
            ],
          ),
      ),
    ):Scaffold(
      body: CartEmpty(),
    );
  }
}