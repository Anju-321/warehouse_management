import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ware_house_management/Model/user_model.dart';
import 'package:ware_house_management/Services/api.dart';
import 'package:ware_house_management/Urls/url.dart';
import 'package:ware_house_management/components/app_button.dart';
import 'package:ware_house_management/components/app_textfield.dart';
import 'package:ware_house_management/components/color.dart';
import 'package:ware_house_management/pages/Login/cubit/login_cubit.dart';
import 'package:ware_house_management/pages/home_page.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  final _usernamecontroller = TextEditingController();
  final _passwordcontroller = TextEditingController();
  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => LoginCubit(context),
        child: BlocBuilder<LoginCubit, LoginState>(
          builder: (context, state) {
            final cubit = context.read<LoginCubit>();
            return Container(
              decoration: const BoxDecoration(color: blackClr),
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Form(
                  key: formkey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AppTextField(
                          text: "User name", controller: _usernamecontroller),
                      const SizedBox(
                        height: 20,
                      ),
                      AppTextField(
                          text: "Password", controller: _passwordcontroller),
                      const SizedBox(height: 16.0),
                      GestureDetector(
                          onTap: () async {
                            if (formkey.currentState?.validate() ?? false) {
                            debugPrint("Login Successful");
                            cubit.loginapi(_usernamecontroller.text, _passwordcontroller.text);
                          }
                          },
                          child: Center(
                            child: GestureDetector(
                                child: const AppButton(
                                    text: "Login",
                                    bgcolor: Colors.white,
                                    size: 16,
                                    txtClr: blackClr,
                                    height: 50,
                                    width: 150)),
                          ))
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
