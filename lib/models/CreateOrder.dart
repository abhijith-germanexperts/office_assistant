import 'dart:convert';

List<OrderCreate> orderCreateFromJson(String str) => List<OrderCreate>.from(
    json.decode(str).map((x) => OrderCreate.fromJson(x)));

String orderCreateToJson(List<OrderCreate> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class OrderCreate {
  final String? message;
  final String? messagecode;

  OrderCreate({
    this.message,
    this.messagecode,
  });

  factory OrderCreate.fromJson(Map<String, dynamic> json) => OrderCreate(
        message: json["message"],
        messagecode: json["messagecode"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "messagecode": messagecode,
      };
}
