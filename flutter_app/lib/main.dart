import 'package:flutter/material.dart';
import 'package:flutter_app/login/auth_service.dart';
import 'package:flutter_app/utils/theme_colors.dart';
import 'package:provider/provider.dart';

import 'chat/chat_view.dart';
import 'counter/counter_view.dart';
import 'login/login_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AuthService.init();
  runApp(ChangeNotifierProvider(
      create: (BuildContext context) {
        return AuthService();
      },
      child: const ChatApp()));
}
// TODO CREATE CHAT APP
// TODO CREATE LOGIN SCREEN

class ChatApp extends StatelessWidget {
  const ChatApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          primarySwatch: ThemeColors.primaryColor,
          canvasColor: ThemeColors.canvasColor,
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.blue,
            foregroundColor: Colors.black,
          ),
        ),
        title: "Chat App",
        home: FutureBuilder<bool>(
          future: context.watch<AuthService>().isUserLoggedIn(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasData && snapshot.data!) {
                return const ChatView();
              } else {
                return LoginView();
              }
            }
            return const CircularProgressIndicator();
          },
        ),
        routes: {
          '/login': (context) => LoginView(),
          '/chat': (context) => const ChatView(),
          '/counter': (context) => CounterView(buttonColor: Colors.red),
        });
  }
}
