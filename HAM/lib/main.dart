import 'package:flutter/material.dart';
import 'package:flutter_auth/HAM_Chat/welcome_chat_screen.dart';
import 'package:flutter_auth/User_Interface/components/navigation_bar.dart';
import 'package:flutter_auth/User_Interface/pages/category_screen.dart';
import 'package:flutter_auth/User_Interface/pages/confirm_password.dart';
import 'package:flutter_auth/User_Interface/pages/home.dart';
import 'package:flutter_auth/User_Interface/pages/login_screen.dart';
import 'package:flutter_auth/User_Interface/pages/profile_screen.dart';
import 'package:flutter_auth/User_Interface/pages/welcome_screen.dart';
import 'package:flutter_auth/constants.dart';
import 'User_Interface/components/bottom_navigation.dart';
import 'User_Interface/pages/schedule_screen.dart';

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
