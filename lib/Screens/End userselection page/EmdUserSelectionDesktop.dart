import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:ge_assistant/Constants/appconst.dart';
import 'package:ge_assistant/Constants/popupmenu.dart';
import 'package:ge_assistant/Screens/EndUserDirectory/EndUserDirectory%20%20BasePage.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../NEWPAGE.dart';
import '../EndPantrymenu/Basepage_end_pantrymenu.dart';
import '../EndUserDirectory/EndUserDirectory Desktop.dart';

class EndUserSelectDesk extends StatefulWidget {
  const EndUserSelectDesk({Key? key}) : super(key: key);

  @override
  State<EndUserSelectDesk> createState() => _EndUserSelectDeskState();
}

class _EndUserSelectDeskState extends State<EndUserSelectDesk> {
  var myOptionGroup = AutoSizeGroup();
  @override
  Widget build(BuildContext context) {
    print(AppConstants.officeId);
    print("${AppConstants.usercategoryId} categoryID");
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: ClipPath(
              clipper: HorizontalSplitClipper(),
              child: FractionallySizedBox(
                alignment: Alignment.centerRight,
                widthFactor: 0.5,
                child: Image.asset(
                  "image/end user selection screen directory.jpg",
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Positioned.fill(
            child: ClipPath(
              clipper: SlantedImageClipper(),
              child: FractionallySizedBox(
                alignment: Alignment.centerLeft,
                widthFactor: 0.6,
                child: Image.asset(
                  "image/end user selection screen pantry.jpg",
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                        width: MediaQuery.of(context).size.width * 0.4,
                        height: MediaQuery.of(context).size.height * 0.1,
                        // color: Colors.red,
                        child: const Image(
                            image: AssetImage(
                                "image/GE office assistant white.png"))),
                    Padding(
                      padding: EdgeInsets.only(
                          right: MediaQuery.of(context).size.width * 0.03),
                      child: PopUpMen(
                        menuList: [
                          PopupMenuItem(
                              child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Hello ${AppConstants.name}".toUpperCase(),
                                    style: const TextStyle(color: Colors.black),
                                  ),
                                  const Icon(Icons.close)
                                ],
                              ),
                              // Row(
                              //   children: [
                              //     Text(
                              //       AppConstants.username.toString(),
                              //       style: TextStyle(color: Colors.black),
                              //     ),
                              //   ],
                              // )
                            ],
                          )),
                          const PopupMenuItem(
                            value: 1,
                            child: ListTile(
                              leading: Icon(
                                Icons.logout,
                              ),
                              title: Text("LogOut",
                                  style: TextStyle(color: Colors.black)),
                            ),
                          ),
                        ],
                        icon: const Icon(
                          Icons.menu,
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                ),
                InkWell(
                  onTap: () {
                    // print(AppConstants.pantryId);
                    AppConstants.pantryId != null
                        ? AppConstants.usercategoryId == 1 ||
                                AppConstants.usercategoryId == 2
                            ? Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const EndUserPantrymenuBasePage()))
                            : alert(context, "User Restricted",
                                "Please Contact Administrator")
                        : alert(context, "User Restricted",
                            "Please Contact Administrator");
                  },
                  child: Row(
                    children: [
                      Column(
                        children: [
                          SizedBox(
                              width: MediaQuery.of(context).size.width * 0.6,
                              height: MediaQuery.of(context).size.height * 0.1,
                              child: Align(
                                alignment: Alignment.center,
                                child: AutoSizeText(
                                  "Pantry",
                                  group: myOptionGroup,
                                  minFontSize: 2,
                                  maxLines: 1,
                                  style: GoogleFonts.inriaSerif(
                                      textStyle: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 90,
                                          fontWeight: FontWeight.bold)),
                                ),
                              )),
                          SizedBox(
                              width: MediaQuery.of(context).size.width * 0.6,
                              height: MediaQuery.of(context).size.height * 0.1,
                              child: Align(
                                alignment: Alignment.center,
                                child: Align(
                                  alignment: Alignment.center,
                                  child: AutoSizeText(
                                    "Service",
                                    group: myOptionGroup,
                                    minFontSize: 2,
                                    maxLines: 1,
                                    style: GoogleFonts.inriaSerif(
                                        textStyle: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 90,
                                    )),
                                  ),
                                ),
                              )),
                        ],
                      ),
                      // SizedBox(width: 1,),
                      InkWell(
                        onTap: () {
                          AppConstants.usercategoryId != 2
                              ? Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const UserDirectoryBasePage()))
                              : alert(context, "User Restricted",
                                  "Please Contact Administrator");
                        },
                        child: Column(
                          children: [
                            SizedBox(
                                width: MediaQuery.of(context).size.width * 0.4,
                                height:
                                    MediaQuery.of(context).size.height * 0.1,
                                child: Align(
                                  alignment: Alignment.center,
                                  child: AutoSizeText(
                                    "Directory",
                                    group: myOptionGroup,
                                    minFontSize: 2,
                                    maxLines: 1,
                                    style: GoogleFonts.inriaSerif(
                                        textStyle: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 90,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                )),
                            SizedBox(
                                width: MediaQuery.of(context).size.width * 0.4,
                                height:
                                    MediaQuery.of(context).size.height * 0.1,
                                child: Align(
                                  alignment: Alignment.center,
                                  child: AutoSizeText(
                                    "Service",
                                    group: myOptionGroup,
                                    minFontSize: 2,
                                    maxLines: 1,
                                    style: GoogleFonts.inriaSerif(
                                        textStyle: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 90,
                                    )),
                                  ),
                                )),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                // Container(
                //   width: MediaQuery.of(context).size.width * 1,
                //   // height: MediaQuery.of(context).size.height * 0.5,
                //   color: Colors.green,
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //     children: [
                //       Container(
                //         // color: Colors.yellow,
                //         width: MediaQuery.of(context).size.width * 0.55,
                //         height: MediaQuery.of(context).size.height * 0.3,
                //         child: Column(
                //           mainAxisAlignment: MainAxisAlignment.center,
                //           children: [
                //             AutoSizeText(
                //               "Pantry",
                //               group: myOptionGroup,
                //               minFontSize: 2,
                //               maxLines: 1,
                //               style: GoogleFonts.inriaSerif(
                //                   textStyle: TextStyle(
                //                       color: Colors.white,
                //                       fontSize: 90,
                //                       fontWeight: FontWeight.bold)),
                //             ),
                //             SizedBox(
                //               width: MediaQuery.of(context).size.width * 0.55,
                //               height: MediaQuery.of(context).size.height * 1.6,
                //               child: AutoSizeText(
                //                 "Service",
                //                 group: myOptionGroup,
                //                 minFontSize: 2,
                //                 maxLines: 1,
                //                 style: GoogleFonts.inriaSerif(
                //                     textStyle: TextStyle(
                //                   color: Colors.white,
                //                   fontSize: 90,
                //                 )),
                //               ),
                //             ),
                //           ],
                //         ),
                //       ),
                //       Container(
                //         // color: Colors.teal,
                //         width: MediaQuery.of(context).size.width * 0.45,
                //         height:MediaQuery.of(context).size.height * 0.3,
                //         child: Column(
                //           mainAxisAlignment: MainAxisAlignment.center,
                //           children: [
                //             AutoSizeText(
                //               "Directory",
                //               group: myOptionGroup,
                //               minFontSize: 2,
                //               maxLines: 1,
                //               style: GoogleFonts.inriaSerif(
                //                   textStyle: TextStyle(
                //                       color: Colors.white,
                //                       fontSize: 90,
                //                       fontWeight: FontWeight.bold)),
                //             ),
                //             AutoSizeText(
                //               "Service",
                //               group: myOptionGroup,
                //               minFontSize: 2,
                //               maxLines: 1,
                //               style: GoogleFonts.inriaSerif(
                //                   textStyle: TextStyle(
                //                 color: Colors.white,
                //                 fontSize: 90,
                //               )),
                //             ),
                //           ],
                //         ),
                //       )
                //     ],
                //   ),
                // ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.5,
                    height: MediaQuery.of(context).size.height * 0.1,
                    child: Align(
                      alignment: Alignment.center,
                      child: AutoSizeText(
                        "Copyright 2023 © German Experts. All Rights Reserved",
                        style: GoogleFonts.inter(
                          textStyle: const TextStyle(color: Color(0xffFFFFFF)),
                        ),
                        maxLines: 1,
                        minFontSize: 2,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SlantedImageClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double width = size.width;
    double height = size.height;
    Path path = Path();

    // top left point
    path.lineTo(0, 0);

    // top right point
    path.lineTo(width * 0.5, 0);

    // bottom right point
    path.lineTo(width, height * 8);

    // bottom left point
    path.lineTo(width, height);
    // go back to -> top left point
    path.lineTo(0, height);

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}

// class SlantedImageClipper extends CustomClipper<Path> {
//   final double slope;
//
//   SlantedImageClipper({this.slope = 17});
//
//   @override
//   Path getClip(Size size) {
//     final path = Path();
//     path.lineTo(size.width * slope, 0);
//     path.lineTo(size.width, size.height);
//     path.lineTo(0, size.height);
//     path.close();
//     return path;
//   }
//
//   @override
//   bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
//     return false;
//   }
// }

class HorizontalSplitClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double width = size.width;
    double height = size.height;
    Path path = Path();

    // top left point
    path.lineTo(0, 0);
    // top right point
    path.lineTo(width, 0);

    // bottom right point
    path.lineTo(width, height);

    // bottom left point
    path.lineTo(0, height);
    // go back to -> top left point
    path.lineTo(0, 0);

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}

alert(BuildContext context, String title, String caption) {
  showDialog(
    context: context,
    builder: (ctx) => AlertDialog(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: const TextStyle(color: Colors.black)),
          InkWell(
              onTap: () {
                Navigator.of(ctx).pop();
              },
              child: Icon(Icons.close))
        ],
      ),
      content: Text(caption, style: const TextStyle(color: Colors.black)),
    ),
  );
}
