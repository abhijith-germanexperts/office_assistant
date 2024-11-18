// To parse this JSON data, do
//
//     final vieworderbystatus = vieworderbystatusFromJson(jsonString);

import 'dart:convert';

List<Vieworderbystatus> vieworderbystatusFromJson(String str) => List<Vieworderbystatus>.from(json.decode(str).map((x) => Vieworderbystatus.fromJson(x)));

String vieworderbystatusToJson(List<Vieworderbystatus> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Vieworderbystatus {
  String message;
  String messagecode;
  List<Datum> data;

  Vieworderbystatus({
    required this.message,
    required this.messagecode,
    required this.data,
  });

  factory Vieworderbystatus.fromJson(Map<String, dynamic> json) => Vieworderbystatus(
    message: json["message"],
    messagecode: json["messagecode"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "messagecode": messagecode,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  String pantryusername;
  int orderid;
  int statusorderid;
  String officename;
  String remark;
  int status;
  String createdByName;
  DateTime createdAt;
  String updatedByName;
  DateTime modifiedAt;
  List<Orderdetail> orderdetails;

  Datum({
    required this.pantryusername,
    required this.orderid,
    required this.statusorderid,
    required this.officename,
    required this.remark,
    required this.status,
    required this.createdByName,
    required this.createdAt,
    required this.updatedByName,
    required this.modifiedAt,
    required this.orderdetails,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    pantryusername: json["pantryusername"],
    orderid: json["orderid"],
    statusorderid: json["statusorderid"],
    officename: json["officename"],
    remark: json["remark"],
    status: json["status"],
    createdByName: json["createdByName"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedByName: json["updatedByName"],
    modifiedAt: DateTime.parse(json["modified_at"]),
    orderdetails: List<Orderdetail>.from(json["Orderdetails"].map((x) => Orderdetail.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "pantryusername": pantryusername,
    "orderid": orderid,
    "statusorderid": statusorderid,
    "officename": officename,
    "remark": remark,
    "status": status,
    "createdByName": createdByName,
    "created_at": createdAt.toIso8601String(),
    "updatedByName": updatedByName,
    "modified_at": modifiedAt.toIso8601String(),
    "Orderdetails": List<dynamic>.from(orderdetails.map((x) => x.toJson())),
  };
}

class Orderdetail {
  int qty;
  Itemname itemname;
  Categoryname categoryname;
  Pantryname pantryname;

  Orderdetail({
    required this.qty,
    required this.itemname,
    required this.categoryname,
    required this.pantryname,
  });

  factory Orderdetail.fromJson(Map<String, dynamic> json) => Orderdetail(
    qty: json["qty"],
    itemname: itemnameValues.map[json["itemname"]]!,
    categoryname: categorynameValues.map[json["categoryname"]]!,
    pantryname: pantrynameValues.map[json["pantryname"]]!,
  );

  Map<String, dynamic> toJson() => {
    "qty": qty,
    "itemname": itemnameValues.reverse[itemname],
    "categoryname": categorynameValues.reverse[categoryname],
    "pantryname": pantrynameValues.reverse[pantryname],
  };
}

enum Categoryname { COFFEE }

final categorynameValues = EnumValues({
  "COFFEE": Categoryname.COFFEE
});

enum Itemname { CAPPUCCINO }

final itemnameValues = EnumValues({
  "CAPPUCCINO": Itemname.CAPPUCCINO
});

enum Pantryname { BODYSHOP_PANTRY }

final pantrynameValues = EnumValues({
  "bodyshop pantry": Pantryname.BODYSHOP_PANTRY
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
