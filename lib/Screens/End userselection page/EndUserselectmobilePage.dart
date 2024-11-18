import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../EndPantrymenu/Basepage_end_pantrymenu.dart';
import '../EndUserDirectory/EndUserDirectory  BasePage.dart';
import 'EmdUserSelectionDesktop.dart';

import '../EndUserDirectory/EndUserDirectory  BasePage.dart';

class EndUserSElectionMobile extends StatefulWidget {
  const EndUserSElectionMobile({Key? key}) : super(key: key);

  @override
  State<EndUserSElectionMobile> createState() => _EndUserSElectionMobileState();
}

var myOptionGroup = AutoSizeGroup();

class _EndUserSElectionMobileState extends State<EndUserSElectionMobile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Positioned.fill(
              child: FractionallySizedBox(
                alignment: Alignment.topCenter,
                heightFactor: 0.5,
                child: Image.asset(
                  "image/end user selection screen pantry.jpg",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned.fill(
              child: ClipPath(
                // clipper: SlantedImageClipper(),
                child: FractionallySizedBox(
                  alignment: Alignment.bottomCenter,
                  heightFactor: 0.5,
                  child: Image.asset(
                    "image/end user selection screen directory.jpg",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                        width: MediaQuery.of(context).size.width * 0.5,
                        height: MediaQuery.of(context).size.height * 0.1,
                        // color: Colors.red,
                        child: Image(
                            image: AssetImage(
                                "image/GE office assistant white.png"))),
                    Padding(
                      padding: EdgeInsets.only(
                          right: MediaQuery.of(context).size.width * 0.03),
                      child: Icon(
                        Icons.menu,
                        color: Colors.white,
                        size: MediaQuery.of(context).size.shortestSide * 0.05,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  width: double.maxFinite,
                  // color: Colors.cyanAccent,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        // color: Colors.green,
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        EndUserPantrymenuBasePage()));
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 1.0,
                                  height:
                                      MediaQuery.of(context).size.height * 0.1,
                                  child: Align(
                                    alignment: Alignment.bottomCenter,
                                    child: AutoSizeText(
                                      "Pantry",
                                      group: myOptionGroup,
                                      minFontSize: 2,
                                      maxLines: 1,
                                      style: GoogleFonts.inriaSerif(
                                          textStyle: TextStyle(
                                              color: Colors.white,
                                              fontSize: 90,
                                              fontWeight: FontWeight.bold)),
                                    ),
                                  )),
                              SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 1.0,
                                  height:
                                      MediaQuery.of(context).size.height * .2,
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Align(
                                      alignment: Alignment.topCenter,
                                      child: AutoSizeText(
                                        "Service",
                                        group: myOptionGroup,
                                        minFontSize: 2,
                                        maxLines: 1,
                                        style: GoogleFonts.inriaSerif(
                                            textStyle: TextStyle(
                                          color: Colors.white,
                                          fontSize: 90,
                                        )),
                                      ),
                                    ),
                                  )),
                            ],
                          ),
                        ),
                      ),
                      // SizedBox(width: 1,),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      UserDirectoryBasePage()));
                        },
                        child: Container(
                          // color: Colors.yellow,
                          child: Column(
                            children: [
                              SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.4,
                                  height:
                                      MediaQuery.of(context).size.height * 0.2,
                                  child: Align(
                                    alignment: Alignment.bottomCenter,
                                    child: AutoSizeText(
                                      "Directory",
                                      group: myOptionGroup,
                                      minFontSize: 2,
                                      maxLines: 1,
                                      style: GoogleFonts.inriaSerif(
                                          textStyle: TextStyle(
                                              color: Colors.white,
                                              fontSize: 90,
                                              fontWeight: FontWeight.bold)),
                                    ),
                                  )),
                              SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.4,
                                  height:
                                      MediaQuery.of(context).size.height * 0.1,
                                  child: Align(
                                    alignment: Alignment.topCenter,
                                    child: AutoSizeText(
                                      "Service",
                                      group: myOptionGroup,
                                      minFontSize: 2,
                                      maxLines: 1,
                                      style: GoogleFonts.inriaSerif(
                                          textStyle: TextStyle(
                                        color: Colors.white,
                                        fontSize: 90,
                                      )),
                                    ),
                                  )),
                            ],
                          ),
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
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.5,
                  height: MediaQuery.of(context).size.height * 0.1,
                  child: Align(
                    alignment: Alignment.center,
                    child: AutoSizeText(
                      "Copyright 2023 © German Experts. All Rights Reserved",
                      style: GoogleFonts.inter(
                        textStyle: TextStyle(color: Color(0xffFFFFFF)),
                      ),
                      maxLines: 1,
                      minFontSize: 2,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
