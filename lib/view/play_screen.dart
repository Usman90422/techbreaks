import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class PlayScreen extends StatefulWidget {
  const PlayScreen({Key? key}) : super(key: key);

  @override
  _PlayScreenState createState() => _PlayScreenState();
}

class _PlayScreenState extends State<PlayScreen> {

  final FlutterTts flutterTts=FlutterTts();

  read()async{
    setState(() {
      isPlaying=!isPlaying;
    });
    await flutterTts.setPitch(20);
    await flutterTts.setLanguage("hi-IN");
    await flutterTts.speak(text);

  }

  stop()async{
    await flutterTts.stop();
    setState(() {
      isPlaying=!isPlaying;
    });
  }


  bool isPlaying=false;
  String text=" Huawei Technologies Co., Ltd. is a Chinese multinational technology corporation headquartered in Shenzhen, Guangdong, China. It designs, develops and sells telecommunications equipment, consumer electronics and various smart devices.";

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    flutterTts.stop();
  }

  @override
  Widget build(BuildContext context) {

    var size=MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Transform(
          transform:  Matrix4.translationValues(90.0, 0.0, 0.0),
          child: SizedBox(
              width: size.width*0.4,
              child: Image.asset('images/logo.png', fit: BoxFit.cover)),
        ),
      ),
      backgroundColor: const Color(0xfff9f9fa),
      body: SingleChildScrollView(
        child: Column(
          children: [

            SizedBox(
              width: size.width,
              height: size.height*0.5,
              child: Stack(
                children: [
                  Container(
                    decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50),bottomRight: Radius.circular(50)),
                      image: DecorationImage(
                        image: ExactAssetImage('images/1.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 0.0, sigmaY: 0.0),
                      child: Container(
                        decoration: BoxDecoration(color: Colors.white.withOpacity(0.0)),
                      ),
                    ),
                  ),
                  Positioned(
                    child: Center(
                      child: Container(
                        decoration:  BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                          boxShadow: [BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            spreadRadius: 5,
                            blurRadius: 5,
                            offset: const Offset(0,0)
                          )]
                        ),
                        width: size.width/1.5,
                        height: size.height/3,
                        child:  ClipRRect(
                            borderRadius: BorderRadius.circular(30),
                            child: const Image(image: AssetImage("images/1.jpg"),fit: BoxFit.cover,)),),
                    ),
                  ),

                ],
              ),
            ),



             Padding(
              padding:  const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
              child: Align(
                  alignment: Alignment.center,
                  child: Text(text,style: const TextStyle(fontSize: 15,), textAlign: TextAlign.center,)),
            ),
            Padding(
              padding:  const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
              child:  SizedBox(
                width: size.width/2,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 25,
                      child: GestureDetector(
                          child: const Image(image: AssetImage("images/prev.png"),)
                      ),
                    ),

                    isPlaying==false ?
                    SizedBox(
                      width: 50,
                      child: GestureDetector(
                        onTap: read,
                          child: const Image(image: AssetImage("images/play.png"),)
                      ),
                    )
                    : SizedBox(
                      width: 50,
                      child: GestureDetector(
                          onTap: stop,
                          child: const Image(image: AssetImage("images/stop.png"),)
                      ),
                    ),
                    SizedBox(
                      width: 25,
                      child: GestureDetector(
                          child: const Image(image: AssetImage("images/next.png"),)
                      ),
                    ),
                  ],
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
