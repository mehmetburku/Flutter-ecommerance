

import 'package:eticaret_mobil_app/models/cart_artt.dart';
import 'package:eticaret_mobil_app/provider/cart_provider.dart';
import 'package:eticaret_mobil_app/views/screens/detail/detail_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartItem extends StatelessWidget {
  final String productId;

  const CartItem({Key? key, required this.productId});
  @override
  Widget build(BuildContext context) {
    final _carrAttr = Provider.of<CartAttr>(context);
    final _cartProvider = Provider.of<CartProvider>(context); 

    double subtotal = (_carrAttr.price * _carrAttr.quantity);
    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, DetailPage.id,);
      },
      child: Container(
        margin: EdgeInsets.all(10,),
        height: 160,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10
        ),
        color: Colors.white70,
        ),
        child: Row(
          children: [
            Container(
              width: 130,
              decoration: BoxDecoration(image: DecorationImage(image: NetworkImage('${_carrAttr.imageUrl}'
               ),
               fit: BoxFit.cover,
              ),
             ),
            ),
            SizedBox(width: 10,),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10,),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('${_carrAttr.title}',style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500
                        ),
                        ),
    
                        IconButton(
                          onPressed: (){
                            _cartProvider.removeCartItem(productId);
                          }, 
                          icon: Icon(
                            CupertinoIcons.delete_left,
                            color: Colors.red,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        'Fiyat:',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(width: 10,),
                      Text('${_carrAttr.price}TL', style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,
                      ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10,),
                  Row(
                    children: [
                      Text(
                        'Toplam:',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(width: 10,),
                      Text(
                        '${subtotal}TL', 
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.pink
                      ),
                      ),
                    ],
                  ),
                  SizedBox(height: 5,),
                  Row(
                    children: [
                      Text(
                        'Adet:  ',
                        style: TextStyle(
                          fontSize: 16, 
                          fontWeight: FontWeight.w500,), 
                      ),
                      IconButton(onPressed: (){
                        _cartProvider.reductCartItem(productId, _carrAttr.price, _carrAttr.title,_carrAttr.imageUrl);
                      }, 
                      icon: Icon(CupertinoIcons.minus_rectangle
                       ),
                      ),
                      Card(
                        elevation: 5,
                        child: Container(
                          width: 50,
                          height: 20,
                          decoration: BoxDecoration(
                            color: Colors.pink,
                          ),
                          child: Center(
                            child: Text(
                              '${_carrAttr.quantity}',
                              style: TextStyle(color: Colors.white),
                              ),
                          ),
                        ),
                      ),
                      IconButton(onPressed: (){
                        _cartProvider.addProductToCart(productId, _carrAttr.price, _carrAttr.title, _carrAttr.imageUrl);
                      }, 
                      icon: Icon(CupertinoIcons.add,),),
                    ],
                  ),
                ],
              ),
            )
           ],
          ),
      ),
    );
  }
}