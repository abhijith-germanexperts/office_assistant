
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:flutter/material.dart';

class UserDirectoryMobile extends StatefulWidget {
  const UserDirectoryMobile({Key? key}) : super(key: key);

  @override
  State<UserDirectoryMobile> createState() => _UserDirectoryMobileState();
}

class _UserDirectoryMobileState extends State<UserDirectoryMobile> {
  @override
  Widget build(BuildContext context) {

    var listgroup = AutoSizeGroup();

    final List<Map<String,dynamic>> _items = List.generate(50, (index) => {
      "id" : index,
      "title":"Item $index",
      "content" : "These is the expanded content of $index "

    });
    return Scaffold(
      body: Center(child: Text("Mobile Body")),
 );
  }
}



