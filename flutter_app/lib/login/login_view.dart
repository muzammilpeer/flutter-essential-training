import 'package:flutter/material.dart';

import '../chat/chat_view.dart';
import '../utils/spacing_widget.dart';
import '../widgets/login_textfield.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final GlobalKey<FormState> _loginFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Let's sign you in",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 30,
                  color: Colors.orange,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.5),
            ),
            Text(
              "Welcome back!\n you are missed!",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 15,
                  color: Colors.grey,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0.5),
            ),
            Image.asset(
              "assets/banner_image.png",
              height: 150,
            ),
            Form(
              key: _loginFormKey,
              child: Column(
                children: [
                  LoginFormTextField(
                    controller: usernameController,
                    hintText: "Username",
                  ),
                  VerticalSpacing(20),
                  LoginFormTextField(
                    controller: passwordController,
                    hintText: "Password",
                    obscureText: true,
                  ),
                ],
              ),
            ),
            VerticalSpacing(20),
            ElevatedButton(
                onPressed: () {
                  loginUser(context);
                },
                child: Text(
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
                    "Sign in")),
            GestureDetector(
              onTap: () {
                print("Find us tapped");
              },
              child: Column(
                children: [
                  Text("Find us"),
                  Text("https://muzammilpeer.uk"),
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }

  void loginUser(context) {
    if (_loginFormKey.currentState != null &&
        _loginFormKey.currentState!.validate()) {
      print("Username = ${usernameController.text}");
      print("Password = ${passwordController.text}");
      Navigator.pushReplacementNamed(context, "/chat",
          arguments: {"username": usernameController.text});
    }
  }
}

//
