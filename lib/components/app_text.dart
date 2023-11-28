import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  const AppText({super.key, required this.text, required this.color, this.fontSize, this.fontFamily, this.decoration});
 final String text;
  final double? fontSize;
  final Color? color;
  final String? fontFamily;
  final TextDecoration? decoration;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: fontSize,
        fontFamily: fontFamily,
        decoration:decoration,
        
      ),
    );
  }
}