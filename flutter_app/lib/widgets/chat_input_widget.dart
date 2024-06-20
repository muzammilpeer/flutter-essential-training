import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/chat_bubble/chat_bubble_model.dart';

import '../utils/theme_colors.dart';

class ChatInput extends StatelessWidget {
  final Function(ChatBubbleModel) chatMessageCallback;

  ChatInput({super.key, required this.chatMessageCallback});

  TextEditingController chatMessageController = TextEditingController();

  void sendMessage(context) {
    if (chatMessageController.text.isNotEmpty) {
      ChatBubbleModel chatMessage = ChatBubbleModel(
          text: chatMessageController.text,
          id: "1",
          author: Author(username: "peer123"),
          createdAt: DateTime.now().millisecondsSinceEpoch);
      print("Message = ${chatMessageController.text}");
      chatMessageCallback(chatMessage);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: ThemeColors.chatInputColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
              onPressed: () {
                print("Add attachment");
              },
              icon: Icon(Icons.add_a_photo)),
          Expanded(
            child: TextField(
              keyboardType: TextInputType.multiline,
              maxLines: 5,
              minLines: 1,
              textCapitalization: TextCapitalization.sentences,
              controller: chatMessageController,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintStyle: TextStyle(color: Colors.blueGrey),
                border: InputBorder.none,
                hintText: "Type your message",
              ),
            ),
          ),
          IconButton(
              onPressed: () {
                sendMessage(context);
              },
              icon: Icon(Icons.send))
        ],
      ),
    );
  }
}
