import 'dart:io';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:ge_assistant/Constants/appconst.dart';
import 'package:ge_assistant/provider/departmant_provider.dart';
import 'package:ge_assistant/provider/service_provider.dart';
import 'package:ge_assistant/rough.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:one_context/one_context.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:window_manager/window_manager.dart';
import 'package:firebase_core/firebase_core.dart';

import 'Screens/End userselection page/EmdUserSelectionDesktop.dart';
import 'Screens/splashScreen.dart';
import 'firebase/firebase.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  AppConstants.username = prefs.getString("Login");
  AppConstants.roleId = prefs.getInt("Id");
  AppConstants.officeId = prefs.getInt("ofcId");
  AppConstants.pantryId = prefs.getInt("panrtyId");
  AppConstants.name = prefs.getString("Name");
  AppConstants.usercategoryId = prefs.getInt("CatId");
  AppConstants.userPantryId = prefs.getInt("userpanrtyId");
  //print(AppConstants.username);
  WidgetsFlutterBinding.ensureInitialized();
  if (Platform.isWindows) {
    await windowManager.ensureInitialized();
    WindowManager.instance.setMinimumSize(const Size(853, 700));
    // WindowManager.instance.setMaximumSize(const Size(1200, 600));
  } else if (Platform.isAndroid) {
    await Firebase.initializeApp();
    await FirebaseAPI().iniNotification();
  }

  audioPlayer = AudioPlayer(
    playerId: 'my_unique_playerId',
  );
  runApp(const BasePage());
}

class BasePage extends StatelessWidget {
  const BasePage({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => CartProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => StringProvider(),
        ),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          builder: OneContext().builder,
          theme: ThemeData(
            textTheme: GoogleFonts.inriaSerifTextTheme(
              Theme.of(context).textTheme.apply(
                    bodyColor: Colors.white,
                  ),
            ),
          ),
          home: const SplashScreen()),
    );
  }
}
