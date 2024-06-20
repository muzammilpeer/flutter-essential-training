class ChatBubbleModel {
  String id;
  String text;
  String? imageUrl;
  int createdAt;
  Author author;

  ChatBubbleModel({
    required this.id,
    required this.text,
    this.imageUrl,
    required this.createdAt,
    required this.author,
  });
}

class Author {
  String username;
  int? lastSeen;

  Author({required this.username});
}
