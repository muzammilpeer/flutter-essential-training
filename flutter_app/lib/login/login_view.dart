import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_media_buttons/social_media_button.dart';
import 'package:url_launcher/url_launcher.dart';

import '../utils/spacing_widget.dart';
import '../widgets/chat_bubble/chat_bubble_model.dart';
import '../widgets/login_textfield_widget.dart';
import 'auth_service.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final GlobalKey<FormState> _loginFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(10.0),
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
                VerticalSpacing(12),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 200,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.fitWidth,
                        image: AssetImage("assets/banner_image.png")),
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                  ),
                ),
                VerticalSpacing(12),
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
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w300),
                        "Sign in")),
                GestureDetector(
                  onTap: () async {
                    print("Find us tapped");
                    if (!await launch("https://muzammilpeer.uk")) {
                      throw Exception('Could not launch ');
                    }
                  },
                  child: Column(
                    children: [
                      Text("Find us"),
                      Text("https://muzammilpeer.uk"),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SocialMediaButton.twitter(
                        size: 65,
                        color: Colors.blue,
                        url: "https://twitter.com/muzammilpeer"),
                    SocialMediaButton.github(
                      url: "https://github.com/muzammilpeer",
                      size: 65,
                      color: Colors.blueGrey,
                    )
                  ],
                ),
              ],
            ),
          ),
        ));
  }

  void loginUser(BuildContext context) {
    if (_loginFormKey.currentState != null &&
        _loginFormKey.currentState!.validate()) {
      print("Username = ${usernameController.text}");
      print("Password = ${passwordController.text}");

      Author author = Author(username: usernameController.text);
      context.read<AuthService>().setAuthor(author);
      Navigator.pushReplacementNamed(context, "/chat");
    }
  }
}

//
