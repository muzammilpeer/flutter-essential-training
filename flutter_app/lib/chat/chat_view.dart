import 'package:flutter/material.dart';

import '../widgets/chat_bubble.dart';
import '../widgets/chat_input.dart';

class ChatView extends StatelessWidget {
  const ChatView({super.key});

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
                },
                icon: Icon(Icons.logout))
          ]),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                ChatBubble(messageText: "It's your message"),
                ChatBubble(
                    bubbleAlignment: Alignment.centerRight,
                    messageText: "It's my message"),
              ],
            ),
          ),
          const ChatInput(),
        ],
      ),
    );
  }
}
