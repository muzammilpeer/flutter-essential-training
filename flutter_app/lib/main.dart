import 'package:flutter/material.dart';
import 'package:flutter_app/login/auth_service.dart';
import 'package:flutter_app/utils/theme_colors.dart';
import 'package:provider/provider.dart';

import 'chat/chat_view.dart';
import 'counter/counter_view.dart';
import 'login/login_view.dart';

void main() {
  runApp(Provider(
      create: (BuildContext context) {
        return AuthService();
      },
      child: ChatApp()));
}
// TODO CREATE CHAT APP
// TODO CREATE LOGIN SCREEN

class ChatApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          primarySwatch: ThemeColors.primaryColor,
          canvasColor: ThemeColors.canvasColor,
          appBarTheme: AppBarTheme(
            backgroundColor: Colors.blue,
            foregroundColor: Colors.black,
          ),
        ),
        title: "Chat App",
        home: LoginView(),
        routes: {
          '/chat': (context) => ChatView(),
          '/counter': (context) => CounterView(buttonColor: Colors.red),
        });
  }
}
