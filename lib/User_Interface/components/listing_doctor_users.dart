import 'package:flutter/material.dart';
import 'package:flutter_auth/User_Interface/components/assistants_list.dart';
import 'package:flutter_auth/User_Interface/components/doctors_list.dart';

import '../../constants.dart';

class AllOfDocs extends StatefulWidget {
  @override
  _AllOfDocsState createState() => _AllOfDocsState();
}

class _AllOfDocsState extends State<AllOfDocs> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        elevation: 0,
        title: Text(
          "Listing All Doctors",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold , fontStyle: FontStyle.italic),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              Transform.translate(
                offset: Offset(0, -20),
                child: Container(
                  width: width,
                  padding: EdgeInsets.only(top: 25),
                  decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(50),
                          topRight: Radius.circular(50))),
                  child: DefaultTabController(
                      length: 2,
                      child: Column(
                        children: <Widget>[
                          TabBar(
                            labelColor: Colors.black,
                            labelStyle: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                            unselectedLabelColor: Color(0xff150e56),
                            unselectedLabelStyle: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontStyle: FontStyle.italic,
                                fontSize: 13),
                            indicatorSize: TabBarIndicatorSize.label,
                            indicatorColor: Colors.transparent,
                            tabs: <Widget>[
                              Tab(
                                child: Text("Doctors" , style :TextStyle( color: Color(0xFF4a1c40))),
                              ),
                              Tab(
                                child: Text("Assistant" , style :TextStyle( color: Color(0xFF4a1c40))),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 1,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                          ),
                          Container(
                            height: height * 1,
                            child: TabBarView(
                              children: <Widget>[
                                MyDoctors(),
                                MyAssistants(),
                              ],
                            ),
                          ),
                        ],
                      )),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
