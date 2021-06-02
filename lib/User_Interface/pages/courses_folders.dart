import 'package:flutter/material.dart';

import 'lecture_folders.dart';
import '../components/temp_folder.dart';

class AllFolders extends StatelessWidget {
  int current;

  AllFolders(this.current);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        elevation: 0,
        title: Text(
          "All Of Materials Semester ${current + 1}",
          style: TextStyle(fontSize: 21, fontStyle: FontStyle.italic),
        ),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 15,
        mainAxisSpacing: 25,
        scrollDirection: Axis.vertical,
        children: <Widget>[
          GestureDetector(
            child: MyFolder(
              mytext: "Ai",
              hinttext: "COMP 408",
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => AllLectures(0)),
              );
            },
          ),
          GestureDetector(
            child: MyFolder(
              mytext: "Compiler",
              hinttext: "COMP 308",
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => AllLectures(1)),
              );
            },
          ),
          GestureDetector(
            child: MyFolder(
              mytext: "Compiler",
              hinttext: "COMP 308",
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => AllLectures(2)),
              );
            },
          ),
          GestureDetector(
            child: MyFolder(
              mytext: "DataMining",
              hinttext: "COMP 418",
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => AllLectures(3)),
              );
            },
          ),
          GestureDetector(
            child: MyFolder(
              mytext: "OS",
              hinttext: "COMP 330",
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => AllLectures(4)),
              );
            },
          ),
          GestureDetector(
            child: MyFolder(
              mytext: "Syntax",
              hinttext: "COMP 108",
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => AllLectures(5)),
              );
            },
          ),
          GestureDetector(
            child: MyFolder(
              mytext: "Complexity",
              hinttext: "COMP 696",
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => AllLectures(6)),
              );
            },
          ),
          GestureDetector(
            child: MyFolder(
              mytext: "Graphics",
              hinttext: "COMP 469",
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => AllLectures(7)),
              );
            },
          ),
        ],
      ),
    );
  }
}
