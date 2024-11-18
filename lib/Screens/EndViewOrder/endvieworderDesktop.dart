// import 'package:auto_size_text/auto_size_text.dart';
// import 'package:flutter/material.dart';
// import 'package:ge_assistant/Screens/EndPantrymenu/Desktop_end_pantrymenu.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:provider/provider.dart';

// import '../../Constants/alertdylog_order_success.dart';
// import '../../provider/service_provider.dart';

// class EndViewOrderDeskTop extends StatelessWidget {
//   const EndViewOrderDeskTop({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     List test = [1, 2, 3, 4, 5, 6, 7];
//     List pantryItems = [
//       "Espresso",
//       "Cappuccino",
//       "Americano",
//       "Cappuccino with chocolate",
//       "Hot Chocolate",
//       "Mochaccino",
//       "Cardomom tea",
//       "Espresso Macchiato",
//     ];
//     final List<Map<String, dynamic>> orderDetails = [];

//     final cartProvider = Provider.of<CartProvider>(context);
//     final cartItems = cartProvider.cartItems;
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
//                         Container(
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
//                             child: Container(
//                               // color: Colors.yellow,
//                               child: Row(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 crossAxisAlignment: CrossAxisAlignment.center,
//                                 children: [
//                                   AutoSizeText(
//                                     "Pantry Service",
//                                     style: GoogleFonts.inriaSerif(
//                                         fontWeight: FontWeight.bold,
//                                         fontSize: 40,
//                                         color: Colors.white),
//                                     minFontSize: 5,
//                                   )
//                                 ],
//                               ),
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
//             Container(
//               // color: Colors.yellow,
//               height: MediaQuery.of(context).size.height * 0.10,
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 crossAxisAlignment: CrossAxisAlignment.end,
//                 children: [
//                   Align(
//                     alignment: Alignment.topCenter,
//                     child: Padding(
//                         padding: EdgeInsets.only(
//                             left: MediaQuery.of(context).size.width * 0.08),
//                         child: SizedBox(
//                           height: MediaQuery.of(context).size.height * 0.029,
//                           child: ElevatedButton(
//                             onPressed: () {
//                               Navigator.pop(context);
//                             },
//                             style: ElevatedButton.styleFrom(
//                               elevation: 4,
//                               backgroundColor: Colors.transparent,
//                               // foregroundColor: Colors.white,
//                               shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(
//                                     17), // Set border radius of 3
//                                 side: const BorderSide(
//                                   color: Colors.white,
//                                 ),
//                               ),
//                             ),
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.start,
//                               children: [
//                                 Icon(
//                                   Icons.arrow_back_rounded,
//                                   size:
//                                       MediaQuery.of(context).size.height * 0.03,
//                                 ),
//                                 SizedBox(width: 8),
//                                 Text('Go back'),
//                               ],
//                             ),
//                           ),
//                         )),
//                   ),
//                   SizedBox(
//                     width: MediaQuery.of(context).size.width * 0.03,
//                   ),
//                   Spacer(),
//                   Align(
//                       alignment: Alignment.center,
//                       child: AutoSizeText(
//                         "View Orders",
//                         style: TextStyle(color: Colors.white, fontSize: 33),
//                       )),
//                   Spacer(
//                     flex: 2,
//                   ),
//                 ],
//               ),
//             ),
//             Expanded(
//               child: Padding(
//                 padding: EdgeInsets.only(
//                   left: MediaQuery.of(context).size.width * 0.268,
//                   right: MediaQuery.of(context).size.width * 0.268,
//                 ),
//                 child: ListView.builder(
//                     itemCount: cartItems.length,
//                     itemBuilder: (cntxt, index) {
//                       final cartItem = cartItems[index];
//                       // Add order details dynamically

