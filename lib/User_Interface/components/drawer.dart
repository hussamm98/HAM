import 'package:flutter/material.dart';
import 'package:flutter_auth/HAM_Chat/welcome_chat_screen.dart';
import 'package:flutter_auth/User_Interface/components/listing_doctor_users.dart';
import 'package:flutter_auth/User_Interface/components/rounded_button.dart';
import 'package:flutter_auth/User_Interface/pages/UserModel.dart';
import 'package:flutter_svg/svg.dart';

import '../pages/welcome_screen.dart';
import 'listing_assistant_users.dart';

class MyDrawer extends StatelessWidget {
  final UserModel user;

  const MyDrawer({Key key, this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //print('drawer user name: ${user.name}');
    Size size = MediaQuery.of(context).size;
    return Drawer(
        child: Container(
      color: Colors.grey[300],
      child: ListView(
        children: <Widget>[
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(
              color: Colors.grey[300],
            ),
            accountEmail: Text(
              '${user.email}',
              // "${user.email}",
              style: TextStyle(color: Color(0xff4a1c40), fontSize: 12),
            ),
            //code hereeeeeeeeeeeeeeeeeeeeeeeee
            accountName: Text(
              '${user.name}',
              // "${user.name} ", // code here
              style: TextStyle(color: Color(0xff4a1c40), fontSize: 18),
            ),
            currentAccountPicture: ClipRRect(
              borderRadius: BorderRadius.circular(200),
              child: Image.network(
                '${user.image}',
                width: 150,
                height: 150,
              ),
            ),
          ),
          ListTile(
            title: Text(
              "Doctors",
              style: TextStyle(
                color: Color(0xff4a1c40),
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            leading: SvgPicture.asset(
              "assets/icons/doctor.svg",
              width: 32,
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return AllOfDocs();
                  },
                ),
              );
            },
          ),
          SizedBox(height: size.height * 0.001),
          Divider(
            color: Colors.black,
            indent: 30,
            endIndent: 30,
            height: 0,
            thickness: 0.5,
          ),
          ListTile(
            title: Text(
              "Assistant",
              style: TextStyle(
                color: Color(0xff4a1c40),
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            leading: SvgPicture.asset(
              "assets/icons/assistant.svg",
              width: 32,
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return AllOfAssist();
                  },
                ),
              );
            },
          ),
          SizedBox(height: size.height * 0.001),
          Divider(
            color: Colors.black,
            indent: 30,
            endIndent: 30,
            height: 0,
            thickness: 0.7,
          ),
          ListTile(
            title: Text(
              "Chat Bot",
              style: TextStyle(
                color: Color(0xff4a1c40),
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            leading: SvgPicture.asset(
              "assets/icons/chat-bot.svg",
              width: 40,
            ),
            onTap: () {},
          ),
          SizedBox(height: size.height * 0.001),
          Divider(
            color: Colors.black,
            indent: 30,
            endIndent: 30,
            height: 0,
            thickness: 0.5,
          ),
          ListTile(
            title: Text(
              "Masseges",
              style: TextStyle(
                color: Color(0xff4a1c40),
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            leading: SvgPicture.asset(
              "assets/icons/messenger.svg",
              width: 30,
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return WelcomeChatScreen();
                  },
                ),
              );
            },
          ),
          SizedBox(
            height: size.height * 0.12,
          ),
          Padding(
            padding: const EdgeInsets.all(50.0),
            child: RoundedButton(
              text: "SignOut",
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return WelcomeScreen();
                    },
                  ),
                );
              },
            ),
          )
        ],
      ),
    ));
  }
}
