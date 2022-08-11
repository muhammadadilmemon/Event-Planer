
import 'package:eventplaner/screens/UploadEvent.dart';
import 'package:eventplaner/screens/signupPage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:eventplaner/screens/homePage.dart';
import 'package:eventplaner/screens/welcomePage.dart';
import 'package:flutter/material.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  // print("in main");
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
//      home: SignUpPage(),

      home: SignUp(),
    );
  }
}
