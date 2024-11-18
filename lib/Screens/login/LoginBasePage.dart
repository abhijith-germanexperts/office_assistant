import 'package:flutter/material.dart';
import 'package:ge_assistant/Screens/login/LoginDesktopBody.dart';
import 'package:ge_assistant/Screens/login/Loginresponsivelayout.dart';

import 'LoginMobile body.dart';

class LoginBasePage extends StatefulWidget {
  const LoginBasePage({Key? key}) : super(key: key);

  @override
  State<LoginBasePage> createState() => _LoginBasePageState();
}

class _LoginBasePageState extends State<LoginBasePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LoginDesktopBody(),
      // body: LoginResponsiveLayout(LoginmobileBody: LoginMobileBody(), LogindesktopBody: LoginDesktopBody())
    );
  }
}
