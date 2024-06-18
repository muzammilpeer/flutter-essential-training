import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {
  final Alignment bubbleAlignment;
  final double cornerRadius;
  final String messageText;

  const ChatBubble(
      {super.key,
      this.bubbleAlignment = Alignment.centerLeft,
      this.cornerRadius = 10,
      required this.messageText});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: bubbleAlignment,
      child: Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                messageText,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 10,
                    color: Colors.white),
              ),
              Image(
                  height: 150,
                  width: 150,
                  fit: BoxFit.fitHeight,
                  image: NetworkImage(
                      "https://3009709.youcanlearnit.net/Alien_LIL_131338.png")),
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
