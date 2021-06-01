// To parse this JSON data, do
//
//     final assModel = assModelFromMap(jsonString);

import 'dart:convert';

class AssModel {
  AssModel({
    this.listOfAssistant,
  });

  List<AssisModel> listOfAssistant;

  factory AssModel.fromJson(String str) => AssModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AssModel.fromMap(Map<String, dynamic> json) => AssModel(
        listOfAssistant: json["listOfAssistant"] == null
            ? null
            : List<AssisModel>.from(
                json["listOfAssistant"].map((x) => AssisModel.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "listOfAssistant": listOfAssistant == null
            ? null
            : List<dynamic>.from(listOfAssistant.map((x) => x.toMap())),
      };
}

class AssisModel {
  AssisModel({
    this.name,
    this.image,
    this.nameOfDeb,
    this.courses,
    this.no,
  });

  String name;
  String image;
  String nameOfDeb;
  List<String> courses;
  int no;

  factory AssisModel.fromJson(String str) =>
      AssisModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AssisModel.fromMap(Map<String, dynamic> json) => AssisModel(
        name: json["name"] == null ? null : json["name"],
        image: json["image"] == null ? null : json["image"],
        nameOfDeb: json["nameOfDeb"] == null ? null : json["nameOfDeb"],
        courses: json["courses"] == null
            ? null
            : List<String>.from(json["courses"].map((x) => x)),
        no: json["no"] == null ? null : json["no"],
      );

  Map<String, dynamic> toMap() => {
        "name": name == null ? null : name,
        "image": image == null ? null : image,
        "nameOfDeb": nameOfDeb == null ? null : nameOfDeb,
        "courses":
            courses == null ? null : List<dynamic>.from(courses.map((x) => x)),
        "no": no == null ? null : no,
      };
}
