// lib/models/check_order_lmit/checkuserorderlimitmodel.dart
import 'dart:convert';

List<CheckUserOrderLimit> checkUserOrderLimitFromJson(String str) =>
    List<CheckUserOrderLimit>.from(
        json.decode(str).map((x) => CheckUserOrderLimit.fromJson(x)));

String checkUserOrderLimitToJson(List<CheckUserOrderLimit> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CheckUserOrderLimit {
  String? message;
  String? messagecode;
  OrderLimitData? data;

  CheckUserOrderLimit({
    this.message,
    this.messagecode,
    this.data,
  });

  factory CheckUserOrderLimit.fromJson(Map<String, dynamic> json) =>
      CheckUserOrderLimit(
        message: json["message"],
        messagecode: json["messagecode"],
        data: json["data"] == null ? null : OrderLimitData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
    "message": message,
    "messagecode": messagecode,
    "data": data?.toJson(),
  };
}

class OrderLimitData {
  String? username;
  bool? hasUserLimit;
  String? categoryname;
  String? categoryType;
  int? limit;
  int? usedQty;
  int? balance;
  bool? hasLimit;
  bool? canOrder; // Added this field

  OrderLimitData({
    this.username,
    this.hasUserLimit,
    this.categoryname,
    this.categoryType,
    this.limit,
    this.usedQty,
    this.balance,
    this.hasLimit,
    this.canOrder, // Added this field
  });

  factory OrderLimitData.fromJson(Map<String, dynamic> json) => OrderLimitData(
    username: json["username"],
    hasUserLimit: json["has_user_limit"],
    categoryname: json["categoryname"],
    categoryType: json["category_type"],
    limit: json["limit"],
    usedQty: json["used_qty"],
    balance: json["balance"],
    hasLimit: json["has_limit"],
    canOrder: json["can_order"], // Added this field
  );

  Map<String, dynamic> toJson() => {
    "username": username,
    "has_user_limit": hasUserLimit,
    "categoryname": categoryname,
    "category_type": categoryType,
    "limit": limit,
    "used_qty": usedQty,
    "balance": balance,
    "has_limit": hasLimit,
    "can_order": canOrder, // Added this field
  };
}

// import 'dart:convert';
//
// List<CheckUserOrderLimit> checkUserOrderLimitFromJson(String str) =>
//     List<CheckUserOrderLimit>.from(
//         json.decode(str).map((x) => CheckUserOrderLimit.fromJson(x)));
//
// String checkUserOrderLimitToJson(List<CheckUserOrderLimit> data) =>
//     json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
//
// class CheckUserOrderLimit {
//   String? message;
//   String? messagecode;
//   OrderLimitData? data;
//
//   CheckUserOrderLimit({
//     this.message,
//     this.messagecode,
//     this.data,
//   });
//
//   factory CheckUserOrderLimit.fromJson(Map<String, dynamic> json) =>
//       CheckUserOrderLimit(
//         message: json["message"],
//         messagecode: json["messagecode"],
//         data: json["data"] == null ? null : OrderLimitData.fromJson(json["data"]),
//       );
//
//   Map<String, dynamic> toJson() => {
//         "message": message,
//         "messagecode": messagecode,
//         "data": data?.toJson(),
//       };
// }
//
// class OrderLimitData {
//   String? username;
//   bool? hasUserLimit;
//   String? categoryname;
//   String? categoryType;
//   int? limit;
//   int? usedQty;
//   int? balance;
//   bool? hasLimit;
//
//   OrderLimitData({
//     this.username,
//     this.hasUserLimit,
//     this.categoryname,
//     this.categoryType,
//     this.limit,
//     this.usedQty,
//     this.balance,
//     this.hasLimit,
//   });
//
//   factory OrderLimitData.fromJson(Map<String, dynamic> json) => OrderLimitData(
//         username: json["username"],
//         hasUserLimit: json["has_user_limit"],
//         categoryname: json["categoryname"],
//         categoryType: json["category_type"],
//         limit: json["limit"],
//         usedQty: json["used_qty"],
//         balance: json["balance"],
//         hasLimit: json["has_limit"],
//       );
//
//   Map<String, dynamic> toJson() => {
//         "username": username,
//         "has_user_limit": hasUserLimit,
//         "categoryname": categoryname,
//         "category_type": categoryType,
//         "limit": limit,
//         "used_qty": usedQty,
//         "balance": balance,
//         "has_limit": hasLimit,
//       };
// }
//
