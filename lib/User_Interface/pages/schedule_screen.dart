import 'package:flutter/material.dart';
import 'package:flutter_auth/User_Interface/components/build_classes.dart';
import 'package:flutter_auth/User_Interface/components/drawer.dart';
import 'package:flutter_auth/User_Interface/components/week_days.dart';
import 'package:intl/intl.dart';
import 'ScheduleModel.dart';
import 'UserModel.dart';
import 'login_screen.dart';
import 'package:http/http.dart' as http;

class ScheduleScreen extends StatefulWidget {
  final UserModel user;

  const ScheduleScreen({Key key, this.user}) : super(key: key);
  @override
  _ScheduleScreenState createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {
  final DateFormat dateFormat = DateFormat("hh:mm a");
  @override
  Widget build(BuildContext context) {
    Container();
    String satudrday = "Saturday";
    String id = user.id;
    buildUser(id, satudrday);
    List<Session> schedule;
    return Scaffold(
      drawer: MyDrawer(user: user),
      appBar: AppBar(
        title: Text(
          "My Schedule",
          style: TextStyle(fontSize: 25, fontStyle: FontStyle.italic),
        ),
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(80, 15, 25, 15),
            child: Text("Your Today Courses" , style :TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25,
              fontStyle: FontStyle.italic,
              color: Color(0xff1c1427),
            )),
          ),
          Container(
            padding: EdgeInsets.all(50.0),
            decoration: BoxDecoration(
              color: Color(0xff1c1427),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(80.0),
                topRight: Radius.circular(80.0),
              ),
            ),
            child: Column(
              children: <Widget>[
                BuildClasses(
                  user: user,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
