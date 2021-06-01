// To parse this JSON data, do
//
//     final scheduleModel = scheduleModelFromMap(jsonString);

import 'dart:convert';

class ScheduleModel {
  ScheduleModel({
    this.status,
    this.sessions,
  });

  String status;
  List<Session> sessions;

  factory ScheduleModel.fromJson(String str) =>
      ScheduleModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ScheduleModel.fromMap(Map<String, dynamic> json) => ScheduleModel(
        status: json["status"] == null ? null : json["status"],
        sessions: json["sessions"] == null
            ? null
            : List<Session>.from(
                json["sessions"].map((x) => Session.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "status": status == null ? null : status,
        "sessions": sessions == null
            ? null
            : List<dynamic>.from(sessions.map((x) => x.toMap())),
      };
}

class Session {
  Session({
    this.nameOfCourse,
    this.name,
    this.dateS,
    this.place,
    isPassed,
    isHappening,
  });

  String nameOfCourse;
  String name;
  DateTime dateS;
  String place;
  bool isPassed = false;
  bool isHappening = false;

  factory Session.fromJson(String str) => Session.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Session.fromMap(Map<String, dynamic> json) => Session(
        nameOfCourse:
            json["nameOfCourse"] == null ? null : json["nameOfCourse"],
        name: json["name"] == null ? null : json["name"],
        dateS: json["dateS"] == null ? null : DateTime.parse(json["dateS"]),
        place: json["place"] == null ? null : json["place"],
        isPassed: json["isPassed"] == null ? null : json["isPassed"],
        isHappening: json["isHappening"] == null ? null : json["isHappening"],
      );

  Map<String, dynamic> toMap() => {
        "nameOfCourse": nameOfCourse == null ? null : nameOfCourse,
        "name": name == null ? null : name,
        "dateS": dateS == null ? null : dateS.toIso8601String(),
        "place": place == null ? null : place,
        "isPassed": isPassed == null ? null : isPassed,
        "isHappening": isHappening == null ? null : isHappening,
      };
}
