import 'package:flutter/material.dart';

class ChatInput extends StatelessWidget {
  ChatInput({super.key});

  TextEditingController chatMessageController = TextEditingController();

  void sendMessage() {
    if (chatMessageController.text.isNotEmpty) {
      print("Message = ${chatMessageController.text}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: Colors.black,
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
                sendMessage();
              },
              icon: Icon(Icons.send))
        ],
      ),
    );
  }
}
