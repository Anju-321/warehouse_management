import 'package:flutter/material.dart';

class Appicon extends StatelessWidget {
   const Appicon({super.key,required this.icon, this.iconcolor});
  final IconData icon;
  final Color? iconcolor;

  @override
  Widget build(BuildContext context) {
    return Icon(
      icon,
      color: iconcolor,
      
    );
  }
}

