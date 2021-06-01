import 'package:flutter/material.dart';
import 'package:flutter_auth/User_Interface/pages/UserModel.dart';

class MyCourses extends StatelessWidget {
  final List<Course> courses;

  const MyCourses({Key key, this.courses}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(children: <Widget>[
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          RichText(
            text: TextSpan(
                text: "Your Courses Number is: ",
                style: TextStyle(
                    fontSize: 16,
                    color: Color(0xFFEEEEEE),
                    fontWeight: FontWeight.normal),
                children: [
                  TextSpan(
                    text: "${courses.length}",
                    // hereeeeeeeeeeeeeee yangmmmmmmmmm
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ]),
          ),
        ],
      ),
      SizedBox(
        height: size.height * 0.04,
      ),
      SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
            ////// fe sho3'l raye2 hnaaaaaaaaaaaaaaaaaaaa
            children: courses
                .map((course) => buildTaskItem(
                    int.parse(course.hours), course.courseName, Colors.blue))
                .toList()),
      )
    ]);
  }
}

Container buildTaskItem(int numDays, String courseTitle, Color color) {
  return Container(
    margin: EdgeInsets.only(right: 15),
    padding: EdgeInsets.all(12),
    height: 90,
    width: 150,
    decoration: BoxDecoration(
      color: color.withOpacity(0.4),
      borderRadius: BorderRadius.circular(30),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start, //beginning of words
      children: [
        SizedBox(
          height: 6,
        ),
        Row(
          children: [
            Container(
              height: 10,
              width: 10,
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              "$numDays Credit Hours", // there is a code here :"))))))
              style: TextStyle(fontSize: 11.5, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        SizedBox(
          height: 16,
        ),
        Container(
          width: 150,
          child: Center(
            child: Text(
              courseTitle,
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ],
    ),
  );
}
