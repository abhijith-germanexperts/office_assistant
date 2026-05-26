import 'dart:convert';
import 'package:flutter/foundation.dart';

import 'package:ge_assistant/Constants/appconst.dart';
import 'package:ge_assistant/Screens/EndUserDirectory/models/image_model.dart';
import 'package:ge_assistant/models/CreateOrder.dart';
import 'package:ge_assistant/models/accesstoken.dart';
import 'package:ge_assistant/models/canceledandcompletedOrdermodel.dart';
import 'package:ge_assistant/models/getpantryid.dart';
import 'package:ge_assistant/models/recentorders.dart';

import '../Constants/alertdylog_order_success.dart';
import '../models/changeorderstausmodel.dart';
import '../models/changingpantrystockstatusmodel.dart';
import '../models/crmloginmodel.dart';
import '../models/directorymodel.dart';
import '../models/endusermenumodel.dart';
import '../models/fcmtokenchangemodel.dart';
import '../models/inventorylistmodel.dart';
import '../models/loginmode.dart';
import '../models/pantryusernotification.dart';
import '../models/pendingorderforpantrymodel.dart';
import '../models/updateNotification.dart';
import '../models/vieworderbystatusmodel.dart';

import 'package:ge_assistant/services/network_call_service.dart';

class ApiProvider {
  // ✅ DEFINE BASE URLS HERE (Update these in one place if the server changes)
  static const String base7004 = 'http://geapps.germanexperts.ae:7004/api';
  static const String base8080 = 'http://apps.germanexperts.ae:8080/crmservices/rest';
  static const String base3000 = 'http://geapps.germanexperts.ae:3000/api';

  Future<Login> getUserDetails(String username, String password) async {
    final response = await ApiService.instance.request(
      endpoint: '$base7004/pantryloginnew/$username/$password',
      method: HttpMethod.GET,
    );
    var data = loginFromJson(response.body);
    return data.first;
  }

  Future<EmployeeImageModel> getEmployeeImages() async {
    final response = await ApiService.instance.request(
      endpoint: '$base7004/gettingemployeeimage',
      method: HttpMethod.GET,
    );
    return EmployeeImageModel.fromJson(jsonDecode(response.body));
  }

  Future<List<DirectoryModel>?> getDirectoryPage() async {
    final response = await ApiService.instance.request(
      endpoint: '$base7004/geassistantdirectorynew',
      method: HttpMethod.GET,
    );
    return directoryModelFromJson(response.body);
  }

  Future<Crmuserslogin> getloginusers(String accessToken) async {
    final response = await ApiService.instance.request(
      endpoint: '$base7004/gettingactiveloggedInUsers',
      method: HttpMethod.GET,
    );
    return crmusersloginFromJson(response.body);
  }

  Future<Accesstoken> getaccesToken() async {
    final response = await ApiService.instance.request(
      endpoint: '$base3000/getaccesstokenByStatus/Active',
      method: HttpMethod.GET,
    );
    var data = accesstokenFromJson(response.body);
    return data.first;
  }

  Future<Endusermenu> getorderList() async {
    final response = await ApiService.instance.request(
      endpoint: '$base7004/geassistantmenunew',
      method: HttpMethod.GET,
    );
    var data = endusermenuFromJson(response.body);
    return data.first;
  }

  Future<OrderCreate> createOrder(List<Map<String, dynamic>> orderDetails, String remark) async {
    final response = await ApiService.instance.request(
        endpoint: '$base7004/createordernew',
        method: HttpMethod.POST,
        body: {
          "enduserid": AppConstants.username,
          "statusorderid": 1,
          "remark": remark,
          "status": 1,
          "Orderdetails": orderDetails
        }
    );
    var data = orderCreateFromJson(response.body);
    return data.first;
  }

  Future<OrderCreate> createAssistance() async {
    final response = await ApiService.instance.request(
        endpoint: '$base7004/insertneedassistancenew',
        method: HttpMethod.POST,
        body: {
          "enduserid": AppConstants.username,
        }
    );
    var data = orderCreateFromJson(response.body);
    return data.first;
  }

  Future<Inventoryresponse> getmenuInventoryList() async {
    final response = await ApiService.instance.request(
        endpoint: '$base7004/listallinventorynew',
        method: HttpMethod.POST,
        body: {"pantryid": AppConstants.pantryId.toString()}
    );
    var data = inventoryresponseFromJson(response.body);
    return data.first;
  }

