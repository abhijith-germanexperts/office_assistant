import 'dart:ui';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:ge_assistant/Constants/appconst.dart';
import 'package:ge_assistant/Screens/PantryUser/Pantry_View_Order/Deskop_Pan_View_Order.dart';
import 'package:ge_assistant/models/pendingorderforpantrymodel.dart';
import 'package:ge_assistant/services/apiservices.dart';

Widget customListViewAcceptedOrder(BuildContext context, Datum menuitem,
    String date, String time, int indexs, itemListGroup) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 18.0),
    child: Container(
      decoration: BoxDecoration(
        color:
            indexs % 2 == 0 ? const Color(0XFF424242) : const Color(0XFF5A5858),
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Column(
        children: [
          // ===========================Editing start===============================
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 17.0),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * .3,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: SizedBox(
                                  child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: AutoSizeText(
                                  time,
                                  textAlign: TextAlign.center,
                                  maxLines: 3,
                                  group: itemListGroup,
                                ),
                              )),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: AutoSizeText(
                                  menuitem.officename?.toUpperCase() ?? "",
                                  textAlign: TextAlign.center,
                                  maxLines: 3,
                                  group: itemListGroup,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                                child: SizedBox(
                                    child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: AutoSizeText(
                                date,
                                textAlign: TextAlign.center,
                                maxLines: 3,
                                group: itemListGroup,
                              ),
                            ))),
                            Expanded(
                                child: SizedBox(
                                    child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: AutoSizeText(
                                "${menuitem.extensioncode ?? ""}/${menuitem.createdByName ?? ""} ",
                                textAlign: TextAlign.center,
                                maxLines: 3,
                                group: itemListGroup,
                              ),
                            ))),
                          ],
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        const Align(
                            alignment: Alignment.topLeft,
                            child: Row(
                              children: [
                                // SizedBox(
                                //   width: 20,
                                // ),
                                Text("Notes:"),
                              ],
                            )),
                        Align(
                          alignment: FractionalOffset.bottomLeft,
                          child: Row(
                            children: [
                              // const SizedBox(
                              //   width: 20,
                              // ),
                              Container(
                                  height:
                                      MediaQuery.of(context).size.height * .06,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5.0),
                                    color: Colors.white,
                                  ),
                                  width:
                                      MediaQuery.of(context).size.width * 0.3,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        top: 8.0, bottom: 8, left: 18),
                                    child: SingleChildScrollView(
                                      child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          menuitem.remark ?? "",
                                          style: const TextStyle(
                                              color: Colors.black),
                                          maxLines: 6,
                                        ),
                                      ),
                                    ),
                                  )),
                            ],
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ElevatedButton(
                              onPressed: () {
                                String orderId =
                                    menuitem.orderid.toString() ?? "";
                                String statusOrderId = "4";
                                //String modifiedBy = "33";
                                // changeStatusOfTheOrder(
                                //     context, orderId, statusOrderId,
                                //     modifiedBy);
                                Navigator.pop(context);
                                alertBox(
                                    context,
                                    orderId,
                                    statusOrderId,
                                    AppConstants.username,
                                    const DesktopPantryViewOrder());
                              },
                              style: ButtonStyle(
                                backgroundColor: const MaterialStatePropertyAll(
                                    Color(0xff303030)),
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5.0),
                                      side: const BorderSide(
                                          color: Color(
                                              0xffE97979)) // Replace with your desired border color
                                      ),
                                ),
                              ),
                              child: AutoSizeText(
                                "Cancel",
                                style: const TextStyle(fontSize: 20),
                                group: itemListGroup,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * .3,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Expanded(
                        child: ListView.builder(
                            padding: EdgeInsets.zero,
                            itemCount: menuitem.orderdetails?.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                          child: SizedBox(
                                              child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: AutoSizeText(
                                          menuitem.orderdetails?[index]
                                                  .categoryname ??
                                              "",
                                          maxLines: 4,
                                          minFontSize: 12,
                                          group: itemListGroup,
                                          textAlign: TextAlign.center,
                                        ),
                                      ))),
                                      Expanded(
                                          child: SizedBox(
                                              child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: AutoSizeText(
                                          menuitem.orderdetails?[index].itemname
                                                  .toString() ??
                                              "",
                                          maxLines: 2,
                                          minFontSize: 8,
                                          group: itemListGroup,
                                          textAlign: TextAlign.center,
                                        ),
                                      ))),
                                      Expanded(
                                          child: SizedBox(
                                              child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: AutoSizeText(
                                          "x${menuitem.orderdetails?[index].qty.toString() ?? ""}",
                                          textAlign: TextAlign.center,
                                          maxLines: 5,
                                          minFontSize: 8,
                                          group: itemListGroup,
                                        ),
                                      ))),
                                    ],
                                  ),
                                ],
                              );
                            }),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0, bottom: 8.0),
                        child: ElevatedButton(
                          onPressed: () {
                            String orderId = menuitem.orderid.toString();
                            String statusOrderId = "3";
                            //String modifiedBy = "33";
                            Navigator.pop(context);
                            alertBox(
                                context,
                                orderId,
                                statusOrderId,
                                AppConstants.username,
                                const DesktopPantryViewOrder());
                          },
                          style: ButtonStyle(
                            backgroundColor: const MaterialStatePropertyAll(
                                Colors.transparent),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                  side: const BorderSide(
                                      color: Color(
                                          0xff69C86D)) // Replace with your desired border color
                                  ),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: AutoSizeText(
                              "Completed",
                              style: const TextStyle(fontSize: 20),
                              group: itemListGroup,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),

          // ========editing area===========;
          // const SizedBox(
          //   height: 20,
          // ),
          // Padding(
          //   padding: const EdgeInsets.all(17.0),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //     children: [
          //       ElevatedButton(
          //         onPressed: () {
          //           String orderId = menuitem.orderid.toString() ?? "";
          //           String statusOrderId = "4";
          //           //String modifiedBy = "33";
          //           // changeStatusOfTheOrder(
          //           //     context, orderId, statusOrderId,
          //           //     modifiedBy);
          //           alertBox(context, orderId, statusOrderId,
          //               AppConstants.username, const DesktopPantryViewOrder());
          //         },
          //         style: ButtonStyle(
          //           backgroundColor:
          //               const MaterialStatePropertyAll(Color(0xff303030)),
          //           shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          //             RoundedRectangleBorder(
          //                 borderRadius: BorderRadius.circular(5.0),
          //                 side: const BorderSide(
          //                     color: Color(
          //                         0xffE97979)) // Replace with your desired border color
          //                 ),
          //           ),
          //         ),
          //         child: Padding(
          //           padding: EdgeInsets.all(8.0),
          //           child: AutoSizeText(
          //             "Cancel",
          //             style: TextStyle(fontSize: 20),
          //             group: itemListGroup,
          //           ),
          //         ),
          //       ),
          //       ElevatedButton(
          //         onPressed: () {
          //           String orderId = menuitem.orderid.toString();
          //           String statusOrderId = "2";
          //           //String modifiedBy = "33";
          //           alertBox(context, orderId, statusOrderId,
          //               AppConstants.username, const DesktopPantryViewOrder());
          //         },
          //         style: ButtonStyle(
          //           backgroundColor:
          //               const MaterialStatePropertyAll(Colors.transparent),
          //           shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          //             RoundedRectangleBorder(
          //                 borderRadius: BorderRadius.circular(5.0),
          //                 side: const BorderSide(
          //                     color: Color(
          //                         0xff69C86D)) // Replace with your desired border color
          //                 ),
          //           ),
          //         ),
          //         child: Padding(
          //           padding: EdgeInsets.all(8.0),
          //           child: AutoSizeText(
          //             "Accept",
          //             style: TextStyle(fontSize: 20),
          //             group: itemListGroup,
          //           ),
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
          // const SizedBox(
          //   height: 5,
          // ),
        ],
      ),
    ),
  );
  // return Padding(
  //   padding: const EdgeInsets.only(bottom: 18.0),
  //   child: Container(
  //     decoration: BoxDecoration(
  //       color:
  //           indexs % 2 == 0 ? const Color(0XFF424242) : const Color(0XFF5A5858),
  //       borderRadius: BorderRadius.circular(5.0),
  //     ),
  //     child: Column(
  //       children: [
  //         const SizedBox(
  //           height: 15,
  //         ),
  //         // ===========================Editing start===============================
  //         Row(
  //           crossAxisAlignment: CrossAxisAlignment.start,
  //           children: [
  //             Expanded(
  //               child: Padding(
  //                 padding: const EdgeInsets.only(left: 17.0),
  //                 child: Column(
  //                   children: [
  //                     Row(
  //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                       crossAxisAlignment: CrossAxisAlignment.start,
  //                       children: [
  //                         Expanded(
  //                           child: SizedBox(
  //                               child: Padding(
  //                             padding: const EdgeInsets.all(8.0),
  //                             child: AutoSizeText(
  //                               time,
  //                               textAlign: TextAlign.center,
  //                               maxLines: 3,
  //                               group: itemListGroup,
  //                             ),
  //                           )),
  //                         ),
  //                         Expanded(
  //                           child: Padding(
  //                             padding: const EdgeInsets.all(8.0),
  //                             child: AutoSizeText(
  //                               menuitem.officename ?? "",
  //                               textAlign: TextAlign.center,
  //                               maxLines: 3,
  //                               group: itemListGroup,
  //                             ),
  //                           ),
  //                         ),
  //                       ],
  //                     ),
  //                     const SizedBox(
  //                       height: 5,
  //                     ),
  //                     Row(
  //                       mainAxisAlignment: MainAxisAlignment.spaceAround,
  //                       crossAxisAlignment: CrossAxisAlignment.start,
  //                       children: [
  //                         Expanded(
  //                             child: SizedBox(
  //                                 child: Padding(
  //                           padding: const EdgeInsets.all(8.0),
  //                           child: AutoSizeText(
  //                             date,
  //                             textAlign: TextAlign.center,
  //                             maxLines: 3,
  //                             group: itemListGroup,
  //                           ),
  //                         ))),
  //                         Expanded(
  //                             child: SizedBox(
  //                                 child: Padding(
  //                           padding: const EdgeInsets.all(8.0),
  //                           child: AutoSizeText(
  //                             "${menuitem.orderid ?? ""}",
  //                             textAlign: TextAlign.center,
  //                             maxLines: 3,
  //                             group: itemListGroup,
  //                           ),
  //                         ))),
  //                       ],
  //                     ),
  //                     const SizedBox(
  //                       height: 8,
  //                     ),
  //                     const Align(
  //                         alignment: Alignment.topLeft,
  //                         child: Row(
  //                           children: [
  //                             // SizedBox(
  //                             //   width: 20,
  //                             // ),
  //                             Text("Notes:"),
  //                           ],
  //                         )),
  //                     Align(
  //                       alignment: FractionalOffset.bottomLeft,
  //                       child: Row(
  //                         children: [
  //                           // const SizedBox(
  //                           //   width: 20,
  //                           // ),
  //                           Container(
  //                               height: 52,
  //                               decoration: BoxDecoration(
  //                                 borderRadius: BorderRadius.circular(5.0),
  //                                 color: Colors.white,
  //                               ),
  //                               width: MediaQuery.of(context).size.width * 0.3,
  //                               child: Padding(
  //                                 padding: const EdgeInsets.only(
  //                                     top: 8.0, bottom: 8, left: 18),
  //                                 child: SingleChildScrollView(
  //                                   child: Align(
  //                                     alignment: Alignment.centerLeft,
  //                                     child: Text(
  //                                       menuitem.remark ?? "",
  //                                       style: const TextStyle(
  //                                           color: Colors.black),
  //                                     ),
  //                                   ),
  //                                 ),
  //                               )),
  //                         ],
  //                       ),
  //                     )
  //                   ],
  //                 ),
  //               ),
  //             ),
  //             Expanded(
  //               child: SizedBox(
  //                 // color: Colors.green,
  //                 height: 107,
  //                 width: 100,
  //                 child: Padding(
  //                   padding: const EdgeInsets.all(8.0),
  //                   child: Column(
  //                     children: [
  //                       Expanded(
  //                         child: ListView.builder(
  //                             itemCount: menuitem.orderdetails?.length,
  //                             itemBuilder: (BuildContext context, int index) {
  //                               return Column(
  //                                 children: [
  //                                   Row(
  //                                     mainAxisAlignment:
  //                                         MainAxisAlignment.spaceAround,
  //                                     crossAxisAlignment:
  //                                         CrossAxisAlignment.start,
  //                                     children: [
  //                                       Expanded(
  //                                           child: SizedBox(
  //                                               child: Padding(
  //                                         padding: const EdgeInsets.all(8.0),
  //                                         child: AutoSizeText(
  //                                           menuitem.orderdetails?[index]
  //                                                   .categoryname ??
  //                                               "",
  //                                           maxLines: 4,
  //                                           minFontSize: 12,
  //                                           group: itemListGroup,
  //                                           textAlign: TextAlign.center,
  //                                         ),
  //                                       ))),
  //                                       Expanded(
  //                                           child: SizedBox(
  //                                               child: Padding(
  //                                         padding: const EdgeInsets.all(8.0),
  //                                         child: AutoSizeText(
  //                                           menuitem.orderdetails?[index]
  //                                                   .itemname ??
  //                                               "",
  //                                           maxLines: 1,
  //                                           minFontSize: 8,
  //                                           group: itemListGroup,
  //                                           textAlign: TextAlign.center,
  //                                         ),
  //                                       ))),
  //                                       Expanded(
  //                                           child: SizedBox(
  //                                               child: Padding(
  //                                         padding: const EdgeInsets.all(8.0),
  //                                         child: AutoSizeText(
  //                                           "x${menuitem.orderdetails?[index].qty.toString() ?? ""}",
  //                                           textAlign: TextAlign.center,
  //                                           maxLines: 5,
  //                                           minFontSize: 8,
  //                                           group: itemListGroup,
  //                                         ),
  //                                       ))),
  //                                     ],
  //                                   ),
  //                                   const SizedBox(
  //                                     height: 5,
  //                                   )
  //                                 ],
  //                               );
  //                             }),
  //                       )
  //                     ],
  //                   ),
  //                 ),
  //               ),
  //             )
  //           ],
  //         ),
  //         // ========editing area===========;
  //         // const SizedBox(
  //         //   height: 20,
  //         // ),
  //         Padding(
  //           padding: const EdgeInsets.all(17.0),
  //           child: Row(
  //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //             children: [
  //               ElevatedButton(
  //                 onPressed: () {
  //                   String orderId = menuitem.orderid.toString() ?? "";
  //                   String statusOrderId = "4";

  //                   // changeStatusOfTheOrder(
  //                   //     context, orderId, statusOrderId,
  //                   //     modifiedBy);
  //                   alertBox(
  //                       context,
  //                       orderId,
  //                       statusOrderId,
  //                       AppConstants.username.toString(),
  //                       const DesktopPantryViewOrder());
  //                 },
  //                 style: ButtonStyle(
  //                   backgroundColor:
  //                       const MaterialStatePropertyAll(Color(0xff303030)),
  //                   shape: MaterialStateProperty.all<RoundedRectangleBorder>(
  //                     RoundedRectangleBorder(
  //                         borderRadius: BorderRadius.circular(5.0),
  //                         side: const BorderSide(
  //                             color: Color(
  //                                 0xffE97979)) // Replace with your desired border color
  //                         ),
  //                   ),
  //                 ),
  //                 child: Padding(
  //                   padding: const EdgeInsets.all(8.0),
  //                   child: AutoSizeText(
  //                     "Cancel",
  //                     style: const TextStyle(fontSize: 20),
  //                     group: itemListGroup,
  //                   ),
  //                 ),
  //               ),
  //               ElevatedButton(
  //                 onPressed: () {
  //                   String orderId = menuitem.orderid.toString();
  //                   String statusOrderId = "3";

  //                   alertBox(
  //                       context,
  //                       orderId,
  //                       statusOrderId,
  //                       AppConstants.username.toString(),
  //                       const DesktopPantryViewOrder());
  //                 },
  //                 style: ButtonStyle(
  //                   backgroundColor:
  //                       const MaterialStatePropertyAll(Colors.transparent),
  //                   shape: MaterialStateProperty.all<RoundedRectangleBorder>(
  //                     RoundedRectangleBorder(
  //                         borderRadius: BorderRadius.circular(5.0),
  //                         side: const BorderSide(
  //                             color: Color(
  //                                 0xff69C86D)) // Replace with your desired border color
  //                         ),
  //                   ),
  //                 ),
  //                 child: Padding(
  //                   padding: const EdgeInsets.all(8.0),
  //                   child: AutoSizeText(
  //                     "Completed",
  //                     style: const TextStyle(fontSize: 20),
  //                     group: itemListGroup,
  //                   ),
  //                 ),
  //               ),
  //             ],
  //           ),
  //         ),
  //         // const SizedBox(
  //         //   height: 5,
  //         // ),
  //       ],
  //     ),
  //   ),
  // );
}

