import 'package:flutter/material.dart';
import 'package:flutter_auth/User_Interface/pages/UserModel.dart';
import 'package:flutter_auth/User_Interface/pages/category_screen.dart';
import 'package:flutter_auth/User_Interface/pages/home.dart';
import 'package:flutter_auth/User_Interface/pages/login_screen.dart';
import 'package:flutter_auth/User_Interface/pages/profile_screen.dart';
import 'package:flutter_auth/User_Interface/pages/schedule_screen.dart';
import 'package:flutter_svg/svg.dart';

class MyBottomNavigationBar extends StatefulWidget {
  final UserModel user;

  const MyBottomNavigationBar({Key key, this.user}) : super(key: key);
  @override
  _MyBottomNavigationBarState createState() => _MyBottomNavigationBarState();
}

class _MyBottomNavigationBarState extends State<MyBottomNavigationBar> {
  int _currentIndex = 0;
  List<Widget> _children = [
    HomeScreen(user: user),
    ScheduleScreen(
      user: user,
    ),
    CategoryScreen(user : user),
    ProfileScreen(user: user)
  ];

  void onTappedBar(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedFontSize: 5,
        type: BottomNavigationBarType.shifting,
        backgroundColor: Colors.white24,
        onTap: onTappedBar,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/icons/home.svg",
              width: 37.0,
            ),
            title: Text(
              'Home',
              style: TextStyle(
                  color: Colors.black87,
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
            ),
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/icons/schedule.svg",
              width: 35.0,
            ),
            title: Text(
              'Schedule',
              style: TextStyle(
                  color: Colors.black87,
                  fontSize: 14,
                  fontWeight: FontWeight.bold),
            ),
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/icons/book.svg",
              width: 40.0,
            ),
            title: Text(
              'Category',
              style: TextStyle(
                color: Colors.black87,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/icons/user.svg",
              width: 30.0,
            ),
            title: Text(
              'Profile',
              style: TextStyle(
                  color: Colors.black87,
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
