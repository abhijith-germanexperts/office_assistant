// To parse this JSON data, do
//
//     final pendingorderforpantryuser = pendingorderforpantryuserFromJson(jsonString);

import 'dart:convert';

List<Pendingorderforpantryuser> pendingorderforpantryuserFromJson(String str) =>
    List<Pendingorderforpantryuser>.from(
        json.decode(str).map((x) => Pendingorderforpantryuser.fromJson(x)));

String pendingorderforpantryuserToJson(List<Pendingorderforpantryuser> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Pendingorderforpantryuser {
  final String? message;
  final String? messagecode;
  final List<Datum>? data;

  Pendingorderforpantryuser({
    this.message,
    this.messagecode,
    this.data,
  });

  factory Pendingorderforpantryuser.fromJson(Map<String, dynamic> json) =>
      Pendingorderforpantryuser(
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
  final String? pantryusername;
  final int? orderid;
  final int? statusorderid;
  final String? officename;
  final String? extensioncode;
  final String? remark;
  final int? status;
  final String? createdByName;
  final String? createdAt;
  final dynamic updatedByName;
  final dynamic modifiedAt;
  final List<Orderdetail>? orderdetails;

  Datum({
    this.pantryusername,
    this.orderid,
    this.statusorderid,
    this.officename,
    this.extensioncode,
    this.remark,
    this.status,
    this.createdByName,
    this.createdAt,
    this.updatedByName,
    this.modifiedAt,
    this.orderdetails,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        pantryusername: json["pantryusername"],
        orderid: json["orderid"],
        statusorderid: json["statusorderid"],
        officename: json["officename"],
        extensioncode: json["extensioncode"],
        remark: json["remark"],
        status: json["status"],
        createdByName: json["createdByName"],
        createdAt: json["created_at"],
        updatedByName: json["updatedByName"],
        modifiedAt: json["modified_at"],
        orderdetails: json["Orderdetails"] == null
            ? []
            : List<Orderdetail>.from(
                json["Orderdetails"]!.map((x) => Orderdetail.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "pantryusername": pantryusername,
        "orderid": orderid,
        "statusorderid": statusorderid,
        "officename": officename,
        "extensioncode": extensioncode,
        "remark": remark,
        "status": status,
        "createdByName": createdByName,
        "created_at": createdAt,
        "updatedByName": updatedByName,
        "modified_at": modifiedAt,
        "Orderdetails": orderdetails == null
            ? []
            : List<dynamic>.from(orderdetails!.map((x) => x.toJson())),
      };
}

class Orderdetail {
  final int? qty;
  final String? itemname;
  final String? itemimgpath;
  final String? categoryname;
  final String? pantryname;

  Orderdetail({
    this.qty,
    this.itemname,
    this.itemimgpath,
    this.categoryname,
    this.pantryname,
  });

  factory Orderdetail.fromJson(Map<String, dynamic> json) => Orderdetail(
        qty: json["qty"],
        itemname: json["itemname"],
        itemimgpath: json["itemimgpath"],
        categoryname: json["categoryname"],
        pantryname: json["pantryname"],
      );

  Map<String, dynamic> toJson() => {
        "qty": qty,
        "itemname": itemname,
        "itemimgpath": itemimgpath,
        "categoryname": categoryname,
        "pantryname": pantryname,
      };
}