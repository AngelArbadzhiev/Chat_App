import "package:Chat_App/models/chat_message_entity.dart";
import "package:Chat_App/utils/brand_color.dart";
import "package:flutter/material.dart";

class ChatBubble extends StatelessWidget {
  final ChatMessageEntity entity;
  final Alignment alignment;

  const ChatBubble(
      {super.key,
      required this.alignment,
      required this.entity,});

  @override
  Widget build(BuildContext context) {
    bool isAuthor = entity.author.username == "angel";
    return Align(
      alignment: alignment,
      child: Container(
        constraints:
            BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.6),
        padding: EdgeInsets.all(24.0),
        margin: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
            color: isAuthor ? Theme.of(context).primaryColor : Colors.black87,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
                bottomLeft: Radius.circular(0),
                bottomRight: Radius.circular(12))),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              entity.text,
              style: TextStyle(fontSize: 20, color: BrandColor.chatInputColor),
            ),
            if (entity.imageUrl != null)
              Container(
                  height: 200,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(entity.imageUrl!)),
                      borderRadius: BorderRadius.circular(12)))
          ],
        ),
      ),
    );
  }
}
