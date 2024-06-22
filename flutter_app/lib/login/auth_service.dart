import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../widgets/chat_bubble/chat_bubble_model.dart';

class AuthService extends ChangeNotifier {
  static init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static late final SharedPreferences _prefs;
  Author _author = Author(username: "");

  Future<void> loginUser(String username) async {
    try {
      _author = Author(username: username);
      _prefs.setString("username", _author.username);
    } catch (e) {
      // handle error
    }
  }

  void logout() {
    _author = Author(username: "");
    _prefs.clear();
  }

  Author getAuthor() {
    _author = Author(username: _prefs.getString("username") ?? "");
    return _author;
  }

  void updateAuthor(Author author) {
    _author = author;
    _prefs.setString("username", _author.username);
    notifyListeners();
  }

  Future<bool> isUserLoggedIn() async {
    String? username = _prefs.getString("username");
    if (username != null) {
      return true;
    }
    return false;
  }
}
