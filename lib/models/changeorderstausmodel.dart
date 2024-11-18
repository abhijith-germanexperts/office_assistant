// To parse this JSON data, do
//
//     final changeOrderStatus = changeOrderStatusFromJson(jsonString);

import 'dart:convert';

List<ChangeOrderStatus> changeOrderStatusFromJson(String str) => List<ChangeOrderStatus>.from(json.decode(str).map((x) => ChangeOrderStatus.fromJson(x)));

String changeOrderStatusToJson(List<ChangeOrderStatus> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ChangeOrderStatus {
  String message;
  String messagecode;

  ChangeOrderStatus({
    required this.message,
    required this.messagecode,
  });

  factory ChangeOrderStatus.fromJson(Map<String, dynamic> json) => ChangeOrderStatus(
    message: json["message"],
    messagecode: json["messagecode"],
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "messagecode": messagecode,
  };
}
