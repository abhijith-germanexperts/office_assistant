// import 'package:flutter/material.dart';
//
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//           // This is the theme of your application.
//           //
//           // TRY THIS: Try running your application with "flutter run". You'll see
//           // the application has a purple toolbar. Then, without quitting the app,
//           // try changing the seedColor in the colorScheme below to Colors.green
//           // and then invoke "hot reload" (save your changes or press the "hot
//           // reload" button in a Flutter-supported IDE, or press "r" if you used
//           // the command line to start the app).
//           //
//           // Notice that the counter didn't reset back to zero; the application
//           // state is not lost during the reload. To reset the state, use hot
//           // restart instead.
//           //
//           // This works for code too, not just values: Most code changes can be
//           // tested with just a hot reload.
//
//           ),
//       home: const MyHomePage(title: 'Flutter Demo Home Page'),
//     );
//   }
// }
//
// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});
//
//   // This widget is the home page of your application. It is stateful, meaning
//   // that it has a State object (defined below) that contains fields that affect
//   // how it looks.
//
//   // This class is the configuration for the state. It holds the values (in this
//   // case the title) provided by the parent (in this case the App widget) and
//   // used by the build method of the State. Fields in a Widget subclass are
//   // always marked "final".
//
//   final String title;
//
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;
//
//   void _incrementCounter() {
//     setState(() {
//       // This call to setState tells the Flutter framework that something has
//       // changed in this State, which causes it to rerun the build method below
//       // so that the display can reflect the updated values. If we changed
//       // _counter without calling setState(), then the build method would not be
//       // called again, and so nothing would appear to happen.
//       _counter++;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     // This method is rerun every time setState is called, for instance as done
//     // by the _incrementCounter method above.
//     //
//     // The Flutter framework has been optimized to make rerunning build methods
//     // fast, so that you can just rebuild anything that needs updating rather
//     // than having to individually change instances of widgets.
//     return Scaffold(
//       appBar: AppBar(
//         // TRY THIS: Try changing the color here to a specific color (to
//         // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
//         // change color while the other colors stay the same.
//         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//         // Here we take the value from the MyHomePage object that was created by
//         // the App.build method, and use it to set our appbar title.
//         title: Text(widget.title),
//       ),
//       body: Center(
//         // Center is a layout widget. It takes a single child and positions it
//         // in the middle of the parent.
//         child: Column(
//           // Column is also a layout widget. It takes a list of children and
//           // arranges them vertically. By default, it sizes itself to fit its
//           // children horizontally, and tries to be as tall as its parent.
//           //
//           // Column has various properties to control how it sizes itself and
//           // how it positions its children. Here we use mainAxisAlignment to
//           // center the children vertically; the main axis here is the vertical
//           // axis because Columns are vertical (the cross axis would be
//           // horizontal).
//           //
//           // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
//           // action in the IDE, or press "p" in the console), to see the
//           // wireframe for each widget.
//
//           children: [
//             const Text('You have pushed the button this many times:'),
//             Text(
//               '$_counter',
//               style: Theme.of(context).textTheme.headlineMedium,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: const Icon(Icons.add),
//       ),
//     );
//   }
// }

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

// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   AppConstants.username = prefs.getString("Login");
//   AppConstants.roleId = prefs.getInt("Id");
//   AppConstants.officeId = prefs.getInt("ofcId");
//   AppConstants.pantryId = prefs.getInt("panrtyId");
//   AppConstants.name = prefs.getString("Name");
//   AppConstants.usercategoryId = prefs.getInt("CatId");
//   AppConstants.userPantryId = prefs.getInt("userpanrtyId");
//   //print(AppConstants.username);
//   WidgetsFlutterBinding.ensureInitialized();
//   if (Platform.isWindows) {
//     await windowManager.ensureInitialized();
//     WindowManager.instance.setMinimumSize(const Size(853, 700));
//     // WindowManager.instance.setMaximumSize(const Size(1200, 600));
//   } else if (Platform.isAndroid) {
//     await Firebase.initializeApp();
//     await FirebaseAPI().iniNotification();
//   }
//
//   audioPlayer = AudioPlayer(
//     playerId: 'my_unique_playerId',
//   );
//   runApp(const BasePage());
// }

Future<void> main() async {
  // 1. Call this ONLY ONCE at the very start
  WidgetsFlutterBinding.ensureInitialized();

  SharedPreferences prefs = await SharedPreferences.getInstance();
  AppConstants.username = prefs.getString("Login");
  AppConstants.roleId = prefs.getInt("Id");
  AppConstants.officeId = prefs.getInt("ofcId");
  AppConstants.pantryId = prefs.getInt("panrtyId");
  AppConstants.name = prefs.getString("Name");
  AppConstants.usercategoryId = prefs.getInt("CatId");
  AppConstants.userPantryId = prefs.getInt("userpanrtyId");

  // 2. Platform Specific Initialization
  if (Platform.isWindows) {
    // Windows Setup
    await windowManager.ensureInitialized();
    WindowOptions windowOptions = const WindowOptions(
      minimumSize: Size(853, 700),
      // center: true, // Optional: centers the app on start
    );

    // Use waitUntilReadyToShow to prevent flickering
    await windowManager.waitUntilReadyToShow(windowOptions, () async {
      await windowManager.show();
      await windowManager.focus();
    });
  } else {
    // Android/iOS Setup (Moved Firebase here to avoid Windows crash)
    // Using try-catch is safer in case Firebase config is missing
    try {
      await Firebase.initializeApp();
      // Ensure this line doesn't crash if imported on Windows
      await FirebaseAPI().iniNotification();
    } catch (e) {
      print("Firebase init failed: $e");
    }
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
