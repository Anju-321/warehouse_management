import 'package:flutter/material.dart';
import 'package:ware_house_management/pages/Movements/select_product.dart';
import 'package:ware_house_management/pages/Movements/select_warehouse.dart';
import 'package:ware_house_management/pages/home_page.dart';
import 'package:ware_house_management/pages/login_page.dart';
import 'package:ware_house_management/pages/splash_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        "Splsh": (context) => const LoginPage(),
        "Homepage": (context) => const Homepage(),
        "Warehouse_select": (context) => const WarehoseSelect(),
        "Product_select": (context) => const Stocks(),
      },
      home: const SplashScreen()));
}
