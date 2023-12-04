import 'package:flutter/material.dart';
import 'package:ware_house_management/components/app_button.dart';
import 'package:ware_house_management/components/app_text.dart';
import 'package:ware_house_management/components/color.dart';
import 'package:ware_house_management/components/warehose_dropdown.dart';

import '../../components/app_bar.dart';

class WarehoseSelect extends StatelessWidget {
  const WarehoseSelect({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(100.0),
          child: CustomAppBar(
            text: 'Warehouse',
            color: Colors.white,
          ),
        ),
        body: Stack(alignment: Alignment.center, children: [
          Positioned(
            top: MediaQuery.of(context).size.height * 0.25,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: greyaccentClr),
                height: MediaQuery.of(context).size.height * 0.25,
                width: MediaQuery.of(context).size.width * 0.75,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const AppText(
                        color: blackClr,
                        text: "From",
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: whiteClr),
                            color: whiteClr),
                        child: const Warehouses(
                          isSelected: true,
                        ),
                      ),
                      const AppText(text: "To", color: blackClr),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: whiteClr),
                            color: whiteClr),
                        child: const Warehouses(),
                      )
                    ]),
              ),
            ),
          ),
          const Positioned(
              bottom: 30,
              right: 40,
              child: AppButton(
                text: "Next",
                txtClr: greyaccentClr,
                size: 16,
                bgcolor: blackClr,
                height: 50,
                width: 150,
                navigator: 'stock',
              ))
        ]));
  }
}
