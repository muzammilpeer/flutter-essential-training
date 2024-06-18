import 'package:flutter/material.dart';

class ChatInput extends StatelessWidget {
  const ChatInput({super.key});

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
          Text("Type a message"),
          IconButton(
              onPressed: () {
                print("Send Message");
              },
              icon: Icon(Icons.send))
        ],
      ),
    );
  }
}
