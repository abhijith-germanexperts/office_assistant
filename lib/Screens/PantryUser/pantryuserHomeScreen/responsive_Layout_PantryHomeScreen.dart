import 'package:flutter/material.dart';

import '../../../Constants/daimentions.dart';


class PantryHomeResponsiveLayout extends StatelessWidget {
  const PantryHomeResponsiveLayout(
      {super.key, required this.pantryHomeMobileBody,required this.pantryHomeDesktopBody});
  final Widget pantryHomeMobileBody;
  final Widget pantryHomeDesktopBody;



  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context,constrains){
      if(constrains.maxWidth < mobileWidth){
        return pantryHomeMobileBody;
      }else{
        return pantryHomeDesktopBody;
      }
    });
  }
}
