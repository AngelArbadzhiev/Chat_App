import 'package:Chat_App/services/auth_services.dart';
import 'package:Chat_App/utils/brand_color.dart';
import 'package:Chat_App/utils/spaces.dart';
import 'package:Chat_App/widgets/login_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_media_buttons/social_media_buttons.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LoginPage extends StatelessWidget {
  final TextEditingController controllerUsername = TextEditingController();
  final TextEditingController controllerPassword = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final String _mainUrl = "https://www.google.com";
  static String linkedinUrl = "https://linkedin.com";
  static String githubUrl = "https://github.com/AngelArbadzhiev";
  static String instagramUrl = "https://instagram.com";
  static String facebookUrl = "https://facebook.com";

  Widget _buildHeader(BuildContext context) {
    return Column(children: [
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
            fontWeight: FontWeight.w500, fontSize: 20, color: Colors.blueGrey),
      ),
      Container(
          height: 200,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.fitWidth,
                  image: AssetImage("assets/images/banner.png")),
              borderRadius: BorderRadius.circular(24))),
      verticalSpacing(24),
    ]);
  }

  Widget _buildForm(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Form(
          key: _formKey,
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
        verticalSpacing(24),
        ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: BrandColor.primaryColor),
            onPressed: () async {
              await loginUser(context);
            },
            child: Text(
              "Log In",
              style: TextStyle(color: BrandColor.chatInputColor),
            )),
        verticalSpacing(12),
        ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: BrandColor.primaryColor),
            onPressed: () async {
              await registerUser(context);
            },
            child: Text(
              "Register",
              style: TextStyle(color: BrandColor.chatInputColor),
            )),
      ],
    );
  }

  Widget _buildFooter() {
    return Column(
      children: [
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
      ],
    );
  }

  Future<void> loginUser(BuildContext context) async {
    if (_formKey.currentState != null && _formKey.currentState!.validate()) {
      final url = Uri.parse('http://37.63.57.37:3000/login'); // Your server's IP address

      try {
        final response = await http.post(
          url,
          headers: {'Content-Type': 'application/json'},
          body: json.encode({
            'email': controllerUsername.text,
            'password': controllerPassword.text,
          }),
        );

        if (response.statusCode == 200) {
          // Handle successful login
          Navigator.pushReplacementNamed(context, "/chat", arguments: controllerUsername.text);
          print('Login successful');
        } else {
          // Handle unsuccessful login
          final responseBody = json.decode(response.body);
          print('Login failed: ${responseBody['message']}');
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text('Login Failed'),
                content: Text(responseBody['message']),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: Text('OK'),
                  ),
                ],
              );
            },
          );
        }
      } catch (error) {
        print('Error: $error');
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('Error'),
              content: Text('Failed to connect to server. Please try again later.'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text('OK'),
                ),
              ],
            );
          },
        );
      }
    }
  }

  Future<void> registerUser(BuildContext context) async {
    if (_formKey.currentState != null && _formKey.currentState!.validate()) {
      final url = Uri.parse('http://37.63.57.37:3000/register'); // Your server's IP address

      try {
        final response = await http.post(
          url,
          headers: {'Content-Type': 'application/json'},
          body: json.encode({
            'email': controllerUsername.text,
            'password': controllerPassword.text,
          }),
        );

        if (response.statusCode == 201) {
          print('User registered successfully');
          // Optionally, log in the user after registration
          await loginUser(context);
        } else {
          final responseBody = json.decode(response.body);
          print('Failed to register user: ${responseBody['error']}');
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text('Registration Failed'),
                content: Text(responseBody['error']),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: Text('OK'),
                  ),
                ],
              );
            },
          );
        }
      } catch (error) {
        print('Error: $error');
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('Error'),
              content: Text('Failed to connect to server. Please try again later.'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text('OK'),
                ),
              ],
            );
          },
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: BrandColor.chatInputColor,
        resizeToAvoidBottomInset: false,
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child:
            LayoutBuilder(builder: (context, BoxConstraints constraints) {
              if (constraints.maxWidth > 600) {
                return Row(
                  children: [
                    Spacer(flex: 1),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [_buildHeader(context), _buildFooter()],
                      ),
                    ),
                    Spacer(flex: 1),
                    Expanded(child: _buildForm(context)),
                    Spacer(flex: 1)
                  ],
                );
              }
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _buildHeader(context),
                  _buildForm(context),
                  _buildFooter(),
                ],
              );
            }),
          ),
        ));
  }
}
