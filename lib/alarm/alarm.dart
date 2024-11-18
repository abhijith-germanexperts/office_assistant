import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:permission_handler/permission_handler.dart';
AudioPlayer audioPlayer = AudioPlayer();
class AlarmApp extends StatefulWidget {
  const AlarmApp({super.key});

  @override
  _AlarmAppState createState() => _AlarmAppState();
}

class _AlarmAppState extends State<AlarmApp> {

  bool isAlarmRinging = false;
  String? mtoken="";
  bool _firebaseInitialized = false;

  @override
  void initState() {
    super.initState();
    // initializeFirebase();
    requestPermission();
    // getTocken();
  }

  void playAlarm() async {
    AudioCache audioCache = AudioCache();
    setState(() {
      isAlarmRinging = true;
    });
    Timer.periodic(Duration(seconds: 5), (timer) {
      if(isAlarmRinging){
      audioPlayer.play(
        AssetSource(
          'audiolib/mixkit-classic-alarm-995.wav',
        ),
        volume: 1,
      );}
    });
  }

  void stopAlarm() async {
    await audioPlayer.stop();
    setState(() {
      isAlarmRinging = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Need Assistance'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: isAlarmRinging ? stopAlarm : playAlarm,
              child: Text(isAlarmRinging ? 'Stop Alarm' : 'Start Alarm'),
            ),
            ElevatedButton(
              onPressed: (){},
              child: Text("Generate Tocken"),
            ),
          ],
        ),
      ),
    );
  }

  // Request permission
  void requestPermission() async {
    FirebaseMessaging messaging= FirebaseMessaging.instance;
    NotificationSettings settings= await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );
  }
  void getTocken()async{
    await FirebaseMessaging.instance.getToken().then((token) {
      setState(() {
        mtoken=token;
        print("My Tocken $mtoken");
      });
    });
  }

  Future<void> initializeFirebase() async {
    try {
      // Initialize Firebase
      await Firebase.initializeApp();
      setState(() {
        _firebaseInitialized = true;
      });
    } catch (e) {
      setState(() {
        _firebaseInitialized = false;
      });
      print('Firebase initialization error: $e');
    }
  }
}


