import 'package:flutter/material.dart';

import '../../Constants/daimentions.dart';

class ResponsiveLayoutRecentOrders extends StatelessWidget {
  const ResponsiveLayoutRecentOrders(
      {super.key, required this.recentOrderMobileBody,required this.recentOrderDesktopBody});
  final Widget recentOrderMobileBody;
  final Widget recentOrderDesktopBody;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context,constrains){
      if(constrains.maxWidth < mobileWidth){
        return recentOrderMobileBody;
      }else{
        return recentOrderDesktopBody;
      }
    });
  }
}
