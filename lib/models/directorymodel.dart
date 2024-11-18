// To parse this JSON data, do
//
//     final directoryModel = directoryModelFromJson(jsonString);

import 'dart:convert';

List<DirectoryModel> directoryModelFromJson(String str) =>
    List<DirectoryModel>.from(
        json.decode(str).map((x) => DirectoryModel.fromJson(x)));

String directoryModelToJson(List<DirectoryModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DirectoryModel {
  final String? message;
  final String? messagecode;
  final List<Datum>? data;

  DirectoryModel({
    this.message,
    this.messagecode,
    this.data,
  });

  factory DirectoryModel.fromJson(Map<String, dynamic> json) => DirectoryModel(
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
  final int? directoryid;
  final String? employeename;
  final String? employeecode;
  final String? extensioncode;
  final String? crmusercode;
  final int? phoneno;
  final String? emailid;
  final String? designation;
  final int? departmentid;
  final String? departmentname;
  final int? cmpId;
  final String? cmpName;
  final int? branchId;
  final String? branchName;
  final int? status;
  final String? createdAt;
  final String? modifiedAt;
  final String? createdbyname;
  final String? updatedbyname;

  Datum({
    this.directoryid,
    this.employeename,
    this.employeecode,
    this.extensioncode,
    this.crmusercode,
    this.phoneno,
    this.emailid,
    this.designation,
    this.departmentid,
    this.departmentname,
    this.cmpId,
    this.cmpName,
    this.branchId,
    this.branchName,
    this.status,
    this.createdAt,
    this.modifiedAt,
    this.createdbyname,
    this.updatedbyname,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        directoryid: json["directoryid"],
        employeename: json["employeename"],
        employeecode: json["employeecode"],
        extensioncode: json["extensioncode"],
        crmusercode: json["crmusercode"],
        phoneno: json["phoneno"],
        emailid: json["emailid"],
        designation: json["designation"],
        departmentid: json["departmentid"],
        departmentname: json["departmentname"],
        cmpId: json["cmp_id"],
        cmpName: json["cmp_name"],
        branchId: json["branch_id"],
        branchName: json["branch_name"],
        status: json["status"],
        createdAt: json["created_at"],
        modifiedAt: json["modified_at"],
        createdbyname: json["createdbyname"],
        updatedbyname: json["updatedbyname"],
      );

  Map<String, dynamic> toJson() => {
        "directoryid": directoryid,
        "employeename": employeename,
        "employeecode": employeecode,
        "extensioncode": extensioncode,
        "crmusercode": crmusercode,
        "phoneno": phoneno,
        "emailid": emailid,
        "designation": designation,
        "departmentid": departmentid,
        "departmentname": departmentname,
        "cmp_id": cmpId,
        "cmp_name": cmpName,
        "branch_id": branchId,
        "branch_name": branchName,
        "status": status,
        "created_at": createdAt,
        "modified_at": modifiedAt,
        "createdbyname": createdbyname,
        "updatedbyname": updatedbyname,
      };
}
