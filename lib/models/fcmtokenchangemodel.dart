// To parse this JSON data, do
//
//     final changefcmtoken = changefcmtokenFromJson(jsonString);

import 'dart:convert';

List<Changefcmtoken> changefcmtokenFromJson(String str) => List<Changefcmtoken>.from(json.decode(str).map((x) => Changefcmtoken.fromJson(x)));

String changefcmtokenToJson(List<Changefcmtoken> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Changefcmtoken {
    final String? message;
    final String? messagecode;

    Changefcmtoken({
        this.message,
        this.messagecode,
    });

    factory Changefcmtoken.fromJson(Map<String, dynamic> json) => Changefcmtoken(
        message: json["message"],
        messagecode: json["messagecode"],
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "messagecode": messagecode,
    };
}
