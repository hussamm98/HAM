import 'package:flutter/material.dart';
import 'package:flutter_auth/User_Interface/pages/AssModel.dart';
import 'assis_inner_desc.dart';

class AsMenuItemCard extends StatefulWidget {
  final AssisModel assistant;
  AsMenuItemCard({this.assistant});

  @override
  _AsMenuItemCardState createState() => _AsMenuItemCardState();
}

class _AsMenuItemCardState extends State<AsMenuItemCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsetsDirectional.fromSTEB(10, 20, 10, 10),
      child: AspectRatio(
        aspectRatio: 3 / 1,
        child: Container(
          child: Row(
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AsDetailPage(
                                assistant: widget.assistant,
                              )));
                },
                child: Row(
                  children: <Widget>[
                    AspectRatio(
                      aspectRatio: 1 / 1,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(60),
                        child: Image.network(
                          widget.assistant.image,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    AspectRatio(
                      aspectRatio: 4 / 3,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            widget.assistant.name,
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold, color:Color(0xFF4a1c40) ),
                          ),
                          SizedBox(
                            height: 6,
                          ),
                          Text(
                            widget.assistant.nameOfDeb,
                            style: TextStyle(
                                fontSize: 15,
                                color: Color(0xFF4a1c40),
                                fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
