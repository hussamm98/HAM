// To parse this JSON data, do
//
//     final userConfirm = userConfirmFromJson(jsonString);

import 'dart:convert';

UserConfirm userConfirmFromJson(String str) => UserConfirm.fromJson(json.decode(str));

String userConfirmToJson(UserConfirm data) => json.encode(data.toJson());

class UserConfirm {
    UserConfirm({
        this.status,
        this.firstTime,
    });

    String status;
    bool firstTime;

    factory UserConfirm.fromJson(Map<String, dynamic> json) => UserConfirm(
        status: json["status"],
        firstTime: json["firstTime"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "firstTime": firstTime,
    };
}
