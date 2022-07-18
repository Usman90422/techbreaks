import 'dart:async';
import 'package:flutter/material.dart';
import 'home.dart';

class Splash_Screen extends StatefulWidget {

  @override
  _Splash_ScreenState createState() => _Splash_ScreenState();
}

class _Splash_ScreenState extends State<Splash_Screen> {

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3),() async{
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>  const Home()));
    });
  }

  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.of(context).size;
    return  Scaffold(
      backgroundColor: Colors.white,
      body:  Container(
        width: size.width,
        height: size.height,
        decoration: const BoxDecoration(
        image: DecorationImage(
        image: AssetImage("images/background.jpg"), fit: BoxFit.cover),
    ),
      child: Center(
        child: SizedBox(
            width: size.width*0.6,
            child: const Image(image: AssetImage("images/logo.png",),fit: BoxFit.cover)),
      ),),
    );
  }
}
