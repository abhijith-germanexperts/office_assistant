import 'package:flutter/material.dart';
import 'package:ge_assistant/Screens/PantryUser/PantryUser_Completed_Order/basepage_CompletedOrder.dart';
import 'package:ge_assistant/Screens/PantryUser/pantryuserHomeScreen/Desktop_pantryHomeScreen.dart';
import 'package:ge_assistant/Screens/PantryUser/pantryuserHomeScreen/Mobile_pantryHomePage.dart';
import 'package:ge_assistant/Screens/PantryUser/pantryuserHomeScreen/responsive_Layout_PantryHomeScreen.dart';

class PantryHomeBasePage extends StatelessWidget {
  const PantryHomeBasePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: PantryHomeResponsiveLayout(
          pantryHomeMobileBody: PantryHomeMobileScreen(),
          pantryHomeDesktopBody: PantryHomeDesktopScreen()),
    );
  }
}
