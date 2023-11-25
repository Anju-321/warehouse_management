 



import 'package:flutter/material.dart';
import 'package:ware_house_management/pages/home_page.dart';
import 'package:ware_house_management/pages/login_page.dart';
import 'package:ware_house_management/pages/splash_screen.dart';



void main(){
  WidgetsFlutterBinding.ensureInitialized();
  runApp( MaterialApp(
    debugShowCheckedModeBanner: false,
    routes: {"Splsh":(context)=>LoginPage(),
    "Homepage":(context)=>const Homepage()},
    home:  const SplashScreen()));
 }