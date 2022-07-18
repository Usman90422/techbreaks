import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:techbreaks/view/feed_screen.dart';

import '../widgets/myCard.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List<String> imagess=[
    "images/bgnew.png",
    "images/bg2.jpg",
    "images/bg3.jpg",
  ];


  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        decoration:  const BoxDecoration(
          color: Color(0xfff9f9fa),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 60),
            child: Column(
              children: [
                Center(
                    child: Image(
                  image: const AssetImage("images/logo.png"),
                  width: size.width * 0.5,
                )
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: CarouselSlider(
                      options: CarouselOptions(
                          height: size.height/4,
                          enlargeCenterPage: true,
                          autoPlay: true,
                      ),
                      items: imagess.map((i) {
                        return ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                            child: Image(
                              image: AssetImage(i),fit: BoxFit.cover,
                            ),
                        );
                      }).toList(),
                    ),
                  ),
                ),
                // Container(
                //   decoration: BoxDecoration(
                //     borderRadius: BorderRadius.circular(20),
                //     boxShadow: const [
                //       BoxShadow(
                //       color: Colors.black,
                //       spreadRadius: 2,
                //       blurRadius: 5,
                //       offset: Offset(10,10)
                //     )],
                //   ),
                //   child: ClipRRect(
                //     borderRadius: BorderRadius.circular(20),
                //     child: const Image(
                //       image: AssetImage("images/bgnew.jpg"),
                //     ),
                //   ),
                // ),
                const Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Text(
                  "Topics",
                  style: TextStyle(fontSize: 15, fontFamily: "BwModelica Bold"),
                  ),
                ),
                SizedBox(
                  width: size.width,
                  child: GridView.count(
                    physics: const ScrollPhysics(),
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 20,
                    shrinkWrap: true,
                    crossAxisCount: 3,
                    children:  [
                      myCard(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>const FeedScreen()));
                          },
                        title: 'Business',
                        imgPath: 'images/business.png',
                        Width: size.width/3,
                      ),
                      myCard(onTap: () {  }, title: 'Minds', imgPath: 'images/minds.png',Width: size.width/3),
                      myCard(onTap: () {  }, title: 'Software', imgPath: 'images/software.png',Width: size.width/3),
                      myCard(onTap: () {  }, title: 'Education', imgPath: 'images/education.png',Width: size.width/3),
                      myCard(onTap: () {  }, title: 'Hardware', imgPath: 'images/hardware.png',Width: size.width/3),
                      myCard(onTap: () {  }, title: 'Gadgets', imgPath: 'images/gadgets.png',Width: size.width/3),
                      myCard(onTap: () {  }, title: 'Podcasts', imgPath: 'images/gadgets.png',Width: size.width/3),
                      // myCard(onTap: () {  }, title: 'Podcasts', imgPath: '',),
                    ],
                  ),
                ),

                SizedBox(height: 40),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    Text("Privacy Policy | Terms and Conditions",style: TextStyle(color: Colors.red,fontSize: 10),),
                    Text("Copyright©2020 All rights are reserved",style: TextStyle(fontSize: 10)),
                  ],),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
