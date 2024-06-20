import 'package:flutter/material.dart';
import 'package:flutter_app/utils/theme_colors.dart';
import 'package:flutter_app/widgets/chat_bubble/chat_bubble_model.dart';

import 'chat/chat_view.dart';
import 'counter/counter_view.dart';
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
