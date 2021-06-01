import 'package:flutter/material.dart';
import 'package:flutter_auth/HAM_Chat/messages/message_screen.dart';

import 'package:flutter_auth/User_Interface/pages/AssModel.dart';

class AsDetailPage extends StatefulWidget {
  final AssisModel assistant;
  AsDetailPage({Key key, this.assistant}) : super(key: key);

  @override
  _AsDetailPageState createState() => _AsDetailPageState();
}

class _AsDetailPageState extends State<AsDetailPage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        elevation: 5,
        backgroundColor: Colors.black,
        splashColor: Colors.grey,
        child: Icon(Icons.chat),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return MessagesScreen();
              },
            ),
          );
        },
      ),
      body: SingleChildScrollView(
        child: Container(
          //width: width,
          child: Stack(
            children: <Widget>[
              Container(
                height: height *0.7,
                decoration: BoxDecoration(
                    image: DecorationImage(
                  image: NetworkImage(widget.assistant.image),
                )),
                child: Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [
                    Colors.black.withOpacity(0.9),
                    Colors.black.withOpacity(0.5),
                    Colors.black.withOpacity(0.0),
                    Colors.black.withOpacity(0.0),
                    Colors.black.withOpacity(0.5),
                    Colors.black.withOpacity(0.9),
                  ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
                ),
              ),
              Container(
                height: height,
                width: width,
                margin: EdgeInsets.only(top: height * 0.55),
                padding: EdgeInsets.all(60),
                decoration: BoxDecoration(
                  color: Color(0xfff0e3ca),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(60),
                      topRight: Radius.circular(60)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      widget.assistant.name,
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    SizedBox(
                      height: height * 0.03,
                    ),
                    Center(
                      child: Text(
                        "Number Of Courses :   ${widget.assistant.no}",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      height: height * 0.04,
                    ),
                    Center(
                      child: Text(
                        "Assigned Courses :",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                    SizedBox(
                      height: height * 0.05,
                    ),
                    Text(
                      widget.assistant.courses.toString(),
                      style: TextStyle(
                          fontSize: 22,
                          color: Colors.black,
                          fontWeight: FontWeight.normal,
                          letterSpacing: 1,
                          wordSpacing: 0),
                    ),
                  ],
                ),
              ),
              Positioned(
                left: 10,
                top: height * 0.06,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.arrow_back_rounded,
                    size: 32,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
