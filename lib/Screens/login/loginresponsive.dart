import 'package:flutter/material.dart';
import '../../Constants/daimentions.dart';

class LoginResponsiveLayout extends StatelessWidget {
  const LoginResponsiveLayout(
      {super.key,
      required this.loginmobileBody,
      required this.logindesktopBody});
  final Widget loginmobileBody;
  final Widget logindesktopBody;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constrains) {
      if (constrains.maxWidth < mobileWidth) {
        return loginmobileBody;
      } else {
        return logindesktopBody;
      }
    });
  }
}
