import 'package:flutter/material.dart';
import 'package:flutter_app/login/auth_service.dart';
import 'package:flutter_app/widgets/chat_bubble/chat_bubble_model.dart';

import '../utils/theme_colors.dart';
import 'network_gallery_widget.dart';
import 'package:provider/provider.dart';

class ChatInput extends StatefulWidget {
  final Function(ChatBubbleModel) onSubmitCallback;

  const ChatInput({super.key, required this.onSubmitCallback});

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

  void sendMessage(BuildContext context) {
    if (chatMessageController.text.isNotEmpty) {
      ChatBubbleModel chatMessage = ChatBubbleModel(
          text: chatMessageController.text,
          id: "1",
          author: context.read<AuthService>().getAuthor(),
          createdAt: DateTime.now().millisecondsSinceEpoch);

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
      decoration: const BoxDecoration(
        color: ThemeColors.chatInputColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
              onPressed: () {
                showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      return NetworkGalleryWidget(
                          attachmentImageCallback: onImagePicked);
                    });
              },
              icon: const Icon(Icons.add_a_photo)),
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
                  style: const TextStyle(color: Colors.black),
                  decoration: const InputDecoration(
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
              icon: const Icon(Icons.send))
        ],
      ),
    );
  }
}
