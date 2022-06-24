
import 'package:eticaret_mobil_app/models/products.dart';
import 'package:eticaret_mobil_app/provider/products.dart';
import 'package:eticaret_mobil_app/views/screens/widget/freed_products.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearcScreen extends StatefulWidget {
  @override
  State<SearcScreen> createState() => _SearcScreenState();
}

class _SearcScreenState extends State<SearcScreen> {
  final TextEditingController _searchController =TextEditingController();
  List<Product> _serachList =[];

  @override
  Widget build(BuildContext context) {
    final productData =Provider.of<Products>(context);

    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        title: TextField(
          controller: _searchController,
            decoration: InputDecoration(
              fillColor: Colors.white,
              filled: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide.none,
              ),
              hintText: "Serarh for Products",
              hintStyle: TextStyle(
                color: Colors.grey,
              ),
              prefixIcon: Container(
                padding: EdgeInsets.all(15),
                child: Image.asset('assets/icons/search.png',width: 15,
              ),
             ),
             suffixIcon: GestureDetector(
              onTap: (){
                _searchController.clear();
              },
              child: Icon(Icons.clear,)),
            ),
            onChanged: (value){
              _searchController.text.toLowerCase();
              setState(() {
                _serachList =productData.serachQuery(_searchController.text);
              });
            },
          ),
      ),

      body: _serachList.isEmpty?Center(
        child: Text(
          'Ürünleri Ara',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,),
          ),): GridView.count(
        crossAxisCount: 2, 
        childAspectRatio: 240/320,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        children: List.generate(_serachList.length, (index) => ChangeNotifierProvider.value(
          value: _serachList[index],
          child: FeedsProducts(),),),
      ),
    );
  }
}