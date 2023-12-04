import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  AppTextField({super.key, required this.text, required this.controller});
  final String text;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          border:  OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
          hintText: text),
      
        controller: controller,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "This field is required";
          }
          return null;
        },
      
    );
  }
}
