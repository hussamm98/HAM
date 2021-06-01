import 'package:flutter/material.dart';

import 'lecture_temp.dart';

class AllLectures extends StatelessWidget {
  int current;
  AllLectures(this.current);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        elevation: 0,
        title: Text(
          "Lectures ${current + 1}",
          style: TextStyle(fontSize: 23, fontStyle: FontStyle.italic),
        ),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 15,
        mainAxisSpacing: 25,
        scrollDirection: Axis.vertical,
        children: <Widget>[
          GestureDetector(
            child: MyLecture(
              lecname: "lecture 1",
            ),
            onTap: () {},
          ),
          GestureDetector(
            child: MyLecture(
              lecname: "lecture 2",
            ),
            onTap: () {},
          ),
          GestureDetector(
            child: MyLecture(
              lecname: "lecture 3",
            ),
            onTap: () {},
          ),
          GestureDetector(
            child: MyLecture(
              lecname: "lecture 4",
            ),
            onTap: () {},
          ),
          GestureDetector(
            child: MyLecture(
              lecname: "lecture 5",
            ),
            onTap: () {},
          ),
          GestureDetector(
            child: MyLecture(
              lecname: "lecture 6",
            ),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
