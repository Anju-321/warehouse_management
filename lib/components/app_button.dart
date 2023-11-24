

import 'package:flutter/material.dart';


class AppButton extends StatelessWidget {
  const AppButton({super.key, required this.text, required this.color, required this.size,});
final String text;
final Color color;
final double size;
  @override
  Widget build(BuildContext context) {
    return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(16),
      border: Border.all(color: Colors.grey),
      color: Colors.white
    ),
    height: 50,width: 150,
     child:Center(
       child: Text(
        text,style: TextStyle(color: color,fontSize: size),),
     )
    );
  }
}