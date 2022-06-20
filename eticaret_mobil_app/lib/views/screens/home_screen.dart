



import 'package:eticaret_mobil_app/provider/order.dart';
import 'package:eticaret_mobil_app/provider/products.dart';
import 'package:eticaret_mobil_app/views/screens/widget/all_products.dart';
import 'package:eticaret_mobil_app/views/screens/widget/category.dart';
import 'package:eticaret_mobil_app/views/screens/widget/category_list.dart';
import 'package:eticaret_mobil_app/views/screens/widget/customApp_bar.dart';
import 'package:eticaret_mobil_app/views/screens/widget/search_input.dart';
import 'package:eticaret_mobil_app/views/screens/widget/tagList.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _productsProvider = Provider.of<Products>(context);
    _productsProvider.fetchProducts();
    final orderProvider= Provider.of<Orders>(context);
    orderProvider.fetchOrders();  
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomAppBar(),
            SearchInput(),
            TagList(),
            Category(),
            CategoryList(),
            AllProduct(),
          ],
        ),
      )
    );
  }
}