  Future<Inventoryresponse> getInventoryList() async {
    final response = await ApiService.instance.request(
        endpoint: '$base7004/listallinventorynew',
        method: HttpMethod.POST,
        body: {"pantryid": AppConstants.userPantryId.toString()}
    );
    var data = inventoryresponseFromJson(response.body);
    return data.first;
  }

  Future<Inventorystatusupdateresponse> changeInventoryItemstatus(id, status) async {
    final response = await ApiService.instance.request(
        endpoint: '$base7004/updateinventorynew/$id',
        method: HttpMethod.POST,
        body: {"menustatus": status.toString()}
    );
    var data = inventorystatusupdateresponseFromJson(response.body);
    return data.first;
  }

  Future<Pendingorderforpantryuser> acceptedOrderByPantry() async {
    final response = await ApiService.instance.request(
        endpoint: '$base7004/ordersbyacceptedcompletedcancelledstatusnew',
        method: HttpMethod.POST,
        body: {"statusorderid": "2", "user_id": AppConstants.username}
    );
    var data = pendingorderforpantryuserFromJson(response.body);
    return data.first;
  }

  Future<Pendingorderforpantryuser> pendingOrderForPantry() async {
    final response = await ApiService.instance.request(
        endpoint: '$base7004/orderhistorybypendingstatusandpantryusernew',
        method: HttpMethod.POST,
        body: {"statusorderid": "1", "user_id": AppConstants.username}
    );
    var data = pendingorderforpantryuserFromJson(response.body);
    return data.first;
  }

  Future<ChangeOrderStatus> changeOrderStatus(orderId, stOrderId, modifiedBy) async {
    final response = await ApiService.instance.request(
        endpoint: '$base7004/editordernew',
        method: HttpMethod.POST,
        body: {
          "orderid": orderId.toString(),
          "statusorderid": stOrderId.toString(),
          "modified_by": modifiedBy.toString()
        }
    );
    var data = changeOrderStatusFromJson(response.body);
    return data.first;
  }

  Future<CanceledAndCompletedOrders> completedAndCanceledOrders(user_id) async {
    final response = await ApiService.instance.request(
        endpoint: '$base7004/ordersbycompletedcancelledstatusnew',
        method: HttpMethod.POST,
        body: {"user_id": user_id.toString()}
    );
    var data = canceledAndCompletedOrdersFromJson(response.body);
    return data.first;
  }

  Future<RecentOrders> getRecentOrder(String id) async {
    final response = await ApiService.instance.request(
      endpoint: '$base7004/listrecentordernew/$id',
      method: HttpMethod.GET,
    );
    var data = recentOrdersFromJson(response.body);
    return data.first;
  }

  Future<Getpantryid> getpPantryId(id) async {
    final response = await ApiService.instance.request(
        endpoint: '$base7004/assignedOfficePantryBYUserIdnew',
        method: HttpMethod.POST,
        body: {"officeid": id.toString()}
    );
    return getpantryidFromJson(response.body);
  }

  Future<Pantryusernotification> pantryNotifications(pantryuserid) async {
    final response = await ApiService.instance.request(
        endpoint: '$base7004/listallnotificationbypantryusernew',
        method: HttpMethod.POST,
        body: {"pantryuserid": pantryuserid.toString()}
    );
    var data = pantryusernotificationFromJson(response.body);
    return data.first;
  }

  Future<Internalnotificationupdate> updatePantryNotifications(String pantryuserid, String notificationid) async {
    final response = await ApiService.instance.request(
        endpoint: '$base7004/updateinternalnotificationnew',
        method: HttpMethod.POST,
        body: {
          "pantryuserid": pantryuserid.toString(),
          "notificationid": notificationid.toString()
        }
    );
    var data = internalnotificationupdateFromJson(response.body);
    return data.first;
  }

  Future<Changefcmtoken> changefcm(String userid, String fcmtoken) async {
    final response = await ApiService.instance.request(
        endpoint: '$base7004/updatefcmtokennew',
        method: HttpMethod.POST,
        body: {
          "user_id": userid.toString(),
          "fcmtoken": fcmtoken.toString()
        }
    );
    var data = changefcmtokenFromJson(response.body);
    return data.first;
  }
}