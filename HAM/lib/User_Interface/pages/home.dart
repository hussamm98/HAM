import 'package:flutter/material.dart';
import 'package:flutter_auth/User_Interface/components/courses.dart';
import 'package:flutter_auth/User_Interface/components/drawer.dart';
import 'package:flutter_auth/User_Interface/components/navigation_bar.dart';
import 'package:flutter_auth/User_Interface/components/temp_alerts.dart';
import 'package:flutter_auth/User_Interface/pages/UserModel.dart';
import 'package:flutter_auth/User_Interface/pages/UserModel.dart';

import 'UserModel.dart';

class HomeScreen extends StatefulWidget {
  final UserModel user;

  const HomeScreen({Key key, this.user}) : super(key: key);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xFFEEEEEE),
      drawer: MyDrawer(user: widget.user),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xFF6F35A5),
        title: widget.user == null
            ? Container()
            : Text(
                "Welcome ${widget.user.name}"), //dh ally btktbo 3lshan tzhr l name
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(35.0),
            decoration: BoxDecoration(
              //     color: Theme.of(context).primaryColor,
              color: Colors.black54,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(60),
                  topRight: Radius.circular(60),
                  bottomLeft: Radius.circular(60),
                  bottomRight: Radius.circular(60)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                widget.user == null
                    ? Container()
                    : MyCourses(
                        courses: widget
                            .user.courses), //da ally btktbo 3lshan tzhr l list
                SizedBox(height: size.height * 0.03),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Current Alerts",
                      style: TextStyle(
                        color: Color(0xFFFFFFFF),
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
                SizedBox(height: size.height * 0),
              ],
            ),
          ),
          Container(
              width: double.infinity,
              height: 280,
              color: Colors.yellow,
              margin: EdgeInsets.all(25),
              child: RecentsAlerts(
                user: widget.user,
              )),
        ],
      ),
    );
  }
}
