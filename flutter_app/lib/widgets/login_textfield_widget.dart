import 'package:flutter/material.dart';

import '../utils/theme_textfield_styles.dart';

class LoginFormTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;
  final FormFieldValidator<String>? validator;

  LoginFormTextField(
      {super.key,
      required this.controller,
      required this.hintText,
      this.obscureText = false,
      this.validator});

  String? validateField(String? value, String fieldName) {
    if (value == null || value.isEmpty || value.length < 5) {
      return "Please enter $fieldName with at least 5 characters.";
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (validator != null) {
          return validator!(value);
        }
        return validateField(value, hintText);
      },
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: ThemeTextFieldStyle.loginTextFieldStyle,
        border: OutlineInputBorder(),
      ),
    );
  }
}
