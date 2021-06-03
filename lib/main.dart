import 'package:flutter/material.dart';
import 'package:flutter_auth/User_Interface/pages/login_screen.dart';
import 'package:flutter_auth/User_Interface/pages/welcome_screen.dart';
import 'package:flutter_auth/constants.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: WelcomeScreen(),
    );
  }
}
