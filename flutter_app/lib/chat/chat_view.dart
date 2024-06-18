import 'package:flutter/material.dart';

class ChatView extends StatelessWidget {
  const ChatView({super.key});

  final double cornerRadius = 10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text("Hi Muzammil"),
          actions: [
            IconButton(
                onPressed: () {
                  print("Logout");
                },
                icon: Icon(Icons.logout))
          ]),
      body: Column(
        children: [
          Flexible(
            flex: 3,
            fit: FlexFit.loose,
            child: ListView(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "It's your message",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 10,
                                color: Colors.white),
                          ),
                          Image(
                              height: 150,
                              width: 150,
                              fit: BoxFit.fitHeight,
                              image: NetworkImage(
                                  "https://3009709.youcanlearnit.net/Alien_LIL_131338.png")),
                        ],
                      ),
                      padding: EdgeInsets.all(cornerRadius),
                      margin: EdgeInsets.all(cornerRadius),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(cornerRadius),
                              topRight: Radius.circular(cornerRadius),
                              bottomLeft: Radius.circular(cornerRadius)),
                          color: Colors.grey)),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "It's your message",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 10,
                                color: Colors.white),
                          ),
                          Image(
                              height: 150,
                              width: 150,
                              fit: BoxFit.fitHeight,
                              image: NetworkImage(
                                  "https://3009709.youcanlearnit.net/Alien_LIL_131338.png")),
                        ],
                      ),
                      padding: EdgeInsets.all(cornerRadius),
                      margin: EdgeInsets.all(cornerRadius),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(cornerRadius),
                              topRight: Radius.circular(cornerRadius),
                              bottomLeft: Radius.circular(cornerRadius)),
                          color: Colors.grey)),
                ),
              ],
            ),
          ),
          Flexible(
            flex: 1,
            fit: FlexFit.tight,
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                color: Colors.black,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () {
                        print("Add attachment");
                      },
                      icon: Icon(Icons.add_a_photo)),
                  Text("Type a message"),
                  IconButton(
                      onPressed: () {
                        print("Send Message");
                      },
                      icon: Icon(Icons.send))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
