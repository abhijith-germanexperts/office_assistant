// color: index%2==0? const Color(0xff5A5858) : const Color(0xff424242),
import 'dart:ui';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:ge_assistant/Constants/appconst.dart';
import 'package:ge_assistant/models/pantryusernotification.dart';
import 'package:badges/badges.dart' as badges;
import 'package:intl/intl.dart';

import '../Screens/EndPantrymenu/Desktop_end_pantrymenu.dart';
import '../Screens/PantryUser/notification/notification.dart';

Widget customNotification(
  BuildContext context,
  Datum notification,
) {
  double height = MediaQuery.of(context).size.height;
  double width = MediaQuery.of(context).size.width;

  String convertToAgo(DateTime input) {
    Duration diff = DateTime.now().difference(input);

    if (diff.inDays >= 1) {
      return '${diff.inDays} d ago';
    } else if (diff.inHours >= 1) {
      return '${diff.inHours} hr ago';
    } else if (diff.inMinutes >= 1) {
      return '${diff.inMinutes} min ago';
    } else if (diff.inSeconds >= 1) {
      return '${diff.inSeconds} sec ago';
    } else {
      return 'just now';
    }
  }

  DateFormat inputFormat = DateFormat('yyyy-MM-dd hh:mm:ss a');
  DateTime dateTime = inputFormat.parse(notification.createdAt ?? "");

  var date = convertToAgo(dateTime);
  return Padding(
    padding: const EdgeInsets.only(bottom: 10.0),
    child: Container(
      height: height > 676
          ? MediaQuery.of(context).size.height * 0.1
          : MediaQuery.of(context).size.height * 0.1,
      decoration: BoxDecoration(
        color: notification.isreaded == false
            ? const Color(0xff3E3E3E)
            : const Color(0xff3E3E3E).withOpacity(0.5),
        borderRadius: BorderRadius.circular(10),
      ),
      // width: MediaQuery.of(context).size.width*0.05,
      child: InkWell(
        onTap: () {
          if (notification.isreaded == false) {
            Navigator.pop(context);
            showAlertDialog(
                context,
                notification.subject.toString(),
                notification.messagebody.toString(),
                notification.notificationid.toString());
          }

          // updationAlertbox(context, notification.notificationid.toString(),
          //     AppConstants.username);
        },
        child: Padding(
          padding: const EdgeInsets.all(3.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              badges.Badge(
                position: badges.BadgePosition.topEnd(top: 0, end: 0),
                showBadge: notification.isreaded == false ? true : false,
                child: Icon(
                  Icons.circle_notifications_rounded,
                  color: const Color(0XFFEFEFEF),
                  size: MediaQuery.of(context).size.shortestSide * 0.04,
                ),
              ),
              AutoSizeText(
                notification.subject.toString(),
                style: const TextStyle(color: Colors.white),
              ),
              AutoSizeText(
                date,
                style: const TextStyle(color: Colors.grey, fontSize: 8),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

showAlertDialog(BuildContext context, String subject, String messageBody,
    String notficationid) async {
  return showDialog<void>(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) {
      return BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                  2.0), // Adjust the radius as per your preference
            ),
            backgroundColor: const Color(0xff3E3E3E),
            title: SizedBox(
              height: MediaQuery.of(context).size.height * 0.2,
              width: MediaQuery.of(context).size.width * 0.3,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                        child: AutoSizeText(
                      messageBody,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                      maxFontSize: 20,
                    )),
                    const SizedBox(
                      height: 5,
                    ),
                    Expanded(
                        child: SingleChildScrollView(
                            child: AutoSizeText(
                      subject,
                      style: const TextStyle(),
                      maxFontSize: 15,
                    ))),
                    const SizedBox(
                      height: 10,
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                          updationAlertbox(context, notficationid,
                              AppConstants.username.toString());
                        },
                        style: ElevatedButton.styleFrom(
                          elevation: 4,
                          backgroundColor: const Color(0xff303030),
                          // foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                17), // Set border radius of 3
                            side: const BorderSide(
                              color: Colors.white,
                            ),
                          ),
                        ),
                        child: const Text("OK"),
                      ),
                    ),
                  ],
                ),
              ),
            )),
      );
    },
  );
}

updationAlertbox(
    BuildContext context, String notificationid, String pantryuserid) {
  return showDialog<void>(
    context: context,
    // barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return StatefulBuilder(
        builder:
            (BuildContext context, void Function(void Function()) setState) {
          return BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: AlertDialog(
              backgroundColor: Colors.transparent,
              content: SingleChildScrollView(
                  child: FutureBuilder(
                      future: client.updatePantryNotifications(
                          pantryuserid, notificationid.toString()),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return SizedBox(
                            height: MediaQuery.of(context).size.height * .1,
                            child: const Center(
                                child: Image(
                                    image: AssetImage(
                                        "image/ge office assistant.gif"))),
                          );
                        } else if (snapshot.hasError) {
                          print(snapshot.error);
                        } else if (snapshot.hasData) {
                          if (snapshot.data?.messagecode == "1001") {
                            Future.delayed(Duration.zero, () {
                              // Navigator.pop(context);
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        const Notificationpage()),
                              );
                            });
                          }
                        }
                        return SizedBox(
                          height: MediaQuery.of(context).size.height * .1,
                          child: const Center(
                              child: Image(
                                  image: AssetImage(
                                      "image/ge office assistant.gif"))),
                        );
                      })),
            ),
          );
        },
      );
    },
  );
}
