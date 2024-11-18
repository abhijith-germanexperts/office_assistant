// To parse this JSON data, do
//
//     final login = loginFromJson(jsonString);

import 'dart:convert';

List<Login> loginFromJson(String str) => List<Login>.from(json.decode(str).map((x) => Login.fromJson(x)));

String loginToJson(List<Login> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Login {
    final String? message;
    final String? messagecode;
    final List<UserList>? userList;
    final List<UserpantryList>? userpantryList;
    final String? isLogin;

    Login({
        this.message,
        this.messagecode,
        this.userList,
        this.userpantryList,
        this.isLogin,
    });

    factory Login.fromJson(Map<String, dynamic> json) => Login(
        message: json["message"],
        messagecode: json["messagecode"],
        userList: json["userList"] == null ? [] : List<UserList>.from(json["userList"]!.map((x) => UserList.fromJson(x))),
        userpantryList: json["userpantryList"] == null ? [] : List<UserpantryList>.from(json["userpantryList"]!.map((x) => UserpantryList.fromJson(x))),
        isLogin: json["isLogin"],
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "messagecode": messagecode,
        "userList": userList == null ? [] : List<dynamic>.from(userList!.map((x) => x.toJson())),
        "userpantryList": userpantryList == null ? [] : List<dynamic>.from(userpantryList!.map((x) => x.toJson())),
        "isLogin": isLogin,
    };
}

class UserList {
    final int? userId;
    final String? username;
    final String? userpassword;
    final String? emailid;
    final int? status;
    final int? roleId;
    final int? branchId;
    final DateTime? lastLogin;
    final bool? useronlineStatus;
    final String? isforcefulllogin;
    final dynamic dashboardurl;
    final int? cmpId;
    final int? createdBy;
    final DateTime? createdAt;
    final int? modifiedBy;
    final DateTime? modifiedAt;
    final String? remark;
    final String? extensioncode;
    final int? officeid;
    final String? userimage;
    final int? usercategory;
    final dynamic crmusercode;
    final bool? isassigned;
    final String? fcmtoken;
    final List<Privilegearr>? privilegearr;

    UserList({
        this.userId,
        this.username,
        this.userpassword,
        this.emailid,
        this.status,
        this.roleId,
        this.branchId,
        this.lastLogin,
        this.useronlineStatus,
        this.isforcefulllogin,
        this.dashboardurl,
        this.cmpId,
        this.createdBy,
        this.createdAt,
        this.modifiedBy,
        this.modifiedAt,
        this.remark,
        this.extensioncode,
        this.officeid,
        this.userimage,
        this.usercategory,
        this.crmusercode,
        this.isassigned,
        this.fcmtoken,
        this.privilegearr,
    });

    factory UserList.fromJson(Map<String, dynamic> json) => UserList(
        userId: json["user_id"],
        username: json["username"],
        userpassword: json["userpassword"],
        emailid: json["emailid"],
        status: json["status"],
        roleId: json["role_id"],
        branchId: json["branch_id"],
        lastLogin: json["last_login"] == null ? null : DateTime.parse(json["last_login"]),
        useronlineStatus: json["useronline_status"],
        isforcefulllogin: json["isforcefulllogin"],
        dashboardurl: json["dashboardurl"],
        cmpId: json["cmp_id"],
        createdBy: json["created_by"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        modifiedBy: json["modified_by"],
        modifiedAt: json["modified_at"] == null ? null : DateTime.parse(json["modified_at"]),
        remark: json["remark"],
        extensioncode: json["extensioncode"],
        officeid: json["officeid"],
        userimage: json["userimage"],
        usercategory: json["usercategory"],
        crmusercode: json["crmusercode"],
        isassigned: json["isassigned"],
        fcmtoken: json["fcmtoken"],
        privilegearr: json["privilegearr"] == null ? [] : List<Privilegearr>.from(json["privilegearr"]!.map((x) => Privilegearr.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "user_id": userId,
        "username": username,
        "userpassword": userpassword,
        "emailid": emailid,
        "status": status,
        "role_id": roleId,
        "branch_id": branchId,
        "last_login": lastLogin?.toIso8601String(),
        "useronline_status": useronlineStatus,
        "isforcefulllogin": isforcefulllogin,
        "dashboardurl": dashboardurl,
        "cmp_id": cmpId,
        "created_by": createdBy,
        "created_at": createdAt?.toIso8601String(),
        "modified_by": modifiedBy,
        "modified_at": modifiedAt?.toIso8601String(),
        "remark": remark,
        "extensioncode": extensioncode,
        "officeid": officeid,
        "userimage": userimage,
        "usercategory": usercategory,
        "crmusercode": crmusercode,
        "isassigned": isassigned,
        "fcmtoken": fcmtoken,
        "privilegearr": privilegearr == null ? [] : List<dynamic>.from(privilegearr!.map((x) => x.toJson())),
    };
}

class Privilegearr {
    final int? privilegeId;
    final int? moduleId;
    final int? roleId;
    final int? fullgrantaccess;
    final int? readaccess;
    final int? writeaccess;
    final int? modifyaccess;
    final int? deleteaccess;
    final DateTime? createdAt;
    final int? createdBy;
    final DateTime? modifiedAt;
    final int? modifiedBy;

    Privilegearr({
        this.privilegeId,
        this.moduleId,
        this.roleId,
        this.fullgrantaccess,
        this.readaccess,
        this.writeaccess,
        this.modifyaccess,
        this.deleteaccess,
        this.createdAt,
        this.createdBy,
        this.modifiedAt,
        this.modifiedBy,
    });

    factory Privilegearr.fromJson(Map<String, dynamic> json) => Privilegearr(
        privilegeId: json["privilege_id"],
        moduleId: json["module_id"],
        roleId: json["role_id"],
        fullgrantaccess: json["fullgrantaccess"],
        readaccess: json["readaccess"],
        writeaccess: json["writeaccess"],
        modifyaccess: json["modifyaccess"],
        deleteaccess: json["deleteaccess"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        createdBy: json["created_by"],
        modifiedAt: json["modified_at"] == null ? null : DateTime.parse(json["modified_at"]),
        modifiedBy: json["modified_by"],
    );

    Map<String, dynamic> toJson() => {
        "privilege_id": privilegeId,
        "module_id": moduleId,
        "role_id": roleId,
        "fullgrantaccess": fullgrantaccess,
        "readaccess": readaccess,
        "writeaccess": writeaccess,
        "modifyaccess": modifyaccess,
        "deleteaccess": deleteaccess,
        "created_at": createdAt?.toIso8601String(),
        "created_by": createdBy,
        "modified_at": modifiedAt?.toIso8601String(),
        "modified_by": modifiedBy,
    };
}

class UserpantryList {
    final String? pantryname;
    final int? pantryid;
    final int? status;
    final int? userId;
    final String? branchName;
    final String? cmpName;
    final String? username;
    final String? rolename;
    final int? usercategory;
    final String? fcmtoken;

    UserpantryList({
        this.pantryname,
        this.pantryid,
        this.status,
        this.userId,
        this.branchName,
        this.cmpName,
        this.username,
        this.rolename,
        this.usercategory,
        this.fcmtoken,
    });

    factory UserpantryList.fromJson(Map<String, dynamic> json) => UserpantryList(
        pantryname: json["pantryname"],
        pantryid: json["pantryid"],
        status: json["status"],
        userId: json["user_id"],
        branchName: json["branch_name"],
        cmpName: json["cmp_name"],
        username: json["username"],
        rolename: json["rolename"],
        usercategory: json["usercategory"],
        fcmtoken: json["fcmtoken"],
    );

    Map<String, dynamic> toJson() => {
        "pantryname": pantryname,
        "pantryid": pantryid,
        "status": status,
        "user_id": userId,
        "branch_name": branchName,
        "cmp_name": cmpName,
        "username": username,
        "rolename": rolename,
        "usercategory": usercategory,
        "fcmtoken": fcmtoken,
    };
}
