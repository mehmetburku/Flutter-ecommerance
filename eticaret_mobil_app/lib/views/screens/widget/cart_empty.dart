


import 'package:flutter/material.dart';

class CartEmpty extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 90,),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height*0.4,
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage('assets/images/emptycart.png',),),
            ),
          ),
          Text('Your Cart is Empty',style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold,),
          ),
          SizedBox(height: 15,),
          Container(
            width: MediaQuery.of(context).size.width -40,
            child:  ElevatedButton(
              onPressed: (){}, 
              child: Center(
                child: Text('Shop Now',style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),),
                ),
              style:  ElevatedButton.styleFrom(
                primary: Colors.pink,
                shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0),
                ),
              ),
           ),
          )
        ],
      ),
    );
  }
  
}

