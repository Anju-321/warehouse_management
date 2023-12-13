import 'package:flutter/material.dart';
import 'package:ware_house_management/components/app_button.dart';
import 'package:ware_house_management/components/color.dart';

class SuccessPage extends StatelessWidget {
  const SuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, "homepage");
          },
          child: const AppButton(
            text: "Go Home",
            bgcolor: blackClr,
            size: 16,
            txtClr: whiteClr,
            height: 50,
            width: 150,
          ),
        ),
      ),
    );
  }
}
