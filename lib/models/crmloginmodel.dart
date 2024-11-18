import 'dart:convert';

Crmuserslogin crmusersloginFromJson(String str) =>
    Crmuserslogin.fromJson(json.decode(str));

String crmusersloginToJson(Crmuserslogin data) => json.encode(data.toJson());

class Crmuserslogin {
  final int? count;
  final List<Record>? records;
  final String? message;
  final int? status;
  final dynamic errors;

  Crmuserslogin({
    this.count,
    this.records,
    this.message,
    this.status,
    this.errors,
  });

  factory Crmuserslogin.fromJson(Map<String, dynamic> json) => Crmuserslogin(
        count: json["count"],
        records: json["records"] == null
            ? []
            : List<Record>.from(
                json["records"]!.map((x) => Record.fromJson(x))),
        message: json["message"],
        status: json["status"],
        errors: json["errors"],
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "records": records == null
            ? []
            : List<dynamic>.from(records!.map((x) => x.toJson())),
        "message": message,
        "status": status,
        "errors": errors,
      };
}

class Record {
  final String? sLoginName;

  Record({
    this.sLoginName,
  });

  factory Record.fromJson(Map<String, dynamic> json) => Record(
        sLoginName: json["sLoginName"],
      );

  Map<String, dynamic> toJson() => {
        "sLoginName": sLoginName,
      };
}
