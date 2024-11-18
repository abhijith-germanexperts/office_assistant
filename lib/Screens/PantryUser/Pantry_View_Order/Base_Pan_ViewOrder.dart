import 'package:flutter/material.dart';
import 'package:ge_assistant/Screens/PantryUser/Pantry_View_Order/Deskop_Pan_View_Order.dart';
import 'package:ge_assistant/Screens/PantryUser/Pantry_View_Order/Mobile_Pan_View_Order.dart';
import 'package:ge_assistant/Screens/PantryUser/Pantry_View_Order/ResponsiveLayout_pan_View_Order.dart';

class BasePantryViewOrder extends StatelessWidget {
  const BasePantryViewOrder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ResponsiveLayoutPantryViewOrder(
          pantryViewOrderMobileBody: DesktopPantryViewOrder(),
          pantryViewOrderDesktopBody: DesktopPantryViewOrder()),
    );
  }
}
