import 'package:flutter/material.dart';

import '../../../Constants/daimentions.dart';
class ResponsiveLayoutPanInventory extends StatelessWidget {
  const ResponsiveLayoutPanInventory(
      {super.key, required this.panInventoryMobileBody,required this.panInventoryDesktopBody});

  final Widget panInventoryMobileBody;
  final Widget panInventoryDesktopBody;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context,constrains){
      if(constrains.maxWidth < mobileWidth){
        return panInventoryMobileBody;
      }else{
        return panInventoryDesktopBody;
      }
    });
  }
}
