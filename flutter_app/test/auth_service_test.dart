import 'package:flutter_app/login/auth_service.dart';
import 'package:mockito/annotations.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

@GenerateMocks([AuthService, SharedPreferences, http.Client])
void main() {}
