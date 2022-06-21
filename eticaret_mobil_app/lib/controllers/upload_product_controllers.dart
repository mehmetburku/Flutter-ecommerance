

import 'dart:io';

import 'package:eticaret_mobil_app/const.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:uuid/uuid.dart';

class UploadProductController{
  _uploadImagetToStorage(File? imageUrl, String id)async{
    Reference ref = firebaseStorage
    .ref()
    .child('products')
    .child(firebaseAuth.currentUser!.uid + '_' + id);
    UploadTask uploadTask = ref.putFile(imageUrl!);
    TaskSnapshot snap=await uploadTask;
    String downloadUrl =await snap.ref.getDownloadURL();
    return downloadUrl; 
  }
  var uuid =Uuid();
  Future<String> uploadProducts(
    String title, 
    String id, 
    var price, 
    String productCategoryName, 
    String description, 
    var quantity, 
    File? imageUrl) async {
    String res = 'Something happend';
    try {
      final productId = uuid.v4();
      if ( title.isNotEmpty &&
      price.isNotEmpty && 
      productCategoryName.isNotEmpty && 
      description.isNotEmpty &&
      quantity.isNotEmpty && 
      imageUrl != null){
        String downloadUrl =await _uploadImagetToStorage(imageUrl, id);
        await firebaseStore.collection('products').doc(productId).set({
          'title':title,
          'id':id,
          'price':price,
          'productCategoryName':productCategoryName,
          'description':description,
          'quantity':quantity,
          'imageUrl':downloadUrl,
        });
      }
    } catch (e) {}
    return res;
  }
}