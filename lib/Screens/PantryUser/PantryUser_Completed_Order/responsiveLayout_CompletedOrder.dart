import 'package:flutter/material.dart';

import '../../../Constants/daimentions.dart';
class ResponsiveLayoutPantryCompletedOrder extends StatelessWidget {
  const ResponsiveLayoutPantryCompletedOrder(
      {super.key, required this.pantryCompletedOrderMobileBody,
      required this.pantryCompletedOrderDesktopBody});
  final Widget pantryCompletedOrderMobileBody;
  final Widget pantryCompletedOrderDesktopBody;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context,constrains){
      if(constrains.maxWidth < mobileWidth){
        return pantryCompletedOrderMobileBody;
      }else{
        return pantryCompletedOrderDesktopBody;
      }
    });
  }
}
