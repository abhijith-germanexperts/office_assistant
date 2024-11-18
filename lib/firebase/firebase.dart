import 'dart:async';
import 'dart:convert';

import 'package:audioplayers/audioplayers.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:ge_assistant/Constants/appconst.dart';
import 'package:ge_assistant/Screens/End%20userselection%20page/EmdUserSelectionDesktop.dart';
import 'package:lottie/lottie.dart';
import 'package:one_context/one_context.dart';

AudioPlayer audioPlayer = AudioPlayer();

String? mtoken = "nothing";
bool isAlarmRinging = false;
bool isnotifyring = false;
Future<void> handleBackgroundMessage(RemoteMessage message) async {
  print("Title: ${message.notification?.title}");
  print("body: ${message.notification?.body}");
  print("payload: ${message.data}");
}

class FirebaseAPI {
  final _firebaseMessaging = FirebaseMessaging.instance;

  final _androidChannel = const AndroidNotificationChannel(
      'high_importance_channell', 'High Importance Notification',
      description: 'this channel is used for important notifivation',
      importance: Importance.defaultImportance,
      sound: RawResourceAndroidNotificationSound(
          'audiolib/mixkit-classic-alarm-995'),
      playSound: true);
  final _localNotifications = FlutterLocalNotificationsPlugin();

  Future initLocalNotification() async {
    const iOS = DarwinInitializationSettings();
    const android = AndroidInitializationSettings('@mipmap/ic_launcher');
    const settings = InitializationSettings(android: android, iOS: iOS);

    await _localNotifications.initialize(
      settings,
      // onSelectNotification: (payload) {
      //   final message = RemoteMessage.fromMap(jsonDecode(payload!));
      //   hanldl
      // }
    );
    final platform = _localNotifications.resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin>();
    await platform?.createNotificationChannel(_androidChannel);
  }

