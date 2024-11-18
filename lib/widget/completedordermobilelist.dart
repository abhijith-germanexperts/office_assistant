import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:flutter_svg/svg.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../models/canceledandcompletedOrdermodel.dart';

// color: index%2==0? const Color(0xff5A5858) : const Color(0xff424242),
Widget customCompletedOrderListExpanded(
    BuildContext context, Datum orders, listgroup) {
  double height = MediaQuery.of(context).size.height;
  double width = MediaQuery.of(context).size.width;
  var isexpanded = false;
  var itemsListGroup = AutoSizeGroup();
  DateFormat inputFormat = DateFormat('yyyy-MM-dd hh:mm:ss a');
  DateTime dateTime = inputFormat.parse(orders.createdAt ?? "");
  String formattedTime = DateFormat('h:mm a').format(dateTime);
  String formatdate = DateFormat("dd-MM-yyyy").format(dateTime);
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
          // trailing: Icon(
          //   isexpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
          //   color: Colors.white, // Specify the icon for the collapsed state
          // ),
          title: !isexpanded
              ? Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: AutoSizeText(
                        formatdate,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.inriaSerif(
                            fontSize: 20, color: Colors.white),
                        maxLines: 1,
                        minFontSize: 10,
                        group: listgroup,
                      ),
                    ),
                    Expanded(
                      child: AutoSizeText(
                        formattedTime,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.inriaSerif(
                            fontSize: 20, color: Colors.white),
                        maxLines: 1,
                        minFontSize: 10,
                        group: listgroup,
                      ),
                    ),
                    Expanded(
                      child: AutoSizeText(
                        orders.officename.toString(),
                        textAlign: TextAlign.center,
                        style: GoogleFonts.inriaSerif(
                            fontSize: 20, color: Colors.white),
                        maxLines: 2,
                        minFontSize: 10,
                        group: listgroup,
                      ),
                    ),
                    Expanded(
                      child: AutoSizeText(
                        orders.extensioncode.toString(),
                        textAlign: TextAlign.center,
                        style: GoogleFonts.inriaSerif(
                            fontSize: 20, color: Colors.white),
                        maxLines: 2,
                        minFontSize: 10,
                        group: listgroup,
                      ),
                    ),
                    Expanded(
                      child: AutoSizeText(
                        orders.statusorderid == 4 ? "Canceled" : "Completed",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.inriaSerif(
                            fontSize: 20,
                            color: orders.statusorderid == 4
                                ? const Color(0xFFE97979)
                                : const Color(0xFFE69C86D)),
                        maxLines: 1,
                        minFontSize: 10,
                        group: listgroup,
                      ),
                    ),
                  ],
                )
              : Container(
                  height: 300,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: AutoSizeText(
                              formatdate,
                              textAlign: TextAlign.center,
                              style: GoogleFonts.inriaSerif(
                                  fontSize: 20, color: Colors.white),
                              maxLines: 1,
                              group: listgroup,
                            ),
                          ),
                          Expanded(
                            child: AutoSizeText(
                              formattedTime,
                              textAlign: TextAlign.center,
                              style: GoogleFonts.inriaSerif(
                                  fontSize: 20, color: Colors.white),
                              maxLines: 1,
                              group: listgroup,
                            ),
                          ),
                          Expanded(
                            child: AutoSizeText(
                              orders.officename.toString(),
                              textAlign: TextAlign.center,
                              style: GoogleFonts.inriaSerif(
                                  fontSize: 20, color: Colors.white),
                              maxLines: 2,
                              group: listgroup,
                            ),
                          ),
                          Expanded(
                            child: AutoSizeText(
                              orders.extensioncode.toString(),
                              textAlign: TextAlign.center,
                              style: GoogleFonts.inriaSerif(
                                  fontSize: 20, color: Colors.white),
                              maxLines: 2,
                              group: listgroup,
                            ),
                          ),
                          Expanded(
                            child: AutoSizeText(
                              orders.statusorderid == 4
                                  ? "Canceled"
                                  : "Completed",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.inriaSerif(
                                  fontSize: 20,
                                  color: orders.statusorderid == 4
                                      ? const Color(0xFFE97979)
                                      : const Color(0xFFE69C86D)),
                              maxLines: 1,
                              group: listgroup,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Expanded(
                        child: Row(
                          children: [
                            Expanded(
                              // flex: width > 750 ?2 :4,
                              flex: 5,
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Expanded(
                                          child: Row(
                                        children: [
                                          SizedBox(
                                            width: 20,
                                          ),
                                          AutoSizeText(
                                            "Item name",
                                            textAlign: TextAlign.left,
                                            maxLines: 1,
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20),
                                            group: itemsListGroup,
                                            minFontSize: 8,
                                          ),
                                        ],
                                      )),
                                      Expanded(
                                          child: AutoSizeText(
                                        "Category",
                                        textAlign: TextAlign.center,
                                        maxLines: 1,
                                        style: TextStyle(color: Colors.white),
                                        group: itemsListGroup,
                                        minFontSize: 8,
                                      )),
                                      Expanded(
                                          child: AutoSizeText(
                                        "Quantity",
                                        textAlign: TextAlign.center,
                                        maxLines: 1,
                                        style: TextStyle(color: Colors.white),
                                        group: itemsListGroup,
                                        minFontSize: 8,
                                      )),
                                    ],
                                  ),
                                  Container(
                                    color: Colors.white,
                                    width: double.maxFinite,
                                    height: 1,
                                  ),
                                  Expanded(
                                    child: ListView.builder(
                                        itemCount: orders.orderdetails!.length,
                                        itemBuilder: (_, index) {
                                          return Container(
                                            height: 40,
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Expanded(
                                                    child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Row(
                                                    children: [
                                                      Image(
                                                        image: AssetImage(
                                                            "image/20002124-d-classic_collection_espresso-cup-expressod.png"),
                                                        fit: BoxFit.contain,
                                                      ),
                                                      Expanded(
                                                          child: AutoSizeText(
                                                        orders
                                                            .orderdetails![
                                                                index]
                                                            .itemname
                                                            .toString(),
                                                        style: const TextStyle(
                                                            color:
                                                                Colors.white),
                                                        textAlign:
                                                            TextAlign.left,
                                                        group: itemsListGroup,
                                                        maxLines: 3,
                                                        minFontSize: 8,
                                                      )),
                                                    ],
                                                  ),
                                                )),
                                                Expanded(
                                                    child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: AutoSizeText(
                                                    orders.orderdetails![index]
                                                        .categoryname
                                                        .toString(),
                                                    style: const TextStyle(
                                                        color: Colors.white),
                                                    textAlign: TextAlign.center,
                                                    group: itemsListGroup,
                                                    maxLines: 1,
                                                  ),
                                                )),
                                                Expanded(
                                                    child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: AutoSizeText(
                                                    "x${orders.orderdetails![index].qty.toString()}",
                                                    style: const TextStyle(
                                                        color: Colors.white),
                                                    textAlign: TextAlign.center,
                                                    group: itemsListGroup,
                                                  ),
                                                )),
                                              ],
                                            ),
                                          );
                                        }),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(child: Column())
                          ],
                        ),
                      ),
                      Align(
                          alignment: Alignment.topLeft,
                          child: Row(
                            children: const [
                              SizedBox(
                                width: 20,
                              ),
                              Text(
                                "Notes:",
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          )),
                      Align(
                        alignment: FractionalOffset.bottomLeft,
                        child: Row(
                          children: [
                            const SizedBox(
                              width: 20,
                            ),
                            Container(
                                height: 52,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5.0),
                                  color: Colors.white,
                                ),
                                width: MediaQuery.of(context).size.width * 0.3,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                          top: 8.0, bottom: 8, left: 18),
                                      child: SingleChildScrollView(
                                          child: Text(
                                        orders.remark.toString(),
                                        style: TextStyle(color: Colors.black),
                                      )),
                                    ),
                                  ],
                                )),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      )
                    ],
                  ),
                ),
          onExpansionChanged: (value) {
            isexpanded = value;
            setState(() {});
          },
        ),
      ),
    );
  });
}
