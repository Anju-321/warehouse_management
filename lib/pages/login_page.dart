import 'package:flutter/material.dart';


class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  final _usernamecontroller = TextEditingController();
  final _passwordcontroller = TextEditingController();
  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ,
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Form(
          key: formkey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppTextField(text: "User name", controller: _usernamecontroller),
              const SizedBox(
                height: 20,
              ),
              AppTextField(text: "Password", controller: _passwordcontroller),
              const SizedBox(height: 16.0),
              GestureDetector(
                  onTap: () {
                        if (formkey.currentState?.validate() ?? false) {
                    
                    debugPrint("Login Successful");
                  }
                  debugPrint("Hiii");
                  },
                  child: const Center(
                    child: AppButton(
                      text: 'Login',
                      color: Color.fromARGB(255, 44, 38, 38), size: 16,
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
