import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyLecture extends StatelessWidget {
  final String lecname;
  final String icon;

  const MyLecture({Key key, this.lecname, this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.only(top: 20),
      child: Column(
        children: <Widget>[
          Image.asset(
            'assets/images/logo.jpg',
            width: 100,
          ),
          SizedBox(
            height: 25,
          ),
          Text(
            lecname,
            style: TextStyle(fontWeight: FontWeight.normal, fontSize: 23),
          ),
        ],
      ),
    );
  }
}
