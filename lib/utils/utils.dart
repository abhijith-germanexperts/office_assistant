import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class Utils {
  Utils._();

  static logout(int id) async {
    final postEditNotificationFcm =
        "http://geapps.germanexperts.ae:7004/api/offlineuser/$id";

    http.Response res = await http.post(
      Uri.parse(postEditNotificationFcm),
    );
    if (res.statusCode == 200) {
      print(res.body);
      //tokenChangeStatus(0);
    } else {
      print(res.body);
      print(res.statusCode);
      print("checking");
    }
  }
}
