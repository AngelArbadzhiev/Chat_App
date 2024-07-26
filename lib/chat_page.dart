import 'package:flutter/material.dart';
import 'package:Chat_App/widgets/chat_bubble.dart';
import 'package:Chat_App/widgets/chat_input.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final username = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text("Hello $username!"),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, "/");
              },
              icon: Icon(Icons.logout))
        ],
      ),
      body: Column(
        children: [
          Expanded(
              child: ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) => ChatBubble(
                alignment: index % 2 == 0
                    ? Alignment.bottomRight
                    : Alignment.bottomLeft,
                message: "Hello"),
          )),
          ChatInput(),
        ],
      ),
    );
  }
}
