import 'package:flutter/material.dart';

import '../../Constants/daimentions.dart';


class UserDirectoryResponsiveLayout extends StatelessWidget {
  UserDirectoryResponsiveLayout(
      {required this.UserDirectorymobileBody,required this.UserDirectorydesktopBody});



  final Widget UserDirectorymobileBody;
  final Widget UserDirectorydesktopBody;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context,constrains){
      if(constrains.maxWidth < mobileWidth){
        return UserDirectorymobileBody;
      }else{
        return UserDirectorydesktopBody;
      }
    });
  }
}
