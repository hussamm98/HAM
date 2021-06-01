import 'package:flutter/material.dart';
import 'package:flutter_auth/User_Interface/components/countdown.dart';

import 'package:flutter_icons/flutter_icons.dart';
import 'package:intl/intl.dart';
import '../../constants.dart';
import 'package:flutter_auth/User_Interface/pages/UserModel.dart';

class RecentsAlerts extends StatefulWidget {
  final UserModel user;

  RecentsAlerts({Key key, @required this.user}) : super(key: key);

  @override
  _RecentsAlertsState createState() => _RecentsAlertsState();
}

class _RecentsAlertsState extends State<RecentsAlerts> {
  final DateFormat dateFormat = DateFormat("hh:mm a");

  @override
  Widget build(BuildContext context) {
    final doctorsList = widget.user.list;
    return ListView.builder(
      shrinkWrap: true,
      itemCount: doctorsList.length,
      itemBuilder: (BuildContext context, int index) {
        ListElement alert = doctorsList[index];

        int hoursLeft = DateTime.now().difference(alert.dateA).inHours;
        hoursLeft = hoursLeft < 0 ? -hoursLeft : 0;
        double percent = hoursLeft / 48;
        return Row(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(bottom: 30.0),
              height: 120.0,
              width: 20,
              decoration: BoxDecoration(
                color: Theme.of(context).accentColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  bottomLeft: Radius.circular(30.0),
                ),
              ),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.only(bottom: 30.0),
                padding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 10.0),
                height: 120.0,
                width: 3.0,
                decoration: BoxDecoration(
                  color: kCardColor,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(12.0),
                    bottomRight: Radius.circular(12.0),
                  ),
                ),
                child: Stack(
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          alert.courseName,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.0,
                          ),
                        ),
                        SizedBox(height: 15.0),
                        Row(
                          children: <Widget>[
                            Icon(
                              AntDesign.clockcircle,
                              color: Theme.of(context).accentColor,
                              size: 17.0,
                            ),
                            SizedBox(width: 10.0),
                            Text(
                              "${DateTime.now().weekday == alert.dateA.weekday ? "Today" : DateFormat.EEEE().format(alert.dateA)}, ${dateFormat.format(alert.dateA)}",
                              style: TextStyle(
                                color: kTextColor,
                                fontSize: 15.0,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10.0),
                        Row(
                          children: <Widget>[
                            Icon(
                              Icons.my_library_books,
                              color: Theme.of(context).accentColor,
                              size: 17.0,
                            ),
                            SizedBox(width: 10.0),
                            Text(
                              alert.title,
                              style: TextStyle(
                                color: kTextColor,
                                fontSize: 15.0,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Positioned(
                      right: 0.0,
                      child: CustomPaint(
                        foregroundPainter: CountdownPainter(
                          bgColor: kBGColor,
                          lineColor: _getColor(context, percent),
                          percent: percent,
                          width: 4.0,
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(20.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                "$hoursLeft",
                                style: TextStyle(
                                  color: _getColor(context, percent),
                                  fontSize: 26.0,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                "hours left",
                                style: TextStyle(
                                  color: _getColor(context, percent),
                                  fontSize: 13.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  _getColor(BuildContext context, double percent) {
    if (percent >= 0.4) return Theme.of(context).accentColor;

    return kHourColor;
  }
}

class Alert {
  final String title;
  final String subject;
  final DateTime time;

  Alert({this.title, this.subject, this.time});
}
