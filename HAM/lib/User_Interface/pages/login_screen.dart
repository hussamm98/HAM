import 'dart:convert';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_auth/User_Interface/components/Sec_rounded_password_field.dart';
import 'package:flutter_auth/User_Interface/components/background.dart';
import 'package:flutter_auth/User_Interface/components/bottom_navigation.dart';
import 'package:flutter_auth/User_Interface/components/navigation_bar.dart';
import 'package:flutter_auth/User_Interface/components/rounded_button.dart';
import 'package:flutter_auth/User_Interface/components/rounded_input_field.dart';
import 'package:flutter_auth/User_Interface/components/rounded_password_field.dart';
import 'package:flutter_auth/User_Interface/pages/UserModel.dart';
import 'package:flutter_auth/User_Interface/pages/confirm_password.dart';
import 'package:flutter_svg/svg.dart';
import 'UserModel.dart';
import 'change_password.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'change_password.dart';
import 'home.dart';
import 'package:form_field_validator/form_field_validator.dart';

UserModel user;
Future<UserModel> createUser(String email, String pass) async {
  final String apiUrl =
      "http://hussam69-001-site1.dtempurl.com/api/ApiHAMController/GetUserWithBody";
  final response = await http.post(
    apiUrl,
    body: jsonEncode(<String, String>{"userName": email, "password": pass}),
    headers: {
      'Content-Type': 'application/json',
      //'Authorization' : 'Bearer $token '
    },
  );

  if (response.statusCode == 200) {
    final String responseString = response.body;
    print(' RESPONSE STATUS =: ${response.statusCode}');
    print('RESPONSE body = ${response.body}');
    return UserModel.fromJson(response.body);
  } else {
    print('Error!');
    print(' RESPONSE STATUS =: ${response.statusCode}');
    print('RESPONSE body = ${response.body}');

    return null;
  }
}

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  GlobalKey<FormState> key = GlobalKey<FormState>(); //modified
  void validate() {
    if (key.currentState.validate()) {
      print("Validated");
    } else {
      print("Not Validated");
    }
  }

  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passController = new TextEditingController();

  //---------------- Shared preferences --------------------------------//
  SharedPreferences prefs;

  String email;
  String pass;

  saveData(String email, String pass) async {
    prefs = await SharedPreferences.getInstance();
    prefs.setString('email', email);
    prefs.setString('password', pass);
  }

  getData() async {
    prefs = await SharedPreferences.getInstance();
    setState(() {
      email = prefs.getString('email');
      pass = prefs.getString('password');
      print(email);
      print(pass);
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Background(
          child: Form(
            autovalidate: true, //modified
            key: key, //modified
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "LOGIN",
                  style: TextStyle(
                      color: Color(0xFF6a2c70),
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
                SizedBox(height: size.height * 0.03),
                SvgPicture.asset(
                  "assets/icons/login.svg",
                  height: size.height * 0.35,
                ),
                SizedBox(height: size.height * 0.03),
                RoundedInputField(
                  hintText: "Your Email",
                  emailController: emailController,
                ),
                RoundedPasswordField2("Password", passController),
                SizedBox(
                  height: size.height * 0.02,
                ),
                RoundedButton(
                  //  دا الزرار الي هيوديك لصفحه الهووووووووووووووووووووم
                  text: "LOGIN",
                  press: () async {
                    print(emailController.text);
                    print(passController.text);
                    final String email = emailController.text;
                    final String pass = passController.text;
                    final UserModel user1 = await createUser(email, pass);
                    print(user);

                    setState(() {
                      user = user1;
                    });
                    if (user1 == null) //if user is wrong
                    {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Invalid email or password')));
                      //any ui change msln

                    }
                    if (user.firstTime == false) {
                      // callMe();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            //if condition
                            return MyBottomNavigationBar(
                              user: user,
                            );
                            //return Home();
                          },
                        ),
                      );
                    } else {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            //if condition
                            return ConfirmPassword(
                              user: user,
                            );
                            //return Home();
                          },
                        ),
                      );
                    }
                  },
                ),
                SizedBox(height: size.height * 0.03),
                GestureDetector(
                  child: Text(
                    "Change Password",
                    style: TextStyle(
                      color: Color(0xFF522546),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return ChangePassword(
                            user: user,
                          );
                        },
                      ),
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
