import 'dart:convert';

List<Login> loginFromJson(String str) => List<Login>.from(json.decode(str).map((x) => Login.fromJson(x)));

String loginToJson(List<Login> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Login {
    final String? message;
    final String? messagecode;
    final List<UserList>? userList;
    final List<dynamic>? officepantryList;
    final String? isLogin;

    Login({
        this.message,
        this.messagecode,
        this.userList,
        this.officepantryList,
        this.isLogin,
    });

    factory Login.fromJson(Map<String, dynamic> json) => Login(
        message: json["message"],
        messagecode: json["messagecode"],
        userList: json["userList"] == null ? [] : List<UserList>.from(json["userList"]!.map((x) => UserList.fromJson(x))),
        officepantryList: json["officepantryList"] == null ? [] : List<dynamic>.from(json["officepantryList"]!.map((x) => x)),
        isLogin: json["isLogin"],
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "messagecode": messagecode,
        "userList": userList == null ? [] : List<dynamic>.from(userList!.map((x) => x.toJson())),
        "officepantryList": officepantryList == null ? [] : List<dynamic>.from(officepantryList!.map((x) => x)),
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
    final String? lastLogin;
    final bool? useronlineStatus;
    final String? isforcefulllogin;
    final dynamic dashboardurl;
    final int? cmpId;
    final int? createdBy;
    final String? createdAt;
    final int? modifiedBy;
    final String? modifiedAt;
    final String? remark;
    final String? extensioncode;
    final int? officeid;
    final String? userimage;
    final int? usercategory;
    final dynamic crmusercode;
    final dynamic isassigned;
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
        lastLogin: json["last_login"],
        useronlineStatus: json["useronline_status"],
        isforcefulllogin: json["isforcefulllogin"],
        dashboardurl: json["dashboardurl"],
        cmpId: json["cmp_id"],
        createdBy: json["created_by"],
        createdAt: json["created_at"],
        modifiedBy: json["modified_by"],
        modifiedAt: json["modified_at"],
        remark: json["remark"],
        extensioncode: json["extensioncode"],
        officeid: json["officeid"],
        userimage: json["userimage"],
        usercategory: json["usercategory"],
        crmusercode: json["crmusercode"],
        isassigned: json["isassigned"],
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
        "last_login": lastLogin,
        "useronline_status": useronlineStatus,
        "isforcefulllogin": isforcefulllogin,
        "dashboardurl": dashboardurl,
        "cmp_id": cmpId,
        "created_by": createdBy,
        "created_at": createdAt,
        "modified_by": modifiedBy,
        "modified_at": modifiedAt,
        "remark": remark,
        "extensioncode": extensioncode,
        "officeid": officeid,
        "userimage": userimage,
        "usercategory": usercategory,
        "crmusercode": crmusercode,
        "isassigned": isassigned,
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
    final String? createdAt;
    final int? createdBy;
    final dynamic modifiedAt;
    final dynamic modifiedBy;

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
        createdAt: json["created_at"],
        createdBy: json["created_by"],
        modifiedAt: json["modified_at"],
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
        "created_at": createdAt,
        "created_by": createdBy,
        "modified_at": modifiedAt,
        "modified_by": modifiedBy,
    };
}
