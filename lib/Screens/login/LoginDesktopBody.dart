import 'dart:io';
import 'dart:ui';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:ge_assistant/Constants/appconst.dart';
import 'package:ge_assistant/Screens/End%20userselection%20page/EmdUserSelectionDesktop.dart';
import 'package:ge_assistant/Screens/EndPantrymenu/Desktop_end_pantrymenu.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/loginmode.dart';
import '../../services/apiservices.dart';
import '../End userselection page/EndUserSelectionBasePage.dart';
import '../PantryUser/pantryuserHomeScreen/basePagePantryHomeScreen.dart';

class LoginDesktopBody extends StatefulWidget {
  const LoginDesktopBody({Key? key}) : super(key: key);

  @override
  State<LoginDesktopBody> createState() => _LoginDesktopBodyState();
}

bool isPasswordvisible = true;

class _LoginDesktopBodyState extends State<LoginDesktopBody> {
  ApiProvider client = ApiProvider();
  bool isPasswordvisible = true;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _userIdcontroller = TextEditingController();
  final TextEditingController _passwordcontroller = TextEditingController();

  PackageInfo _packageInfo = PackageInfo(
    appName: ' ',
    packageName: ' ',
    version: ' ',
    buildNumber: ' ',
    buildSignature: ' ',
  );

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _initPackageInfo();
  }

  Future<void> _initPackageInfo() async {
    final info = await PackageInfo.fromPlatform();
    setState(() {
      _packageInfo = info;
    });
  }

  @override
  Widget build(BuildContext context) {
    {
      return Scaffold(
          body: InkWell(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Stack(
          children: [
            Container(
              width: double.maxFinite,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: const AssetImage(
                      'image/aaron-huber-8qYE6LGHW-c-unsplash.jpg'),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.7), BlendMode.hardLight),
                ),
              ),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.00),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                        width: MediaQuery.of(context).size.width * .5,
                        height: MediaQuery.of(context).size.height * 0.11,
                        child: const Image(
                            image: AssetImage(
                                "image/GE office assistant white.png"))),
                    Container(
                        height: MediaQuery.of(context).size.height * .2,
                        width: 1,
                        color: Colors.white),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * .45,
                      height: MediaQuery.of(context).size.height * 8,
                      child: Form(
                        key: _formKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                                width: MediaQuery.of(context).size.width * .4,
                                child: TextFormField(
                                  controller: _userIdcontroller,
                                  style: const TextStyle(color: Colors.white),
                                  decoration: const InputDecoration(
                                    hintText: "User ID",
                                    hintStyle: TextStyle(color: Colors.white),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors
                                            .white, // Set your desired border color here.
                                        width: 1.0,
                                      ),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors
                                            .white, // Border color when focused.
                                        width: 1.0,
                                      ),
                                    ),
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter UserName';
                                    }
                                    return null;
                                  },
                                )),
                            SizedBox(
                                width: MediaQuery.of(context).size.width * .4,
                                child: TextFormField(
                                  controller: _passwordcontroller,
                                  style: const TextStyle(color: Colors.white),
                                  obscureText: isPasswordvisible,
                                  decoration: InputDecoration(
                                    suffixIcon: IconButton(
                                      icon: isPasswordvisible
                                          ? Icon(
                                              Icons.visibility_off,
                                              size: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.03,
                                              color: Colors.grey,
                                            )
                                          : const Icon(
                                              Icons.visibility,
                                              color: Colors.grey,
                                            ),
                                      onPressed: () {
                                        setState(() {
                                          isPasswordvisible =
                                              !isPasswordvisible;
                                        });
                                      },
                                    ),
                                    hintText: "Password",
                                    hintStyle:
                                        const TextStyle(color: Colors.white),
                                    enabledBorder: const UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors
                                            .white, // Set your desired border color here.
                                        width: 1.0,
                                      ),
                                    ),
                                    focusedBorder: const UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors
                                            .white, // Border color when focused.
                                        width: 1.0,
                                      ),
                                    ),
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please Enter the Password';
                                    }
                                    return null;
                                  },
                                )),
                            const SizedBox(
                              height: 20,
                            ),
                            Align(
                              // alignment: Alignment.centerRight,
                              child: SizedBox(
                                  width: MediaQuery.of(context).size.width * .2,
                                  child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.transparent,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                              10), // Set the border radius here
                                          side: const BorderSide(
                                              color: Colors
                                                  .white), // Set the border color here
                                        ),
                                      ),
                                      onPressed: () {
                                        if (_formKey.currentState!.validate()) {
                                          final FocusNode focusNode =
                                              FocusNode();
                                          // Use the focus node to control the keyboard visibility
                                          FocusScope.of(context)
                                              .requestFocus(focusNode);
                                          // Call unfocus method to hide the keyboard
                                          focusNode.unfocus();
                                          Future.delayed(Duration(seconds: 1),
                                              () {
                                            showDialog(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return AlertDialog(
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  title: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      const Text(
                                                        'Login Validation',
                                                        style: TextStyle(
                                                            color:
                                                                Colors.black),
                                                      ),
                                                      InkWell(
                                                          onTap: () {
                                                            Navigator.of(
                                                                    context)
                                                                .pop();
                                                          },
                                                          child: const Icon(
                                                            Icons.close,
                                                          ))
                                                    ],
                                                  ),
                                                  content: FutureBuilder(
                                                      future:
                                                          client.getUserDetails(
                                                              _userIdcontroller
                                                                  .text,
                                                              _passwordcontroller
                                                                  .text),
                                                      builder:
                                                          (context, snapshot) {
                                                        if (snapshot
                                                                .connectionState ==
                                                            ConnectionState
                                                                .waiting) {
                                                          return SizedBox(
                                                            height: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .height *
                                                                .1,
                                                            child: const Center(
                                                                child: Image(
                                                                    image: AssetImage(
                                                                        "image/ge office assistant.gif"))),
                                                          );
                                                        } else if (snapshot
                                                            .hasError) {
                                                          // return error UI COde
                                                          // print(snapshot.error);
                                                          return Text(
                                                            "Error!!${snapshot.error}",
                                                            style:
                                                                const TextStyle(
                                                                    color: Colors
                                                                        .black),
                                                          );
                                                        } else if (snapshot
                                                            .hasData) {
                                                          if (snapshot.data
                                                                      ?.messagecode ==
                                                                  "1004" ||
                                                              snapshot.data
                                                                      ?.messagecode ==
                                                                  "1003") {
                                                            return Container(
                                                              height: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .height *
                                                                  .2,
                                                              decoration: BoxDecoration(
                                                                  color: Colors
                                                                      .white,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              6)),
                                                              child: Column(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  Row(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .end,
                                                                    children: [
                                                                      InkWell(
                                                                          onTap:
                                                                              () {
                                                                            Navigator.pop(context);
                                                                          },
                                                                          child:
                                                                              const Icon(Icons.close))
                                                                    ],
                                                                  ),
                                                                  const Text(
                                                                    "User Already Loged In",
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .black),
                                                                  ),
                                                                  TextButton(
                                                                      onPressed:
                                                                          () {
                                                                        Navigator.pop(
                                                                            context);
                                                                      },
                                                                      child: const Text(
                                                                          "Ok"))
                                                                ],
                                                              ),
                                                            );
                                                          } else if (snapshot
                                                                  .data
                                                                  ?.messagecode ==
                                                              "1001") {
                                                            Future.delayed(
                                                                Duration.zero,
                                                                () {
                                                              _userIdcontroller
                                                                  .clear();
                                                              _passwordcontroller
                                                                  .clear();
                                                            });

                                                            if (Platform
                                                                .isAndroid) {
                                                              if (snapshot
                                                                      .data
                                                                      ?.userList
                                                                      ?.first
                                                                      .fcmtoken ==
                                                                  null) {
                                                                client.changefcm(
                                                                    snapshot
                                                                            .data
                                                                            ?.userList
                                                                            ?.first
                                                                            .userId
                                                                            .toString() ??
                                                                        "",
                                                                    AppConstants
                                                                        .fcmtoken);
                                                              } else if (snapshot
                                                                      .data
                                                                      ?.userList
                                                                      ?.first
                                                                      .fcmtoken !=
                                                                  AppConstants
                                                                      .fcmtoken) {
                                                                client.changefcm(
                                                                    snapshot
                                                                            .data
                                                                            ?.userList
                                                                            ?.first
                                                                            .userId
                                                                            .toString() ??
                                                                        "",
                                                                    AppConstants
                                                                        .fcmtoken);
                                                              }
                                                            }

                                                            saveLoginValue(
                                                                snapshot
                                                                    .data
                                                                    ?.userList
                                                                    ?.first
                                                                    .userId
                                                                    .toString());
                                                            saveUserName(snapshot
                                                                .data
                                                                ?.userList
                                                                ?.first
                                                                .username
                                                                .toString());
                                                            saveRoleid(snapshot
                                                                .data
                                                                ?.userList
                                                                ?.first
                                                                .roleId);
                                                            saveCategoryid(snapshot
                                                                .data
                                                                ?.userList
                                                                ?.first
                                                                .usercategory);
                                                            saveOfficeid(snapshot
                                                                    .data
                                                                    ?.userList
                                                                    ?.first
                                                                    .officeid ??
                                                                "");
                                                            if (snapshot
                                                                    .data
                                                                    ?.userList
                                                                    ?.first
                                                                    .roleId ==
                                                                2) {
                                                              if ((snapshot.data
                                                                          ?.userpantryList ??
                                                                      [])
                                                                  .isNotEmpty) {
                                                                savePantryUserId(
                                                                    snapshot
                                                                        .data
                                                                        ?.userpantryList
                                                                        ?.first
                                                                        .pantryid);
                                                                AppConstants
                                                                        .userPantryId =
                                                                    getpantryuserId();
                                                              }
                                                            }

                                                            AppConstants
                                                                    .username =
                                                                getValue();
                                                            AppConstants
                                                                    .roleId =
                                                                getroleid();
                                                            AppConstants
                                                                    .officeId =
                                                                getofficeid();
                                                            AppConstants.name =
                                                                getUserName();
                                                            AppConstants
                                                                    .usercategoryId =
                                                                getCategoryid();

                                                            if (snapshot
                                                                    .data
                                                                    ?.userList
                                                                    ?.first
                                                                    .roleId ==
                                                                2) {
                                                              snapshot
                                                                          .data
                                                                          ?.userList
                                                                          ?.first
                                                                          .usercategory ==
                                                                      1
                                                                  ? Future.delayed(
                                                                      Duration
                                                                          .zero,
                                                                      () {
                                                                      Navigator.pushReplacement(
                                                                          context,
                                                                          MaterialPageRoute(
                                                                              builder: (context) => const PantryHomeBasePage()));
                                                                    })
                                                                  : Future.delayed(
                                                                      Duration
                                                                          .zero,
                                                                      () {
                                                                      Navigator.pop(
                                                                          context);
                                                                      alert(
                                                                          context,
                                                                          "SomeThing Went Wrong",
                                                                          "Please Contact the Administrator");
                                                                    });
                                                            } else {
                                                              Future.delayed(
                                                                  Duration.zero,
                                                                  () {
                                                                Navigator.pushReplacement(
                                                                    context,
                                                                    MaterialPageRoute(
                                                                        builder:
                                                                            (context) =>
                                                                                const EndUserSelectioBasePage()));
                                                              });
                                                            }
                                                            return Container(
                                                              color: Colors
                                                                  .transparent,
                                                            );
                                                          } else if (snapshot
                                                                  .data
                                                                  ?.messagecode ==
                                                              "1005") {
                                                            return Container(
                                                              height: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .height *
                                                                  .2,
                                                              decoration: BoxDecoration(
                                                                  color: Colors
                                                                      .white,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              6)),
                                                              child: Column(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  Row(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .end,
                                                                    children: [
                                                                      InkWell(
                                                                          onTap:
                                                                              () {
                                                                            Navigator.pop(context);
                                                                          },
                                                                          child:
                                                                              const Icon(Icons.close))
                                                                    ],
                                                                  ),
                                                                  const Text(
                                                                    "Invalid Credentails",
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .black),
                                                                  ),
                                                                  TextButton(
                                                                      onPressed:
                                                                          () {
                                                                        Navigator.pop(
                                                                            context);
                                                                      },
                                                                      child: const Text(
                                                                          "Ok"))
                                                                ],
                                                              ),
                                                            );
                                                          } else if (snapshot
                                                                  .data
                                                                  ?.messagecode ==
                                                              "1002") {
                                                            return Container(
                                                              height: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .height *
                                                                  .2,
                                                              decoration: BoxDecoration(
                                                                  color: Colors
                                                                      .white,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              6)),
                                                              child: Column(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  Row(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .end,
                                                                    children: [
                                                                      InkWell(
                                                                          onTap:
                                                                              () {
                                                                            Navigator.pop(context);
                                                                          },
                                                                          child:
                                                                              const Icon(Icons.close))
                                                                    ],
                                                                  ),
                                                                  const Text(
                                                                    "UserName and password is not match",
                                                                    maxLines: 3,
                                                                    style:
                                                                        TextStyle(
                                                                      color: Colors
                                                                          .black,
                                                                    ),
                                                                  ),
                                                                  TextButton(
                                                                      onPressed:
                                                                          () {
                                                                        Navigator.pop(
                                                                            context);
                                                                      },
                                                                      child: const Text(
                                                                          "Ok"))
                                                                ],
                                                              ),
                                                            );
                                                          }
                                                        }
                                                        return Container(
                                                          color: Colors
                                                              .transparent,
                                                        );
                                                      }),
                                                );
                                              },
                                            );
                                          });
                                        }
                                      },
                                      child: const AutoSizeText(
                                        "LogIn",
                                        maxLines: 1,
                                        minFontSize: 2,
                                      ))),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned.fill(
                child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Text("Version : ${_packageInfo.version} ")),
            ))
          ],
        ),
      ));
    }
  }
}

saveLoginValue(var password) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString("Login", password);
}

saveUserName(var name) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString("Name", name);
}

getUserName() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  AppConstants.name = prefs.getString("Name");
  return AppConstants.name;
}

saveRoleid(var id) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setInt("Id", id);
}

saveCategoryid(var id) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setInt("CatId", id);
}

getCategoryid() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  AppConstants.usercategoryId = prefs.getInt("CatId");
  return AppConstants.usercategoryId;
}

getValue() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  AppConstants.username = prefs.getString("Login");
  return AppConstants.username;
}

getroleid() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  AppConstants.roleId = prefs.getInt("Id");
  return AppConstants.roleId;
}

saveOfficeid(var id) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setInt("ofcId", id);
}

getofficeid() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  AppConstants.officeId = prefs.getInt("ofcId");
  return AppConstants.officeId;
}

savePantryid(var id) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setInt("panrtyId", id);
}

getPantryid() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  AppConstants.pantryId = prefs.getInt("panrtyId");
  return AppConstants.pantryId;
}

savePantryUserId(var id) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setInt("userpanrtyId", id);
}

getpantryuserId() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  AppConstants.userPantryId = prefs.getInt("userpanrtyId");
  return AppConstants.userPantryId;
}
