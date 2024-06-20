import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/chat_bubble/chat_bubble_model.dart';

import '../utils/theme_colors.dart';
import 'network_gallery_widget.dart';

class ChatInput extends StatefulWidget {
  final Function(ChatBubbleModel) onSubmitCallback;

  ChatInput({super.key, required this.onSubmitCallback});

  @override
  State<ChatInput> createState() => _ChatInputState();
}

class _ChatInputState extends State<ChatInput> {
  String _selectedAttachmentImageUrl = "";

  TextEditingController chatMessageController = TextEditingController();

  void onImagePicked(String attachmentImage) {
    setState(() {
      _selectedAttachmentImageUrl = attachmentImage;
    });
    Navigator.of(context).pop();
  }

  void sendMessage(context) {
    if (chatMessageController.text.isNotEmpty) {
      ChatBubbleModel chatMessage = ChatBubbleModel(
          text: chatMessageController.text,
          id: "1",
          author: Author(username: "peer123"),
          createdAt: DateTime.now().millisecondsSinceEpoch);
      print("Message = ${chatMessageController.text}");
      if (_selectedAttachmentImageUrl.isNotEmpty) {
        chatMessage.imageUrl = _selectedAttachmentImageUrl;
      }

      widget.onSubmitCallback(chatMessage);

      chatMessageController.clear();
      _selectedAttachmentImageUrl = "";
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ThemeColors.chatInputColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
              onPressed: () {
                print("Add attachment");
                showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      return NetworkGalleryWidget(
                          attachmentImageCallback: onImagePicked);
                    });
              },
              icon: Icon(Icons.add_a_photo)),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  keyboardType: TextInputType.multiline,
                  maxLines: 5,
                  minLines: 1,
                  textCapitalization: TextCapitalization.sentences,
                  controller: chatMessageController,
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    hintStyle: TextStyle(color: Colors.blueGrey),
                    border: InputBorder.none,
                    hintText: "Type your message",
                  ),
                ),
                if (_selectedAttachmentImageUrl.isNotEmpty)
                  Image.network(
                    _selectedAttachmentImageUrl,
                    height: 150,
                  ),
              ],
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
