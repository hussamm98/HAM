// To parse this JSON data, do
//
//     final userModel = userModelFromMap(jsonString);

import 'dart:convert';

class UserModel {
  UserModel({
    this.status,
    this.list,
    this.firstTime,
    this.courses,
    this.academicid,
    this.name,
    this.email,
    this.gpa,
    this.totalScore,
    this.level,
    this.phoneNumber,
    this.image,
    this.department,
    this.id,
  });

  String status;
  List<ListElement> list;
  bool firstTime;
  List<Course> courses;
  int academicid;
  String name;
  String email;
  double gpa;
  int totalScore;
  int level;
  String phoneNumber;
  String image;
  String department;
  String id;

  factory UserModel.fromJson(String str) => UserModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UserModel.fromMap(Map<String, dynamic> json) => UserModel(
        status: json["status"] == null ? null : json["status"],
        list: json["list"] == null
            ? null
            : List<ListElement>.from(
                json["list"].map((x) => ListElement.fromMap(x))),
        firstTime: json["firstTime"] == null ? null : json["firstTime"],
        courses: json["courses"] == null
            ? null
            : List<Course>.from(json["courses"].map((x) => Course.fromMap(x))),
        academicid: json["academicid"] == null ? null : json["academicid"],
        name: json["name"] == null ? null : json["name"],
        email: json["email"] == null ? null : json["email"],
        gpa: json["gpa"] == null ? null : json["gpa"].toDouble(),
        totalScore: json["totalScore"] == null ? null : json["totalScore"],
        level: json["level"] == null ? null : json["level"],
        phoneNumber: json["phoneNumber"] == null ? null : json["phoneNumber"],
        image: json["image"] == null ? null : json["image"],
        department: json["department"] == null ? null : json["department"],
        id: json["id"] == null ? null : json["id"],
      );

  Map<String, dynamic> toMap() => {
        "status": status == null ? null : status,
        "list": list == null
            ? null
            : List<dynamic>.from(list.map((x) => x.toMap())),
        "firstTime": firstTime == null ? null : firstTime,
        "courses": courses == null
            ? null
            : List<dynamic>.from(courses.map((x) => x.toMap())),
        "academicid": academicid == null ? null : academicid,
        "name": name == null ? null : name,
        "email": email == null ? null : email,
        "gpa": gpa == null ? null : gpa,
        "totalScore": totalScore == null ? null : totalScore,
        "level": level == null ? null : level,
        "phoneNumber": phoneNumber == null ? null : phoneNumber,
        "image": image == null ? null : image,
        "department": department == null ? null : department,
        "id": id == null ? null : id,
      };
}

class Course {
  Course({
    this.hours,
    this.courseName,
    this.courseId,
  });

  String hours;
  String courseName;
  int courseId;

  factory Course.fromJson(String str) => Course.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Course.fromMap(Map<String, dynamic> json) => Course(
        hours: json["hours"] == null ? null : json["hours"],
        courseName: json["courseName"] == null ? null : json["courseName"],
        courseId: json["courseId"] == null ? null : json["courseId"],
      );

  Map<String, dynamic> toMap() => {
        "hours": hours == null ? null : hours,
        "courseName": courseName == null ? null : courseName,
        "courseId": courseId == null ? null : courseId,
      };
}

class ListElement {
  ListElement({
    this.title,
    this.courseName,
    this.dateA,
  });

  String title;
  String courseName;
  DateTime dateA;

  factory ListElement.fromJson(String str) =>
      ListElement.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ListElement.fromMap(Map<String, dynamic> json) => ListElement(
        title: json["title"] == null ? null : json["title"],
        courseName: json["courseName"] == null ? null : json["courseName"],
        dateA: json["dateA"] == null ? null : DateTime.parse(json["dateA"]),
      );

  Map<String, dynamic> toMap() => {
        "title": title == null ? null : title,
        "courseName": courseName == null ? null : courseName,
        "dateA": dateA == null ? null : dateA.toIso8601String(),
      };
}
