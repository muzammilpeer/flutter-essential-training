import 'package:flutter/material.dart';
import 'package:social_media_buttons/social_media_button.dart';
import 'package:url_launcher/url_launcher.dart';

import '../utils/spacing_widget.dart';
import '../widgets/login_textfield_widget.dart';
import 'auth_service.dart';
import 'package:provider/provider.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final GlobalKey<FormState> _loginFormKey = GlobalKey<FormState>();

  Widget _buildHeader(context) {
    return Column(
      children: [
        const Text(
          "Let's sign you in",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 30,
              color: Colors.orange,
              fontWeight: FontWeight.bold,
              letterSpacing: 0.5),
        ),
        const Text(
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
          decoration: const BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fitWidth,
                image: AssetImage("assets/banner_image.png")),
            borderRadius: BorderRadius.all(Radius.circular(12)),
          ),
        ),
        VerticalSpacing(12),
      ],
    );
  }

  Widget _buildForm(context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
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
              onPressed: () async {
                loginUser(context);
              },
              child: const Text(
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
                  "Sign in")),
        ]);
  }

  Widget _buildFooter(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () async {
            if (!await launchUrl(Uri(path: "https://muzammilpeer.uk"),
                mode: LaunchMode.externalApplication)) {
              throw Exception('Could not launch ');
            }
          },
          child: const Column(
            children: [
              Text("Find us"),
              Text("https://muzammilpeer.uk"),
            ],
          ),
        ),
        const Row(
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
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
              if (constraints.maxWidth > 1000) {
                // web layout
                return Row(children: [
                  const Spacer(
                    flex: 2,
                  ),
                  Expanded(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _buildHeader(context),
                          _buildFooter(context)
                        ]),
                  ),
                  const Spacer(
                    flex: 1,
                  ),
                  Expanded(child: _buildForm(context)),
                  const Spacer(
                    flex: 2,
                  ),
                ]);
              } else {
                // mobile layout
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    _buildHeader(context),
                    _buildForm(context),
                    _buildFooter(context)
                  ],
                );
              }
            }),
          ),
        ));
  }

  Future<void> loginUser(BuildContext context) async {
    if (_loginFormKey.currentState != null &&
        _loginFormKey.currentState!.validate()) {
      await context.read<AuthService>().loginUser(usernameController.text);
      navigateToChatScreen(context);
    }
  }

  void navigateToChatScreen(BuildContext context) {
    Navigator.pushReplacementNamed(context, "/chat");
  }
}

//
