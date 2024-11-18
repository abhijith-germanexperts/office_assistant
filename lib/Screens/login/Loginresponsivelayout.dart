import 'package:flutter/material.dart';

import '../../Constants/daimentions.dart';



class LoginResponsiveLayout extends StatelessWidget {
  const LoginResponsiveLayout({required this.LoginmobileBody, required this.LogindesktopBody});
  final Widget LoginmobileBody;
  final Widget LogindesktopBody;



  @override



  Widget build(BuildContext context) {


    return LayoutBuilder(builder: (context,constrains){
      if(constrains.maxWidth < mobileWidth){
        return LoginmobileBody;
      }else{
        return LogindesktopBody;
      }
    });
  }
}
