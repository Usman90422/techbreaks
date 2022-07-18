import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:techbreaks/view/splash_screen.dart';

void main() {

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: "BwModelica"
      ),
      home:  Splash_Screen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
