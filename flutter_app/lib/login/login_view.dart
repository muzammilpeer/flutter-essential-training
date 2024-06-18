import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Let's sign you in",
            style: TextStyle(
                fontSize: 30,
                color: Colors.orange,
                fontWeight: FontWeight.bold,
                letterSpacing: 0.5),
          ),
          Text(
            "Welcome back!\n you are missed!",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 15,
                color: Colors.grey,
                fontWeight: FontWeight.bold,
                letterSpacing: 0.5),
          ),
          Container(
            width: 150,
            height: 150,
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                    "https://3009709.youcanlearnit.net/Alien_LIL_131338.png"),
                fit: BoxFit.fitHeight,
              ),
              color: Colors.green,
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ],
      ),
    ));
  }
}
//
