

import 'package:badges/badges.dart';
import 'package:eticaret_mobil_app/models/products.dart';
import 'package:eticaret_mobil_app/views/screens/detail/detail_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../provider/products.dart';

class FeedsProducts extends StatefulWidget {


  @override
  State<FeedsProducts> createState() => _FeedsProductsState();
}

class _FeedsProductsState extends State<FeedsProducts> {
  
  @override
  Widget build(BuildContext context) {
    final products = Provider.of<Product>(context);
    final _productsProvider = Provider.of<Products>(context);
    return Container(
      margin: EdgeInsets.only(left: 5, right: 5),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15),
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: (){
            Navigator.of(context).pushNamed(DetailPage.id, arguments: products.id);
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                children: [
                  Container(
                    height: 170,
                    width: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        15,
                      ),
                      image: DecorationImage(image: NetworkImage(
                          products.imageUrl,),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  Positioned(
                    left: 5,
                    top: 15,
                    child: Badge(
                      toAnimate: true,
                      shape: BadgeShape.square,
                      badgeColor: Colors.pink,
                      borderRadius: BorderRadius.circular(8),
                      badgeContent: Text('New ', style: TextStyle(color: Colors.white)),
                      ),
                  ),
                ],
              ),
              Text(
                products.title,
              style: TextStyle(fontWeight: FontWeight.bold,
              height: 1.6,
              ),
              ),
              Text(
               '${products.price} TL',
              style: TextStyle(fontWeight: FontWeight.bold,
              height: 1.6,
               ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}