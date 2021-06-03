import 'package:flutter/material.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';
import 'lecture_temp.dart';

class pdfviewer extends StatefulWidget {
  @override
  _pdfviewerState createState() => _pdfviewerState();
}

class _pdfviewerState extends State<pdfviewer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text(
            "Lectures",
            style: TextStyle(fontSize: 23, fontStyle: FontStyle.italic),
          ),
        ),
        body: Center(
          child: PDF().fromAsset("assets/images/DM.pdf"),
        ));
  }
}
