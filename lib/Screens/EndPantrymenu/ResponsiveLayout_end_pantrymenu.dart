import 'package:flutter/material.dart';

import '../../Constants/daimentions.dart';

 class ResponsiveLayoutEndPantryMenu extends StatelessWidget {
   ResponsiveLayoutEndPantryMenu(
       {required this.UserPantryMenuMobileBody,required this.UserPantryMenuDesktopBody});

  final Widget UserPantryMenuMobileBody;
   final Widget UserPantryMenuDesktopBody;
   @override
   Widget build(BuildContext context) {
     return LayoutBuilder(builder: (context,constrains){
       if(constrains.maxWidth < mobileWidth){
         return UserPantryMenuMobileBody;
       }else{
         return UserPantryMenuDesktopBody;
       }
     });
   }
 }
