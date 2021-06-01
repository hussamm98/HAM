import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_auth/User_Interface/components/Sec_rounded_password_field.dart';
import 'package:flutter_auth/User_Interface/components/rounded_button.dart';
import 'package:flutter_auth/User_Interface/components/rounded_input_field.dart';
import 'package:flutter_auth/User_Interface/components/rounded_password_field.dart';
import 'package:flutter_auth/User_Interface/pages/UserModel.dart';
import 'package:flutter_svg/svg.dart';
import '../components/background.dart';
import 'UserConfirm.dart';
import 'login_screen.dart';
import 'package:http/http.dart' as http;
import 'package:form_field_validator/form_field_validator.dart';

class ChangePassword extends StatefulWidget {
  final UserModel user; //hena data 1

  const ChangePassword({Key key, this.user}) : super(key: key); //constructor 2
  @override
  _ChangePasswordState createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  Future<UserConfirm> createUser(
      String emailpass, String curPass, String newPass) async {
    final String apiUrl =
        "http://hussam69-001-site1.dtempurl.com/api/ApiHAMController/ChangePassword";
    final response = await http.post(
      apiUrl,
      body: jsonEncode(<String, String>{
        "id": "ab4f74eb-933e-4ad3-bf84-6c4031c2ceb2",
        "UserName": emailpass,
        "CurrentPassword": curPass,
        "NewPassword": newPass
      }),
      headers: {
        'Content-Type': 'application/json',
        //'Authorization' : 'Bearer $token '
      },
    );

    if (response.statusCode == 200) {
      final String responseString = response.body;
      print(' RESPONSE STATUS =: ${response.statusCode}');
      print('RESPONSE body = ${response.body}');
      return userConfirmFromJson(responseString);
    } else {
      print('Error!');
      print(' RESPONSE STATUS =: ${response.statusCode}');
      print('RESPONSE body = ${response.body}');

      return null;
    }
  }

  GlobalKey<FormState> key = GlobalKey<FormState>(); //modified
  void validate() {
    if (key.currentState.validate()) {
      print("Validated");
    } else {
      print("Not Validated");
    }
  }

  final TextEditingController emailpassController = new TextEditingController();
  final TextEditingController curPassController = new TextEditingController();
  final TextEditingController newPassController = new TextEditingController();
  UserConfirm _user1;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Background(
          child: Form(
            //modified SingleChildScrollView
            autovalidate: true, //modified
            key: key, //modified
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Change Password",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                SizedBox(height: size.height * 0.02),
                SvgPicture.asset(
                  "assets/icons/changepassword.svg",
                  height: size.height * 0.2,
                ),
                SizedBox(height: size.height * 0.01),
                RoundedInputField(
                  hintText: "Your Email",
                  emailController: emailpassController,
                ),
                RoundedPasswordField2(" Current Password ", curPassController),
                RoundedPasswordField(" New Password "),
                SizedBox(
                  height: size.height * 0.00001,
                ),
                RoundedPasswordField("Confirm New Password", newPassController),
                SizedBox(
                  height: size.height * 0.03,
                ),
                RoundedButton(
                  text: "Confirm ",
                  press: () async {
                    print(curPassController.text);
                    print(newPassController.text);
                    final String emailpass = emailpassController.text;
                    final String curPass = curPassController.text;
                    final String newPass = newPassController.text;
                    final UserConfirm user =
                        await createUser(emailpass, curPass, newPass);
                    setState(() {
                      _user1 = user;
                    });
                    if (_user1 == null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Invalid email or password')));
                    } else if (_user1.status == "true") {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return LoginScreen();
                          },
                        ),
                      );
                    }
                  },
                ),
                _user1 == null
                    ? Container()
                    : Text("${_user1.status + " to change password"} "),
                SizedBox(height: size.height * 0.02),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
