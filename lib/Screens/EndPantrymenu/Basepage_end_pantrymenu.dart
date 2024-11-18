import 'package:flutter/material.dart';
import 'package:ge_assistant/Screens/EndPantrymenu/Desktop_end_pantrymenu.dart';
import 'package:ge_assistant/Screens/EndPantrymenu/Mobile_end_pantrymenu.dart';
import 'package:ge_assistant/Screens/EndPantrymenu/ResponsiveLayout_end_pantrymenu.dart';
import 'package:ge_assistant/provider/service_provider.dart';
import 'package:provider/provider.dart';

class EndUserPantrymenuBasePage extends StatelessWidget {
  const EndUserPantrymenuBasePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    return Scaffold(
      body: ResponsiveLayoutEndPantryMenu(
          UserPantryMenuMobileBody: const MobileEndPantryMenu(),
          UserPantryMenuDesktopBody: const DesktopEndPantryMenu()),
    );
  }
}
