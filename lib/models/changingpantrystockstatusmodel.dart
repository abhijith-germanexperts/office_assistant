// To parse this JSON data, do
//
//     final inventorystatusupdateresponse = inventorystatusupdateresponseFromJson(jsonString);

import 'dart:convert';

List<Inventorystatusupdateresponse> inventorystatusupdateresponseFromJson(String str) => List<Inventorystatusupdateresponse>.from(json.decode(str).map((x) => Inventorystatusupdateresponse.fromJson(x)));

String inventorystatusupdateresponseToJson(List<Inventorystatusupdateresponse> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Inventorystatusupdateresponse {
  String message;
  String messagecode;

  Inventorystatusupdateresponse({
    required this.message,
    required this.messagecode,
  });

  factory Inventorystatusupdateresponse.fromJson(Map<String, dynamic> json) => Inventorystatusupdateresponse(
    message: json["message"],
    messagecode: json["messagecode"],
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "messagecode": messagecode,
  };
}
