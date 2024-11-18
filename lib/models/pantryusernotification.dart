// To parse this JSON data, do
//
//     final pantryusernotification = pantryusernotificationFromJson(jsonString);

import 'dart:convert';

List<Pantryusernotification> pantryusernotificationFromJson(String str) =>
    List<Pantryusernotification>.from(
        json.decode(str).map((x) => Pantryusernotification.fromJson(x)));

String pantryusernotificationToJson(List<Pantryusernotification> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Pantryusernotification {
  final String? message;
  final String? messagecode;
  final List<Datum>? data;

  Pantryusernotification({
    this.message,
    this.messagecode,
    this.data,
  });

  factory Pantryusernotification.fromJson(Map<String, dynamic> json) =>
      Pantryusernotification(
        message: json["message"],
        messagecode: json["messagecode"],
        data: json["data"] == null
            ? []
            : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "messagecode": messagecode,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Datum {
  final int? notificationid;
  final String? createdAt;
  final int? createdBy;
  final bool? isdeleted;
  final bool? isreaded;
  final String? messagebody;
  final dynamic modifiedAt;
  final dynamic modifiedBy;
  final dynamic notificationdeleted;
  final dynamic notificationreaded;
  final String? receiver;
  final String? remark;
  final String? sender;
  final int? status;
  final String? subject;
  final int? userId;
  final String? username;

  Datum({
    this.notificationid,
    this.createdAt,
    this.createdBy,
    this.isdeleted,
    this.isreaded,
    this.messagebody,
    this.modifiedAt,
    this.modifiedBy,
    this.notificationdeleted,
    this.notificationreaded,
    this.receiver,
    this.remark,
    this.sender,
    this.status,
    this.subject,
    this.userId,
    this.username,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        notificationid: json["notificationid"],
        createdAt: json["created_at"],
        createdBy: json["created_by"],
        isdeleted: json["isdeleted"],
        isreaded: json["isreaded"],
        messagebody: json["messagebody"],
        modifiedAt: json["modified_at"],
        modifiedBy: json["modified_by"],
        notificationdeleted: json["notificationdeleted"],
        notificationreaded: json["notificationreaded"],
        receiver: json["receiver"],
        remark: json["remark"],
        sender: json["sender"],
        status: json["status"],
        subject: json["subject"],
        userId: json["user_id"],
        username: json["username"],
      );

  Map<String, dynamic> toJson() => {
        "notificationid": notificationid,
        "created_at": createdAt,
        "created_by": createdBy,
        "isdeleted": isdeleted,
        "isreaded": isreaded,
        "messagebody": messagebody,
        "modified_at": modifiedAt,
        "modified_by": modifiedBy,
        "notificationdeleted": notificationdeleted,
        "notificationreaded": notificationreaded,
        "receiver": receiver,
        "remark": remark,
        "sender": sender,
        "status": status,
        "subject": subject,
        "user_id": userId,
        "username": username,
      };
}

enum Messagebody { ORDER_HAS_BEEN_CREATED }

final messagebodyValues =
    EnumValues({"Order has been created.": Messagebody.ORDER_HAS_BEEN_CREATED});

enum Username { IBRAHIM, JOHN, ASHRAR, JYOTHI, SARATH, YASSAR_A, REVERENDO_P }

final usernameValues = EnumValues({
  "ashrar": Username.ASHRAR,
  "ibrahim": Username.IBRAHIM,
  "john": Username.JOHN,
  "jyothi": Username.JYOTHI,
  "reverendo.p": Username.REVERENDO_P,
  "sarath": Username.SARATH,
  "yassar.a": Username.YASSAR_A
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
