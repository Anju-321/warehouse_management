import 'dart:js';

import 'package:flutter/material.dart';
import 'package:ware_house_management/pages/Deadstocks/deadstock.dart';
import 'package:ware_house_management/pages/Movement/movementhistory.dart';
import 'package:ware_house_management/pages/Login/login_page.dart';
import 'package:ware_house_management/pages/Movement_flow/select-warehouse/select_warehouse.dart';
import 'package:ware_house_management/pages/splash_screen.dart';
import 'package:ware_house_management/pages/stocks/stockdetails.dart';
import 'package:ware_house_management/pages/success_page.dart';
import 'pages/home_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        "Splsh": (context) => LoginPage(),
        "success": (context) => const SuccessPage(),
        "homepage": (context) => Homepage(),
        'movement_history': (context) => const MovementHistory(),
        'stocks_details': (context) => const StocksPage(),
        'deadstocks_details': (context) => DeadStocksTableWidget(),
        'warehouse_select': (context) => const WarehoseSelect(),
      },
      home: const SplashScreen()));
}
