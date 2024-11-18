import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:ge_assistant/Constants/appconst.dart';
import 'package:ge_assistant/Screens/EndUser_RecentOrders/BasePage_RecentOrders.dart';
import 'package:ge_assistant/Screens/EndViewOrder/EndViewOrderBasePage.dart';
import 'package:ge_assistant/models/endusermenumodel.dart';
import 'package:ge_assistant/models/inventorylistmodel.dart';
import 'package:ge_assistant/widget/alert_box_needassis.dart';
import 'package:ge_assistant/widget/customgirdofItems.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import '../../Constants/popupmenu.dart';
import '../../provider/service_provider.dart';
import '../../services/apiservices.dart';
import '../End userselection page/EmdUserSelectionDesktop.dart';
import '../End userselection page/EndUserSelectionBasePage.dart';

class DesktopEndPantryMenu extends StatefulWidget {
  const DesktopEndPantryMenu({Key? key}) : super(key: key);

  @override
  State<DesktopEndPantryMenu> createState() => _DesktopEndPantryMenuState();
}

late TabController _tabController;
ApiProvider client = ApiProvider();
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

late Future<Inventoryresponse> endUserMenu;

class _DesktopEndPantryMenuState extends State<DesktopEndPantryMenu>
    with TickerProviderStateMixin {
  @override
  void initState() {
    // TODO: implement initState
    endUserMenu = client.getmenuInventoryList();
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    _tabController.animateTo(0);
  }

  var itemNameGroup = AutoSizeGroup();
  var categoryGroup = AutoSizeGroup();
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    final padding = MediaQuery.of(context).padding;

    final cartProvider = Provider.of<CartProvider>(context);
    print(AppConstants.pantryId);
    return Scaffold(
        // backgroundColor: Colors.black87,
        backgroundColor: const Color(0xff303030),
        body: Column(
          children: [
            Container(
                width: double.maxFinite,
                height: MediaQuery.of(context).size.height * 0.25,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                  image:
                      AssetImage("image/end user pantry banner darkened.jpg"),
                  fit: BoxFit.cover,
                )),
                child: SafeArea(
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
                                right:
                                    MediaQuery.of(context).size.width * 0.03),
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
                                          fontSize: 45,
                                          color: Colors.white),
                                      maxLines: 2,
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
                  ),
                )),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.018,
            ),
            SizedBox(
              // color: Colors.yellow,
              height: MediaQuery.of(context).size.height * 0.08,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: Padding(
                        padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width * 0.08),
                        child: ElevatedButton(
                          onPressed: () {
                            cartProvider.cartItems.clear();
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const EndUserSelectioBasePage()));
                            // Navigator.pop(context);
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
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(Icons.arrow_back_rounded),
                              SizedBox(width: 8),
                              Text(
                                'Go back',
                                style: GoogleFonts.inriaSerif(),
                              ),
                            ],
                          ),
                        )),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.03,
                  ),

                  Align(
                    alignment: Alignment.bottomCenter,
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width > 890
                          ? MediaQuery.of(context).size.width * 0.3
                          : MediaQuery.of(context).size.width * 0.5,
                      child: TabBar(
                        labelColor: Colors.black,
                        unselectedLabelColor: Colors.white,
                        labelPadding: EdgeInsets.all(0),
                        labelStyle: GoogleFonts.inriaSerif(
                          textStyle: const TextStyle(color: Colors.black),
                        ),
                        //For Selected tab
                        unselectedLabelStyle: GoogleFonts.inriaSerif(
                          textStyle: const TextStyle(color: Colors.white),
                        ), //For Un-selected Tabs
                        indicator: BoxDecoration(
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        ),
                        controller: _tabController,
                        tabs: [
                          Tab(
                            child: AutoSizeText(
                              "Coffee",
                              maxLines: 1,
                              minFontSize: 10,
                              group: categoryGroup,
                            ),
                          ),
                          Tab(
                            child: AutoSizeText(
                              "Tea",
                              maxLines: 1,
                              minFontSize: 10,
                              group: categoryGroup,
                            ),
                          ),
                          Tab(
                            child: AutoSizeText(
                              "Water",
                              maxLines: 1,
                              minFontSize: 10,
                              group: categoryGroup,
                            ),
                          ),
                          Tab(
                            child: AutoSizeText(
                              "Pastries",
                              maxLines: 1,
                              minFontSize: 10,
                              group: categoryGroup,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  // ElevatedButton(
                  //   onPressed: () {},
                  //   child: Text(
                  //     "Coffee",
                  //     style: TextStyle(color: Colors.black),
                  //   ),
                  //   style: ButtonStyle(
                  //       backgroundColor:
                  //           MaterialStatePropertyAll(Colors.white)),
                  // ),
                  // ElevatedButton(
                  //   onPressed: () {},
                  //   child: Text("Tea"),
                  //   style: ButtonStyle(
                  //       backgroundColor:
                  //           MaterialStatePropertyAll(Colors.transparent)),
                  // ),
                  // ElevatedButton(
                  //   onPressed: () {},
                  //   child: Text("Water"),
                  //   style: ButtonStyle(
                  //       backgroundColor:
                  //           MaterialStatePropertyAll(Colors.transparent)),
                  // ),
                  // ElevatedButton(
                  //   onPressed: () {},
                  //   child: Text("Pastries"),
                  //   style: ButtonStyle(
                  //       backgroundColor:
                  //           MaterialStatePropertyAll(Colors.transparent)),
                  // ),
                  MediaQuery.of(context).size.width > 800
                      ? const Spacer(flex: 4)
                      : const Spacer(flex: 4),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const BaseRecentOrder()));
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => const BaseRecentOrder()));
                      },
                      style: ButtonStyle(
                        backgroundColor:
                            const MaterialStatePropertyAll(Color(0xff303030)),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(3.0),
                              side: const BorderSide(
                                  color: Colors
                                      .white) // Replace with your desired border color
                              ),
                        ),
                      ),
                      child: const Text("Recent orders"),
                    ),
                  ),
                  const Spacer(),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            // SizedBox(height: MediaQuery.of(context).size.height*0.01,),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  buildGridView(context, cartProvider, "COFFEE"),
                  buildGridView(context, cartProvider, "TEA"),
                  buildGridView(context, cartProvider, "WATER"),
                  buildGridView(context, cartProvider, "PASTRIES"),
                ],
              ),
            ),
            const SizedBox(
              height: 9,
            ),
            Container(
              // color: Colors.yellow,
              child: Row(
                children: [
                  Container(
                    color: Colors.red,
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.075,
                    ),
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
                        // Icon(
                        //   Icons.support_agent,
                        //   color: Colors.white,
                        //   size: MediaQuery.of(context).size.width * 0.03,
                        // ),
                        Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors
                                  .white, // Replace with your desired border color
                              width:
                                  2, // Replace with your desired border width
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
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.005,
                        ),
                        const AutoSizeText(
                          "Need Assistance?",
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                  ),
                  MediaQuery.of(context).size.width > 800
                      ? const Spacer(flex: 8)
                      : const Spacer(flex: 1),
                  ElevatedButton(
                    onPressed: cartProvider.cartItems.isEmpty
                        ? null
                        : () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const EndViewOrderBasePage()));
                          },
                    style: ButtonStyle(
                        backgroundColor: cartProvider.cartItems.isNotEmpty
                            ? MaterialStatePropertyAll(Colors.white)
                            : MaterialStatePropertyAll(Colors.grey.shade600)),
                    child: const Text(
                      "View Order",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  // Spacer(),
                  SizedBox(
                    width: MediaQuery.of(context).size.width > 800
                        ? MediaQuery.of(context).size.width * 0.091
                        : MediaQuery.of(context).size.width * 0.0001,
                  ),
                ],
              ),
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

  buildGridView(BuildContext context, provider, String category) {
    return FutureBuilder(
        future: endUserMenu,
        builder: (context, ssnapshot) {
          if (ssnapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (ssnapshot.hasData) {
            List<Response> filteredItems =
                (ssnapshot.data?.data?.response ?? [])
                    .where((item) => item.categoryname == category)
                    .toList();
            List<Response> activeList =
                filteredItems.where((item) => item.menustatus == 1).toList();
            if (activeList.length == 0) {
              return Center(
                child: Lottie.asset(
                  'image/animation_lk86re3q.json',
                  fit: BoxFit.fill,
                ),
              );
            }
            return Padding(
              padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * .1,
                  right: MediaQuery.of(context).size.width * .1),
              child: ScrollConfiguration(
                behavior:
                    ScrollConfiguration.of(context).copyWith(scrollbars: false),
                child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount:
                            MediaQuery.of(context).size.width > 1000 ? 4 : 3,
                        mainAxisSpacing: 15.0,
                        crossAxisSpacing: 60.0,
                        childAspectRatio: 1.0),
                    itemCount: activeList.length,
                    itemBuilder: (BuildContext context, int index) {
                      print("${activeList.length} active ");
                      return customGirdview(
                        context,
                        activeList[index],
                        itemNameGroup,
                        provider,
                      );

                      //return Container();
                    }),
              ),
            );
            //print(ssnapshot.data?.crmAccesstoken);
          } else if (ssnapshot.hasError) {
            return const Center(
              child: Text('Error'),
            );
          } else {
            const SizedBox.shrink();
          }
          return const SizedBox.shrink();
        });
  }
}
