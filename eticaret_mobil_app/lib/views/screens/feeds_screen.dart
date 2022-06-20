
import 'package:eticaret_mobil_app/provider/products.dart';
import 'package:eticaret_mobil_app/views/screens/widget/freed_products.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/products.dart';

class FeedsScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final productsProvider = Provider.of<Products>(context);
    List<Product>productsList =productsProvider.products;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          'Feed Products',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 8,
        childAspectRatio: 240/320,
        children: List.generate(
          productsList.length, 
        (index) => ChangeNotifierProvider.value(
          value: productsList[index],
          child: FeedsProducts()),
         ),
        ),
    );
  }
}