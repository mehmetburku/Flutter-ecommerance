
import 'dart:typed_data';

import 'package:eticaret_mobil_app/const.dart';
import 'package:eticaret_mobil_app/controllers/auth_controller.dart';
import 'package:eticaret_mobil_app/views/screens/auth/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';


class SignUpScreen extends StatefulWidget {
  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _fullNameController = TextEditingController();

  final TextEditingController _usernameController = TextEditingController();

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  final TextEditingController _phoneNumberController = TextEditingController();

  Uint8List? _image;
  bool _isLoading = false;


  selectImage() async{
    Uint8List im=await AuthController().pickImage(ImageSource.gallery);
    setState(() {
      _image = im;
    });
  }

  SignUpUser()async{
    setState(() {
      _isLoading=true;
    });
    String res = await AuthController().signUpUsers(
      _fullNameController.text, 
      _usernameController.text, 
      _emailController.text,
      _phoneNumberController.text,
      _passwordController.text,
      _image);
      setState(() {
        _isLoading=false;
      });
  if (res !='success') {
    return showSnackBar(res, context);
  }else{
    return showSnackBar('Hesabınız oluşturuldu.', context);
  }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                children: [
                  _image!=null?
                  CircleAvatar(
                    radius: 64,
                    backgroundColor: Colors.blue,
                    backgroundImage: MemoryImage(_image!),
                  ):CircleAvatar(
                    radius: 64,
                    backgroundColor: Colors.blue,
                    backgroundImage: NetworkImage('https://www.pngitem.com/pimgs/m/150-1503945_transparent-user-png-default-user-image-png-png.png'),
                  ),
                  Positioned(
                    right: 5,
                    bottom: 10,
                    child: InkWell(
                      onTap: selectImage,
                      child: Icon(Icons.add_a_photo)),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                controller: _fullNameController,
                decoration: InputDecoration(
                  filled: true,
                  hintText: 'Enter your full name',
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black,),),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                controller: _usernameController,
                decoration: InputDecoration(
                  filled: true,
                  hintText: 'Enter your username',
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black,),),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  filled: true,
                  hintText: 'Enter your Email',
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black,),),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                controller: _phoneNumberController,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  filled: true,
                  hintText: 'Enter your phone number',
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black,),),
                ),
              ),
        
              SizedBox(
                height: 20,
              ),
              TextField(
                obscureText: true,
                controller: _passwordController,
                decoration: InputDecoration(
                  filled: true,
                  hintText: 'Enter your password',
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black,),),
                ),
              ),
              SizedBox(height: 20,),
              Container(
                width: MediaQuery.of(context).size.width -40,
                height: 50,
                decoration: BoxDecoration(
                  color: buttonColor,
                ),
                child: Center(
                  child: InkWell(
                    onTap: () {
                      SignUpUser();
                      _fullNameController.clear();
                      _usernameController.clear();
                      _emailController.clear();
                      _passwordController.clear();
                      _image!.clear(); 
                    },
                    child: _isLoading? Center(child: CircularProgressIndicator(color: Colors.white,),): Text(
                      'Kayıt Ol',
                      style: TextStyle(
                        color: textButtonColor,
                        fontWeight: FontWeight.bold, 
                        fontSize: 24,
                                   ),
                                  ),
                  ),
               ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Zaten hesabınız var mı?', 
                    style: TextStyle(fontSize: 18, 
                    fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                    ),
                   InkWell(
                     onTap: (){
                       Navigator.of(context).push(MaterialPageRoute(builder: (context)=>LoginScreen()));
                     },
                     child: Text(
                       'Giriş Yap', 
                       style: TextStyle(
                         fontSize: 18, 
                         fontWeight: FontWeight.bold,
                      ),
                                   ),
                   ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}