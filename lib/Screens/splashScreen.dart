import 'dart:async';
import 'dart:io';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:ge_assistant/Screens/End%20userselection%20page/EndUserSelectionBasePage.dart';
import 'package:ge_assistant/Screens/login/LoginDesktopBody.dart';
import 'package:ge_assistant/rough.dart';
import 'package:ge_assistant/services/apiservices.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Constants/appconst.dart';
import 'PantryUser/pantryuserHomeScreen/basePagePantryHomeScreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  ApiProvider client = ApiProvider();
  //final firebaseMessaging = FirebaseMessaging.instance;

  @override
  void initState() {
    //AppConstants.username = getValue() ?? "";
    //print(AppConstants.username);
    inittimer();
    initreload();
    //initilizefirebase();
    super.initState();
  }

  initreload() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    AppConstants.username = prefs.getString("Login");
    AppConstants.roleId = prefs.getString("Id");
  }

  inittimer() {
    Timer(const Duration(seconds: 5), () {
      // print(AppConstants.roleId);
      AppConstants.username == null
          ? Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const Roughpage()))
          : AppConstants.roleId == 2
              ? Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const PantryHomeBasePage()))
              : Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const EndUserSelectioBasePage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    // print(AppConstants.username);
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('image/aaron-huber-8qYE6LGHW-c-unsplash.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // SizedBox(height: MediaQuery.of(context).size.height * 0.1 ,),
            const Spacer(),
            SizedBox(
                width: MediaQuery.of(context).size.width * 0.4,
                // height:MediaQuery.of(context).size.height * 0.2,
                child: const Image(
                    image: AssetImage("image/GE office assistant white.png"))),
            SizedBox(
                width: MediaQuery.of(context).size.width * 0.1,
                // height:MediaQuery.of(context).size.height * 0.2,
                child: const Image(
                    image: AssetImage("image/ge office assistant.gif"))),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8),
              child: SizedBox(
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
            ),
            FutureBuilder(
                future: client.getaccesToken(),
                builder: (context, ssnapshot) {
                  if (ssnapshot.hasData) {
                    savetokenValue(ssnapshot.data?.crmAccesstoken);
                    gettoken();
                    //print(ssnapshot.data?.crmAccesstoken);
                  } else if (ssnapshot.hasError) {
                    return const Center(
                      child: Text('Error'),
                    );
                  } else {
                    const SizedBox.shrink();
                  }
                  return const SizedBox.shrink();
                })
          ],
        ),
      ),
    );
  }
}

savetokenValue(var token) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString("token", token);
}

gettoken() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  AppConstants.token = prefs.getString("token");
  return AppConstants.token;
}
