import 'dart:ui';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../services/apiservices.dart';
import '../End userselection page/EndUserSelectionBasePage.dart';
import '../PantryUser/pantryuserHomeScreen/basePagePantryHomeScreen.dart';
import 'LoginDesktopBody.dart';

class LoginMobileBody extends StatefulWidget {
  const LoginMobileBody({Key? key}) : super(key: key);

  @override
  State<LoginMobileBody> createState() => _LoginMobileBodyState();
}

class _LoginMobileBodyState extends State<LoginMobileBody> {
  ApiProvider client = ApiProvider();
  final TextEditingController _userIdcontroller = TextEditingController();
  final TextEditingController _passwordcontroller = TextEditingController();

  @override
  void initState() {
    _userIdcontroller.text = "suhaib.b";
    _passwordcontroller.text = "219";

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String UserID = _userIdcontroller.value.text;
    String password = _passwordcontroller.value.text;
    return Scaffold(
        floatingActionButton: FloatingActionButton(onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const PantryHomeBasePage()));
        }),
        body: Container(
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(),
                SizedBox(
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: MediaQuery.of(context).size.height * 0.11,
                    child: const Image(
                        image:
                            AssetImage("image/GE office assistant white.png"))),
                Container(
                  width: MediaQuery.of(context).size.width * 0.7,
                  // height: MediaQuery.of(context).size.height * 0.05,
                  child: Column(
                    children: [
                      SizedBox(
                          width: MediaQuery.of(context).size.width * 0.7,
                          height: MediaQuery.of(context).size.height * 0.05,
                          child: TextFormField(
                            controller: _userIdcontroller,
                            style: const TextStyle(color: Colors.white),
                            decoration: const InputDecoration(
                              hintText: "User ID",
                              hintStyle: TextStyle(color: Colors.white),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.white,
                                  // Set your desired border color here.
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
                          )),
                      SizedBox(
                          width: MediaQuery.of(context).size.width * 0.7,
                          height: MediaQuery.of(context).size.height * 0.05,
                          child: TextFormField(
                            controller: _passwordcontroller,
                            style: const TextStyle(color: Colors.white),
                            obscureText: isPasswordvisible,
                            decoration: InputDecoration(
                              suffixIcon: IconButton(
                                icon: isPasswordvisible
                                    ? Icon(
                                        Icons.visibility_off,
                                        size:
                                            MediaQuery.of(context).size.height *
                                                0.03,
                                        color: Colors.grey,
                                      )
                                    : const Icon(
                                        Icons.visibility,
                                        color: Colors.grey,
                                      ),
                                onPressed: () {
                                  setState(() {
                                    isPasswordvisible = !isPasswordvisible;
                                  });
                                },
                              ),
                              hintText: "Password",
                              hintStyle: const TextStyle(color: Colors.white),
                              enabledBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.white,
                                  // Set your desired border color here.
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
                          )),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.4,
                            height: MediaQuery.of(context).size.height * 0.05,
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
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const EndUserSelectioBasePage()));
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        backgroundColor: Colors.grey,
                                        title: const Text('Login Validation'),
                                        content: FutureBuilder(
                                            future: client.getUserDetails(
                                                _userIdcontroller.text,
                                                _passwordcontroller.text),
                                            builder: (context, snapshot) {
                                              if (snapshot.connectionState ==
                                                  ConnectionState.waiting) {
                                                return const Center(
                                                    child:
                                                        CircularProgressIndicator());
                                              } else if (snapshot.hasError) {
                                                // return error UI COde
                                                return Text(
                                                  "Error!!${snapshot.error}",
                                                  style: const TextStyle(
                                                      color: Colors.black),
                                                );
                                              } else if (snapshot.hasData) {
                                                if (snapshot
                                                        .data?.messagecode ==
                                                    "1004") {
                                                  if (snapshot
                                                          .data?.messagecode ==
                                                      "1004") {
                                                    return const Text(
                                                      "User Already Loged In",
                                                      style: TextStyle(
                                                          color: Colors.black),
                                                    );
                                                  }
                                                } else if (snapshot
                                                        .data?.messagecode ==
                                                    "1001") {
                                                  if (snapshot
                                                          .data
                                                          ?.userList
                                                          ?.first
                                                          .usercategory ==
                                                      1) {
                                                    return const Text(
                                                      "cat1",
                                                      style: TextStyle(
                                                          color: Colors.black),
                                                    );
                                                    // print("userid1");
                                                  } else if (snapshot
                                                          .data
                                                          ?.userList!
                                                          .first
                                                          .usercategory ==
                                                      2) {
                                                    return const Text(
                                                      "cat2",
                                                      style: TextStyle(
                                                          color: Colors.black),
                                                    );
                                                    //print("userid2");
                                                  } else if (snapshot
                                                          .data
                                                          ?.userList!
                                                          .first
                                                          .usercategory ==
                                                      3) {
                                                    return const Text(
                                                      "cat3",
                                                      style: TextStyle(
                                                          color: Colors.black),
                                                    );
                                                    //print("userid3");
                                                  } else {
                                                    // print("User not defined");
                                                  }
                                                } else {
                                                  return const Text(
                                                    "SomeTHing Wrong",
                                                    style: TextStyle(
                                                        color: Colors.black),
                                                  );
                                                }
                                              }
                                              return Container();
                                            }
                                            // child: Container(
                                            //   // width: width * .8,
                                            //   child: ListView.builder(
                                            //       itemCount: _items.length,
                                            //       itemBuilder: (_, index) {
                                            //         final item = _items[index];
                                            //         return Container(
                                            //             color: index % 2 == 0
                                            //                 ? const Color(0xff5A5858)
                                            //                 : const Color(0xff424242),
                                            //             // height: 50,
                                            //             child:
                                            //                 customListExpanded(context, index, listgroup));
                                            //       }),
                                            // ),
                                            ),
                                      );
                                    },
                                  );
                                },
                                child: const AutoSizeText(
                                  "LogIn",
                                  maxLines: 1,
                                  minFontSize: 2,
                                ))),
                      )
                    ],
                  ),
                ),
                const Spacer(),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.5,
                  height: MediaQuery.of(context).size.height * 0.1,
                  child: Align(
                    alignment: Alignment.center,
                    child: AutoSizeText(
                      "Copyright 2023 © German Experts. All Rights Reserved",
                      style: GoogleFonts.inter(
                        textStyle: const TextStyle(color: Color(0xffFFFFFF)),
                      ),
                      maxLines: 1,
                      minFontSize: 2,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
