// import 'package:auto_size_text/auto_size_text.dart';
// import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
// import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:ge_assistant/models/recentorders.dart';
// import 'package:google_fonts/google_fonts.dart';

// // color: index%2==0? const Color(0xff5A5858) : const Color(0xff424242),
// Widget customRecentOrderListExpanded(
//   BuildContext context,
//   listgroup,
//   Datum data,
// ) {
//   List orderedItemsList = [
//     "Espresso",
//     "Cappuccino",
//     "Americano",
//     "Cappuccino with chocolate",
//     "Hot Chocolate",
//     "Mochaccino",
//     "Cardomom tea",
//     "Espresso Macchiato",
//   ];
//   List category = [
//     "Tea",
//     "Coffee",
//     "Coffee",
//     "Pastry",
//     "Tea",
//     "Tea",
//     "Pastry",
//     "Tea",
//   ];
//   double height = MediaQuery.of(context).size.height;
//   double width = MediaQuery.of(context).size.width;
//   var headgroup = AutoSizeGroup();
//   var isexpanded = false;
//   return StatefulBuilder(
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
//                       data.createdAt.toString(),
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
//                         data.createdAt.toString(),
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
//                       child: Container(
//                           height: 16, child: Image(image: AssetImage(image))),
//                     ),
//                     const Spacer(
//                       flex: 6,
//                     ),
//                     ElevatedButton(
//                       onPressed: () {
//                         // Navigator.pushReplacement(
//                         //     context, MaterialPageRoute(builder: (context) => const EndViewOrderBasePage()));
//                       },
//                       child: const Text(
//                         "Repeat Order",
//                         style: TextStyle(color: Colors.black),
//                       ),
//                       style: const ButtonStyle(
//                           backgroundColor:
//                               MaterialStatePropertyAll(Colors.white)),
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
//                                   "",
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
//                                     "time",
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
//                                   child: Container(
//                                       height: 16,
//                                       child: Image(image: AssetImage(image))),
//                                 ),
//                                 // const Spacer(
//                                 //   flex: 6,
//                                 // ),
//                               ],
//                             ),
//                             // ============List of items start here==============================
//                             Container(
//                               height: 200,
//                               child: Column(
//                                 children: [
//                                   Padding(
//                                     padding: const EdgeInsets.only(left: 18.0),
//                                     child: Row(
//                                       children: const [
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
//                                         itemCount: data.orderdetails?.length,
//                                         itemBuilder: (_, index) {
//                                           return Container(
//                                             height: 40,
//                                             child: Row(
//                                               children: [
//                                                 const Expanded(
//                                                     child: Image(
//                                                         image: AssetImage(
//                                                             "image/20002124-d-classic_collection_espresso-cup-expressod.png"))),
//                                                 Expanded(
//                                                     child: Text(
//                                                   data.orderdetails?[index]
//                                                           .itemname ??
//                                                       "",
//                                                   style: const TextStyle(
//                                                       color: Colors.white),
//                                                 )),
//                                                 Expanded(
//                                                     child: Text(
//                                                   data.orderdetails?[index]
//                                                           .categoryname ??
//                                                       "",
//                                                   style: const TextStyle(
//                                                       color: Colors.white),
//                                                 )),
//                                                 Expanded(
//                                                     child: Text(
//                                                   data.orderdetails?[index].qty
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
//                         child: Container(
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
// }
