import 'dart:convert';

import 'package:ge_assistant/Constants/appconst.dart';
import 'package:ge_assistant/models/CreateOrder.dart';
import 'package:ge_assistant/models/accesstoken.dart';
import 'package:ge_assistant/models/canceledandcompletedOrdermodel.dart';
import 'package:ge_assistant/models/getpantryid.dart';
import 'package:ge_assistant/models/recentorders.dart';
import 'package:http/http.dart' as http;

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

class ApiProvider {
  Future<Login> getUserDetails(String username, String password) async {
    final response = await http.get(
        Uri.parse(
            'http://geapps.germanexperts.ae:7004/api/pantrylogin/$username/$password'),
        headers: {"apikey": "a4db08b7-5729-4ba9-8c08-f2df493465a1"});
    var data = loginFromJson(response.body.toString());
    if (response.statusCode == 200) {
      return data.first;
    } else {
      return data.first;
    }
  }

  Future<List<DirectoryModel>?> getDirectoryPage() async {
    final response = await http.get(
        Uri.parse(
            'http://geapps.germanexperts.ae:7004/api/geassistantdirectory'),
        headers: {"apikey": "a4db08b7-5729-4ba9-8c08-f2df493465a1"});
    List<DirectoryModel>? data =
        directoryModelFromJson(response.body.toString());
    if (response.statusCode == 200) {
      return data;
    } else {
      return null;
    }
  }

  Future<Crmuserslogin> getloginusers(String accessToken) async {
    final response = await http.get(
        Uri.parse(
            'http://apps.germanexperts.ae:8080/crmservices/rest/utils/v1.0/getQueryBasedMetaData?query=select distinct(vu.sLoginName)from mSec_Users vu with (nolock) right outer join tSec_UserLog vl with (nolock) on vu.iUserId=vl.iUserId where iLoginDate=dbo.DateToInt(getdate()) and isnull(iLogoutTime,0)=0'),
        headers: {"access_token": accessToken});
    var data = crmusersloginFromJson(response.body.toString());
    if (response.statusCode == 200) {
      return data;
    } else {
      return data;
    }
  }

  Future<Accesstoken> getaccesToken() async {
    final response = await http.get(Uri.parse(
        'http://geapps.germanexperts.ae:3000/api/getaccesstokenByStatus/Active'));
    // headers: {"apikey": "a4db08b7-5729-4ba9-8c08-f2df493465a1"});
    var data = accesstokenFromJson(response.body.toString());
    if (response.statusCode == 200) {
      return data.first;
    } else {
      return data.first;
    }
  }

  Future<Endusermenu> getorderList() async {
    final response = await http.get(
        Uri.parse('http://geapps.germanexperts.ae:7004/api/geassistantmenu'),
        headers: {"apikey": "a4db08b7-5729-4ba9-8c08-f2df493465a1"});
    var data = endusermenuFromJson(response.body.toString());
    if (response.statusCode == 200) {
      return data.first;
    } else {
      return data.first;
    }
  }

  Future<OrderCreate> createOrder(
      List<Map<String, dynamic>> orderDetails, String remark) async {
    const postaddFcm = "http://geapps.germanexperts.ae:7004/api/createorder";
    http.Response res = await http.post(Uri.parse(postaddFcm),
        headers: {
          "content-type": "application/json",
          "accept": "application/json",
          "apikey": 'a4db08b7-5729-4ba9-8c08-f2df493465a1'
        },
        body: jsonEncode({
          "enduserid": AppConstants.username,
          "statusorderid": 1,
          "remark": remark,
          "status": 1,
          "Orderdetails": orderDetails
        }));
    var data = orderCreateFromJson(res.body.toString());
    if (res.statusCode == 200) {
      return data.first;
      //showOrderSuccessDialog();
      //tokenChangeStatus(0);
    } else {
      return data.first;
    }
  }

  Future<OrderCreate> createAssistance() async {
    const postaddFcm =
        "http://geapps.germanexperts.ae:7004/api/insertneedassistance";
    http.Response res = await http.post(Uri.parse(postaddFcm),
        headers: {
          "content-type": "application/json",
          "accept": "application/json",
          "apikey": 'a4db08b7-5729-4ba9-8c08-f2df493465a1'
        },
        body: jsonEncode({
          "enduserid": AppConstants.username,
        }));
    var data = orderCreateFromJson(res.body.toString());
    if (res.statusCode == 200) {
      return data.first;
      //showOrderSuccessDialog();
      //tokenChangeStatus(0);
    } else {
      return data.first;
    }
  }

  Future<Inventoryresponse> getmenuInventoryList() async {
    final response = await http.post(
        Uri.parse('http://geapps.germanexperts.ae:7004/api/listallinventory'),
        headers: {"apikey": "a4db08b7-5729-4ba9-8c08-f2df493465a1"},
        body: {"pantryid": AppConstants.pantryId.toString()});
    var data = inventoryresponseFromJson(response.body.toString());
    if (response.statusCode == 200) {
      return data.first;
    } else {
      return data.first;
    }
  }

  Future<Inventoryresponse> getInventoryList() async {
    final response = await http.post(
        Uri.parse('http://geapps.germanexperts.ae:7004/api/listallinventory'),
        headers: {"apikey": "a4db08b7-5729-4ba9-8c08-f2df493465a1"},
        body: {"pantryid": AppConstants.userPantryId.toString()});
    var data = inventoryresponseFromJson(response.body.toString());
    if (response.statusCode == 200) {
      return data.first;
    } else {
      return data.first;
    }
  }

