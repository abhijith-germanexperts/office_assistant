import 'package:flutter/material.dart';

import '../Constants/daimentions.dart';

class ResponsiveLayout extends StatelessWidget {
  ResponsiveLayout({required this.mobileBody, required this.desktopBody});
  final Widget mobileBody;
  final Widget desktopBody;



  @override



  Widget build(BuildContext context) {


    return LayoutBuilder(builder: (context,constrains){
      if(constrains.maxWidth < mobileWidth){
        return mobileBody;
      }else{
        return desktopBody;
      }
    });
  }
}
