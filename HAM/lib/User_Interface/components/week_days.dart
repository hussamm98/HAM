import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class WeekDays extends StatefulWidget {
  @override
  _WeekDaysState createState() => _WeekDaysState();
}

class _WeekDaysState extends State<WeekDays> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        InkWell(
          child: Card(
              elevation: 6,
              color: Color(0xffe4d3cf),
              child: Text(
                "SAT",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic),
              )),
          onTap: () {},
        ),
        InkWell(
          child: Card(
              elevation: 6,
              color: Color(0xffe4d3cf),
              child: Text(
                "SUN",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic),
              )),
          onTap: () {},
        ),
        InkWell(
          child: Card(
              elevation: 6,
              color: Color(0xffe4d3cf),
              child: Text(
                "MON",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic),
              )),
          onTap: () {},
        ),
        InkWell(
          child: Card(
              elevation: 6,
              color: Color(0xffe4d3cf),
              child: Text(
                "TUE",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic),
              )),
          onTap: () {},
        ),
        InkWell(
          child: Card(
              elevation: 6,
              color: Color(0xffe4d3cf),
              child: Text(
                "WED",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic),
              )),
          onTap: () {},
        ),
        InkWell(
          child: Card(
              elevation: 6,
              color: Color(0xffe4d3cf),
              child: Text(
                "THU",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic),
              )),
          onTap: () {},
        ),
        InkWell(
          child: Card(
              elevation: 6,
              color: Color(0xffe4d3cf),
              child: Text(
                "FRI",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic),
              )),
          onTap: () {},
        ),
      ],
    );
  }
}
