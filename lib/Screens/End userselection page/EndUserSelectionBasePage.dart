import 'package:flutter/material.dart';
import 'package:ge_assistant/Constants/appconst.dart';
import 'package:ge_assistant/Screens/End%20userselection%20page/EndUserSelectionResponsiveLayout.dart';
import 'package:ge_assistant/Screens/EndPantrymenu/Desktop_end_pantrymenu.dart';
import 'package:ge_assistant/Screens/login/LoginDesktopBody.dart';

import 'EmdUserSelectionDesktop.dart';
import 'EndUserselectmobilePage.dart';

class EndUserSelectioBasePage extends StatefulWidget {
  const EndUserSelectioBasePage({
    Key? key,
  }) : super(key: key);

  @override
  State<EndUserSelectioBasePage> createState() =>
      _EndUserSelectioBasePageState();
}

class _EndUserSelectioBasePageState extends State<EndUserSelectioBasePage> {
  @override
  Widget build(BuildContext context) {
    // print(AppConstants.token);
    print("${AppConstants.usercategoryId} categoryID");
    return Scaffold(
      body: FutureBuilder(
        future: client.getpPantryId(AppConstants.officeId.toString()),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            //print("${snapshot.data?.data?.first.pantryid} pantry");
            if ((snapshot.data?.data ?? []).isEmpty) {
              return EndUserSlctResponsiveLayout(
                  selectionmobileBody: const EndUserSElectionMobile(),
                  selectiondesktopBody: const EndUserSelectDesk());
            } else {
              savePantryid(snapshot.data?.data?.first.pantryid);
              AppConstants.pantryId = getPantryid();
              return EndUserSlctResponsiveLayout(
                  selectionmobileBody: const EndUserSElectionMobile(),
                  selectiondesktopBody: const EndUserSelectDesk());
            }
          } else if (snapshot.hasError) {
            return const Center(
              child: Text('Error'),
            );
          } else {
            const SizedBox.shrink();
          }
          return Container();
        },
        // child: EndUserSlctResponsiveLayout(
        //     selectionmobileBody: const EndUserSElectionMobile(),
        //     selectiondesktopBody: const EndUserSelectDesk()),
      ),
    );
  }
}
