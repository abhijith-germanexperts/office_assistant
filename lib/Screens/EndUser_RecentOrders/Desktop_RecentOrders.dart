// import 'package:auto_size_text/auto_size_text.dart';
// import 'package:flutter/material.dart';
// import 'package:ge_assistant/Constants/appconst.dart';
// import 'package:ge_assistant/Constants/mobileRecentOrderList.dart';
// import 'package:ge_assistant/Screens/EndPantrymenu/Desktop_end_pantrymenu.dart';
// import 'package:ge_assistant/widget/recentorderslist.dart';
// import 'package:google_fonts/google_fonts.dart';

// import '../../Constants/recentorderslist.dart';

// class DesktopRecentOrder extends StatefulWidget {
//   const DesktopRecentOrder({Key? key}) : super(key: key);

//   @override
//   State<DesktopRecentOrder> createState() => _DesktopRecentOrderState();
// }

// class _DesktopRecentOrderState extends State<DesktopRecentOrder> {
//   List time = [
//     "09:00 AM",
//     "09:00 AM",
//     "09:00 AM",
//     "09:00 AM",
//   ];
//   List date = [
//     "13-12-23",
//     "13-12-23",
//     "13-12-23",
//     "13-12-23",
//   ];

//   var listgroup = AutoSizeGroup();
//   @override
//   Widget build(BuildContext context) {
//     double height = MediaQuery.of(context).size.height;
//     double width = MediaQuery.of(context).size.width;
//     print(AppConstants.pantryId);
//     return Scaffold(
//         backgroundColor: Colors.black87,
//         // backgroundColor: Colors.white,
//         // appBar: AppBar(
//         //   title: Text('image/end user directory banner.jpg'),
//         // ),
//         body: Column(
//           children: [
//             Container(
//                 width: double.maxFinite,
//                 height: MediaQuery.of(context).size.height * 0.25,
//                 decoration: const BoxDecoration(
//                     image: DecorationImage(
//                   image:
//                       AssetImage("image/end user pantry banner darkened.jpg"),
//                   fit: BoxFit.fill,
//                 )),
//                 child: Column(
//                   children: [
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         SizedBox(
//                             width: MediaQuery.of(context).size.width * 0.4,
//                             height: MediaQuery.of(context).size.height * 0.05,
//                             // color: Colors.red,
//                             child: const Image(
//                                 image: AssetImage(
//                                     "image/GE office assistant white.png"))),
//                         Padding(
//                           padding: EdgeInsets.only(
//                               right: MediaQuery.of(context).size.width * 0.03),
//                           child: Icon(
//                             Icons.menu,
//                             color: Colors.white,
//                             size:
//                                 MediaQuery.of(context).size.shortestSide * 0.04,
//                           ),
//                         )
//                       ],
//                     ),
//                     SizedBox(
//                       width: MediaQuery.of(context).size.width,
//                       height: MediaQuery.of(context).size.height * .2,
//                       // color: Colors.blue,
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Expanded(
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               crossAxisAlignment: CrossAxisAlignment.center,
//                               children: [
//                                 AutoSizeText(
//                                   "Pantry Service",
//                                   style: GoogleFonts.inriaSerif(
//                                       fontWeight: FontWeight.bold,
//                                       fontSize: 40,
//                                       color: Colors.white),
//                                   minFontSize: 5,
//                                 )
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 )),
//             SizedBox(
//               height: MediaQuery.of(context).size.height * 0.018,
//             ),
//             SizedBox(
//               // color: Colors.yellow,
//               height: MediaQuery.of(context).size.height * 0.06,
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 crossAxisAlignment: CrossAxisAlignment.end,
//                 children: [
//                   Align(
//                     alignment: Alignment.topCenter,
//                     child: Padding(
//                         padding: EdgeInsets.only(
//                             left: MediaQuery.of(context).size.width * 0.13),
//                         child: ElevatedButton(
//                           onPressed: () {
//                             Navigator.pop(context);
//                           },
//                           style: ElevatedButton.styleFrom(
//                             elevation: 4,
//                             backgroundColor: const Color(0xff303030),
//                             // foregroundColor: Colors.white,
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(
//                                   17), // Set border radius of 3
//                               side: const BorderSide(
//                                 color: Colors.white,
//                               ),
//                             ),
//                           ),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.start,
//                             children: const [
//                               Icon(Icons.arrow_back_rounded),
//                               SizedBox(width: 8),
//                               Text('Go back'),
//                             ],
//                           ),
//                         )),
//                   ),
//                   // Align(
//                   //   alignment: Alignment.topCenter,
//                   //   child: Padding(
//                   //       padding: EdgeInsets.only(
//                   //           left: MediaQuery.of(context).size.width * 0.08),
//                   //       child: ElevatedButton(
//                   //         onPressed: () {
//                   //           Navigator.pop(context);
//                   //         },
//                   //         style: ElevatedButton.styleFrom(
//                   //           elevation: 4,
//                   //           backgroundColor: Colors.transparent,
//                   //           // foregroundColor: Colors.white,
//                   //           shape: RoundedRectangleBorder(
//                   //             borderRadius: BorderRadius.circular(17), // Set border radius of 3
//                   //             side: const BorderSide(
//                   //               color: Colors.white,
//                   //             ),
//                   //           ),
//                   //         ),
//                   //         child: Row(
//                   //           mainAxisAlignment: MainAxisAlignment.start,
//                   //           children:  [
//                   //             Icon(Icons.arrow_back_rounded,size: MediaQuery.of(context).size.height*0.05,),
//                   //             SizedBox(width: 8),
//                   //             Text('Go back'),
//                   //           ],
//                   //         ),
//                   //       )
//                   //   ),
//                   // ),
//                   SizedBox(
//                     width: MediaQuery.of(context).size.width * 0.03,
//                   ),
//                   const Spacer(),
//                   const AutoSizeText(
//                     "Recent orders ",
//                     style: TextStyle(color: Colors.white, fontSize: 50),
//                   ),
//                   const Spacer(
//                     flex: 2,
//                   ),
//                 ],
//               ),
//             ),
//             // SizedBox(
//             //   height: MediaQuery.of(context).size.height * 0.01,
//             // ),
//             Padding(
//               padding: EdgeInsets.only(left: width * 0.13, right: width * 0.13),
//               child: Row(
//                 children: [
//                   const Padding(
//                     padding: EdgeInsets.only(left: 18.0),
//                     child: Text(
//                       "Date",
//                       textAlign: TextAlign.start,
//                       style: TextStyle(fontSize: 20),
//                     ),
//                   ),
//                   Padding(
//                     padding: EdgeInsets.only(
//                         left: MediaQuery.of(context).size.width * 0.06,
//                         right: 8),
//                     child: const Text(
//                       "Time",
//                       style: TextStyle(fontSize: 20),
//                     ),
//                   ),
//                   Padding(
//                     padding: EdgeInsets.only(
//                         left: MediaQuery.of(context).size.width * 0.04,
//                         right: 8),
//                     child: const Text(
//                       "Status",
//                       style: TextStyle(fontSize: 20),
//                     ),
//                   ),
//                   // Spacer(flex: 5,)
//                 ],
//               ),
//             ),
// FutureBuilder(
//     future: client.getRecentOrder(AppConstants.username),
//     builder: (context, snapshot) {
//       if (snapshot.connectionState == ConnectionState.waiting) {
//         return CircularProgressIndicator();
//       } else if (snapshot.hasData) {
//         return Expanded(
//           child: Padding(
//             padding: EdgeInsets.only(
//                 left: width * 0.13, right: width * 0.13),
//             child: ListView.builder(
//                 itemCount: snapshot.data?.data?.length,
//                 itemBuilder: (_, index) {
//                   // final item = _items[index];
//                   return Container(
//                       color: index % 2 == 0
//                           ? const Color(0xff5A5858)
//                           : const Color(0xff424242),
//                       // height: 50,
//                       child: customRecentOrderListExpanded(
//                           context,
//                           listgroup,
//                           (snapshot.data?.data ?? [])[index]));
//                 }),
//           ),
//         );
//       } else {
//         return Container();
//       }
//     }),

//             // Spacer(),
//             const SizedBox(
//               height: 10,
//             ),
//             // Spacer(),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: [
//                 SizedBox(
//                   width: MediaQuery.of(context).size.width * 0.08,
//                 ),
//                 Row(
//                   children: [
//                     Container(
//                       decoration: BoxDecoration(
//                         shape: BoxShape.circle,
//                         border: Border.all(
//                           color: Colors.white,
//                           width: 2,
//                         ),
//                       ),
//                       child: const CircleAvatar(
//                         radius: 16,
//                         backgroundColor: Colors.transparent,
//                         child: Padding(
//                           padding: EdgeInsets.all(5.0),
//                           child: Image(
//                               image: AssetImage(
//                                   "image/iconmonstr-headphones-4.png")),
//                         ),
//                       ),
//                     ),
//                     const SizedBox(
//                       // height: MediaQuery.of(context).size.width,
//                       child: AutoSizeText(
//                         "Need Assistance?",
//                         style: TextStyle(color: Colors.white),
//                       ),
//                     )
//                   ],
//                 ),
//               ],
//             ),
// // Spacer(),
//             Padding(
//               padding: const EdgeInsets.only(left: 8.0, right: 8),
//               child: SizedBox(
//                 width: MediaQuery.of(context).size.width * 0.5,
//                 height: MediaQuery.of(context).size.height * 0.05,
//                 child: Align(
//                   alignment: Alignment.center,
//                   child: AutoSizeText(
//                     "Copyright 2023 © German Experts. All Rights Reserved",
//                     style: GoogleFonts.inter(
//                       textStyle: const TextStyle(color: Color(0xffFFFFFF)),
//                     ),
//                     maxLines: 1,
//                     minFontSize: 2,
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ));
//   }
// }
import 'dart:ffi';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:ge_assistant/Constants/appconst.dart';
import 'package:ge_assistant/Constants/popupmenu.dart';
import 'package:ge_assistant/Screens/EndPantrymenu/Desktop_end_pantrymenu.dart';
import 'package:ge_assistant/widget/recentorderslist.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';

