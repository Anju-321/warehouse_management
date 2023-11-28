import 'package:flutter/material.dart';
import 'package:ware_house_management/components/app_button.dart';
import 'package:ware_house_management/components/app_text.dart';
import 'package:ware_house_management/components/color.dart';
import 'package:ware_house_management/components/warehouse_dropdown.dart';

class WarehoseSelect extends StatelessWidget {
  const WarehoseSelect({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(alignment: Alignment.center, children: [
      Center(
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16), color: greyaccentClr),
          height: 200,
          width: 300,
          child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppText(
                  color: blackClr,
                  text: "From",
                ),
                Warehouses(
                  isSelected: true,
                ),
                AppText(text: "To", color: blackClr),
                Warehouses()
              ]),
        ),
      ),
      Positioned(
        bottom: 30,
        right: 40,
        child:  GestureDetector(
          onTap: () {
                    Navigator.of(context).pushNamed("Product_select");
                  },
          child: const AppButton(
              text: "Next",
              bgcolor: blackClr,
              size: 16,
              txtClr: Colors.white,
              height: 50,
              width: 150),
        ),
     
      )
     
    ]));
  }
}
