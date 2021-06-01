// import 'package:flutter/material.dart';
// import 'package:flutter_auth/User_Interface/pages/UserModel.dart';
// import 'package:flutter_auth/User_Interface/pages/category_screen.dart';
// import 'package:flutter_auth/User_Interface/pages/home.dart';
// import 'package:flutter_auth/User_Interface/pages/login_screen.dart';
// import 'package:flutter_auth/User_Interface/pages/profile_screen.dart';
// import 'package:flutter_auth/User_Interface/pages/schedule_screen.dart';
// import 'package:flutter_svg/flutter_svg.dart';

// class BottomNavigation extends StatefulWidget {
//   @override
//   _BottomNavigationState createState() => _BottomNavigationState();
// }

// class _BottomNavigationState extends State<BottomNavigation> {
//   // int _currentIndex = 0;

//   final List<Widget> _children = [
//     HomeScreen(user: user,),
//     ScheduleScreen(),
//     CategoryScreen(),
//     ProfileScreen()
//   ];

// /*  void onTappedBar(int index) {
//     setState(() {
//       _currentIndex = index;
//     });
//   }*/

//   @override
//   int selectedIndex = 0;
//   var itemIndex = 0;
//   Color backgroundColorNav = Colors.black;
//   List<NavigationItem> items = [
//     NavigationItem(
//         SvgPicture.asset(
//           "assets/icons/home.svg",
//           width: 37.0,
//         ),
//         Text(
//           'Home',
//           style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
//         ),
//         Colors.deepPurpleAccent),
//     NavigationItem(
//         SvgPicture.asset(
//           "assets/icons/schedule.svg",
//           width: 35.0,
//         ),
//         Text(
//           'Schedule',
//           style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
//         ),
//         Colors.deepPurpleAccent),
//     NavigationItem(
//         SvgPicture.asset(
//           "assets/icons/book.svg",
//           width: 40.0,
//         ),
//         Text(
//           'Category',
//           style: TextStyle(
//             fontSize: 14,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         Colors.deepPurpleAccent),
//     NavigationItem(
//         SvgPicture.asset(
//           "assets/icons/user.svg",
//           width: 30.0,
//         ),
//         Text(
//           'Profile',
//           style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
//           textAlign: TextAlign.center,
//         ),
//         Colors.deepPurpleAccent),
//   ];

//   Widget _buildItem(NavigationItem item, bool isSelected) {
//     return AnimatedContainer(
//       duration: Duration(milliseconds: 200),
//       height: 50,
//       width: isSelected ? 140 : 50,
//       padding: isSelected ? EdgeInsets.only(left: 16, right: 16) : null,
//       decoration: isSelected
//           ? BoxDecoration(
//               color: item.color,
//               borderRadius: BorderRadius.all(Radius.circular(50)))
//           : null,
//       child: ListView(
//         scrollDirection: Axis.horizontal,
//         children: <Widget>[
//           Row(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: <Widget>[
//               IconTheme(
//                 data: IconThemeData(
//                   size: 24,
//                   color: isSelected ? backgroundColorNav : Colors.black,
//                 ),
//                 child: item.svgPicture,
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(left: 8),
//                 child: isSelected
//                     ? DefaultTextStyle.merge(
//                         style: TextStyle(color: backgroundColorNav),
//                         child: item.title)
//                     : Container(),
//               )
//             ],
//           ),
//         ],
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.start,
//         verticalDirection: VerticalDirection.up,
//         children: [
//           Container(
//             height: 60,
//             padding: EdgeInsets.only(left: 18, top: 10, bottom: 10, right: 18),
//             decoration: BoxDecoration(
//                 color: Color(0xffedffec),
//                 boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)]),
//             width: MediaQuery.of(context).size.width,
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: items.map((item) {
//                 var itemIndex = items.indexOf(item);
//                 return GestureDetector(
//                   onTap: () {
//                     setState(() {
//                       selectedIndex = itemIndex;
//                       _children[itemIndex];
//                     });
//                   },
//                   child: _buildItem(item, selectedIndex == itemIndex),
//                 );
//               }).toList(),
//             ),
//           ),
//           _children[itemIndex],
//         ],
//       ),
//     );
//   }
// }

// class NavigationItem {
//   final SvgPicture svgPicture;
//   final Text title;
//   final Color color;

//   NavigationItem(this.svgPicture, this.title, this.color);
// }
