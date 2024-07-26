import 'package:flutter/material.dart';
import 'package:flutter_application_1/chat_page.dart';
import 'package:flutter_application_1/utils/brand_color.dart';
import 'package:flutter_application_1/utils/spaces.dart';
import 'package:flutter_application_1/utils/texfield_styles.dart';
import 'package:flutter_application_1/widgets/login_field.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController controllerUsername = TextEditingController();
  final TextEditingController controllerPassword = TextEditingController();
  final _formkey = GlobalKey<FormState>();
  void loginUser(context) {
    if (_formkey.currentState != null && _formkey.currentState!.validate()) {
      Navigator.pushReplacementNamed(context, "/chat",
          arguments: controllerUsername.text);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  textAlign: TextAlign.center,
                  "Let's sign you in!",
                  style: TextStyle(
                      fontSize: 30,
                      letterSpacing: 0.5,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ),
              Image(
                  image: AssetImage("assets/images/banner.png"),
                  height: 250,
                  width: 150),
              Form(
                key: _formkey,
                child: Column(
                  children: [
                    LoginField(
                      controller: controllerUsername,
                      type: "username",
                      obscureTextEnabled: false,
                    ),
                    verticalSpacing(15),
                    LoginField(
                        controller: controllerPassword,
                        type: "password",
                        obscureTextEnabled: true)
                  ],
                ),
              ),
              verticalSpacing(15),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: BrandColor.primaryColor),
                  onPressed: () {
                    loginUser(context);
                  },
                  child: Text(
                    "Log In",
                    style: TextStyle(color: BrandColor.chatInputColor),
                  )),
              verticalSpacing(15),
              GestureDetector(
                onTap: () {
                  //TODO: Redirect user to my website
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [Text("Find us on: "), Text("somesite.com")],
                ),
              )
            ]),
      ),
    ));
  }
}
