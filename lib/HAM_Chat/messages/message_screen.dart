import 'package:flutter/material.dart';
import '../../constants.dart';
import 'components/body.dart';

class MessagesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Body(),
    );
  }
  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: primaryColor,
      automaticallyImplyLeading: false,
      title: Row(
        children: [
          BackButton(),
          CircleAvatar(
            backgroundImage: AssetImage("assets/images/user_3.png"),
          ),
          SizedBox(width: defaultPadding * 0.75),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Dr Hatem Bahig",
                style: TextStyle(fontSize: 16),
              ),
              Text(
                "Online now",
                style: TextStyle(fontSize: 12),
              )
            ],
          )
        ],
      ),
      actions: [
        IconButton(icon: Icon(Icons.local_phone), onPressed: () {}),
        IconButton(icon: Icon(Icons.videocam), onPressed: () {}),
        SizedBox(width: defaultPadding / 2),
      ],
    );
  }
}
