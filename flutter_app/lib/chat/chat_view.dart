import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/chat_bubble/chat_bubble_model.dart';

import '../widgets/chat_bubble/chat_bubble_widget.dart';
import '../widgets/chat_input_widget.dart';

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
              ChatBubbleModel chatModel = ChatBubbleModel(
                author: Author(username: "John Doe"),
                id: "$index",
                text: index.isEven
                    ? "Your message goes here index $index"
                    : "My message goes here index  $index",
                createdAt: DateTime.now().microsecondsSinceEpoch,
              );
              return ChatBubbleWidget(
                  bubbleAlignment: index.isEven
                      ? Alignment.centerLeft
                      : Alignment.centerRight,
                  chatModel: chatModel);
            },
          )),
          ChatInput()
        ],
      ),
    );
  }
}
