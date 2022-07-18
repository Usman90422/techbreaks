import 'dart:io';

import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:webview_flutter/webview_flutter.dart';

class AdView extends StatefulWidget {
  const AdView({
    required this.url,
    Key? key}) : super(key: key);

  final String url;

  @override
  _AdViewState createState() => _AdViewState();
}

class _AdViewState extends State<AdView> {


  @override
  void initState() {

    if (Platform.isAndroid) WebView.platform = AndroidWebView();
    super.initState();
  }


  int view=1;

  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.of(context).size;
    return  Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.black),
          backgroundColor: Colors.white,
          centerTitle: true,
          title: SizedBox(
              width: size.width*0.4,
              child: Image.asset('images/logo.png', fit: BoxFit.cover)),
        ),
        body: IndexedStack(
          index: view,
          children: [
            WebView(
              javascriptMode: JavascriptMode.unrestricted,
              initialUrl: widget.url,
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
