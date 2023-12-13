import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  const AppText(
      {super.key,
      required this.text,
      required this.color,
       this.fontWeight});
  final String text;
  final Color color;
  final FontWeight? fontWeight;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(color: color),
    );
  }
}
