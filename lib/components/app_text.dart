

import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  const AppText({super.key, required this.text, required this.color});
final String text;
final Color color;
  @override
  Widget build(BuildContext context) {
    return Text(
           text,style: TextStyle(color: color),
    );
  }
}