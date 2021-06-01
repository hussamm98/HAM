import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../pages/courses_folders.dart';

class Semester extends StatelessWidget {
  int current;
  Semester(this.current);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: Text(
            "What\'s Your Semester ? ",
            style: TextStyle(fontSize: 22, fontStyle: FontStyle.italic),
          ),
        ),
      ),
      // drawer: MyDrawer(),
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 25,
          ),
          GestureDetector(
            child: Container(
              height: 90,
              width: 350,
              margin: EdgeInsets.symmetric(vertical: 30, horizontal: 30),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey[200],
                    blurRadius: 15,
                    spreadRadius: 30,
                  )
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: ListTile(
                  leading: Image.asset(
                    "assets/images/1.png",
                    fit: BoxFit.fill,
                    width: 55,
                    height: 120,
                  ),
                  title: Text(
                    "   Semester 1",
                    style: TextStyle(
                        fontSize: 30,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => AllFolders(0)),
              );
            },
          ),
          GestureDetector(
            child: Container(
              height: 90,
              width: 350,
              margin: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey[200],
                    blurRadius: 15,
                    spreadRadius: 30,
                  )
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: ListTile(
                  leading: Image.asset(
                    "assets/images/2.png",
                    fit: BoxFit.fill,
                    width: 70,
                    height: 110,
                  ),
                  title: Text(
                    "  Semester 2",
                    style: TextStyle(
                        fontSize: 30,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => AllFolders(1)),
              );
            },
          ),
          SizedBox(
            height: 50,
          ),
          SvgPicture.asset(
            "assets/images/semester.svg",
            width: 200,
            height: 250,
          ),
        ],
      ),
    );
  }
}
