import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:techbreaks/view/news.dart';
import 'package:techbreaks/view/play_screen.dart';
import 'newscard.dart';

class CardsColumn extends StatefulWidget {
  const CardsColumn({Key? key}) : super(key: key);


  @override
  _CardsColumnState createState() => _CardsColumnState();
}

class _CardsColumnState extends State<CardsColumn> {

  @override
  Widget build(BuildContext context){
    String text="Lorem Ipsum is simply dummy text of the printing and typesetting."
        "Lorem Ipsum is simply dummy text of the printing and typesetting";
    return
      SizedBox(
        height: MediaQuery.of(context).size.height*0.77,
        child: Column(
        children: [
          NewsCard(
            onPlayPress: (){
         Navigator.push(context, MaterialPageRoute(builder: (context) => const  PlayScreen()) );
      },
            description: text,
            imgPath: "images/1.jpg",
            credits: "JJ Thompson",
            onSharePress: () async{
              await Share.share("$text \n\n https://www.wikipedia.com/" );
            },
            onCardPress: (){
             Navigator.push(context, MaterialPageRoute(builder: (context) => const News()));
            },
          ),
          NewsCard(
            description: text,
            imgPath: "images/2.jpg",
            credits: "Ben Cutting ",
            onSharePress: (){},
            onCardPress: (){
              print("aaaaa");
            },
            onPlayPress:  (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => const PlayScreen()));
            },
          ),
        ],
    ),
      );
  }


}
