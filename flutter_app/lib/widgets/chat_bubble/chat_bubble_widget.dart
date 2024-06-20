import 'package:flutter/material.dart';
import 'package:flutter_app/utils/theme_colors.dart';

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
          constraints:
              BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.5),
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
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 200,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.fitHeight,
                        image: NetworkImage(chatModel.imageUrl!)),
                    borderRadius:
                        BorderRadius.all(Radius.circular(cornerRadius)),
                  ),
                )
            ],
          ),
          padding: EdgeInsets.all(cornerRadius),
          margin: EdgeInsets.all(cornerRadius),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(cornerRadius),
                topRight: Radius.circular(cornerRadius),
                bottomLeft: Radius.circular(
                    bubbleAlignment == Alignment.centerLeft ? 0 : cornerRadius),
                bottomRight: Radius.circular(
                    bubbleAlignment == Alignment.centerLeft
                        ? cornerRadius
                        : 0)),
            color: bubbleAlignment == Alignment.centerLeft
                ? ThemeColors.chatBubbleColor
                : ThemeColors.chatBubbleAuthorColor,
          )),
    );
  }
}
