import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ge_assistant/models/directorymodel.dart';
import 'package:ge_assistant/services/apiservices.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/crmloginmodel.dart';

// color: index%2==0? const Color(0xff5A5858) : const Color(0xff424242),
Widget customListExpanded(
    BuildContext context, Datum directory, Future<Crmuserslogin> status) {
  double height = MediaQuery.of(context).size.height;
  double width = MediaQuery.of(context).size.width;
  var headgroup = AutoSizeGroup();
  var isexpanded = false;
  ApiProvider client = ApiProvider();

  return StatefulBuilder(
      builder: (BuildContext context, void Function(void Function()) setState) {
    return Container(
      // width: width * .7,
      margin: const EdgeInsets.all(1), // Optional margin for the inner shadow
      decoration: isexpanded
          ? const BoxDecoration(
              boxShadow: [
                BoxShadow(
                    color: Colors.black,
                    offset: Offset(1, 1),
                    blurRadius: 4,
                    spreadRadius: 0,
                    inset: true),
                BoxShadow(
                    color: Colors.grey,
                    offset: Offset(-1, -1),
                    blurRadius: 4,
                    spreadRadius: 0,
                    inset: true),
              ], //
              //
              //color: Color(0xff5A5858),// Container background color
            )
          : const BoxDecoration(),
      child: Theme(
        data: ThemeData().copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          // tilePadding: EdgeInsets.zero,
          shape: Border.all(color: Colors.transparent),
          // collapsedBackgroundColor: Colors.transparent,
          trailing: isexpanded
              ? SizedBox(
                  child: SvgPicture.asset(
                      'image/iconmonstr-angel-up-circle-thin.svg'))
              : SizedBox(
                  child: SvgPicture.asset(
                      'image/iconmonstr-angel-down-circle-thin.svg')),

          title: !isexpanded
              ? Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                          child: Text(
                        directory.employeename ?? "",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.inriaSerif(
                            fontSize: 15, color: Colors.white),
                        // maxLines: 2,
                        // group: listgroup,
                      )),
                    ),
                    Expanded(
                      child: SizedBox(
                          child: Text(
                        directory.branchName ?? "",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.inriaSerif(
                            fontSize: 15, color: Colors.white),
                        // maxLines: 1,
                        // group: listgroup,
                      )),
                    ),
                    Expanded(
                      child: SizedBox(
                          child: Text(
                        directory.departmentname ?? "",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.inriaSerif(
                            fontSize: 15, color: Colors.white),
                        // maxLines: 1,
                        // group: listgroup,
                      )),
                    ),
                    Expanded(
                      child: SizedBox(
                          child: AutoSizeText(
                        directory.extensioncode ?? "",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.inriaSerif(
                            fontSize: 15, color: Colors.white),
                        // maxLines: 2,
                        //   group: listgroup,
                      )),
                    ),
                    Expanded(
                      child: FutureBuilder(
                          future: status,
                          builder: (context, snapshot) {
                            if (!snapshot.hasData) {
                              return Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    height: height * .07,
                                    child: const Image(
                                        image: AssetImage(
                                            "image/ge office assistant.gif")),
                                  )
                                ],
                              );
                            } else if (snapshot.hasData) {
                              //        String comparisonResults = snapshot.data.records
                              // .map((object1) => (compareLists).any((element) =>
                              //         object1.crmusercode == element.sLoginName)
                              //     ? 'Online'
                              //     : 'Offline')
                              // .toList();
                              //print(snapshot.data?.message.toString() ?? "");
                              var checkValue =
                                  snapshot.data!.records!.where((oldValue) {
                                return directory.crmusercode ==
                                    (oldValue.sLoginName);
                                //  &&
                                //     shelfId == (oldValue.shelfno);
                              }).isEmpty;
                              return SizedBox(
                                  child: Text(
                                checkValue ? "Offline" : "Online",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.inriaSerif(
                                    fontSize: 15,
                                    color:
                                        checkValue ? Colors.red : Colors.green),
                                maxLines: 2,
                                //  group: listgroup,
                              ));
                            }
                            return Container();
                          }),
                    )
                  ],
                )
              : Column(
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                      child: SizedBox(
                                          child: Text(
                                    "Name:",
                                    style: GoogleFonts.inriaSerif(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                        color: Colors.white),
                                    // maxLines: 1,
                                    // minFontSize: 4,
                                    // group: headgroup,
                                  ))),
                                  Expanded(
                                      flex: 2,
                                      child: SizedBox(
                                          child: Text(
                                        directory.employeename ?? "",
                                        textAlign: TextAlign.start,
                                        style: GoogleFonts.inriaSerif(
                                            fontWeight: FontWeight.normal,
                                            fontSize: 15,
                                            color: Colors.white),
                                        // maxLines: 1,
                                        // minFontSize: 4,
                                        // group: headgroup,
                                      )))
                                ],
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                      child: SizedBox(
                                          child: Text(
                                    "Branch:",
                                    style: GoogleFonts.inriaSerif(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                        color: Colors.white),
                                    // maxLines: 1,
                                    // minFontSize: 4,
                                    // group: headgroup,
                                  ))),
                                  Expanded(
                                      flex: 2,
                                      child: SizedBox(
                                          child: Text(
                                        directory.branchName ?? "",
                                        style: GoogleFonts.inriaSerif(
                                            fontWeight: FontWeight.normal,
                                            fontSize: 15,
                                            color: Colors.white),
                                        // maxLines: 1,
                                        // minFontSize: 4,
                                        // group: headgroup,
                                      )))
                                ],
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                      child: SizedBox(
                                          child: Text(
                                    "Department:",
                                    style: GoogleFonts.inriaSerif(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                        color: Colors.white),
                                    // maxLines: 1,
                                    // minFontSize: 4,
                                    // group: headgroup,
                                  ))),
                                  Expanded(
                                      flex: 2,
                                      child: SizedBox(
                                          child: Text(
                                        directory.departmentname ?? "",
                                        style: GoogleFonts.inriaSerif(
                                            fontWeight: FontWeight.normal,
                                            fontSize: 15,
                                            color: Colors.white),
                                        // maxLines: 1,
                                        // minFontSize: 4,
                                        // group: headgroup,
                                      )))
                                ],
                              ),
                              // Row(children: [Expanded(child: SizedBox(child: AutoSizeText("Building number:", style: GoogleFonts.inriaSerif(fontWeight: FontWeight.bold, fontSize: 96, color: Colors.white),maxLines: 1,minFontSize: 4,group: listgroup,))), Expanded(child: SizedBox(child: AutoSizeText("123", style: GoogleFonts.inriaSerif(fontWeight: FontWeight.bold, fontSize: 96, color: Colors.white),maxLines: 1,minFontSize: 4,group: listgroup,)))],),
                              // Row(children: [Expanded(child: SizedBox(child: AutoSizeText("Office room:", style: GoogleFonts.inriaSerif(fontWeight: FontWeight.bold, fontSize: 96, color: Colors.white),maxLines: 1,minFontSize: 4,group: listgroup,))), Expanded(child: SizedBox(child: AutoSizeText("123", style: GoogleFonts.inriaSerif(fontWeight: FontWeight.bold, fontSize: 96, color: Colors.white),maxLines: 1,minFontSize: 4,group: listgroup,)))],),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                      child: SizedBox(
                                          child: Text(
                                    "Status:",
                                    style: GoogleFonts.inriaSerif(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                        color: Colors.white),
                                    // maxLines: 1,
                                    // minFontSize: 4,
                                    // group: headgroup,
                                  ))),
                                  Expanded(
                                    child: FutureBuilder(
                                        future: status,
                                        builder: (context, snapshot) {
                                          if (!snapshot.hasData) {
                                            return const Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                CircularProgressIndicator(),
                                              ],
                                            );
                                          } else if (snapshot.hasData) {
                                            //        String comparisonResults = snapshot.data.records
                                            // .map((object1) => (compareLists).any((element) =>
                                            //         object1.crmusercode == element.sLoginName)
                                            //     ? 'Online'
                                            //     : 'Offline')
                                            // .toList();
                                            var checkValue = snapshot
                                                .data!.records!
                                                .where((oldValue) {
                                              return directory.crmusercode ==
                                                  (oldValue.sLoginName);
                                              //  &&
                                              //     shelfId == (oldValue.shelfno);
                                            }).isEmpty;
                                            return SizedBox(
                                                child: Text(
                                              checkValue ? "Offline" : "Online",
                                              textAlign: TextAlign.center,
                                              style: GoogleFonts.inriaSerif(
                                                  fontSize: 15,
                                                  color: checkValue
                                                      ? Colors.red
                                                      : Colors.green),
                                              // maxLines: 2,
                                              // group: listgroup,
                                            ));
                                          }
                                          return Container();
                                        }),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                      child: SizedBox(
                                          child: Text(
                                    "Extension:",
                                    style: GoogleFonts.inriaSerif(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                        color: Colors.white),
                                    // maxLines: 1,
                                    // minFontSize: 4,
                                    // group: headgroup,
                                  ))),
                                  Expanded(
                                      flex: 2,
                                      child: SizedBox(
                                          child: Text(
                                        directory.extensioncode ?? "",
                                        style: GoogleFonts.inriaSerif(
                                            fontWeight: FontWeight.normal,
                                            fontSize: 15,
                                            color: Colors.white),
                                        // maxLines: 1,
                                        // minFontSize: 4,
                                        // group: headgroup,
                                      )))
                                ],
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                      child: SizedBox(
                                          child: Text(
                                    "Phone:",
                                    style: GoogleFonts.inriaSerif(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                        color: Colors.white),
                                    // maxLines: 1,
                                    // minFontSize: 4,
                                    // group: headgroup,
                                  ))),
                                  Expanded(
                                      flex: 2,
                                      child: SizedBox(
                                          child: Text(
                                        directory.phoneno.toString() ?? "",
                                        style: GoogleFonts.inriaSerif(
                                            fontWeight: FontWeight.normal,
                                            fontSize: 15,
                                            color: Colors.white),
                                        // maxLines: 1,
                                        // minFontSize: 4,
                                        // group: headgroup,
                                      )))
                                ],
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                      child: SizedBox(
                                          child: Text(
                                    "Email:",
                                    style: GoogleFonts.inriaSerif(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                        color: Colors.white),
                                    // maxLines: 1,
                                    // minFontSize: 4,
                                    // group: headgroup,
                                  ))),
                                  Expanded(
                                      flex: 2,
                                      child: SizedBox(
                                          child: Text(
                                        directory.emailid ?? "",
                                        style: GoogleFonts.inriaSerif(
                                            fontWeight: FontWeight.normal,
                                            fontSize: 15,
                                            color: Colors.white),
                                        // maxLines: 1,
                                        // minFontSize: 4,
                                        // group: headgroup,
                                      )))
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                  ],
                ),
          // Row(
          //   children: [
          //     Expanded(
          //       child: SizedBox(
          //         child: Column(
          //           crossAxisAlignment: CrossAxisAlignment.start,
          //           children: [
          //             AutoSizeText("Name:", style: GoogleFonts.inriaSerif(fontWeight: FontWeight.bold, fontSize: 96, color: Colors.white),maxLines: 1,minFontSize: 4,group: listgroup,),
          //             AutoSizeText("Branch:", style: GoogleFonts.inriaSerif(fontWeight: FontWeight.bold, fontSize: 96, color: Colors.white),maxLines: 1,minFontSize: 4,group: listgroup,),
          //             AutoSizeText("Department:", style: GoogleFonts.inriaSerif(fontWeight: FontWeight.bold, fontSize: 96, color: Colors.white),maxLines: 1,minFontSize: 4,group: listgroup,),
          //             AutoSizeText("Building number:", style: GoogleFonts.inriaSerif(fontWeight: FontWeight.bold, fontSize: 96, color: Colors.white),maxLines: 1,minFontSize: 4,group: listgroup,),
          //             AutoSizeText("Office room:", style: GoogleFonts.inriaSerif(fontWeight: FontWeight.bold, fontSize: 96, color: Colors.white),maxLines: 1,minFontSize: 4,group: listgroup,),
          //           ],
          //         ),
          //       ),
          //     ),
          //     Expanded(
          //       child: SizedBox(
          //         child: Column(
          //           crossAxisAlignment: CrossAxisAlignment.start,
          //           children: [
          //             AutoSizeText("John Doe", style: GoogleFonts.inriaSerif(fontWeight: FontWeight.bold, fontSize: 96, color: Colors.white),maxLines: 1,minFontSize: 4,group: listgroup,),
          //             AutoSizeText("Abu Dhabi", style: GoogleFonts.inriaSerif(fontWeight: FontWeight.bold, fontSize: 96, color: Colors.white),maxLines: 1,minFontSize: 4,group: listgroup,),
          //             AutoSizeText("IT", style: GoogleFonts.inriaSerif(fontWeight: FontWeight.bold, fontSize: 96, color: Colors.white),maxLines: 1,minFontSize: 4,group: listgroup,),
          //             AutoSizeText("22", style: GoogleFonts.inriaSerif(fontWeight: FontWeight.bold, fontSize: 96, color: Colors.white),maxLines: 1,minFontSize: 4,group: listgroup,),
          //             AutoSizeText("123", style: GoogleFonts.inriaSerif(fontWeight: FontWeight.bold, fontSize: 96, color: Colors.white),maxLines: 1,minFontSize: 4,group: listgroup,),
          //           ],
          //         ),
          //       ),
          //     ),
          //     Expanded(
          //       child: SizedBox(
          //         child: Column(
          //           crossAxisAlignment: CrossAxisAlignment.start,
          //           mainAxisAlignment: MainAxisAlignment.start,
          //           children: [
          //             AutoSizeText("Status:",textAlign: TextAlign.center, style: GoogleFonts.inriaSerif(fontWeight: FontWeight.bold, fontSize: 96, color: Colors.white),maxLines: 1,minFontSize: 4,group: listgroup,),
          //             AutoSizeText("Extension:", style: GoogleFonts.inriaSerif(fontWeight: FontWeight.bold, fontSize: 96, color: Colors.white),maxLines: 1,minFontSize: 4,group: listgroup,),
          //             AutoSizeText("Phone: ", style: GoogleFonts.inriaSerif(fontWeight: FontWeight.bold, fontSize: 96, color: Colors.white),maxLines: 1,minFontSize: 4,group: listgroup,),
          //             AutoSizeText("Email:", style: GoogleFonts.inriaSerif(fontWeight: FontWeight.bold, fontSize: 96, color: Colors.white),maxLines: 1,minFontSize: 4,group: listgroup,),
          //
          //           ],
          //         ),
          //       ),
          //     ),
          //     Expanded(
          //       child: SizedBox(
          //         child: Column(
          //           crossAxisAlignment: CrossAxisAlignment.start,
          //           mainAxisAlignment: MainAxisAlignment.start,
          //           children: [
          //             Row(
          //               mainAxisAlignment: MainAxisAlignment.start,
          //               children: [
          //                 Padding(
          //                   padding: const EdgeInsets.all(2.0),
          //                   child: CircleAvatar(radius: MediaQuery.of(context).size.width*0.004,backgroundColor: Colors.green,),
          //                 ),
          //                 AutoSizeText("John Doe", style: GoogleFonts.inriaSerif(fontWeight: FontWeight.bold, fontSize: 96, color: Colors.white),maxLines: 1,minFontSize: 4,group: listgroup,),
          //               ],
          //             ),
          //             AutoSizeText("Abu Dhabi", style: GoogleFonts.inriaSerif(fontWeight: FontWeight.bold, fontSize: 96, color: Colors.white),maxLines: 1,minFontSize: 4,group: listgroup,),
          //             AutoSizeText("IT", style: GoogleFonts.inriaSerif(fontWeight: FontWeight.bold, fontSize: 96, color: Colors.white),maxLines: 1,minFontSize: 4,group: listgroup,),
          //             AutoSizeText("johndoe@gmail.com", style: GoogleFonts.inriaSerif(fontWeight: FontWeight.bold, fontSize: 96, color: Colors.white),maxLines: 1,minFontSize: 4,group: listgroup,),
          //           ],
          //         ),
          //       ),
          //     ),
          //   ],
          // ),
          onExpansionChanged: (value) {
            isexpanded = value;
            setState(() {});
          },
          //   ExpansionTile(
          //   ...
          //   onExpansionChanged: (expanded) {
          // setState(() {
          // _items[index]["isExpanded"] = expanded;
          // _expandedIcon = expanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down;
          // });
          // },
          // onExpansionChanged: (isExpanded) {
          //   if (isExpanded) {
          //     setState(() {
          //       // Change the icon when the tile is expanded
          //       _expandedIcon = Icons.keyboard_arrow_up;
          //     });
          //   } else {
          //     setState(() {
          //       // Change the icon when the tile is collapsed
          //       _expandedIcon = Icons.keyboard_arrow_down;
          //     });
          //   }
          // },
        ),
      ),
    );
  });
}
