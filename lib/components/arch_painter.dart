import 'package:flutter/material.dart';

class ArchPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.grey.shade300
      ..style = PaintingStyle.fill;

    double width = size.width;
    double height = size.height;

    // Draw the rectangular part of the container
    canvas.drawRect(Rect.fromPoints(const Offset(0, 0), Offset(width, height)), paint);

    // Draw the arch at the bottom
    // double radius = width / 2;
    double centerX = width / 2;
    // double centerY = height;

    Path path = Path()
      ..moveTo(0, height)
      ..quadraticBezierTo(centerX, height + 50, width, height)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}