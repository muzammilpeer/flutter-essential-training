import 'package:flutter/material.dart';

import '../chat/chat_view.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  GlobalKey<FormState> _loginFormKey = GlobalKey<FormState>();

  void loginUser(context) {
    if (_loginFormKey.currentState != null &&
        _loginFormKey.currentState!.validate()) {
      print("Username = ${usernameController.text}");
      print("Password = ${passwordController.text}");

      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ChatView(
                    username: usernameController.text,
                  )));
    }
  }

  String? validateField(String? value, String fieldName) {
    if (value == null || value.isEmpty || value.length < 5) {
      return "Please enter $fieldName with at least 5 characters.";
    }
    return null;
  }

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
            Container(
              width: 150,
              height: 150,
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                      "https://3009709.youcanlearnit.net/Alien_LIL_131338.png"),
                  fit: BoxFit.fitHeight,
                ),
                color: Colors.green,
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            Form(
              key: _loginFormKey,
              child: Column(
                children: [
                  TextFormField(
                    validator: (value) {
                      return validateField(value, "Username");
                    },
                    controller: usernameController,
                    decoration: InputDecoration(
                      hintText: "Username",
                      hintStyle: TextStyle(color: Colors.blueGrey),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    validator: (value) {
                      return validateField(value, "Password");
                    },
                    controller: passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: "Password",
                      hintStyle: TextStyle(color: Colors.blueGrey),
                      border: OutlineInputBorder(),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
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
}
//
