import 'package:flutter/material.dart';
import 'package:Chat_App/login_page.dart';
import 'package:Chat_App/chat_page.dart';

void main() {
  runApp(ChatApp());
}

class ChatApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Flutter Chat app",
        theme: ThemeData(
            primarySwatch: Colors.deepPurple,
            appBarTheme: AppBarTheme(
                backgroundColor: Colors.blue, foregroundColor: Colors.black)),
        home: LoginPage(),
        routes: {"/chat": (context) => ChatPage()});
  }
}
