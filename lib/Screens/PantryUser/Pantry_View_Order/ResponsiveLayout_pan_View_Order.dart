import 'package:flutter/material.dart';

import '../../../Constants/daimentions.dart';

class ResponsiveLayoutPantryViewOrder extends StatelessWidget {
  const ResponsiveLayoutPantryViewOrder(
      {super.key, required this.pantryViewOrderMobileBody,required this.pantryViewOrderDesktopBody});
  final Widget pantryViewOrderMobileBody;
  final Widget pantryViewOrderDesktopBody;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context,constrains){
      if(constrains.maxWidth < mobileWidth){
        return pantryViewOrderMobileBody;
      }else{
        return pantryViewOrderDesktopBody;
      }
    });
  }
}
