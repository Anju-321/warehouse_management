 









import 'package:flutter/material.dart';
import 'package:ware_house_management/pages/MovementPage/stocks.dart';
import 'package:ware_house_management/pages/MovementPage/warehose_select.dart';
import 'package:ware_house_management/pages/login_page.dart';
import 'package:ware_house_management/pages/success_page.dart';

import 'pages/History/historyproduct.dart';
import 'pages/home_page.dart';



void main(){
  WidgetsFlutterBinding.ensureInitialized();
  runApp( MaterialApp(
    debugShowCheckedModeBanner: false,
    routes: {"Splsh":(context)=>LoginPage(),
    "warehouse":(context)=>const WarehoseSelect(),
    "stock":(context)=>const Stocks(),
    "success":(context)=>const SuccessPage(),
    "homepage":(context)=> Homepage(),
    "producthistory":(context)=>const ProductHistory()
    },
    home:  Homepage()));
 }
