import 'package:flutter/material.dart';
import 'package:ge_assistant/Screens/PantryUser/pantry_inventory/Mobile_Pan_Inventory.dart';
import 'package:ge_assistant/Screens/PantryUser/pantry_inventory/desktop_Pan_Inventory.dart';
import 'package:ge_assistant/Screens/PantryUser/pantry_inventory/responsiveLayout_Pan_inventory.dart';

class BasePanInventory extends StatelessWidget {
  const BasePanInventory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  const Scaffold(
      body: ResponsiveLayoutPanInventory(panInventoryMobileBody: MobilePanInventory(), panInventoryDesktopBody: DesktopPanInventory()),
    );
  }
}
