import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:ware_house_management/pages/login_page.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: AnimatedSplashScreen(
          nextScreen:LoginPage() ,
          splash:const Column(mainAxisAlignment: MainAxisAlignment.center,children: [Icon(Icons.home)],) ,
      ),
    );
  }
}