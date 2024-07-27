import 'dart:convert';

import 'package:Chat_App/models/chat_message_entity.dart';
import 'package:Chat_App/utils/brand_color.dart';
import 'package:Chat_App/widgets/chat_bubble.dart';
import 'package:Chat_App/widgets/chat_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ChatPage extends StatefulWidget {
  ChatPage({Key? key}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  List<ChatMessageEntity> _messages = [];

  _loadMessages() async {
    rootBundle.loadString("assets/mock_messages.json").then((response) {
      final List<dynamic> decodedList = jsonDecode(response) as List;
      final List<ChatMessageEntity> _chatMessages = decodedList.map((listItem) {
        return ChatMessageEntity.fromJSON(listItem);
      }).toList();
      setState(() {
        _messages = _chatMessages;
      });
    });
  }

  onSentMessage(ChatMessageEntity entity) {
    _messages.add(entity);
    setState(() {});
  }

  @override
  void initState() {
    _loadMessages();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final username = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      backgroundColor: BrandColor.chatInputColor,
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
            itemCount: _messages.length,
            itemBuilder: (context, index) => ChatBubble(
              alignment: _messages[index].author.username != username
                  ? Alignment.bottomLeft
                  : Alignment.bottomRight,
              edgeLeft: _messages[index].author.username != username ? 0 : 12,
              edgeRight: _messages[index].author.username != username ? 12 : 0,
              entity: _messages[index],
            ),
          )),
          ChatInput(
            onSubmit: onSentMessage,
          ),
        ],
      ),
    );
  }
}
