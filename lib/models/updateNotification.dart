// To parse this JSON data, do
//
//     final internalnotificationupdate = internalnotificationupdateFromJson(jsonString);

import 'dart:convert';

List<Internalnotificationupdate> internalnotificationupdateFromJson(String str) => List<Internalnotificationupdate>.from(json.decode(str).map((x) => Internalnotificationupdate.fromJson(x)));

String internalnotificationupdateToJson(List<Internalnotificationupdate> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Internalnotificationupdate {
  String message;
  String messagecode;

  Internalnotificationupdate({
    required this.message,
    required this.messagecode,
  });

  factory Internalnotificationupdate.fromJson(Map<String, dynamic> json) => Internalnotificationupdate(
    message: json["message"],
    messagecode: json["messagecode"],
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "messagecode": messagecode,
  };
}
