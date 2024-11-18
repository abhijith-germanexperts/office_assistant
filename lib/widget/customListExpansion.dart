import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:ge_assistant/widget/customshadow.dart';
import 'package:google_fonts/google_fonts.dart';

Widget customListExpanded(BuildContext context, index) {
  double height = MediaQuery.of(context).size.height;
  double width = MediaQuery.of(context).size.width;
  var listgroup = AutoSizeGroup();
  var isexpanded = false;
  return StatefulBuilder(
      builder: (BuildContext context, void Function(void Function()) setState) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black,
        //borderRadius: BorderRadius.circular(50),
        boxShadow: isexpanded
            ? [
                const BoxShadow(
                  color: Colors.black,
                  offset: Offset(4, 4),
                  blurRadius: 3,
                  spreadRadius: 1,
                ),
                const BoxShadow(
                  color: Colors.white, // color of the shadow
                  offset: Offset(-4, -4),
                  blurRadius: 3,
                  spreadRadius: 1, // how far the color effect spreads.
                ),
              ]
            : null,

     // when the elevation is disabled, we won't create any effect and keep the container as it is.
      ),
      child: Theme(
        data: ThemeData().copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          shape: Border.all(color: Colors.transparent),
          // onExpansionChanged: (value) {

          // },
          trailing: Icon(
            isexpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
            color: Colors.white, // Specify the icon for the collapsed state
          ),
          // trailing: Icon(
          //   _items[index]["isExpanded"] ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
          // ),

          title: Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                    child: AutoSizeText(
                  "Item $index",
                  style: GoogleFonts.inriaSerif(
                      fontWeight: FontWeight.bold,
                      fontSize: 96,
                      color: Colors.white),
                  maxLines: 1,
                  minFontSize: 4,
                  group: listgroup,
                )),
                const Spacer(),
                Expanded(
                    child: MediaQuery.of(context).size.width > 1000
                        ? AutoSizeText(
                            "Abu Dhabi $index",
                            style: GoogleFonts.inriaSerif(
                                fontWeight: FontWeight.bold,
                                fontSize: 96,
                                color: Colors.white),
                            maxLines: 1,
                            minFontSize: 4,
                            group: listgroup,
                          )
                        : AutoSizeText(
                            "AUH $index",
                            style: GoogleFonts.inriaSerif(
                                fontWeight: FontWeight.bold,
                                fontSize: 96,
                                color: Colors.white),
                            maxLines: 1,
                            minFontSize: 4,
                            group: listgroup,
                          )),
                const Spacer(),
                Expanded(
                    child: AutoSizeText(
                  "IT $index",
                  style: GoogleFonts.inriaSerif(
                      fontWeight: FontWeight.bold,
                      fontSize: 96,
                      color: Colors.white),
                  maxLines: 1,
                  minFontSize: 4,
                  group: listgroup,
                )),
                const Spacer(),
                Expanded(
                    child: AutoSizeText(
                  "777 $index",
                  style: GoogleFonts.inriaSerif(
                      fontWeight: FontWeight.bold,
                      fontSize: 96,
                      color: Colors.white),
                  maxLines: 1,
                  minFontSize: 4,
                  group: listgroup,
                )),
                const Spacer(),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                          child: CircleAvatar(
                        radius: MediaQuery.of(context).size.width * 0.004,
                        backgroundColor: Colors.green,
                      )),
                      // Expanded(child: Icon(Icons.round,color: Colors.red,size: MediaQuery.of(context).size.width*0.009,)),
                      Expanded(
                          child: MediaQuery.of(context).size.width > 1000
                              ? AutoSizeText(
                                  "online",
                                  style: GoogleFonts.inriaSerif(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 96,
                                      color: Colors.white),
                                  maxLines: 1,
                                  minFontSize: 4,
                                  group: listgroup,
                                )
                              : AutoSizeText(
                                  "on",
                                  style: const TextStyle(color: Colors.white),
                                  maxLines: 1,
                                  minFontSize: 4,
                                  group: listgroup,
                                ))
                    ],
                  ),
                )
              ],
            ),
          ),
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
          children: [
            Container(
              decoration: BoxDecoration(
                  color:
                      index % 2 == 0 ? const Color(0xff5A5858) : Colors.white,
                  // color: index%2==0? Color(0xff5A5858) : Color(0xff424242),
                  boxShadow: const [
                    BoxShadow(
                        blurRadius: 30.0,
                        offset: Offset(2, 2),
                        color: Color(0XFFA7A9AF)),
                    BoxShadow(
                      blurRadius: 30.0,
                      offset: Offset(-2, -2),
                      color: Color(0XFFA7A9AF),
                      // inset:
                    ),
                  ]),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AutoSizeText(
                            "Name:",
                            style: GoogleFonts.inriaSerif(
                                fontWeight: FontWeight.bold,
                                fontSize: 96,
                                color: Colors.white),
                            maxLines: 1,
                            minFontSize: 4,
                            group: listgroup,
                          ),
                          AutoSizeText(
                            "Branch:",
                            style: GoogleFonts.inriaSerif(
                                fontWeight: FontWeight.bold,
                                fontSize: 96,
                                color: Colors.white),
                            maxLines: 1,
                            minFontSize: 4,
                            group: listgroup,
                          ),
                          AutoSizeText(
                            "Department:",
                            style: GoogleFonts.inriaSerif(
                                fontWeight: FontWeight.bold,
                                fontSize: 96,
                                color: Colors.white),
                            maxLines: 1,
                            minFontSize: 4,
                            group: listgroup,
                          ),
                          AutoSizeText(
                            "Building number:",
                            style: GoogleFonts.inriaSerif(
                                fontWeight: FontWeight.bold,
                                fontSize: 96,
                                color: Colors.white),
                            maxLines: 1,
                            minFontSize: 4,
                            group: listgroup,
                          ),
                          AutoSizeText(
                            "Office room:",
                            style: GoogleFonts.inriaSerif(
                                fontWeight: FontWeight.bold,
                                fontSize: 96,
                                color: Colors.white),
                            maxLines: 1,
                            minFontSize: 4,
                            group: listgroup,
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AutoSizeText(
                            "John Doe",
                            style: GoogleFonts.inriaSerif(
                                fontWeight: FontWeight.bold,
                                fontSize: 96,
                                color: Colors.white),
                            maxLines: 1,
                            minFontSize: 4,
                            group: listgroup,
                          ),
                          AutoSizeText(
                            "Abu Dhabi",
                            style: GoogleFonts.inriaSerif(
                                fontWeight: FontWeight.bold,
                                fontSize: 96,
                                color: Colors.white),
                            maxLines: 1,
                            minFontSize: 4,
                            group: listgroup,
                          ),
                          AutoSizeText(
                            "IT",
                            style: GoogleFonts.inriaSerif(
                                fontWeight: FontWeight.bold,
                                fontSize: 96,
                                color: Colors.white),
                            maxLines: 1,
                            minFontSize: 4,
                            group: listgroup,
                          ),
                          AutoSizeText(
                            "22",
                            style: GoogleFonts.inriaSerif(
                                fontWeight: FontWeight.bold,
                                fontSize: 96,
                                color: Colors.white),
                            maxLines: 1,
                            minFontSize: 4,
                            group: listgroup,
                          ),
                          AutoSizeText(
                            "123",
                            style: GoogleFonts.inriaSerif(
                                fontWeight: FontWeight.bold,
                                fontSize: 96,
                                color: Colors.white),
                            maxLines: 1,
                            minFontSize: 4,
                            group: listgroup,
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          AutoSizeText(
                            "Status:",
                            style: GoogleFonts.inriaSerif(
                                fontWeight: FontWeight.bold,
                                fontSize: 96,
                                color: Colors.white),
                            maxLines: 1,
                            minFontSize: 4,
                            group: listgroup,
                          ),
                          AutoSizeText(
                            "Extension:",
                            style: GoogleFonts.inriaSerif(
                                fontWeight: FontWeight.bold,
                                fontSize: 96,
                                color: Colors.white),
                            maxLines: 1,
                            minFontSize: 4,
                            group: listgroup,
                          ),
                          AutoSizeText(
                            "Phone: ",
                            style: GoogleFonts.inriaSerif(
                                fontWeight: FontWeight.bold,
                                fontSize: 96,
                                color: Colors.white),
                            maxLines: 1,
                            minFontSize: 4,
                            group: listgroup,
                          ),
                          AutoSizeText(
                            "Email:",
                            style: GoogleFonts.inriaSerif(
                                fontWeight: FontWeight.bold,
                                fontSize: 96,
                                color: Colors.white),
                            maxLines: 1,
                            minFontSize: 4,
                            group: listgroup,
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          AutoSizeText(
                            "John Doe",
                            style: GoogleFonts.inriaSerif(
                                fontWeight: FontWeight.bold,
                                fontSize: 96,
                                color: Colors.white),
                            maxLines: 1,
                            minFontSize: 4,
                            group: listgroup,
                          ),
                          AutoSizeText(
                            "Abu Dhabi",
                            style: GoogleFonts.inriaSerif(
                                fontWeight: FontWeight.bold,
                                fontSize: 96,
                                color: Colors.white),
                            maxLines: 1,
                            minFontSize: 4,
                            group: listgroup,
                          ),
                          AutoSizeText(
                            "IT",
                            style: GoogleFonts.inriaSerif(
                                fontWeight: FontWeight.bold,
                                fontSize: 96,
                                color: Colors.white),
                            maxLines: 1,
                            minFontSize: 4,
                            group: listgroup,
                          ),
                          AutoSizeText(
                            "johndoe@gmail.com",
                            style: GoogleFonts.inriaSerif(
                                fontWeight: FontWeight.bold,
                                fontSize: 96,
                                color: Colors.white),
                            maxLines: 1,
                            minFontSize: 4,
                            group: listgroup,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  });
}
