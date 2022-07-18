import 'dart:io';
import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:webview_flutter/webview_flutter.dart';

class News extends StatefulWidget {
  const News({Key? key}) : super(key: key);

  @override
  _NewsState createState() => _NewsState();
}

class _NewsState extends State<News> with TickerProviderStateMixin {


  late AnimationController controller;

  @override
  void initState() {
    controller = AnimationController(
      duration: const Duration(milliseconds: 5000),
      vsync: this,
    );

    controller.addListener((){
      if(controller.isCompleted){
        controller.repeat();
      }
    });
    if (Platform.isAndroid) WebView.platform = AndroidWebView();

    super.initState();
  }


  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  int view=1;

  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.of(context).size;
    controller.forward();
    return  Scaffold(
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
      body: IndexedStack(
        index: view,
        children: [
          WebView(
            javascriptMode: JavascriptMode.unrestricted,
            initialUrl: 'https://www.wikipedia.com/',
            onPageFinished: (String url) {
              setState(() {
                view = 0;
              });
            },
          ),
           SizedBox(
             width: size.width,
             child: Column(
               mainAxisAlignment: MainAxisAlignment.center,
               crossAxisAlignment: CrossAxisAlignment.center,
               children: const [
                 SizedBox(
                   width: 50,
                   child: LoadingIndicator(
                       indicatorType: Indicator.lineScalePulseOutRapid,
                       colors: [Colors.black,Colors.red],
                       strokeWidth: 2,
                       backgroundColor: Colors.transparent,
                       pathBackgroundColor: Colors.black
                   ),
                 ),
                 SizedBox(height: 20,),
                 Text("Loading",style: TextStyle(color: Colors.black,fontSize: 15),)
               ],
             ),
           )
        ],
      )

    );
  }

}
