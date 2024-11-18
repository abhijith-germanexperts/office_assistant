import 'package:flutter/material.dart';
import 'package:ge_assistant/Screens/EndViewOrder/EndViewOrderMobile.dart';
import 'package:ge_assistant/Screens/EndViewOrder/EndViewOrderResponsive%20Layout.dart';
import 'package:ge_assistant/Screens/EndViewOrder/endvieworderDesktop.dart';

class EndViewOrderBasePage extends StatelessWidget {
  const EndViewOrderBasePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: EndViewOrderResponsive(viewordermobileBody: EndViewOrderMobile(), vieworderdesktopBody: EndViewOrderDeskTop()),
    );
  }
}
