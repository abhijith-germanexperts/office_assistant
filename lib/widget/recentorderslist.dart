import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ge_assistant/Constants/appconst.dart';
import 'package:ge_assistant/Screens/End%20userselection%20page/EmdUserSelectionDesktop.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../Constants/alertdylog_order_success.dart';
import '../models/recentorders.dart';

// color: index%2==0? const Color(0xff5A5858) : const Color(0xff424242),
Widget customRecentOrderListExpanded(
  BuildContext context,
  listgroup,
  Datum orderitem,
) {
  final List<Map<String, dynamic>> orderDetails = [];

  List image = [
    "image/pednding.png", //pending
    "image/accepted.png", //accept
    "image/completed.png", //completed
    "image/cancelled.png", // cancelled
  ];
  double height = MediaQuery.of(context).size.height;
  double width = MediaQuery.of(context).size.width;
  var headgroup = AutoSizeGroup();
  var isexpanded = false;
  DateFormat inputFormat = DateFormat('yyyy-MM-dd hh:mm:ss a');
  DateTime dateTime = inputFormat.parse(orderitem.createdAt ?? "");
  String formattedTime = DateFormat('h:mm a').format(dateTime);
  String formatdate = DateFormat("dd-MM-yyyy").format(dateTime);
  int status = orderitem.statusorderid! - 1;
  print(formatdate);
  print(formattedTime);
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
                  children: [
                    SizedBox(
                      width: width > 944 ? width * .1 : width * .1,
                      // color: Colors.red,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0, right: 4),
                        child: AutoSizeText(
                          formatdate,
                          textAlign: TextAlign.center,
                          style: GoogleFonts.inriaSerif(
                              fontSize: 20, color: Colors.white),
                          maxLines: 1,
                          minFontSize: 8,
                          //group: listgroup,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: width > 944 ? width * .08 : width * .08,
                      // color: Colors.yellow,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0, right: 4),
                        child: AutoSizeText(
                          formattedTime,
                          textAlign: TextAlign.center,
                          style: GoogleFonts.inriaSerif(
                              fontSize: 18, color: Colors.white),
                          maxLines: 1,
                          minFontSize: 8,
                          //group: listgroup,
                        ),
                      ),
                    ),
                    const Spacer(),
                    SizedBox(
                        width: width * 0.1,
                        // color: Colors.blue,
                        height: 16,
                        child: Image(image: AssetImage(image[status]))),
                    // const Spacer(
                    //   flex: 2,
                    // ),
                    const Spacer(
                      flex: 2,
                    ),
                    ElevatedButton(
                      onPressed: status != 2
                          ? null
                          : () {
                              for (int i = 0;
                                  i < orderitem.orderdetails!.length;
                                  i++) {
                                orderDetails.add({
                                  "qty": orderitem.orderdetails?[i].qty,
                                  "menuid": orderitem.orderdetails?[i].menuid,
                                  "pantryid": AppConstants.pantryId ?? ""
                                });
                              }
                              showOrderSuccessDialog(context, orderDetails, "");
                              // status == 2
                              //     ? showOrderSuccessDialog(
                              //         context, orderDetails, "remark")
                              //     : alert(context, "ALERT....!",
                              //         "You have already placed this order before.");

                              // Navigator.pushReplacement(
                              //     context, MaterialPageRoute(builder: (context) => const EndViewOrderBasePage()));
                            },
                      style: ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll(status == 2
                              ? Colors.white
                              : Colors.grey.shade600)),
                      child: const Text(
                        "Repeat Order",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ],
                )
              : Row(
                  children: [
                    Expanded(
                      flex: 4,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              // SizedBox(width: width*0.038,),
                              SizedBox(
                                width: width > 944 ? width * .1 : width * .1,
                                // color: Colors.red,
                                child: AutoSizeText(
                                  formatdate,
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.inriaSerif(
                                      fontSize: 20, color: Colors.white),
                                  maxLines: 1,
                                  minFontSize: 8,
                                  group: listgroup,
                                ),
                              ),
                              SizedBox(
                                width: width > 944 ? width * .08 : width * .08,
                                // color: Colors.yellow,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 8.0, right: 8),
                                  child: AutoSizeText(
                                    formattedTime,
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.inriaSerif(
                                        fontSize: 20, color: Colors.white),
                                    maxLines: 1,
                                    minFontSize: 8,
                                    group: listgroup,
                                  ),
                                ),
                              ),
                              const Spacer(),
                              SizedBox(
                                  width: width * 0.1,
                                  // color: Colors.blue,
                                  height: 16,
                                  child:
                                      Image(image: AssetImage(image[status]))),
                              // Expanded(flex: 2,child: Container()),
                              // const Spacer(
                              //   flex: 2,
                              // ),
                              const Spacer(),
                              SizedBox(
                                width: width > 944 ? 80 : 60,
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          // ============List of items start here==============================
                          SizedBox(
                            // color: Colors.red,
                            height: 200,
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    SizedBox(
                                      width: width * .25,
                                      child: AutoSizeText(
                                        "Item name",
                                        textAlign: TextAlign.start,
                                        style: GoogleFonts.inriaSerif(
                                            fontSize: 20, color: Colors.white),
                                        maxLines: 1,
                                        minFontSize: 8,
                                        group: listgroup,
                                      ),
                                    ),
                                    SizedBox(
                                      width: width * .08,
                                      child: AutoSizeText(
                                        "Category",
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.inriaSerif(
                                            fontSize: 20, color: Colors.white),
                                        maxLines: 1,
                                        minFontSize: 8,
                                        group: listgroup,
                                      ),
                                    ),
                                    SizedBox(
                                      width: width * .1,
                                      child: AutoSizeText(
                                        "Quantity",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(color: Colors.white),
                                        maxLines: 1,
                                        group: listgroup,
                                      ),
                                    ),
                                  ],
                                ),
                                Container(
                                  color: Colors.white,
                                  width: double.maxFinite,
                                  height: 1,
                                ),
                                Expanded(
                                  child: ScrollConfiguration(
                                    behavior: ScrollConfiguration.of(context)
                                        .copyWith(scrollbars: false),
                                    child: ListView.builder(
                                        itemCount:
                                            orderitem.orderdetails?.length,
                                        itemBuilder: (_, index) {
                                          return SizedBox(
                                            height: height * .03,
                                            // color: Colors.brown,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: [
                                                SizedBox(
                                                  width: width * .25,
                                                  // color:Colors.red,
                                                  child: Row(
                                                    children: [
                                                      SizedBox(
                                                        child: FadeInImage
                                                            .assetNetwork(
                                                          placeholder:
                                                              'image/ge office assistant.gif',
                                                          imageErrorBuilder:
                                                              (context, error,
                                                                  stackTrace) {
                                                            return Image.asset(
                                                                'image/ge office assistant.gif',
                                                                width:
                                                                    width * .1,
                                                                fit: BoxFit
                                                                    .fitWidth);
                                                          },
                                                          image: (orderitem
                                                                  .orderdetails?[
                                                                      index]
                                                                  .itemimgpath
                                                                  .toString() ??
                                                              ""),
                                                          fit: BoxFit.fill,
                                                        ),
                                                      ),
                                                      Expanded(
                                                          child: AutoSizeText(
                                                        orderitem
                                                                .orderdetails?[
                                                                    index]
                                                                .itemname ??
                                                            "",
                                                        group: listgroup,
                                                        style: GoogleFonts
                                                            .inriaSerif(
                                                                fontSize: 20,
                                                                color: Colors
                                                                    .white),
                                                      )),
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(
                                                    // color: Colors.blue,
                                                    width: width * .1,
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 8.0,
                                                              right: 8),
                                                      child: AutoSizeText(
                                                          orderitem
                                                                  .orderdetails?[
                                                                      index]
                                                                  .categoryname ??
                                                              "",
                                                          group: listgroup,
                                                          style: GoogleFonts
                                                              .inriaSerif(
                                                                  fontSize: 20,
                                                                  color: Colors
                                                                      .white),
                                                          textAlign:
                                                              TextAlign.center),
                                                    )),
                                                SizedBox(
                                                    width: width * .1,
                                                    // color: Colors.green,
                                                    child: AutoSizeText(
                                                      orderitem
                                                              .orderdetails?[
                                                                  index]
                                                              .qty
                                                              .toString() ??
                                                          "",
                                                      group: listgroup,
                                                      style: GoogleFonts
                                                          .inriaSerif(
                                                              fontSize: 20,
                                                              color:
                                                                  Colors.white),
                                                      textAlign:
                                                          TextAlign.center,
                                                    )),
                                              ],
                                            ),
                                          );
                                        }),
                                  ),
                                )
                              ],
                            ),
                          ),
                          // SizedBox(
                          //   // color: Colors.red,
                          //   height: 200,
                          //   child: Column(
                          //     children: [
                          //       Row(
                          //         mainAxisAlignment:
                          //             MainAxisAlignment.spaceBetween,
                          //         children: [
                          //           SizedBox(
                          //             width: width * .25,
                          //             child: const Row(
                          //               mainAxisAlignment:
                          //                   MainAxisAlignment.start,
                          //               children: [
                          //                 SizedBox(
                          //                   width: 20,
                          //                 ),
                          //                 Text(
                          //                   "Item name",
                          //                   textAlign: TextAlign.left,
                          //                   style:
                          //                       TextStyle(color: Colors.white),
                          //                 ),
                          //               ],
                          //             ),
                          //           ),
                          //           SizedBox(
                          //             width: width * .1,
                          //             child: const AutoSizeText(
                          //               "Category",
                          //               textAlign: TextAlign.center,
                          //               style: TextStyle(color: Colors.white),
                          //               maxLines: 1,
                          //             ),
                          //           ),
                          //           SizedBox(
                          //             width: width * .1,
                          //             child: const AutoSizeText(
                          //               "Quantity",
                          //               textAlign: TextAlign.center,
                          //               style: TextStyle(color: Colors.white),
                          //               maxLines: 1,
                          //             ),
                          //           ),
                          //         ],
                          //       ),
                          //       Container(
                          //         color: Colors.white,
                          //         width: double.maxFinite,
                          //         height: 1,
                          //       ),
                          //       Expanded(
                          //         child: ListView.builder(
                          //             itemCount: orderitem.orderdetails?.length,
                          //             itemBuilder: (_, index) {
                          //               return SizedBox(
                          //                 height: height * .1,
                          //                 // color: Colors.brown,
                          //                 child: Row(
                          //                   mainAxisAlignment:
                          //                       MainAxisAlignment.spaceBetween,
                          //                   children: [
                          //                     SizedBox(
                          //                       width: width * .25,
                          //                       // color:Colors.red,
                          //                       child: Row(
                          //                         children: [
                          //                           SizedBox(
                          //                             child: FadeInImage
                          //                                 .assetNetwork(
                          //                               placeholder:
                          //                                   'image/ge office assistant.gif',
                          //                               imageErrorBuilder:
                          //                                   (context, error,
                          //                                       stackTrace) {
                          //                                 return Image.asset(
                          //                                     'image/ge office assistant.gif',
                          //                                     width: width * .1,
                          //                                     fit: BoxFit
                          //                                         .fitWidth);
                          //                               },
                          //                               image: (orderitem
                          //                                       .orderdetails?[
                          //                                           index]
                          //                                       .itemimgpath
                          //                                       .toString() ??
                          //                                   ""),
                          //                               fit: BoxFit.fill,
                          //                             ),
                          //                           ),
                          //                           Align(
                          //                             alignment:
                          //                                 Alignment.center,
                          //                             child: Padding(
                          //                               padding:
                          //                                   const EdgeInsets
                          //                                       .only(top: 8.0),
                          //                               child: AutoSizeText(
                          //                                 orderitem
                          //                                         .orderdetails?[
                          //                                             index]
                          //                                         .itemname ??
                          //                                     "",
                          //                                 style:
                          //                                     const TextStyle(
                          //                                         color: Colors
                          //                                             .white),
                          //                               ),
                          //                             ),
                          //                           ),
                          //                         ],
                          //                       ),
                          //                     ),
                          //                     SizedBox(
                          //                         // color: Colors.blue,
                          //                         width: width * .1,
                          //                         child: Padding(
                          //                           padding:
                          //                               const EdgeInsets.only(
                          //                                   left: 8.0,
                          //                                   right: 8),
                          //                           child: AutoSizeText(
                          //                             orderitem
                          //                                     .orderdetails?[
                          //                                         index]
                          //                                     .categoryname ??
                          //                                 "",
                          //                             textAlign:
                          //                                 TextAlign.center,
                          //                             style: const TextStyle(
                          //                               color: Colors.white,
                          //                             ),
                          //                             maxLines: 1,
                          //                           ),
                          //                         )),
                          //                     SizedBox(
                          //                         width: width * .1,
                          //                         // color: Colors.green,
                          //                         child: AutoSizeText(
                          //                           orderitem
                          //                                   .orderdetails?[
                          //                                       index]
                          //                                   .qty
                          //                                   .toString() ??
                          //                               "",
                          //                           style: const TextStyle(
                          //                               color: Colors.white),
                          //                           textAlign: TextAlign.center,
                          //                         )),
                          //                   ],
                          //                 ),
                          //               );
                          //             }),
                          //       )
                          //     ],
                          //   ),
                          // )
                        ],
                      ),
                    ),
                    // =====Fist part of row end here =============================
                    Expanded(
                      child: SizedBox(
                        height: 225,
                        width: 850,
                        // color: Colors.yellow,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            SizedBox(
                              child: ElevatedButton(
                                onPressed: status != 2
                                    ? null
                                    : () {
                                        // Navigator.pushReplacement(
                                        //     context, MaterialPageRoute(builder: (context) => const EndViewOrderBasePage()));
                                        print(status);
                                        for (int i = 0;
                                            i < orderitem.orderdetails!.length;
                                            i++) {
                                          orderDetails.add({
                                            "qty":
                                                orderitem.orderdetails?[i].qty,
                                            "menuid": orderitem
                                                .orderdetails?[i].menuid,
                                            "pantryid":
                                                AppConstants.pantryId.toString()
                                          });
                                        }
                                        showOrderSuccessDialog(
                                            context, orderDetails, "");
                                      },
                                style: ButtonStyle(
                                    backgroundColor: MaterialStatePropertyAll(
                                        status == 2
                                            ? Colors.white
                                            : Colors.grey.shade600)),
                                child: const AutoSizeText(
                                  "Repeat Order",
                                  textAlign: TextAlign.center,
                                  maxLines: 2,
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
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






// StatefulBuilder(
//       builder: (BuildContext context, void Function(void Function()) setState) {
//     return Container(
//       // width: width * .7,
//       margin: const EdgeInsets.all(1), // Optional margin for the inner shadow
//       decoration: isexpanded
//           ? const BoxDecoration(
//               boxShadow: [
//                 BoxShadow(
//                     color: Colors.black,
//                     offset: Offset(1, 1),
//                     blurRadius: 4,
//                     spreadRadius: 0,
//                     inset: true),
//                 BoxShadow(
//                     color: Colors.grey,
//                     offset: Offset(-1, -1),
//                     blurRadius: 4,
//                     spreadRadius: 0,
//                     inset: true),
//               ], //
//               //
//               //color: Color(0xff5A5858),// Container background color
//             )
//           : const BoxDecoration(),
//       child: Theme(
//         data: ThemeData().copyWith(dividerColor: Colors.transparent),
//         child: ExpansionTile(
//           // tilePadding: EdgeInsets.zero,
//           shape: Border.all(color: Colors.transparent),
//           // collapsedBackgroundColor: Colors.transparent,
//           trailing: isexpanded
//               ? SizedBox(
//                   child: SvgPicture.asset(
//                       'image/iconmonstr-angel-up-circle-thin.svg'))
//               : SizedBox(
//                   child: SvgPicture.asset(
//                       'image/iconmonstr-angel-down-circle-thin.svg')),
//           // trailing: Icon(
//           //   isexpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
//           //   color: Colors.white, // Specify the icon for the collapsed state
//           // ),
//           title: !isexpanded
//               ? Row(
//                   children: [
//                     SizedBox(
//                         child: Text(
//                       formatdate,
//                       textAlign: TextAlign.center,
//                       style: GoogleFonts.inriaSerif(
//                           fontSize: 20, color: Colors.white),
//                       maxLines: 1,
//                       // group: listgroup,
//                     )),
//                     SizedBox(
//                         child: Padding(
//                       padding: EdgeInsets.only(
//                           left: MediaQuery.of(context).size.width * 0.03,
//                           right: 8),
//                       child: Text(
//                         formattedTime,
//                         textAlign: TextAlign.center,
//                         style: GoogleFonts.inriaSerif(
//                             fontSize: 20, color: Colors.white),
//                         maxLines: 1,
//                         // group: listgroup,
//                       ),
//                     )),
//                     Padding(
//                       padding: EdgeInsets.only(
//                           left: MediaQuery.of(context).size.width * 0.03,
//                           right: 8),
//                       child: SizedBox(
//                           height: 16,
//                           child: Image(image: AssetImage(image[status]))),
//                     ),
//                     const Spacer(
//                       flex: 6,
//                     ),
//                     ElevatedButton(
//                       onPressed: () {
//                         for (int i = 0;
//                             i < orderitem.orderdetails!.length;
//                             i++) {
//                           orderDetails.add({
//                             "qty": orderitem.orderdetails?[i].qty,
//                             "menuid": orderitem.orderdetails?[i].menuid,
//                             "pantryid": "2"
//                           });
//                         }
//                         showOrderSuccessDialog(context, orderDetails, "remark");
//                        // Navigator.pop(context);
//                         //  Navigator.pushReplacement(
//                         //     context,
//                         //     MaterialPageRoute(
//                         //         builder: (context) =>
//                         //             const EndViewOrderBasePage()));
//                       },
//                       style: const ButtonStyle(
//                           backgroundColor:
//                               MaterialStatePropertyAll(Colors.white)),
//                       child: const Text(
//                         "Repeat Order",
//                         style: TextStyle(color: Colors.black),
//                       ),
//                     ),
//                   ],
//                 )
//               : Container(
//                   child: Row(
//                     children: [
//                       Expanded(
//                         flex: 4,
//                         child: Column(
//                           children: [
//                             Row(
//                               children: [
//                                 SizedBox(
//                                     child: Text(
//                                   orderitem.createdAt.toString(),
//                                   textAlign: TextAlign.center,
//                                   style: GoogleFonts.inriaSerif(
//                                       fontSize: 20, color: Colors.white),
//                                   maxLines: 1,
//                                   // group: listgroup,
//                                 )),
//                                 SizedBox(
//                                     child: Padding(
//                                   padding: EdgeInsets.only(
//                                       left: MediaQuery.of(context).size.width *
//                                           0.03,
//                                       right: 8),
//                                   child: Text(
//                                     orderitem.createdAt.toString(),
//                                     textAlign: TextAlign.center,
//                                     style: GoogleFonts.inriaSerif(
//                                         fontSize: 20, color: Colors.white),
//                                     maxLines: 1,
//                                     // group: listgroup,
//                                   ),
//                                 )),
//                                 Padding(
//                                   padding: EdgeInsets.only(
//                                       left: MediaQuery.of(context).size.width *
//                                           0.03,
//                                       right: 8),
//                                   child: SizedBox(
//                                       height: 16,
//                                       child: Image(
//                                           image: AssetImage(image[
//                                               orderitem.statusorderid ?? 0]))),
//                                 ),
//                                 // const Spacer(
//                                 //   flex: 6,
//                                 // ),
//                               ],
//                             ),
//                             // ============List of items start here==============================
//                             SizedBox(
//                               height: 200,
//                               child: Column(
//                                 children: [
//                                   const Padding(
//                                     padding: EdgeInsets.only(left: 18.0),
//                                     child: Row(
//                                       children: [
//                                         Expanded(
//                                             child: Text(
//                                           "Item name",
//                                           textAlign: TextAlign.center,
//                                           style: TextStyle(color: Colors.white),
//                                         )),
//                                         Expanded(
//                                             child: Text(
//                                           "Category",
//                                           textAlign: TextAlign.center,
//                                           style: TextStyle(color: Colors.white),
//                                         )),
//                                         Expanded(
//                                             child: Text(
//                                           "Quantity",
//                                           textAlign: TextAlign.start,
//                                           style: TextStyle(color: Colors.white),
//                                         )),
//                                       ],
//                                     ),
//                                   ),
//                                   Container(
//                                     color: Colors.white,
//                                     width: double.maxFinite,
//                                     height: 1,
//                                   ),
//                                   Expanded(
//                                     child: ListView.builder(
//                                         itemCount:
//                                             orderitem.orderdetails?.length,
//                                         itemBuilder: (_, index) {
//                                           return SizedBox(
//                                             height: 40,
//                                             child: Row(
//                                               children: [
//                                                 const Expanded(
//                                                     child: Row(
//                                                   children: [
//                                                     Image(
//                                                         image: AssetImage(
//                                                             "image/20002124-d-classic_collection_espresso-cup-expressod.png")),
//                                                   ],
//                                                 )),
//                                                 Expanded(
//                                                     child: Text(
//                                                   orderitem.orderdetails?[index]
//                                                           .itemname ??
//                                                       "",
//                                                   style: const TextStyle(
//                                                       color: Colors.white),
//                                                 )),
//                                                 Expanded(
//                                                     child: Text(
//                                                   orderitem.orderdetails?[index]
//                                                           .categoryname ??
//                                                       "",
//                                                   style: const TextStyle(
//                                                       color: Colors.white),
//                                                 )),
//                                                 Expanded(
//                                                     child: Text(
//                                                   orderitem.orderdetails?[index]
//                                                           .qty
//                                                           .toString() ??
//                                                       "",
//                                                   style: TextStyle(
//                                                       color: Colors.white),
//                                                 )),
//                                               ],
//                                             ),
//                                           );
//                                         }),
//                                   )
//                                 ],
//                               ),
//                             )
//                           ],
//                         ),
//                       ),
//                       // =====Fist part of row end here =============================
//                       Expanded(
//                         child: SizedBox(
//                           height: 200,
//                           width: 850,
//                           child: Column(
//                             mainAxisAlignment: MainAxisAlignment.end,
//                             crossAxisAlignment: CrossAxisAlignment.end,
//                             children: [
//                               SizedBox(
//                                 child: ElevatedButton(
//                                   onPressed: () {
//                                     // Navigator.pushReplacement(
//                                     //     context, MaterialPageRoute(builder: (context) => const EndViewOrderBasePage()));
//                                   },
//                                   child: const AutoSizeText(
//                                     "Repeat Order",
//                                     textAlign: TextAlign.center,
//                                     maxLines: 2,
//                                     style: TextStyle(color: Colors.black),
//                                   ),
//                                   style: const ButtonStyle(
//                                       backgroundColor: MaterialStatePropertyAll(
//                                           Colors.white)),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),

//           onExpansionChanged: (value) {
//             isexpanded = value;
//             setState(() {});
//           },
//         ),
//       ),
//     );
//   });
