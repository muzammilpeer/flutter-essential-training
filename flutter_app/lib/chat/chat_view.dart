import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/widgets/chat_bubble/chat_bubble_model.dart';
import 'package:provider/provider.dart';

import '../login/auth_service.dart';
import '../widgets/chat_bubble/chat_bubble_widget.dart';
import '../widgets/chat_input_widget.dart';

class ChatView extends StatefulWidget {
  const ChatView({super.key});

  @override
  State<ChatView> createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView> {
  late Author author;

  late List<ChatBubbleModel> _chatMessages = [];

  // check reference variable effect on stateless widget,
  String testMessage = "Your message goes here";

  void loadJsonChatMessages() async {
    // load json chat messages
    final encodedJson =
        await rootBundle.loadString("assets/mock_chat_messages.json");
    final List<dynamic> decodedList = jsonDecode(encodedJson) as List;
    final List<ChatBubbleModel> chatMessages = decodedList.map((item) {
      return ChatBubbleModel.fromJson(item);
    }).toList();
    setState(() {
      _chatMessages = chatMessages;
    });
  }

  void onMessageSentCallback(ChatBubbleModel chatMessage) {
    setState(() {
      _chatMessages.add(chatMessage);
    });
  }

  @override
  void initState() {
    loadJsonChatMessages();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final author = context.watch<AuthService>().getAuthor();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text("Hi ${author.username} !"),
          actions: [
            IconButton(
                onPressed: () {
                  context
                      .read<AuthService>()
                      .updateAuthor(Author(username: "test"));
                },
                icon: const Icon(Icons.logout)),
            IconButton(
                onPressed: () {
                  logout(context);
                },
                icon: const Icon(Icons.logout))
          ]),
      body: Column(
        children: [
          Expanded(
              child: ListView.builder(
            itemCount: _chatMessages.length,
            itemBuilder: (context, index) {
              final chatModel = _chatMessages[index];

              return ChatBubbleWidget(
                  bubbleAlignment: chatModel.author.username == author.username
                      ? Alignment.centerRight
                      : Alignment.centerLeft,
                  chatModel: chatModel);
            },
          )),
          ChatInput(onSubmitCallback: onMessageSentCallback)
        ],
      ),
    );
  }

  void logout(BuildContext context) {
    testMessage = "hahahaha";
    context.read<AuthService>().logout();
    Navigator.pushReplacementNamed(context, "/login");
  }
}
