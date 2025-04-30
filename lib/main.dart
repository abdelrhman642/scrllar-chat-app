
import 'package:chhat_app/firebase_options.dart';
import 'package:chhat_app/pages/chat_page.dart';
import 'package:chhat_app/pages/login_page.dart';
import 'package:chhat_app/pages/resgister_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async{
   WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(ScholarChat());
}

class ScholarChat extends StatelessWidget {
  const ScholarChat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        LoginPage.id: (context) => LoginPage(),
        ResgisterPage.id: (context) => ResgisterPage(),
        ChatPage.id: (context) => ChatPage(),
      },
      initialRoute: LoginPage.id,
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}
