


import 'package:eticaret_mobil_app/provider/cart_provider.dart';
import 'package:eticaret_mobil_app/provider/products.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetailPage extends StatelessWidget {
static const String id='detailPage';

  @override
  Widget build(BuildContext context) {
     final productData = Provider.of<Products>(context);
     final _cartProvider = Provider.of<CartProvider>(context);
     final productId = ModalRoute.of(context)!.settings.arguments as String;
     final productAttr = productData.findById(productId);

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                height: 500,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                      '${productAttr.imageUrl}',
                    ),
                    fit: BoxFit.fitHeight,
                  ),
                  borderRadius: BorderRadius.circular(10,
                  ),
                ),
              ),
              Positioned(
                left: 15,
                top: 35,
                child: InkWell(
                  onTap: (){
                    Navigator.of(context).pop();
                  },
                  child: Container( 
                    padding: EdgeInsets.all(5,),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.9,),
                      shape: BoxShape.circle,
                      ),
                  child: Icon(
                    Icons.arrow_back_ios,
                  color: Colors.black,
                  ),
                 ),
                ),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 25,
              vertical: 10,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('${productAttr.title}', style: TextStyle(fontSize:  22, fontWeight: FontWeight.bold,
                ),
              ),
              Container(child: Icon(Icons.favorite,
              color: Colors.red,
              size: 15,
              ),
             ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25,),
          child: Text(
            '${productAttr.description}', 
            style: TextStyle(
              height: 1.7,
              fontSize: 15,
              
            ),
          ),
         ),
         SizedBox(height: 80,),
         Padding(
           padding: const EdgeInsets.symmetric(horizontal: 25,),
           child: Row(
            children: [
              Column(
                children: [
                  Text(
                    'Fiyat',
                    style:  TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: Colors.grey),
                  ),
                  Text('${productAttr.price} TL',style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),)
                ],
              ),
              SizedBox(width: 15,),
              Expanded(
                child: Container(
                  height: 58,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15,),
                      ),
                      primary: Colors.black,
                    ),
                    onPressed: _cartProvider.getCartItem.containsKey(productId)?null:(){
                      _cartProvider.addProductToCart(
                        productAttr.id,
                        productAttr.price, 
                        productAttr.title, 
                        productAttr.imageUrl);
                    }, 
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(_cartProvider.getCartItem.containsKey(productId)
                        ?'Sepetinde':
                          'Sepete Ekle',
                        style: TextStyle(fontSize: 20,
                        ),
                        ),
                        SizedBox(width: 10,),
                        Icon(Icons.shopping_cart_outlined,),
                      ],
                    ),
                  ),
                ),
              ),
            ],
           ),
         ),
       ],
      ),
    );
  }
}