//                       // print(orderDetails);
//                       return Padding(
//                         padding: const EdgeInsets.only(bottom: 10.0),
//                         child: Container(
//                           height: MediaQuery.of(context).size.height * 0.11,
//                           decoration: BoxDecoration(
//                             color: Color(0xff3E3E3E),
//                             borderRadius: BorderRadius.circular(10),
//                           ),
//                           // width: MediaQuery.of(context).size.width*0.05,
//                           child: Padding(
//                             padding: const EdgeInsets.all(3.0),
//                             child: Row(
//                               crossAxisAlignment: CrossAxisAlignment.center,
//                               children: [
//                                 Image(
//                                     image: NetworkImage(
//                                         cartItem.item.itemimgpath ?? "")),
//                                 Expanded(
//                                     child: AutoSizeText(
//                                   cartItem.item.itemname ?? "",
//                                   style: TextStyle(color: Colors.white),
//                                 )),
//                                 const Spacer(),
//                                 Row(
//                                   children: [
//                                     InkWell(
//                                         onTap: () {
//                                           cartProvider
//                                               .removeFromCart(cartItem.item);
//                                         },
//                                         child: Icon(
//                                           Icons.remove,
//                                           color: Colors.white,
//                                           size: MediaQuery.of(context)
//                                                   .size
//                                                   .width *
//                                               0.015,
//                                         )),
//                                     Padding(
//                                       padding: const EdgeInsets.all(8.0),
//                                       child: Container(
//                                         decoration: BoxDecoration(
//                                           shape: BoxShape.circle,
//                                           border: Border.all(
//                                             color: Colors
//                                                 .white, // Replace with your desired border color
//                                             width:
//                                                 2, // Replace with your desired border width
//                                           ),
//                                         ),
//                                         child: CircleAvatar(
//                                           radius: MediaQuery.of(context)
//                                                   .size
//                                                   .width *
//                                               0.01,
//                                           backgroundColor: Colors.transparent,
//                                           child: AutoSizeText(
//                                             cartItem.quantity.toString(),
//                                             style:
//                                                 TextStyle(color: Colors.white),
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                     InkWell(
//                                         onTap: () {
//                                           cartProvider.addToCart(cartItem.item);
//                                         },
//                                         child: Icon(
//                                           Icons.add,
//                                           opticalSize: 48,
//                                           weight: 200,
//                                           color: Colors.white,
//                                           size: MediaQuery.of(context)
//                                                   .size
//                                                   .width *
//                                               0.015,
//                                         )),
//                                   ],
//                                 ),
//                                 Align(
//                                     alignment: Alignment.topRight,
//                                     child: InkWell(
//                                       onTap: () {
//                                         cartProvider.removeitem(cartItem.item);
//                                       },
//                                       child: Icon(
//                                         Icons.close,
//                                         color: Colors.white,
//                                         size:
//                                             MediaQuery.of(context).size.width *
//                                                 0.009,
//                                       ),
//                                     ))
//                               ],
//                             ),
//                           ),
//                         ),
//                       );
//                     }),
//               ),
//             ),
//             // SizedBox(
//             //   height: MediaQuery.of(context).size.height * 0.01,
//             // ),
//             // Spacer(),
//             SizedBox(
//               height: 10,
//             ),
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
//                     SizedBox(
//                       // height: MediaQuery.of(context).size.width,
//                       child: const AutoSizeText(
//                         "Need Assistance?",
//                         style: TextStyle(color: Colors.white),
//                       ),
//                     )
//                   ],
//                 ),
//                 SizedBox(
//                   width: MediaQuery.of(context).size.width * 0.1,
//                 ),
//                 Container(
//                     height: MediaQuery.of(context).size.height * 0.1,
//                     width: MediaQuery.of(context).size.width * 0.465,
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     child: TextFormField(
//                       decoration: const InputDecoration(
//                           border: InputBorder.none,
//                           // focusedBorder: OutlineInputBorder(
//                           //   borderSide: BorderSide(color: Colors.white), // Set the focused border color
//                           // ),
//                           // enabledBorder: OutlineInputBorder(
//                           //   borderSide: BorderSide(color: Colors.white), // Set the unfocused border color
//                           // ),
//                           hintText: "Add Note....",
//                           hintStyle: TextStyle(fontWeight: FontWeight.bold),
//                           focusColor: Colors.white),
//                     )),
//                 // Spacer(),
//                 Container(
//                   height: MediaQuery.of(context).size.height * 0.05,
//                   child: ElevatedButton(
//                     onPressed: () {
//                       //showOrderSuccessDialog(context);
//                       for (int i = 0; i < cartItems.length; i++) {
//                         orderDetails.add({
//                           "qty": cartItems[i].quantity,
//                           "menuid": cartItems[i].item.menuid,
//                           "pantryid": "2"
//                         });
//                       }
//                       //print(orderDetails);
//                       client.createOrder(orderDetails, "Remark");
//                       cartItems.clear();
//                     },
//                     style: const ButtonStyle(
//                         backgroundColor:
//                             MaterialStatePropertyAll(Colors.white)),
//                     child: const Text(
//                       "Place Order",
//                       style: TextStyle(color: Colors.black),
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   width: MediaQuery.of(context).size.width * 0.07,
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

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:ge_assistant/Constants/appconst.dart';
import 'package:ge_assistant/provider/service_provider.dart';
import 'package:ge_assistant/services/apiservices.dart';
import 'package:ge_assistant/widget/alert_box_needassis.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../Constants/alertdylog_order_success.dart';
import '../../Constants/popupmenu.dart';
import '../End userselection page/EmdUserSelectionDesktop.dart';

class EndViewOrderDeskTop extends StatelessWidget {
  const EndViewOrderDeskTop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List test = [1, 2, 3, 4, 5, 6, 7];
    List pantryItems = [
      "Espresso",
      "Cappuccino",
      "Americano",
      "Cappuccino with chocolate",
      "Hot Chocolate",
      "Mochaccino",
      "Cardomom tea",
      "Espresso Macchiato",
    ];
    ApiProvider client = ApiProvider();

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    final List<Map<String, dynamic>> orderDetails = [];

    final cartProvider = Provider.of<CartProvider>(context);
    final cartItems = cartProvider.cartItems;
    final TextEditingController _remarkController = TextEditingController();

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
                                        style: TextStyle(color: Colors.black),
                                      ),
                                      Icon(Icons.close)
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
                            child: Container(
                              // color: Colors.yellow,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  AutoSizeText(
                                    "Pantry Service",
                                    style: GoogleFonts.inriaSerif(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 40,
                                        color: Colors.white),
                                    minFontSize: 5,
                                  )
                                ],
                              ),
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
            // ===================================new methord==========================================================
            Expanded(
              child: Row(
                children: [
                  // =====================================================first column===========================
                  Expanded(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              const Spacer(),
                              Align(
                                alignment: Alignment.topCenter,
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
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(Icons.arrow_back_rounded),
                                      SizedBox(width: 8),
                                      Text('Go back'),
                                    ],
                                  ),
                                ),
                              ),
                              const Spacer()
                            ],
                          ),
                          InkWell(
                            onTap: () {
                              AppConstants.pantryId != null
                                  ? AppConstants.usercategoryId == 1 ||
                                          AppConstants.usercategoryId == 2
                                      ? showAssistanceSuccessDialog(context)
                                      : alert(context, "User Restricted",
                                          "Please Contact Administrator")
                                  : alert(context, "User Restricted",
                                      "Please Contact Administrator");
                            },
                            child: Align(
                              alignment: Alignment.topCenter,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
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
                          ),
                        ]),
                  ),
                  // ===============================================second column=============================================
                  Expanded(
                    flex: 2,
                    child: Column(
                      children: [
                        SizedBox(
                          height: height * .025,
                        ),
                        const Align(
                            alignment: Alignment.center,
                            child: AutoSizeText(
                              "View Orders",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 33),
                            )),
                        const SizedBox(
                          height: 10,
                        ),
                        Expanded(
                          child: Container(
                            width: double.maxFinite,
                            child: ListView.builder(
                                itemCount: cartItems.length,
                                itemBuilder: (cntxt, index) {
                                  print(cartItems[index].quantity);
                                  return Padding(
                                    padding:
                                        const EdgeInsets.only(bottom: 10.0),
                                    child: Container(
                                      height: height > 676
                                          ? MediaQuery.of(context).size.height *
                                              0.1
                                          : 0.08,
                                      decoration: BoxDecoration(
                                        color: const Color(0xff3E3E3E),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      // width: MediaQuery.of(context).size.width*0.05,
                                      child: Padding(
                                        padding: const EdgeInsets.all(3.0),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            SizedBox(
                                              height: height * .08,
                                              child: Align(
                                                alignment: Alignment.center,
                                                child: Image(
                                                    image: NetworkImage(
                                                        cartItems[index]
                                                                .item
                                                                .itemimgpath ??
                                                            "")),
                                              ),
                                            ),
                                            SizedBox(
                                              height: height * .08,
                                              child: Center(
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 8.0),
                                                  child: AutoSizeText(
                                                    cartItems[index]
                                                            .item
                                                            .itemname ??
                                                        "",
                                                    style: const TextStyle(
                                                        color: Colors.white),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            const Spacer(),
                                            Row(
                                              children: [
                                                InkWell(
                                                    onTap: () {
                                                      cartProvider
                                                          .removeFromCart(
                                                              cartItems[index]
                                                                  .item);
                                                    },
                                                    child: Icon(
                                                      Icons.remove,
                                                      color: Colors.white,
                                                      size: width > 1080
                                                          ? MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width *
                                                              0.015
                                                          : 15,
                                                    )),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      border: Border.all(
                                                        color: Colors
                                                            .white, // Replace with your desired border color
                                                        width:
                                                            2, // Replace with your desired border width
                                                      ),
                                                    ),
                                                    child: CircleAvatar(
                                                      radius: width > 1080
                                                          ? MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width *
                                                              0.01
                                                          : 11,
                                                      backgroundColor:
                                                          Colors.transparent,
                                                      child: AutoSizeText(
                                                        cartItems[index]
                                                            .quantity
                                                            .toString(),
                                                        style: const TextStyle(
                                                            color:
                                                                Colors.white),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                InkWell(
                                                    onTap: () {
                                                      cartProvider.addToCart(
                                                          cartItems[index]
                                                              .item);
                                                    },
                                                    child: Icon(
                                                      Icons.add,
                                                      opticalSize: 48,
                                                      weight: 200,
                                                      color: Colors.white,
                                                      size: width > 1080
                                                          ? MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width *
                                                              0.015
                                                          : 15,
                                                    )),
                                              ],
                                            ),
                                            InkWell(
                                              onTap: () {
                                                cartProvider.removeitem(
                                                    cartItems[index].item);
                                              },
                                              child: const Align(
                                                  alignment: Alignment.topRight,
                                                  child: Icon(Icons.close,
                                                      color: Colors.red,
                                                      size: 15
                                                      // width>1080? MediaQuery.of(context).size.width*0.009 : 10,
                                                      )),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                }),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Container(
                            height: MediaQuery.of(context).size.height * 0.1,
                            // width: MediaQuery.of(context).size.width*0.465,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: TextFormField(
                              controller: _remarkController,
                              style: const TextStyle(color: Colors.black),
                              decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  // focusedBorder: OutlineInputBorder(
                                  //   borderSide: BorderSide(color: Colors.white), // Set the focused border color
                                  // ),
                                  // enabledBorder: OutlineInputBorder(
                                  //   borderSide: BorderSide(color: Colors.white), // Set the unfocused border color
                                  // ),
                                  hintText: "  Add Note....",
                                  hintStyle: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                  focusColor: Colors.black),
                            )),
                      ],
                    ),
                  ),

                  // ====================================================third column================================================
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Row(
                          children: [
                            MediaQuery.of(context).size.width > 800
                                ? const Spacer(flex: 8)
                                : const Spacer(flex: 1),
                            ElevatedButton(
                              onPressed: () {
                                for (int i = 0; i < cartItems.length; i++) {
                                  orderDetails.add({
                                    "qty": cartItems[i].quantity,
                                    "menuid": cartItems[i].item.menuid,
                                    "pantryid": AppConstants.pantryId.toString()
                                  });
                                }
                                // //print(orderDetails);
                                // client.createOrder(orderDetails, "Remark");
                                // cartItems.clear();
                                showOrderSuccessDialog(context, orderDetails,
                                    _remarkController.text ?? "");
                              },
                              style: ButtonStyle(
                                  backgroundColor: cartProvider
                                          .cartItems.isNotEmpty
                                      ? MaterialStatePropertyAll(Colors.white)
                                      : MaterialStatePropertyAll(
                                          Colors.grey.shade900)),
                              child: const Text(
                                "Place Order",
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                            const Spacer()
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            // SizedBox(
            //   height: MediaQuery.of(context).size.height * 0.01,
            // ),
            // Spacer(),
            // SizedBox(height: 10,),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.start,
            //   children: [
            //     // SizedBox(
            //     //   width: MediaQuery.of(context).size.width * 0.08,
            //     // ),
            //     // SizedBox(width: width*0.08,),
            //
            //     // SizedBox(
            //     //   width: MediaQuery.of(context).size.width * 0.1,
            //     // ),
            //     // SizedBox(width: width*0.09,),
            //     // SizedBox(width: width*0.08,),
            //
            //
            //     SizedBox(
            //       width: MediaQuery.of(context).size.width * 0.07,
            //     ),
            //   ],
            // ),
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
