import 'package:Chat_App/models/chat_message_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:Chat_App/utils/brand_color.dart';
import 'package:Chat_App/utils/texfield_styles.dart';

class ChatInput extends StatelessWidget {
  final Function(ChatMessageEntity) onSubmit;
  ChatInput({super.key, required this.onSubmit});
  final controllerMessage = TextEditingController();
  void onSendBtnPressed() {
    final newChatMessage = ChatMessageEntity(
        text: controllerMessage.text,
        id: "244",
        createdAt: DateTime.now().millisecondsSinceEpoch,
        author: Author(username: "angel"));
    onSubmit(newChatMessage);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 15, right: 15),
      height: 75,
      decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.add,
              color: BrandColor.chatInputColor,
            ),
          ),
          Expanded(
              child: TextField(
            keyboardType: TextInputType.multiline,
            maxLines: 5,
            minLines: 1,
            textCapitalization: TextCapitalization.sentences,
            controller: controllerMessage,
            style: TextStyle(color: BrandColor.chatInputColor),
            decoration: InputDecoration(
                hintText: "Type your message",
                hintStyle: ThemeTextStyle.loginTextFieldStyle,
                border: InputBorder.none),
          )),
          IconButton(
            onPressed: onSendBtnPressed,
            icon: Icon(
              Icons.send,
              color: BrandColor.chatInputColor,
            ),
          ),
        ],
      ),
    );
  }
}
