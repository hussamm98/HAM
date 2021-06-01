import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

Widget headerChild(String header, var value) => new Expanded(
        child: new Column(
      children: <Widget>[
        new Text(
          header,
          style: TextStyle(fontSize: 15, fontStyle: FontStyle.italic),
        ),
        new SizedBox(
          height: 9.0,
        ),
        new Text(
          '$value',
          style: new TextStyle(
              fontSize: 17.0,
              color: const Color(0xff582564),
              fontWeight: FontWeight.bold),
        )
      ],
    ));

Widget infoChild(double width, String icon, data) => new Padding(
      padding: new EdgeInsets.only(bottom: 20.0),
      child: new InkWell(
        child: new Row(
          children: <Widget>[
            new SizedBox(
              width: width / 20,
            ),
            new SvgPicture.asset(
              icon,
              height: 30,
            ),
            new SizedBox(
              width: width / 15,
            ),
            new Text(
              data,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            )
          ],
        ),
        onTap: () {},
      ),
    );
