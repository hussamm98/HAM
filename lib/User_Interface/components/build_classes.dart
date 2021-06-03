import 'dart:convert';
import 'package:flutter/material.dart';

import 'package:flutter_auth/User_Interface/pages/ScheduleModel.dart';
import 'package:flutter_auth/User_Interface/pages/UserModel.dart';
import 'package:flutter_auth/User_Interface/pages/login_screen.dart';
import 'package:intl/intl.dart';
import '../../constants.dart';
import 'package:http/http.dart' as http;

Future<ScheduleModel> buildUser(String id, String current) async {
  final String apiUrl =
      "http://hussam69-001-site1.dtempurl.com/api/ApiHAMController/SesssionsByName";
  final response = await http.post(
    apiUrl,
    body: jsonEncode(<String, String>{"id": id, "current": current}),
    headers: {
      'Content-Type': 'application/json',
      //'Authorization' : 'Bearer $token '
    },
  );

  if (response.statusCode == 200) {
    final String responseString = response.body;
    print(' RESPONSE STATUS =: ${response.statusCode}');
    print('RESPONSE body = ${response.body}');
    return ScheduleModel.fromJson(response.body);
  } else {
    print('Error!');
    print(' RESPONSE STATUS =: ${response.statusCode}');
    print('RESPONSE body = ${response.body}');

    return null;
  }
}

class BuildClasses extends StatefulWidget {
  final UserModel user;

  const BuildClasses({Key key, this.user}) : super(key: key);

  @override
  _BuildClassesState createState() => _BuildClassesState();
}

String satudrday = "Saturday";
String id = user.id;

class _BuildClassesState extends State<BuildClasses> {
  @override
  final DateFormat dateFormat = DateFormat("hh:mm a");

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ScheduleModel>(
        future: buildUser(id, satudrday),
        builder: (context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting ||
              snapshot.data == null) {
            return Center(child: CircularProgressIndicator());
          } else {
            //if (snapshot.connectionState == ConnectionState.done) {
            //return Center(child: CircularProgressIndicator());
            // }

            return ListView.builder(
              shrinkWrap: true,
              itemCount: snapshot.data.sessions.length,
              itemBuilder: (BuildContext context, int index) {
                print(snapshot);
                print(snapshot.data.sessions);
                final sessionList = snapshot.data.sessions;

                Session c = sessionList[index];

                _getStatus(c);
                return Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Text(
                          "${dateFormat.format(c.dateS)}",
                          style: TextStyle(
                            color: c.isPassed
                                ? Colors.white.withOpacity(0.2)
                                : Colors.white,
                            fontSize: 15.0,
                          ),
                        ),
                        SizedBox(width: 42.0),
                        _getTime(c, context),
                        SizedBox(width: 15.0),
                        Text(
                          c.nameOfCourse,
                          style: TextStyle(
                            color: c.isPassed
                                ? Colors.yellow.withOpacity(0.4)
                                : Colors.white,
                            fontSize: 18.0,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 12.0),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(left: 90.0, bottom: 50.0),
                          width: 0.4,
                          height: 80.0,
                          color: c.isPassed
                              ? kTextColor.withOpacity(0.6)
                              : kTextColor,
                        ),
                        SizedBox(width: 20.0),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Icon(
                                  Icons.location_on,
                                  color: c.isPassed
                                      ? Theme
                                      .of(context)
                                      .accentColor
                                      .withOpacity(0.3)
                                      : Theme
                                      .of(context)
                                      .accentColor,
                                  size: 20.0,
                                ),
                                SizedBox(width: 10.0),
                                Text(
                                  c.place,
                                  style: TextStyle(
                                    color: c.isPassed
                                        ? kTextColor.withOpacity(0.3)
                                        : kTextColor,
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 10.0),
                            Row(
                              children: <Widget>[
                                Icon(
                                  Icons.person,
                                  color: c.isPassed
                                      ? Theme
                                      .of(context)
                                      .accentColor
                                      .withOpacity(0.3)
                                      : Theme
                                      .of(context)
                                      .accentColor,
                                  size: 20.0,
                                ),
                                SizedBox(width: 8.0),
                                Text(
                                  c.name,
                                  style: TextStyle(
                                    color: c.isPassed
                                        ? kTextColor.withOpacity(0.3)
                                        : kTextColor,
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                );
              },
            );
          }
        });
  }

  _getStatus(Session c) {
    DateTime now = DateTime.now();
    DateTime finishedTime = c.dateS.add(Duration(hours: 1));

    if (now.difference(c.dateS).inMinutes >= 59) {
      c.isPassed = true;
    } else if (now.difference(c.dateS).inMinutes <= 59 &&
        now.difference(finishedTime).inMinutes >= -59) {
      c.isHappening = true;
    }
  }

  _getTime(Session c, context) {
    return Container(
      height: 20.0,
      width: 20.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: c.isPassed
              ? Theme.of(context).accentColor.withOpacity(0.5)
              : Theme.of(context).accentColor,
          // width: 2.0,
        ),
      ),
      child: _getChild(c, context),
    );
  }

  _getChild(Session c, context) {
    if (c.isPassed) {
      return Icon(
        Icons.check,
        color: c.isPassed
            ? Theme.of(context).accentColor.withOpacity(0.6)
            : Theme.of(context).accentColor,
        size: 16.0,
      );
    } else if (c.isHappening) {
      return Container(
        margin: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
        ),
      );
    }
  }
}
