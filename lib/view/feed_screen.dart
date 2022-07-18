import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:techbreaks/view/ad_screen.dart';
import 'package:techbreaks/widgets/cards_column.dart';
import 'package:url_launcher/url_launcher.dart';


class FeedScreen extends StatefulWidget {
  const FeedScreen({Key? key}) : super(key: key);

  @override
  _FeedScreenState createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {

  int index = 0;

  PageController _pageController = PageController();
  Duration pageTurnDuration = const Duration(milliseconds: 500);
  Curve pageTurnCurve = Curves.ease;


  int pages = 0;
  bool showAd = false;
  String url='https://flutter.io';


  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  void _goForward() {
    _pageController.nextPage(duration: pageTurnDuration, curve: pageTurnCurve);
  }

  void _goBack() {
    _pageController.previousPage(
        duration: pageTurnDuration, curve: pageTurnCurve);
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery
        .of(context)
        .size;
    return Scaffold(
      backgroundColor: const Color(0xfff9f9fa),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 20, right: 20, top: 40),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                icon: const Icon(
                                  Icons.sort, color: Colors.black,)),
                            Image(
                              image: const AssetImage("images/logo.png"),
                              width: size.width * 0.4,
                            ),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onVerticalDragEnd: (dragEndDetails) {
                          if (dragEndDetails.primaryVelocity! < 0) {
                            print('Move page forwards');
                            _goForward();
                          }
                          else if (dragEndDetails.primaryVelocity! > 0) {
                            print('Move page backwards');
                            _goBack();
                          }
                        },
                        child: Container(
                          margin: const EdgeInsets.only(top: 10),
                          color: Colors.transparent,
                          width: size.width,
                          height: size.height * 0.77,
                          child: PageView.builder(
                            controller: _pageController,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: 10,
                            onPageChanged: (p) {
                              print(pages);
                              setState(() {
                                pages++;
                                if (pages % 3 == 0) {
                                  showGeneralDialog(
                                      context: context,
                                      barrierDismissible: true,
                                      barrierLabel: MaterialLocalizations
                                          .of(context)
                                          .modalBarrierDismissLabel,
                                      transitionDuration: const Duration(
                                          milliseconds: 200),
                                      pageBuilder: (BuildContext buildContext,
                                          Animation animation,
                                          Animation secondaryAnimation) {
                                        return Material(
                                          child: Container(
                                            width: size.width,
                                            height: size.height,
                                            padding: const EdgeInsets.all(20),
                                            color: Colors.black,
                                            child:
                                            Column(
                                              children: [
                                                const SizedBox(height: 20),
                                                Row(
                                                  crossAxisAlignment: CrossAxisAlignment
                                                      .center,
                                                  mainAxisAlignment: MainAxisAlignment
                                                      .spaceBetween,

                                                  children: [
                                                    IconButton(
                                                      icon: const Icon(
                                                        Icons.clear,
                                                        color: Colors.black,),
                                                      onPressed: () {},),

                                                    const Text(
                                                      "Advertisement",
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 15),
                                                    ),

                                                    IconButton(
                                                      icon: const Icon(
                                                        Icons.clear,
                                                        color: Colors.white,),
                                                      onPressed: () {
                                                        Navigator.pop(
                                                            context, false);
                                                      },),
                                                  ],
                                                ),

                                                GestureDetector(
                                                    onTap: () {
                                                      Navigator.push(context, MaterialPageRoute(builder: (context)=>AdView(url: url)));

                                                    },
                                                    child: const Image(
                                                      image:  AssetImage(
                                                          "images/ad.jpeg"),
                                                      fit: BoxFit.cover,)),
                                              ],
                                            ),
                                          ),
                                        );
                                      });
                                }
                              });
                            },
                            scrollDirection: Axis.vertical,
                            itemBuilder: (BuildContext context,
                                int itemIndex) {
                              return const DelayedDisplay(
                                  slidingCurve: Curves.linear,
                                  delay: Duration(milliseconds: 100),
                                  child:
                                  CardsColumn());
                            },),
                        ),
                      ),

                      // Stack(
                      //     children: [
                      //       for(index; index<5 ; index++)
                      //         Swipable(
                      //             animationDuration: 500,
                      //             child: const CardsColumn()),
                      //     ]
                      // ),


                    ],),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      Text("Privacy Policy | Terms and Conditions",
                        style: TextStyle(color: Colors.red, fontSize: 10),),
                      Text("Copyright©2020 All rights are reserved",
                          style: TextStyle(fontSize: 10)),
                    ],),
                ],
              ),

            ],
          ),
        )
    );
  }

  launchURL() async {
    const url = 'https://flutter.io';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }


// Widget CardsColumn(BuildContext context, int index){
//   String text="Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s.";
//   return Column(
//     children: [
//       NewsCard(
//           description: text,
//           imgPath: "images/1.jpg",
//           credits: "JJ Thompson",
//           onSharePress: (){},
//           onCardPress: (){},
//       ),
//
//       NewsCard(
//         description: text,
//         imgPath: "images/2.jpg",
//         credits: "Ben Cutting ",
//         onSharePress: (){},
//         onCardPress: (){},
//       ),
//     ],
//   );
// }
}
