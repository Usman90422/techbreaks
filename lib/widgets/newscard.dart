import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewsCard extends StatefulWidget {
  const NewsCard({Key? key, required this.onPlayPress,required this.description, required this.imgPath,required this.credits,required this.onSharePress,required this.onCardPress}) : super(key: key);


  final String description;
  final String imgPath;
  final String credits;
  final VoidCallback onSharePress;
  final VoidCallback onCardPress;
  final VoidCallback onPlayPress;

  @override
  _NewsCardState createState() => _NewsCardState();
}

class _NewsCardState extends State<NewsCard> {
  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.of(context).size;
    return Column(
      children: [
        Container(
          height: size.height*0.35,
          margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 20,
              spreadRadius: 1,
              offset: const Offset(8,5),
            )],
            borderRadius: BorderRadius.circular(20),
          ),
          width: size.width,
          child: GestureDetector(
            onTap: widget.onCardPress,
            child: Column(
              children:  [
                SizedBox(
                  width: size.width,
                  height: size.height/4.3,

                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image(image: AssetImage(widget.imgPath),fit: BoxFit.cover,)),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(widget.description,maxLines: 2,overflow: TextOverflow.ellipsis,style: const TextStyle(fontFamily: "BwModelica"),),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children:  [
                           Text("Credits: ""${widget.credits}",style: const TextStyle(color: Colors.black45,fontSize: 12),),
                           Row(
                             children: [
                               Container(
                                 padding: EdgeInsets.all(2),
                                 decoration: const BoxDecoration(
                                   shape: BoxShape.circle,
                                   color: Colors.redAccent
                                 ),
                                 child: GestureDetector(
                                   onTap: widget.onPlayPress,
                                   child: const Icon(Icons.play_arrow,color: Colors.white,size: 15,),
                                 ),
                               ),
                               const SizedBox(width: 10,),

                               SizedBox(
                                 width: 20,
                                 child: GestureDetector(
                                   onTap: widget.onSharePress,
                                   child: const Image(image: AssetImage("images/share.png"),)
                                 ),
                               ),
                             ],
                           ),
                          // IconButton(onPressed: widget.onSharePress, icon: const Icon(Icons.share,color: Colors.red,))
                        ],),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
