import "package:Chat_App/models/chat_message_entity.dart";
import "package:flutter/material.dart";
import "package:Chat_App/utils/brand_color.dart";

class ChatBubble extends StatelessWidget {
  final ChatMessageEntity entity;
  final Alignment alignment;
  const ChatBubble({super.key, required this.alignment, required this.entity});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment,
      child: Container(
        constraints:
            BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.4),
        padding: EdgeInsets.all(24),
        margin: EdgeInsets.all(50),
        decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
                bottomLeft: Radius.circular(12))),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              entity.text,
              style: TextStyle(fontSize: 20, color: BrandColor.chatInputColor),
            ),
            if (entity.imageUrl != null) Image.network("${entity.imageUrl}")
          ],
        ),
      ),
    );
  }
}
