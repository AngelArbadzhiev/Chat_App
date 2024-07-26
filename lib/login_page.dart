import 'package:flutter/material.dart';
import 'package:Chat_App/utils/brand_color.dart';
import 'package:Chat_App/utils/spaces.dart';
import 'package:Chat_App/widgets/login_field.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:social_media_buttons/social_media_buttons.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController controllerUsername = TextEditingController();
  final TextEditingController controllerPassword = TextEditingController();
  final _formkey = GlobalKey<FormState>();
  final String _mainUrl = "https://www.google.com";
  static String linkedinUrl = "https://linkedin.com";
  static String githubUrl = "https://github.com/AngelArbadzhiev";
  static String instagramUrl = "https://instagram.com";
  static String facebookUrl = "https://facebook.com";
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
              Text(
                'Welcome back! \n You\'ve been missed!',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                    color: Colors.blueGrey),
              ),
              Image(image: AssetImage("assets/images/banner.png"), height: 200),
              verticalSpacing(15),
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
                onTap: () async {
                  if (await canLaunchUrl(Uri.parse(_mainUrl))) {
                    await launchUrl(Uri.parse(_mainUrl));
                  } else {
                    throw 'Could not launch $_mainUrl';
                  }
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [Text("Find us on: "), Text(_mainUrl)],
                ),
              ),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                SocialMediaButton.linkedin(
                    url: linkedinUrl, color: BrandColor.primaryColor),
                SocialMediaButton.instagram(
                    url: instagramUrl, color: BrandColor.primaryColor),
                SocialMediaButton.github(
                    url: githubUrl, color: BrandColor.primaryColor),
                SocialMediaButton.facebook(
                    url: facebookUrl, color: BrandColor.primaryColor)
              ])
            ]),
      ),
    ));
  }
}
