

import 'package:flutter/material.dart';
import 'package:ware_house_management/components/app_text.dart';

class CustomAppBar extends StatelessWidget {
  final Widget? avatarIcon;
  final String text;
  final Color color;
  final Color backgroundColor;

  const CustomAppBar({
    super.key,
    this.avatarIcon,
    this.backgroundColor = Colors.black, required this.text, required this.color, 
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0.0, 
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          if (avatarIcon != null)
            CircleAvatar(
              radius: 20.0,
              backgroundColor: Colors
                  .white, 
              child: avatarIcon,
            ),
          if (avatarIcon != null) const SizedBox(width: 16.0),
          AppText(text: text, color: color)
        ],
        
      ),
      backgroundColor: backgroundColor,
      
      
);
}
}