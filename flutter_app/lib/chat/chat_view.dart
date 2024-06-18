import 'package:flutter/material.dart';

import '../widgets/chat_bubble.dart';
import '../widgets/chat_input.dart';

class ChatView extends StatelessWidget {
  ChatView({super.key});

  String test_message = "Your message goes here";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text("Hi Muzammil"),
          actions: [
            IconButton(
                onPressed: () {
                  print("Logout");
                  test_message = "hahahaha";
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
