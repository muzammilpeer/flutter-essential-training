import '../widgets/chat_bubble/chat_bubble_model.dart';

class AuthService {
  Author _author = Author(username: "peer123");

  void loginUser() {}

  void logout() {}

  Author getAuthor() {
    return _author;
  }

  void setAuthor(Author author) {
    _author = author;
  }
}
