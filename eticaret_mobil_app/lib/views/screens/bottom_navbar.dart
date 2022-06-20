
import 'package:eticaret_mobil_app/const.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/products.dart';

class BottomNavBar extends StatefulWidget {
  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int pageIndex=0;

  @override
  Widget build(BuildContext context) {
    final _productsProvider = Provider.of<Products>(context);
    _productsProvider.fetchProducts();
    return Scaffold(
      bottomNavigationBar: CupertinoTabBar(
        onTap: (index){
          setState(() {
            pageIndex=index;
          });  
        },
        currentIndex:  pageIndex,
        activeColor: textButtonColor,
        inactiveColor: Colors.white,
        backgroundColor: backgroundColor, 
        items: [ 
        BottomNavigationBarItem(icon: Icon(Icons.home,size: 30,), label: 'Anasayfa',),
        BottomNavigationBarItem(icon: Icon(Icons.rss_feed, size: 30,), label: 'Ürünler'),
        BottomNavigationBarItem(icon: Icon(Icons.search, size: 30,), label: 'Arama'),
        BottomNavigationBarItem(icon: Icon(Icons.shopping_bag, size: 30,), label: 'Sepetim'),
        BottomNavigationBarItem(icon: Icon(Icons.upload, size: 30,), label: 'Yükle'),
        BottomNavigationBarItem(icon: Icon(Icons.person, size: 30,), label: 'Hesabım'),
      ],),
      body: pages[pageIndex],
    );
  }
}