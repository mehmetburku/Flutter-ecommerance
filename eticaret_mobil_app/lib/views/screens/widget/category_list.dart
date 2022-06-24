

import 'package:eticaret_mobil_app/views/screens/feeds_screen.dart';
import 'package:flutter/material.dart';

class CategoryList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 25, vertical: 25,),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
        Text(
          'New Arrival', 
          style: TextStyle(
            fontSize: 22, 
            fontWeight: FontWeight.bold,
          ),
         ),
         Row(
          children: [
            GestureDetector(
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context){
                  return FeedsScreen();
                }));
              },
              child: Text(
                'View All',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Container(
              padding: EdgeInsets.all(5,),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(10,),
              ),
              child: GestureDetector(
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context){
                  return FeedsScreen();
                }));                    
                },
                child: Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white,
                          ),
              ),
           ),
          ],
         )
       ],
      ),
    );
  }
}