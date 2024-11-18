import 'package:flutter/material.dart';
import 'package:ge_assistant/Responsive/desktopBody.dart';
import 'package:ge_assistant/Responsive/mobileBody.dart';
import 'package:ge_assistant/Responsive/responsive_layout.dart';
class Roughpage extends StatefulWidget {
  const Roughpage({Key? key}) : super(key: key);

  @override
  State<Roughpage> createState() => _RoughpageState();
}

class _RoughpageState extends State<Roughpage> {
  @override
  Widget build(BuildContext context) {
    final currentwidth= MediaQuery.of(context).size.width;
    return Scaffold(
      body: ResponsiveLayout(
          mobileBody: MobileOnboarding(),
          desktopBody: MyDesktopBody())
    );
  }
}
