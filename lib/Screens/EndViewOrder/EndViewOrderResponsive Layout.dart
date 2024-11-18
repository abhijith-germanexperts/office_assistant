import 'package:flutter/material.dart';

import '../../Constants/daimentions.dart';


class EndViewOrderResponsive extends StatelessWidget {

  EndViewOrderResponsive({required this.viewordermobileBody, required this.vieworderdesktopBody});

  final Widget viewordermobileBody;
  final Widget vieworderdesktopBody;


  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context,constrains){
      if(constrains.maxWidth < mobileWidth){
        return viewordermobileBody;
      }else{
        return vieworderdesktopBody;
      }
    });
  }
}

