import 'package:flutter/material.dart';

import '../../Constants/daimentions.dart';

class EndUserSlctResponsiveLayout extends StatelessWidget {
  EndUserSlctResponsiveLayout({required this.selectionmobileBody, required this.selectiondesktopBody});
  final Widget selectionmobileBody;
  final Widget selectiondesktopBody;



  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context,constrains){
      if(constrains.maxWidth < mobileWidth){
        return selectionmobileBody;
      }else{
        return selectiondesktopBody;
      }
    });
  }
}
