import 'dart:io';

import 'package:flutter/material.dart';
import 'package:ge_assistant/Constants/appconst.dart';
import 'package:ge_assistant/Screens/splashScreen.dart';
import 'package:ge_assistant/main.dart';
import 'package:ge_assistant/utils/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Screens/PantryUser/PantryUser_Completed_Order/basepage_CompletedOrder.dart';

class PopUpMen extends StatelessWidget {
  final List<PopupMenuEntry> menuList;
  final Widget? icon;
  const PopUpMen({Key? key, required this.menuList, this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      itemBuilder: ((context) => menuList),
      icon: icon,
      onSelected: (value) {
        // if value 1 show dialog
        if (value == 1) {
          _showDialog(context);
          // if value 2 show dialog
        }
        if (value == 2) {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (Context) => const BasePantryCompletedOrder()));

          // if value 2 show dialog
        }
      },
    );
  }
}

_showDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text(
          "Logout",
          style: TextStyle(color: Colors.black),
        ),
        content: const Text(
          "You Want to Logout!",
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          MaterialButton(
            child: const Text("Yes"),
            onPressed: () async {
              Utils.logout(int.parse(AppConstants.username));
              if (Platform.isWindows) {
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                        builder: (context) => const SplashScreen()),
                    (Route<dynamic> route) => false);
              } else {
                Navigator.popUntil(context, (route) => route.isFirst);
              }

              //Restart.restartApp();
              SharedPreferences preferences =
                  await SharedPreferences.getInstance();
              await preferences.clear();

              //Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
