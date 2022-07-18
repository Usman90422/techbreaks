import 'package:flutter/material.dart';

class myCard extends StatelessWidget {
  const myCard({
    required this.title,
    required this.onTap,
    required this.imgPath,
    this.Width,
    Key? key,
  }) : super(key: key);

  final VoidCallback onTap;
  final String title;
  final String imgPath;
  final Width;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
        child: Container(
          width: Width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children:  [
              SizedBox(
                width: 40,
                child: Image(image: AssetImage(imgPath),),
              ),
              const SizedBox(height: 10,),
              Text(title,style: const TextStyle(fontSize: 12),),
            ],
          ),
        ),
    );
  }
}
