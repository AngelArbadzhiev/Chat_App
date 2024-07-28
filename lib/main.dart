import 'package:Chat_App/chat_page.dart';
import 'package:Chat_App/login_page.dart';
import 'package:Chat_App/services/auth_services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AuthServices.init();
  runApp(ChangeNotifierProvider(
    create: (BuildContext context) => AuthServices(),
    child: ChatApp(),
  ));
}

class ChatApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Flutter Chat app",
        theme: ThemeData(
            canvasColor: Colors.transparent,
            primarySwatch: Colors.deepPurple,
            appBarTheme: AppBarTheme(
                backgroundColor: Colors.blue, foregroundColor: Colors.black)),
        home: FutureBuilder<bool>(
          builder: (context, AsyncSnapshot<bool> snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasData && snapshot.data!) {
                return ChatPage();
              } else {
                return LoginPage();
              }
            }
            return CircularProgressIndicator();
          },
          future: context.read<AuthServices>().isLoggedIn(),
        ),
        routes: {"/chat": (context) => ChatPage()});
  }
}