import '../../Constants/recentorderslist.dart';
import '../../widget/alert_box_needassis.dart';
import '../End userselection page/EmdUserSelectionDesktop.dart';

class DesktopRecentOrder extends StatefulWidget {
  const DesktopRecentOrder({Key? key}) : super(key: key);

  @override
  State<DesktopRecentOrder> createState() => _DesktopRecentOrderState();
}

class _DesktopRecentOrderState extends State<DesktopRecentOrder> {
  List time = [
    "09:00 AM",
    "09:00 AM",
    "09:00 AM",
    "09:00 AM",
  ];
  List date = [
    "13-12-23",
    "13-12-23",
    "13-12-23",
    "13-12-23",
  ];
  List image = [
    "image/iconmonstr-time-15.png",
    "image/iconmonstr-check-mark-lined.png",
    "image/iconmonstr-check-mark-circle-lined.png",
    "image/iconmonstr-x-mark-circle-lined.png",
  ];
  var listgroup = AutoSizeGroup();
  var headgroup = AutoSizeGroup();
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: Colors.black87,
        // backgroundColor: Colors.white,
        // appBar: AppBar(
        //   title: Text('image/end user directory banner.jpg'),
        // ),
        body: Column(
          children: [
            Container(
                width: double.maxFinite,
                height: MediaQuery.of(context).size.height * 0.25,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                  image:
                      AssetImage("image/end user pantry banner darkened.jpg"),
                  fit: BoxFit.fill,
                )),
                child: Column(
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
                                        "Hello ${AppConstants.name}"
                                            .toUpperCase(),
                                        style: const TextStyle(
                                            color: Colors.black),
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
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * .15,
                      // color: Colors.blue,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                AutoSizeText(
                                  "Pantry Service",
                                  style: GoogleFonts.inriaSerif(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 45,
                                      color: Colors.white),
                                  minFontSize: 5,
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                )),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.018,
            ),
            SizedBox(
              // color: Colors.yellow,
              // height: MediaQuery.of(context).size.height * 0.05,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: Padding(
                        padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width * 0.13),
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          style: ElevatedButton.styleFrom(
                            elevation: 4,
                            backgroundColor: const Color(0xff303030),
                            // foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  17), // Set border radius of 3
                              side: const BorderSide(
                                color: Colors.white,
                              ),
                            ),
                          ),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(Icons.arrow_back_rounded),
                              SizedBox(width: 8),
                              Text('Go back'),
                            ],
                          ),
                        )),
                  ),
                ],
              ),
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AutoSizeText(
                  "Recent orders ",
                  style: TextStyle(color: Colors.white, fontSize: 36),
                  minFontSize: 20,
                  maxLines: 1,
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.018,
            ),
            Padding(
              padding: EdgeInsets.only(left: width * 0.13, right: width * 0.13),
              child: Container(
                // color: Colors.green,
                child: Row(
                  children: [
                    const SizedBox(
                      width: 18,
                    ),
                    Container(
                        width: width > 944 ? width * .1 : width * .1,
                        // color: Colors.red,
                        child: const AutoSizeText(
                          "Date",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 20),
                          // group: listgroup,
                          minFontSize: 8,
                        )),
                    Container(
                        width: width > 944 ? width * .08 : width * .08,
                        // color: Colors.yellow,
                        child: const AutoSizeText(
                          "Time",
                          style: TextStyle(fontSize: 20),
                          //group: listgroup,
                          textAlign: TextAlign.center,
                          minFontSize: 8,
                        )),
                    const Spacer(),
                    Container(
                        width: width * 0.1,
                        // color: Colors.blue,
                        child: const AutoSizeText(
                          "Status",
                          style: TextStyle(fontSize: 20),
                          //group: listgroup,
                          textAlign: TextAlign.center,
                          minFontSize: 8,
                        )),
                    const Spacer(
                      flex: 2,
                    ),
                    // Spacer(flex: 5,)
                    const SizedBox(
                      width: 180,
                    )
                  ],
                ),
              ),
            ),
            FutureBuilder(
                future: client.getRecentOrder(AppConstants.username),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  } else if (snapshot.hasData) {
                    return Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: width * 0.13, right: width * 0.13),
                        child: ListView.builder(
                            itemCount: snapshot.data?.data?.length,
                            itemBuilder: (_, index) {
                              // final item = _items[index];
                              return Container(
                                  color: index % 2 == 0
                                      ? const Color(0xff5A5858)
                                      : const Color(0xff424242),
                                  // height: 50,
                                  child:
                                      //     context,
                                      //     listgroup,
                                      //     date[index],
                                      //     time[index],
                                      //     image[index])
                                      customRecentOrderListExpanded(
                                          context,
                                          listgroup,
                                          (snapshot.data?.data ?? [])[index]));
                            }),
                      ),
                    );
                  } else {
                    return Container();
                  }
                }),
            // Spacer(),
            const SizedBox(
              height: 10,
            ),
            // Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.08,
                ),
                InkWell(
                  onTap: () {
                    AppConstants.pantryId != null
                        ? AppConstants.usercategoryId == 1 ||
                                AppConstants.usercategoryId == 2
                            ?   showAssistanceSuccessDialog(context)
                            : alert(context, "User Restricted",
                                "Please Contact Administrator")
                        : alert(context, "User Restricted",
                            "Please Contact Administrator");
                  },
                  child: Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.white,
                            width: 2,
                          ),
                        ),
                        child: const CircleAvatar(
                          radius: 16,
                          backgroundColor: Colors.transparent,
                          child: Padding(
                            padding: EdgeInsets.all(5.0),
                            child: Image(
                                image: AssetImage(
                                    "image/iconmonstr-headphones-4.png")),
                          ),
                        ),
                      ),
                      const SizedBox(
                        // height: MediaQuery.of(context).size.width,
                        child: AutoSizeText(
                          "Need Assistance?",
                          style: TextStyle(color: Colors.white),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
// Spacer(),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8),
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.5,
                height: MediaQuery.of(context).size.height * 0.05,
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
        ));
  }
}
