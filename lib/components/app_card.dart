import 'package:flutter/material.dart';

class Appcard extends StatelessWidget {
  const Appcard({super.key, required this.child, required this.padding});
  final Widget child;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding:padding,
        child: child,
      ),
    );
  }
}