alertBox(BuildContext context, String orderId, String statusOrderId,
    String modifiedBy, Widget replacementWidget) {
  ApiProvider client = ApiProvider();
  return showDialog<void>(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return StatefulBuilder(
        builder:
            (BuildContext context, void Function(void Function()) setState) {
          return BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: AlertDialog(
              backgroundColor: Colors.transparent,
              content: FutureBuilder(
                future: client.changeOrderStatus(
                    orderId, statusOrderId, modifiedBy),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return SizedBox(
                      height: MediaQuery.of(context).size.height * .1,
                      child: const Center(
                          child: Image(
                              image:
                                  AssetImage("image/ge office assistant.gif"))),
                    );
                  } else if (snapshot.hasError) {
                    print(snapshot.error);
                    // Handle error case
                    return const Text(
                        'Error occurred while changing order status');
                  } else {
                    // Handle success case
                    print(statusOrderId);
                    Future.delayed(Duration.zero, () {
                      // Navigator.pop(context);
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) =>
                                replacementWidget),
                      );
                    });

                    return SizedBox(
                      height: MediaQuery.of(context).size.height * .1,
                      child: const Center(
                          child: Image(
                              image:
                                  AssetImage("image/ge office assistant.gif"))),
                    );
                  }
                },
              ),
            ),
          );
        },
      );
    },
  );
}