  Future initPushNotification() async {
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      sound: true,
      badge: true,
      alert: true,
    );
    // FirebaseMessaging.instance.getInitialMessage().then(handleMessage);
    // playAlarm();
    FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);
    FirebaseMessaging.onMessage.listen((message) {
      final notification = message.notification;
      if (notification == null) return;
      // _showAlertDialog(context);
      // example dialog
      if (message.notification?.title == "Need Assistance") {
        playAlarm();
        
        // =======================================alertbox
        // OneContext().showDialog(
        //     barrierDismissible: false,
        //     builder: (_) => AlertDialog(
        //           titlePadding: EdgeInsets.zero,
        //           backgroundColor: const Color(0xff303030),
        //           shape: RoundedRectangleBorder(
        //             borderRadius: BorderRadius.circular(
        //                 8.0), // Adjust the radius as per your preference
        //           ),
        //           title: SizedBox(
        //             height: OneContext().mediaQuery.size.height * 0.5,
        //             width: OneContext().mediaQuery.size.width * 0.5,
        //             child: Column(
        //               children: [
        //                 Expanded(
        //                   child: Lottie.asset('image/animation_lkihl709.json',
        //                       fit: BoxFit.cover
        //                       // width: 200,
        //                       // height: 400,
        //                       ),
        //                 ),
        //                 Expanded(
        //                   child: Column(
        //                     children: [
        //                       Text(
        //                         "${message.notification?.title}",
        //                         style: const TextStyle(
        //                             color: Colors.white,
        //                             fontWeight: FontWeight.bold),
        //                       ),
        //                       Text(
        //                         "${message.notification?.body}",
        //                         style: const TextStyle(color: Colors.white),
        //                       ),
        //                       const SizedBox(
        //                         height: 10,
        //                       ),
        //                       ElevatedButton(
        //                         onPressed: () {
        //                           stopAlarm();
        //                           OneContext().popDialog();
        //                         },
        //                         style: ElevatedButton.styleFrom(
        //                           shape: RoundedRectangleBorder(
        //                             borderRadius: BorderRadius.circular(
        //                                 8.0), // Adjust the radius as per your preference
        //                           ),
        //                         ),
        //                         child: const Text("Ok"),
        //                       )
        //                     ],
        //                   ),
        //                 ),
        //               ],
        //             ),
        //           ),
        //         ));
        OneContext().showDialog(
            barrierDismissible: false,
            builder: (_) => AlertDialog(
                titlePadding: EdgeInsets.zero,
                backgroundColor: const Color(0xff303030),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                      20.0), // Adjust the radius as per your preference
                ),
                title: SizedBox(
                  height: OneContext().mediaQuery.size.height * 0.5,
                  width: OneContext().mediaQuery.size.width * 0.5,
                  child: Column(
                    children: [
                      Expanded(
                          flex: 3,
                          child: Container(
                            decoration: const BoxDecoration(
                              color: Colors.white, // Container background color
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(
                                    20.0), // Adjust the radius to get the desired curve for the top corners
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Lottie.asset('image/animation_lkihl709.json',
                                    fit: BoxFit.cover
                                    // width: 200,
                                    // height: 400,
                                    ),
                              ],
                            ),
                          )),
                      Expanded(
                          flex: 2,
                          child: Container(
                            decoration: const BoxDecoration(
                              color: Color(
                                  0xff303030), // Container background color
                              borderRadius: BorderRadius.vertical(
                                bottom: Radius.circular(
                                    20.0), // Adjust the radius to get the desired curve for the top corners
                              ),
                            ),
                            child: Column(
                              children: [
                                const SizedBox(
                                  height: 10,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 8.0, right: 8.0),
                                  child: AutoSizeText(
                                    message.notification?.body ?? "",
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                // SizedBox(height: 10,),
                                // AutoSizeText("message.notification?.body}",style: TextStyle(color: Colors.black),),
                                // SizedBox(height: 20,),
                                const Spacer(),
                                ElevatedButton(
                                  onPressed: () {
                                    stopAlarm();
                                    OneContext().popDialog();
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
                                  child: const Text("ok"),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                              ],
                            ),
                          )),
                    ],
                  ),
                )));
      } else {
        playNotify();
        OneContext().showDialog(
            barrierDismissible: false,
            builder: (_) => AlertDialog(
                titlePadding: EdgeInsets.zero,
                backgroundColor: const Color(0xff303030),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                      20.0), // Adjust the radius as per your preference
                ),
                title: SizedBox(
                  height: OneContext().mediaQuery.size.height * 0.5,
                  width: OneContext().mediaQuery.size.width * 0.5,
                  child: Column(
                    children: [
                      Expanded(
                          flex: 3,
                          child: Container(
                            decoration: const BoxDecoration(
                              color: Colors.teal, // Container background color
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(
                                    20.0), // Adjust the radius to get the desired curve for the top corners
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Lottie.asset('image/animation_lkifggj5.json',
                                    fit: BoxFit.cover
                                    // width: 200,
                                    // height: 400,
                                    ),
                              ],
                            ),
                          )),
                      Expanded(
                          flex: 2,
                          child: Container(
                            decoration: const BoxDecoration(
                              color: Color(
                                  0xff303030), // Container background color
                              borderRadius: BorderRadius.vertical(
                                bottom: Radius.circular(
                                    20.0), // Adjust the radius to get the desired curve for the top corners
                              ),
                            ),
                            child: Column(
                              children: [
                                const SizedBox(
                                  height: 10,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 8.0, right: 8.0),
                                  child: AutoSizeText(
                                    message.notification?.body ?? "",
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                // SizedBox(height: 10,),
                                // AutoSizeText("message.notification?.body}",style: TextStyle(color: Colors.black),),
                                // SizedBox(height: 20,),
                                const Spacer(),
                                ElevatedButton(
                                  onPressed: () {
                                    OneContext().popDialog();
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
                                  child: const Text("ok"),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                              ],
                            ),
                          )),
                    ],
                  ),
                )));
      }

      // =======================alertbox
      _localNotifications.show(
        notification.hashCode,
        notification.title,
        notification.body,
        NotificationDetails(
            android: AndroidNotificationDetails(
          _androidChannel.id,
          _androidChannel.name,
          channelDescription: _androidChannel.description,
          icon: '@mipmap/ic_launcher',
        )),
        payload: jsonEncode(message.toMap()),
      );
    });
  }

  Future<void> iniNotification() async {
    await _firebaseMessaging.requestPermission();
    await FirebaseMessaging.instance.getToken().then((token) {
      mtoken = token;
      print("My Tocken $mtoken");
      AppConstants.fcmtoken = mtoken;
    });
    initPushNotification();
    initLocalNotification();
    print("hiiiii\n\n\nhoooooooo");
  }
}
// end====================================================================

void playAlarm() async {
  AudioCache audioCache = AudioCache();
  isAlarmRinging = true;

  Timer(const Duration(seconds: 10), () {
    stopAlarm();
  });

  Timer.periodic(const Duration(seconds: 5), (timer) {
    if (isAlarmRinging) {
      audioPlayer.play(
        AssetSource(
          'audiolib/mixkit-classic-alarm-995.wav',
        ),
        volume: 1,
      );
    }
  });
}

void playNotify() async {
  AudioCache audioCache = AudioCache();
  isnotifyring = true;

  if (isnotifyring) {
    audioPlayer.play(
      AssetSource(
        'audiolib/mixkit-software-interface-remove-2576.wav',
      ),
      volume: 1,
    );
  }
}

void stopAlarm() async {
  await audioPlayer.stop();
  isAlarmRinging = false;
}
