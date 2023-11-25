import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ware_house_management/components/app_button.dart';

import 'package:ware_house_management/components/app_textfield.dart';
import 'package:ware_house_management/components/color.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final usernameController = TextEditingController();
    final passwordController = TextEditingController();

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: gradientClr)),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppTextField(text: "Username", controller: usernameController),
              const SizedBox(
                height: 20,
              ),
              AppTextField(text: "Password", controller: passwordController),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(onTap: (){
                saveLoginStatus(true);
                Navigator.of(context).pushNamed("Homepage");
              },
                  child: const AppButton(text: "Login", color: blackClr, size: 16),
                  )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> saveLoginStatus(bool isLoggedIn) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', isLoggedIn);
  }
}
