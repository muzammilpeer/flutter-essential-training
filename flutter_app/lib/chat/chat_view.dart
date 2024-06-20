import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/chat_bubble/chat_bubble_model.dart';

import '../widgets/chat_bubble/chat_bubble_widget.dart';
import '../widgets/chat_input_widget.dart';

class ChatView extends StatelessWidget {
  ChatView({super.key});

  late Author author;

  // check reference variable effect on stateless widget,
  // (when view got rebuild) it will have changes
  String test_message = "Your message goes here";

  List<ChatBubbleModel> getDataSource() {
    return [
      ChatBubbleModel(
          text: "Your message goes here",
          author: author,
          createdAt: DateTime.now().microsecondsSinceEpoch,
          id: '1'),
      ChatBubbleModel(
          text: "Your message goes here1",
          author: author,
          createdAt: DateTime.now().microsecondsSinceEpoch,
          imageUrl: "https://picsum.photos/250?image=9",
          id: '2'),
      ChatBubbleModel(
          text: "Your message goes here",
          author: Author(username: "Peer Doe"),
          createdAt: DateTime.now().microsecondsSinceEpoch,
          id: '3'),
    ];
  }

  void logout(context) {
    print("Logout");
    test_message = "hahahaha";
    Navigator.pushReplacementNamed(context, "/");
  }

  @override
  Widget build(BuildContext context) {
    author = ModalRoute.of(context)!.settings.arguments as Author;

    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text("Hi ${author.username} !"),
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
            itemCount: getDataSource().length,
            itemBuilder: (context, index) {
              final chatModel = getDataSource()[index];

              return ChatBubbleWidget(
                  bubbleAlignment: chatModel.author.username == author.username
                      ? Alignment.centerRight
                      : Alignment.centerLeft,
                  chatModel: chatModel);
            },
          )),
          ChatInput()
        ],
      ),
    );
  }
}
