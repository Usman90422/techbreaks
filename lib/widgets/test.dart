import 'package:flutter/material.dart';

class MyList extends StatefulWidget {
  const MyList({Key? key}) : super(key: key);

  @override
  _MyListState createState() => _MyListState();
}


List dum=["a","b","d","f","g"];

class _MyListState extends State<MyList> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListView.builder(
            itemCount: dum.length,
            itemBuilder: (context, index) {
          return Container(color: Colors.red,
          width: 200,
          height: 200,
          child: Text(dum[index],style: TextStyle(color: Colors.white),),

          );

        }

        ),
      ],
    );
  }
}
