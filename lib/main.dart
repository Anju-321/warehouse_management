 


import 'package:flutter/material.dart';
import 'package:ware_house_management/pages/login_page.dart';

import 'pages/splash_screen.dart';

void main(){
  WidgetsFlutterBinding.ensureInitialized();
  runApp( MaterialApp(
    debugShowCheckedModeBanner: false,
    routes: {"Splsh":(context)=>LoginPage()},
    home: const SplashScreen()));
 }