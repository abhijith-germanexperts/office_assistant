import 'dart:convert';

List<Accesstoken> accesstokenFromJson(String str) => List<Accesstoken>.from(
    json.decode(str).map((x) => Accesstoken.fromJson(x)));

String accesstokenToJson(List<Accesstoken> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Accesstoken {
  final int? crmId;
  final String? crmAccesstoken;
  final String? crmRefreshtoken;
  final dynamic crmTokentime;
  final int? status;
  final DateTime? createdAt;
  final int? createdBy;
  final dynamic modifiedAt;
  final dynamic modifiedBy;
  final dynamic lastLogin;

  Accesstoken({
    this.crmId,
    this.crmAccesstoken,
    this.crmRefreshtoken,
    this.crmTokentime,
    this.status,
    this.createdAt,
    this.createdBy,
    this.modifiedAt,
    this.modifiedBy,
    this.lastLogin,
  });

  factory Accesstoken.fromJson(Map<String, dynamic> json) => Accesstoken(
        crmId: json["crm_id"],
        crmAccesstoken: json["crm_accesstoken"],
        crmRefreshtoken: json["crm_refreshtoken"],
        crmTokentime: json["crm_tokentime"],
        status: json["status"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        createdBy: json["created_by"],
        modifiedAt: json["modified_at"],
        modifiedBy: json["modified_by"],
        lastLogin: json["last_login"],
      );

  Map<String, dynamic> toJson() => {
        "crm_id": crmId,
        "crm_accesstoken": crmAccesstoken,
        "crm_refreshtoken": crmRefreshtoken,
        "crm_tokentime": crmTokentime,
        "status": status,
        "created_at": createdAt?.toIso8601String(),
        "created_by": createdBy,
        "modified_at": modifiedAt,
        "modified_by": modifiedBy,
        "last_login": lastLogin,
      };
}
