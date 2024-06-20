import 'package:shared_preferences/shared_preferences.dart';

import '../widgets/chat_bubble/chat_bubble_model.dart';

class AuthService {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  Author _author = Author(username: "");

  Future<void> loginUser(String username) async {
    try {
      SharedPreferences preferences = await _prefs;
      _author = Author(username: username);
      preferences.setString("username", _author.username);
    } catch (e) {
      print("Storing value failed: $e");
    }
  }

  Future<void> logout() async {
    SharedPreferences preferences = await _prefs;
    _author = Author(username: "");
    preferences.clear();
  }

  Author getAuthor() {
    return _author;
  }
}
