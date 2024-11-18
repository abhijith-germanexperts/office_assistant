import 'dart:convert';

List<Endusermenu> endusermenuFromJson(String str) => List<Endusermenu>.from(
    json.decode(str).map((x) => Endusermenu.fromJson(x)));

String endusermenuToJson(List<Endusermenu> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Endusermenu {
  final String? message;
  final String? messagecode;
  final List<Datum>? data;

  Endusermenu({
    this.message,
    this.messagecode,
    this.data,
  });

  factory Endusermenu.fromJson(Map<String, dynamic> json) => Endusermenu(
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
  final int? menuid;
  final String? itemname;
  final String? itemcode;
  final int? foodcategoryid;
  final String? categoryname;
  final String? itemimgpath;
  final int? status;
  final DateTime? createdAt;
  final DateTime? modifiedAt;
  final int? createdBy;
  final int? modifiedBy;
  final String? createdbyname;
  final String? updatedbyname;

  Datum({
    this.menuid,
    this.itemname,
    this.itemcode,
    this.foodcategoryid,
    this.categoryname,
    this.itemimgpath,
    this.status,
    this.createdAt,
    this.modifiedAt,
    this.createdBy,
    this.modifiedBy,
    this.createdbyname,
    this.updatedbyname,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        menuid: json["menuid"],
        itemname: json["itemname"],
        itemcode: json["itemcode"],
        foodcategoryid: json["foodcategoryid"],
        categoryname: json["categoryname"],
        itemimgpath: json["itemimgpath"],
        status: json["status"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        modifiedAt: json["modified_at"] == null
            ? null
            : DateTime.parse(json["modified_at"]),
        createdBy: json["created_by"],
        modifiedBy: json["modified_by"],
        createdbyname: json["createdbyname"],
        updatedbyname: json["updatedbyname"],
      );

  Map<String, dynamic> toJson() => {
        "menuid": menuid,
        "itemname": itemname,
        "itemcode": itemcode,
        "foodcategoryid": foodcategoryid,
        "categoryname": categoryname,
        "itemimgpath": itemimgpath,
        "status": status,
        "created_at": createdAt?.toIso8601String(),
        "modified_at": modifiedAt?.toIso8601String(),
        "created_by": createdBy,
        "modified_by": modifiedBy,
        "createdbyname": createdbyname,
        "updatedbyname": updatedbyname,
      };
}
