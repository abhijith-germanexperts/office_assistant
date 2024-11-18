import 'dart:io';

import 'package:flutter/material.dart';
import 'package:ge_assistant/Screens/EndUserDirectory/EndUserDirectory%20Desktop.dart';
import 'package:ge_assistant/Screens/EndUserDirectory/EndUserDirectory%20Mobile.dart';
import 'package:ge_assistant/Screens/EndUserDirectory/EndUserDirectory%20ResponsiveLayout.dart';
import 'package:ge_assistant/models/directorymodel.dart';
import 'package:ge_assistant/services/apiservices.dart';

class UserDirectoryBasePage extends StatelessWidget {
  const UserDirectoryBasePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ApiProvider client = ApiProvider();

    return Scaffold(
        body: FutureBuilder<List<DirectoryModel>?>(
            future: client.getDirectoryPage(),
            builder: (context, ssnapshot) {
              if (ssnapshot.hasData) {
                print(ssnapshot.data?.length);
                return UserDirectoryResponsiveLayout(
                    UserDirectorymobileBody: UserDirectoryDesktop(
                      director: ssnapshot.data ?? [],
                    ),
                    UserDirectorydesktopBody: UserDirectoryDesktop(
                      director: ssnapshot.data ?? [],
                    ));
              } else if (ssnapshot.hasError) {
                return const Center(
                  child: Text('Error'),
                );
              } else {
                const SizedBox.shrink();
              }
              return const SizedBox.shrink();
            }));
  }
}
