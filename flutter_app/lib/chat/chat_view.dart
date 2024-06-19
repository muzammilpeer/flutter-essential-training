import 'package:flutter/material.dart';

import '../widgets/chat_bubble.dart';
import '../widgets/chat_input.dart';

class ChatView extends StatelessWidget {
  ChatView({super.key});

  String test_message = "Your message goes here";

  void logout(context) {
    print("Logout");
    test_message = "hahahaha";
    Navigator.pushReplacementNamed(context, "/");
  }

  @override
  Widget build(BuildContext context) {
    final Map arguements = ModalRoute.of(context)!.settings.arguments as Map;
    final String username =
        arguements.containsKey("username") ? arguements["username"] : "";

    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text("Hi $username!"),
          actions: [
            IconButton(
                onPressed: () {
                  logout(context);
                },
                icon: Icon(Icons.logout))
          ]),
      body: Column(
        children: [
          Expanded(
              child: ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) {
              return ChatBubble(
                  bubbleAlignment: index.isEven
                      ? Alignment.centerLeft
                      : Alignment.centerRight,
                  messageText: index.isEven
                      ? "Your message goes here index $index"
                      : "$test_message $index");
            },
          )),
          ChatInput()
        ],
      ),
    );
  }
}
