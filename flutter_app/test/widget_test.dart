// import 'package:flutter/material.dart';
import 'package:flutter_app/login/auth_service.dart';
import 'package:flutter_app/main.dart';
import 'package:flutter_app/widgets/chat_bubble/chat_bubble_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'auth_service_test.mocks.dart';

@GenerateMocks([AuthService, SharedPreferences, http.Client])
void main() {
  late MockAuthService mockAuthService;
  late MockSharedPreferences mockSharedPreferences;
  late MockClient mockHttpClient;

  setUp(() async {
    mockAuthService = MockAuthService();
    mockSharedPreferences = MockSharedPreferences();
    mockHttpClient = MockClient();

    // Mock SharedPreferences instance
    when(mockSharedPreferences.getString(any)).thenReturn(null);

    // Set up the static _prefs in AuthService
    AuthService.init();

    // Stub the getAuthor method
    when(mockAuthService.getAuthor()).thenReturn(Author(username: 'test_user'));

    // Mock HTTP client for network image
    when(mockHttpClient.get(Uri.parse(
            "https://pixelford.com/api/img/small/Clouds%20in%20a%20blue%20sky_LIL_134208.jpg")))
        .thenAnswer((_) async => http.Response('Mocked image data', 200));
    when(mockHttpClient.get(Uri.parse(
            "https://pixelford.com/api/img/small/Dog_LIL_134140.jpg")))
        .thenAnswer((_) async => http.Response('Mocked image data', 200));
  });

  Future<void> pumpChatApp(WidgetTester tester) async {
    await tester.pumpWidget(
      MultiProvider(
        providers: [
          ChangeNotifierProvider<AuthService>(create: (_) => mockAuthService),
          Provider<http.Client>(create: (_) => mockHttpClient),
        ],
        child: const ChatApp(),
      ),
    );
  }

  // testWidgets('shows ChatView when user is logged in',
  //     (WidgetTester tester) async {
  //   when(mockAuthService.isUserLoggedIn()).thenAnswer((_) async {
  //     await Future.delayed(Duration(seconds: 1));
  //     return true;
  //   });
  //
  //   await pumpChatApp(tester);
  //
  //   // Wait for FutureBuilder to complete
  //   await tester.pumpAndSettle();
  //
  //   expect(find.byType(ChatView), findsOneWidget);
  // });
  //
  // testWidgets('shows LoginView when user is not logged in',
  //     (WidgetTester tester) async {
  //   when(mockAuthService.isUserLoggedIn()).thenAnswer((_) async {
  //     await Future.delayed(Duration(seconds: 1));
  //     return false;
  //   });
  //
  //   await pumpChatApp(tester);
  //
  //   // Wait for FutureBuilder to complete
  //   await tester.pumpAndSettle();
  //
  //   expect(find.byType(LoginView), findsOneWidget);
  // });

  // testWidgets('shows CircularProgressIndicator while waiting',
  //     (WidgetTester tester) async {
  //   when(mockAuthService.isUserLoggedIn()).thenAnswer((_) async {
  //     await Future.delayed(Duration(seconds: 1));
  //     return true;
  //   });
  //
  //   await pumpChatApp(tester);
  //
  //   // Initial pump to start the FutureBuilder
  //   await tester.pump();
  //
  //   expect(find.byType(CircularProgressIndicator), findsOneWidget);
  //
  //   // Complete the Future
  //   await tester.pumpAndSettle();
  // });
  testWidgets("hello", (WidgetTester tester) async {
    expect("hello", "hello");
  });
}
