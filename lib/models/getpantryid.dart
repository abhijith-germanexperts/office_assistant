// To parse this JSON data, do
//
//     final getpantryid = getpantryidFromJson(jsonString);

import 'dart:convert';

Getpantryid getpantryidFromJson(String str) =>
    Getpantryid.fromJson(json.decode(str));

String getpantryidToJson(Getpantryid data) => json.encode(data.toJson());

class Getpantryid {
  final String? message;
  final List<Datum>? data;

  Getpantryid({
    this.message,
    this.data,
  });

  factory Getpantryid.fromJson(Map<String, dynamic> json) => Getpantryid(
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Datum {
  final int? assignpantryofficeid;
  final int? officeid;
  final int? pantryid;
  final int? status;
  final int? createdBy;
  final String? createdAt;
  final int? modifiedBy;
  final String? modifiedAt;
  final String? pantryname;
  final String? pantrycode;
  final int? buildingid;

  Datum({
    this.assignpantryofficeid,
    this.officeid,
    this.pantryid,
    this.status,
    this.createdBy,
    this.createdAt,
    this.modifiedBy,
    this.modifiedAt,
    this.pantryname,
    this.pantrycode,
    this.buildingid,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        assignpantryofficeid: json["assignpantryofficeid"],
        officeid: json["officeid"],
        pantryid: json["pantryid"],
        status: json["status"],
        createdBy: json["created_by"],
        createdAt: json["created_at"],
        modifiedBy: json["modified_by"],
        modifiedAt: json["modified_at"],
        pantryname: json["pantryname"],
        pantrycode: json["pantrycode"],
        buildingid: json["buildingid"],
      );

  Map<String, dynamic> toJson() => {
        "assignpantryofficeid": assignpantryofficeid,
        "officeid": officeid,
        "pantryid": pantryid,
        "status": status,
        "created_by": createdBy,
        "created_at": createdAt,
        "modified_by": modifiedBy,
        "modified_at": modifiedAt,
        "pantryname": pantryname,
        "pantrycode": pantrycode,
        "buildingid": buildingid,
      };
}
