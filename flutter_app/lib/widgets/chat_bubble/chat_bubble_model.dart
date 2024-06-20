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

  factory ChatBubbleModel.fromJson(Map<String, dynamic> json) {
    return ChatBubbleModel(
        id: json['id'],
        text: json['text'],
        imageUrl: json['imageUrl'],
        createdAt: json['createdAt'],
        author: Author.fromJson(json['author']));
  }
}

class Author {
  String username;
  int? lastSeen;

  Author({required this.username});

  factory Author.fromJson(Map<String, dynamic> json) {
    return Author(username: json['username']);
  }
}
