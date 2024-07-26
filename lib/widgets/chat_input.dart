import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/utils/brand_color.dart';
import 'package:flutter_application_1/utils/texfield_styles.dart';

class ChatInput extends StatelessWidget {
  ChatInput({super.key});
  final controllerMessage = TextEditingController();
  void onSendBtnPressed() {
    print(controllerMessage.text);
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
