import 'package:flutter/material.dart';
import 'package:flutter_auth/User_Interface/components/courses.dart';
import 'package:flutter_auth/User_Interface/components/drawer.dart';
import 'package:flutter_auth/User_Interface/components/temp_alerts.dart';
import 'package:flutter_auth/User_Interface/pages/UserModel.dart';

import '../../constants.dart';
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
      backgroundColor: Colors.grey[300],
      drawer: MyDrawer(user: widget.user),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xFF4a1c40),
        title: widget.user == null
            ? Container()
            : Text("Welcome ${widget.user.name}"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: size.height * 0.01),
            Container(
              padding: EdgeInsets.all(40.0),
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(100),
                    topRight: Radius.circular(100),
                    bottomLeft: Radius.circular(100),
                    bottomRight: Radius.circular(100)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  widget.user == null
                      ? Container()
                      : MyCourses(
                          courses: widget.user
                              .courses), //da ally btktbo 3lshan tzhr l list
                  SizedBox(height: size.height * 0.005),
                ],
              ),
            ),
            SizedBox(height: size.height * 0.03),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Current Alerts",
                  style: TextStyle(
                      color: Color(0xff4a1c40),
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic),
                )
              ],
            ),
            Container(
                width: double.infinity,
                color: Colors.grey[300],
                margin: EdgeInsets.all(30),
                child: RecentsAlerts(
                  user: widget.user,
                )),
          ],
        ),
      ),
    );
  }
}
