import 'package:flutter/material.dart';
import 'package:ge_assistant/Screens/EndUser_RecentOrders/Desktop_RecentOrders.dart';
import 'package:ge_assistant/Screens/EndUser_RecentOrders/Mobile_RecentOrders.dart';
import 'package:ge_assistant/Screens/EndUser_RecentOrders/ResponsiveLayout_RecentOrders.dart';
class BaseRecentOrder extends StatelessWidget {
  const BaseRecentOrder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ResponsiveLayoutRecentOrders(recentOrderMobileBody: const MobileRecentOrder(), recentOrderDesktopBody: const DesktopRecentOrder()),
    );
  }
}
