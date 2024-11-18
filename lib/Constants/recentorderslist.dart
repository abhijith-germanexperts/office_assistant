import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
// color: index%2==0? const Color(0xff5A5858) : const Color(0xff424242),
Widget viewOrderCustomListExpanded(BuildContext context, index,listgroup) {
  double height = MediaQuery.of(context).size.height;
  double width = MediaQuery.of(context).size.width;
  // var listgroup = AutoSizeGroup();
  var isexpanded = false;
  return StatefulBuilder(
      builder: (BuildContext context, void Function(void Function()) setState) {
        return ClipRRect(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: isexpanded ? BoxDecoration(
                color: index%2==0? const Color(0xff5A5858) : const Color(0xff424242),
                boxShadow: [
                  BoxShadow(
                    color: Colors.white.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 4,
                    offset: Offset(0, 2), // Set the shadow offset
                  ),
                ],
              ):BoxDecoration(),
              child: ExpansionTile(
                trailing:isexpanded ? SvgPicture.asset('image/iconmonstr-angel-up-circle-thin.svg') : SvgPicture.asset('image/iconmonstr-angel-down-circle-thin.svg'),
                // trailing: Icon(
                //   isexpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                //   color: Colors.white, // Specify the icon for the collapsed state
                // ),
                title: !isexpanded? Padding(
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
                ) : Container(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AutoSizeText("Name:", style: GoogleFonts.inriaSerif(fontWeight: FontWeight.bold, fontSize: 96, color: Colors.white),maxLines: 1,minFontSize: 4,group: listgroup,),
                              AutoSizeText("Branch:", style: GoogleFonts.inriaSerif(fontWeight: FontWeight.bold, fontSize: 96, color: Colors.white),maxLines: 1,minFontSize: 4,group: listgroup,),
                              AutoSizeText("Department:", style: GoogleFonts.inriaSerif(fontWeight: FontWeight.bold, fontSize: 96, color: Colors.white),maxLines: 1,minFontSize: 4,group: listgroup,),
                              AutoSizeText("Building number:", style: GoogleFonts.inriaSerif(fontWeight: FontWeight.bold, fontSize: 96, color: Colors.white),maxLines: 1,minFontSize: 4,group: listgroup,),
                              AutoSizeText("Office room:", style: GoogleFonts.inriaSerif(fontWeight: FontWeight.bold, fontSize: 96, color: Colors.white),maxLines: 1,minFontSize: 4,group: listgroup,),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AutoSizeText("John Doe", style: GoogleFonts.inriaSerif(fontWeight: FontWeight.bold, fontSize: 96, color: Colors.white),maxLines: 1,minFontSize: 4,group: listgroup,),
                              AutoSizeText("Abu Dhabi", style: GoogleFonts.inriaSerif(fontWeight: FontWeight.bold, fontSize: 96, color: Colors.white),maxLines: 1,minFontSize: 4,group: listgroup,),
                              AutoSizeText("IT", style: GoogleFonts.inriaSerif(fontWeight: FontWeight.bold, fontSize: 96, color: Colors.white),maxLines: 1,minFontSize: 4,group: listgroup,),
                              AutoSizeText("22", style: GoogleFonts.inriaSerif(fontWeight: FontWeight.bold, fontSize: 96, color: Colors.white),maxLines: 1,minFontSize: 4,group: listgroup,),
                              AutoSizeText("123", style: GoogleFonts.inriaSerif(fontWeight: FontWeight.bold, fontSize: 96, color: Colors.white),maxLines: 1,minFontSize: 4,group: listgroup,),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              AutoSizeText("Status:", style: GoogleFonts.inriaSerif(fontWeight: FontWeight.bold, fontSize: 96, color: Colors.white),maxLines: 1,minFontSize: 4,group: listgroup,),
                              AutoSizeText("Extension:", style: GoogleFonts.inriaSerif(fontWeight: FontWeight.bold, fontSize: 96, color: Colors.white),maxLines: 1,minFontSize: 4,group: listgroup,),
                              AutoSizeText("Phone: ", style: GoogleFonts.inriaSerif(fontWeight: FontWeight.bold, fontSize: 96, color: Colors.white),maxLines: 1,minFontSize: 4,group: listgroup,),
                              AutoSizeText("Email:", style: GoogleFonts.inriaSerif(fontWeight: FontWeight.bold, fontSize: 96, color: Colors.white),maxLines: 1,minFontSize: 4,group: listgroup,),

                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(2.0),
                                    child: CircleAvatar(radius: MediaQuery.of(context).size.width*0.004,backgroundColor: Colors.green,),
                                  ),
                                  AutoSizeText("John Doe", style: GoogleFonts.inriaSerif(fontWeight: FontWeight.bold, fontSize: 96, color: Colors.white),maxLines: 1,minFontSize: 4,group: listgroup,),
                                ],
                              ),
                              AutoSizeText("Abu Dhabi", style: GoogleFonts.inriaSerif(fontWeight: FontWeight.bold, fontSize: 96, color: Colors.white),maxLines: 1,minFontSize: 4,group: listgroup,),
                              AutoSizeText("IT", style: GoogleFonts.inriaSerif(fontWeight: FontWeight.bold, fontSize: 96, color: Colors.white),maxLines: 1,minFontSize: 4,group: listgroup,),
                              AutoSizeText("johndoe@gmail.com", style: GoogleFonts.inriaSerif(fontWeight: FontWeight.bold, fontSize: 96, color: Colors.white),maxLines: 1,minFontSize: 4,group: listgroup,),
                            ],
                          ),
                        ),
                      ],
                    ),
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
              ),
            ),
          ),
        );
      });
}