  Future<Inventorystatusupdateresponse> changeInventoryItemstatus(
      id, status) async {
    final response = await http.post(
        Uri.parse(
            'http://geapps.germanexperts.ae:7004/api/updateinventory/$id'),
        headers: {"apikey": "a4db08b7-5729-4ba9-8c08-f2df493465a1"},
        body: {"menustatus": status});
    var data = inventorystatusupdateresponseFromJson(response.body.toString());
    if (response.statusCode == 200) {
      return data.first;
    } else {
      return data.first;
    }
  }

  Future<Pendingorderforpantryuser> acceptedOrderByPantry() async {
    final response = await http.post(
        Uri.parse(
            'http://geapps.germanexperts.ae:7004/api/ordersbyacceptedcompletedcancelledstatus'),
        headers: {"apikey": "a4db08b7-5729-4ba9-8c08-f2df493465a1"},
        body: {"statusorderid": "2", "user_id": AppConstants.username});
    var data = pendingorderforpantryuserFromJson(response.body.toString());
    if (response.statusCode == 200) {
      return data.first;
    } else {
      return data.first;
    }
  }

  Future<Pendingorderforpantryuser> pendingOrderForPantry() async {
    final response = await http.post(
        Uri.parse(
            'http://geapps.germanexperts.ae:7004/api/orderhistorybypendingstatusandpantryuser'),
        headers: {"apikey": "a4db08b7-5729-4ba9-8c08-f2df493465a1"},
        body: {"statusorderid": "1", "user_id": AppConstants.username});
    var data = pendingorderforpantryuserFromJson(response.body.toString());
    if (response.statusCode == 200) {
      return data.first;
    } else {
      return data.first;
    }
  }

  Future<ChangeOrderStatus> changeOrderStatus(
      orderId, stOrderId, modifiedBy) async {
    final response = await http.post(
        Uri.parse('http://geapps.germanexperts.ae:7004/api/editorder'),
        headers: {
          "apikey": "a4db08b7-5729-4ba9-8c08-f2df493465a1"
        },
        body: {
          "orderid": orderId,
          "statusorderid": stOrderId,
          "modified_by": modifiedBy
        });
    var data = changeOrderStatusFromJson(response.body.toString());
    if (response.statusCode == 200) {
      return data.first;
    } else {
      return data.first;
    }
  }

  Future<CanceledAndCompletedOrders> completedAndCanceledOrders(user_id) async {
    final response = await http.post(
        Uri.parse(
            'http://geapps.germanexperts.ae:7004/api/ordersbycompletedcancelledstatus'),
        headers: {"apikey": "a4db08b7-5729-4ba9-8c08-f2df493465a1"},
        body: {"user_id": user_id});
    var data = canceledAndCompletedOrdersFromJson(response.body.toString());
    if (response.statusCode == 200) {
      return data.first;
    } else {
      return data.first;
    }
  }

  Future<RecentOrders> getRecentOrder(String id) async {
    final response = await http.get(
        Uri.parse(
            'http://geapps.germanexperts.ae:7004/api/listrecentorder/$id'),
        headers: {"apikey": "a4db08b7-5729-4ba9-8c08-f2df493465a1"});
    var data = recentOrdersFromJson(response.body.toString());
    if (response.statusCode == 200) {
      return data.first;
    } else {
      return data.first;
    }
  }

  Future<Getpantryid> getpPantryId(id) async {
    final response = await http.post(
        Uri.parse(
            'http://geapps.germanexperts.ae:7004/api/assignedOfficePantryBYUserId'),
        headers: {"apikey": "a4db08b7-5729-4ba9-8c08-f2df493465a1"},
        body: {"officeid": id});
    var data = getpantryidFromJson(response.body.toString());
    if (response.statusCode == 200) {
      return data;
    } else {
      return data;
    }
  }

  Future<Pantryusernotification> pantryNotifications(pantryuserid) async {
    final response = await http.post(
        Uri.parse(
            'http://geapps.germanexperts.ae:7004/api/listallnotificationbypantryuser'),
        headers: {"apikey": "a4db08b7-5729-4ba9-8c08-f2df493465a1"},
        body: {"pantryuserid": pantryuserid});
    var data = pantryusernotificationFromJson(response.body.toString());
    if (response.statusCode == 200) {
      return data.first;
    } else {
      return data.first;
    }
  }

  Future<Internalnotificationupdate> updatePantryNotifications(
      String pantryuserid, String notificationid) async {
    final response = await http.post(
        Uri.parse(
            'http://geapps.germanexperts.ae:7004/api/updateinternalnotification'),
        headers: {"apikey": "a4db08b7-5729-4ba9-8c08-f2df493465a1"},
        body: {"pantryuserid": pantryuserid, "notificationid": notificationid});
    var data = internalnotificationupdateFromJson(response.body.toString());
    if (response.statusCode == 200) {
      return data.first;
    } else {
      print(response.statusCode);
      return data.first;
    }
  }

  Future<Changefcmtoken> changefcm(String userid, String fcmtoken) async {
    final response = await http.post(
        Uri.parse('http://geapps.germanexperts.ae:7004/api/updatefcmtoken'),
        headers: {"apikey": "a4db08b7-5729-4ba9-8c08-f2df493465a1"},
        body: {"user_id": userid, "fcmtoken": fcmtoken});
    var data = changefcmtokenFromJson(response.body.toString());
    if (response.statusCode == 200) {
      print(response.statusCode);
      print(data);
      return data.first;
    } else {
      return data.first;
    }
  }
}
