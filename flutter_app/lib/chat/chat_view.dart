import 'package:flutter/material.dart';

import '../widgets/chat_bubble.dart';
import '../widgets/chat_input.dart';

class ChatView extends StatelessWidget {
  late String username;

  ChatView({super.key, required this.username});

  String test_message = "Your message goes here";

  void logout(context) {
    print("Logout");
    test_message = "hahahaha";
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
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
