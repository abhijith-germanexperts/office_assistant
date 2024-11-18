// To parse this JSON data, do
//
//     final inventoryresponse = inventoryresponseFromJson(jsonString);

import 'dart:convert';

List<Inventoryresponse> inventoryresponseFromJson(String str) =>
    List<Inventoryresponse>.from(
        json.decode(str).map((x) => Inventoryresponse.fromJson(x)));

String inventoryresponseToJson(List<Inventoryresponse> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Inventoryresponse {
  final String? message;
  final String? messagecode;
  final Data? data;

  Inventoryresponse({
    this.message,
    this.messagecode,
    this.data,
  });

  factory Inventoryresponse.fromJson(Map<String, dynamic> json) =>
      Inventoryresponse(
        message: json["message"],
        messagecode: json["messagecode"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "messagecode": messagecode,
        "data": data?.toJson(),
      };
}

class Data {
  final String? totalCount;
  final int? responseRowCount;
  final List<Response>? response;

  Data({
    this.totalCount,
    this.responseRowCount,
    this.response,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        totalCount: json["totalCount"],
        responseRowCount: json["responseRowCount"],
        response: json["response"] == null
            ? []
            : List<Response>.from(
                json["response"]!.map((x) => Response.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "totalCount": totalCount,
        "responseRowCount": responseRowCount,
        "response": response == null
            ? []
            : List<dynamic>.from(response!.map((x) => x.toJson())),
      };
}

class Response {
  final int? menupantryid;
  final int? pantryid;
  final int? menuid;
  final int? menustatus;
  final String? pantryname;
  final String? itemname;
  final String? itemimgpath;
  final String? categoryname;
  final int? status;
  final String? createdAt;
  final String? modifiedAt;
  final String? createdbyname;
  final dynamic updatedbyname;

  Response({
    this.menupantryid,
    this.pantryid,
    this.menuid,
    this.menustatus,
    this.pantryname,
    this.itemname,
    this.itemimgpath,
    this.categoryname,
    this.status,
    this.createdAt,
    this.modifiedAt,
    this.createdbyname,
    this.updatedbyname,
  });

  factory Response.fromJson(Map<String, dynamic> json) => Response(
        menupantryid: json["menupantryid"],
        pantryid: json["pantryid"],
        menuid: json["menuid"],
        menustatus: json["menustatus"],
        pantryname: json["pantryname"],
        itemname: json["itemname"],
        itemimgpath: json["itemimgpath"],
        categoryname: json["categoryname"],
        status: json["status"],
        createdAt: json["created_at"],
        modifiedAt: json["modified_at"],
        createdbyname: json["createdbyname"],
        updatedbyname: json["updatedbyname"],
      );

  Map<String, dynamic> toJson() => {
        "menupantryid": menupantryid,
        "pantryid": pantryid,
        "menuid": menuid,
        "menustatus": menustatus,
        "pantryname": pantryname,
        "itemname": itemname,
        "itemimgpath": itemimgpath,
        "categoryname": categoryname,
        "status": status,
        "created_at": createdAt,
        "modified_at": modifiedAt,
        "createdbyname": createdbyname,
        "updatedbyname": updatedbyname,
      };
}
