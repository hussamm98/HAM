import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyFolder extends StatelessWidget {
  final String mytext;
  final String hinttext;
  final String icon;

  const MyFolder({Key key, this.mytext, this.hinttext, this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 20),
      child: Column(
        children: <Widget>[
          SvgPicture.asset(
            'assets/images/folder.svg',
            width: 70,
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            hinttext,
            style: TextStyle(fontStyle: FontStyle.italic, fontSize: 14),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            mytext,
            style: TextStyle(fontWeight: FontWeight.normal, fontSize: 21),
          ),
        ],
      ),
    );
  }
}
