
import 'package:eticaret_mobil_app/const.dart';
import 'package:eticaret_mobil_app/models/order_attr.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OrderItem extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final orderList = Provider.of<OrderAttr>(context);
    return GestureDetector(
      onTap: (){
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
              decoration: BoxDecoration(image: DecorationImage(image: NetworkImage(orderList.imageUrl
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
                        Text(orderList.title ,style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500
                        ),
                        ),
    
                        IconButton(
                          onPressed: (){
                            firebaseStore.collection('orders').doc(orderList.orderId).delete();
                          }, 
                          icon: Icon(
                            CupertinoIcons.delete_left,
                            color: Colors.blue,
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
                      Text(orderList.price, style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,
                      ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10,),
                  
                 
                  
                ],
              ),
            )
           ],
          ),
      ),
    );
  }
}