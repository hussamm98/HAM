// To parse this JSON data, do
//
//     final docModel = docModelFromMap(jsonString);

import 'dart:convert';

class DocModel {
  DocModel({
    this.listOfDoctro,
  });

  List<DoctorModel> listOfDoctro;

  factory DocModel.fromJson(String str) => DocModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory DocModel.fromMap(Map<String, dynamic> json) => DocModel(
        listOfDoctro: json["listOfDoctro"] == null
            ? null
            : List<DoctorModel>.from(
                json["listOfDoctro"].map((x) => DoctorModel.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "listOfDoctro": listOfDoctro == null
            ? null
            : List<dynamic>.from(listOfDoctro.map((x) => x.toMap())),
      };
}

class DoctorModel {
  DoctorModel({
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

  factory DoctorModel.fromJson(String str) =>
      DoctorModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory DoctorModel.fromMap(Map<String, dynamic> json) => DoctorModel(
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
