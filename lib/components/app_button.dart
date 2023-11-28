import 'package:flutter/material.dart';


class AppButton extends StatelessWidget {
  const AppButton({super.key, required this.text, required this.bgcolor, required this.size, required this.txtClr, required this.height, required this.width});
final String text;
final Color bgcolor;
final Color txtClr;
final double size;
final double height;
final double width;
  @override
  Widget build(BuildContext context) {
    return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(16),
      border: Border.all(color: Colors.grey),
      color: bgcolor
    ),
    height: height,width: width,
     child:Center(
       child: Text(
        text,style: TextStyle(color: txtClr,fontSize: size),),
     )
    );
  }
}