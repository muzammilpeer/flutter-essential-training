import 'package:flutter/material.dart';

import 'chat_bubble_model.dart';

class ChatBubbleWidget extends StatelessWidget {
  final Alignment bubbleAlignment;
  final double cornerRadius;
  final ChatBubbleModel chatModel;

  const ChatBubbleWidget(
      {super.key,
      this.bubbleAlignment = Alignment.centerLeft,
      this.cornerRadius = 10,
      required this.chatModel});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: bubbleAlignment,
      child: Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                this.chatModel.text,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 10,
                    color: Colors.white),
              ),
              if (this.chatModel.imageUrl != null)
                Image.network(
                  this.chatModel.imageUrl!,
                  height: 200,
                )
            ],
          ),
          padding: EdgeInsets.all(cornerRadius),
          margin: EdgeInsets.all(cornerRadius),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(cornerRadius),
                  topRight: Radius.circular(cornerRadius),
                  bottomLeft: Radius.circular(cornerRadius)),
              color: Colors.grey)),
    );
  }
}
