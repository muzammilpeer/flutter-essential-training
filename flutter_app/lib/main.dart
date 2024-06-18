import 'package:flutter/material.dart';

import 'login/login_view.dart';

void main() {
  runApp(ChatApp());
}
// TODO CREATE CHAT APP
// TODO CREATE LOGIN SCREEN

class ChatApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
        title: "Chat App",
        home: LoginPage());
  }
}
