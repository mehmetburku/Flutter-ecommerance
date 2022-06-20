
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eticaret_mobil_app/views/screens/cart_screen.dart';
import 'package:eticaret_mobil_app/views/screens/feeds_screen.dart';
import 'package:eticaret_mobil_app/views/screens/home_screen.dart';
import 'package:eticaret_mobil_app/views/screens/profile_screen.dart';
import 'package:eticaret_mobil_app/views/screens/search_screen.dart';
import 'package:eticaret_mobil_app/views/screens/upload_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';


//Pages

List pages =[
  HomeScreen(),
  FeedsScreen(),
  SearcScreen(),
  CartScreen(),
  UploadProductForm(),
  ProfileScreen(),
];


var backgroundColor=Colors.black;

var buttonColor = Colors.black;

var textButtonColor = Colors.white;

//FİREBASE
var firebaseAuth = FirebaseAuth.instance;

var firebaseStore = FirebaseFirestore.instance;

var firebaseStorage = FirebaseStorage.instance;
