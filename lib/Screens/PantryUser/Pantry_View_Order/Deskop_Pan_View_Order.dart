import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:ge_assistant/Constants/appconst.dart';
import 'package:ge_assistant/widget/customacceptedItems.dart';
import 'package:ge_assistant/widget/customlistviewOrder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../../../Constants/popupmenu.dart';
import '../../../services/apiservices.dart';
import '../notification/notification.dart';

class DesktopPantryViewOrder extends StatefulWidget {
  const DesktopPantryViewOrder({Key? key}) : super(key: key);

  @override
  State<DesktopPantryViewOrder> createState() => _DesktopPantryViewOrderState();
}

late TabController _tabController;

class _DesktopPantryViewOrderState extends State<DesktopPantryViewOrder>
    with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.animateTo(0);
  }

  ApiProvider client = ApiProvider();
  var itemListGroup = AutoSizeGroup();
  @override
  Widget build(BuildContext context) {
    var headingGroup = AutoSizeGroup();
    List catGory = ["Coffee", "Tea", "Coffee"];
    List catItem = ["Cappuccino", "Green tea", "Americano"];
    List itemQuantity = ["3", "2", "1"];
    print(AppConstants.userPantryId);
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
                  image: AssetImage(
                      "image/rohit-khadgi-lEbR6nR8V1A-unsplash (2).jpg"),
                  fit: BoxFit.cover,
                  alignment: Alignment(0.0, 0.3),
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
                          child: Row(
                            children: [
                              PopUpMen(
                                menuList: [
                                  PopupMenuItem(
                                      child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Hello ${AppConstants.name}",
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          Icon(Icons.close)
                                        ],
                                      ),
                                      const PopupMenuItem(
                                        value: 2,
                                        child: ListTile(
                                          title: Text("Completed Orders",
                                              style: TextStyle(
                                                  color: Colors.black)),
                                        ),
                                      ),
                                      const PopupMenuItem(
                                        value: 1,
                                        child: ListTile(
                                          leading: Icon(
                                            Icons.logout,
                                          ),
                                          title: Text("LogOut",
                                              style: TextStyle(
                                                  color: Colors.black)),
                                        ),
                                      ),
                                    ],
                                  )),
                                ],
                                icon: const Icon(
                                  Icons.menu,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(
                                width: 25,
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const Notificationpage()));
                                },
                                child: Icon(
                                  Icons.notifications_active_sharp,
                                  color: Colors.white,
                                  size:
                                      MediaQuery.of(context).size.shortestSide *
                                          .03,
                                ),
                              ),
                            ],
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
                                    "The Pantry",
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
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.03,
                  ),
                  Expanded(
                    flex: 2,
                    child: SizedBox(
                      // height: 1200,
                      child: TabBar(
                        indicatorWeight: 4,
                        indicatorColor: Colors.white,
                        indicatorSize: TabBarIndicatorSize.label,
                        indicatorPadding: const EdgeInsets.all(10),
                        controller: _tabController,
                        tabs: const [
                          Tab(
                            child: Padding(
                              padding: EdgeInsets.all(11.0),
                              child: AutoSizeText(
                                "Pending",
                                maxLines: 1,
                                minFontSize: 15,
                                style: TextStyle(fontSize: 30),
                              ),
                            ),
                          ),
                          Tab(
                            child: Padding(
                              padding: EdgeInsets.all(11.0),
                              child: AutoSizeText(
                                "Accepted",
                                maxLines: 1,
                                minFontSize: 15,
                                style: TextStyle(fontSize: 30),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // SizedBox(
            //   height: MediaQuery.of(context).size.height * 0.01,
            // ),
            // Spacer(),
            Container(
              height: 1,
              width: double.maxFinite,
              color: Colors.white,
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.09,
                  right: MediaQuery.of(context).size.width * 0.09),
              child: Row(
                children: [
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const SizedBox(
                          width: 17,
                        ),
                        Expanded(
                            child: AutoSizeText(
                          "Date & Time",
                          textAlign: TextAlign.center,
                          style: const TextStyle(fontSize: 18),
                          maxLines: 1,
                          group: headingGroup,
                        )),
                        Expanded(
                            child: AutoSizeText(
                          "Office & Extension ",
                          textAlign: TextAlign.center,
                          style: const TextStyle(fontSize: 18),
                          maxLines: 1,
                          group: headingGroup,
                        )),
                      ],
                    ),
                  ),
                  Expanded(
                    child: SizedBox(
                      // color: Colors.green,
                      width: 100,
                      height: 40,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const SizedBox(
                            width: 8,
                          ),
                          Expanded(
                              child: AutoSizeText(
                            "Category",
                            textAlign: TextAlign.center,
                            style: const TextStyle(fontSize: 18),
                            maxLines: 1,
                            group: headingGroup,
                            minFontSize: 10,
                          )),
                          Expanded(
                              child: AutoSizeText(
                            "Item",
                            textAlign: TextAlign.center,
                            style: const TextStyle(fontSize: 18),
                            maxLines: 1,
                            group: headingGroup,
                            minFontSize: 8,
                          )),
                          Expanded(
                              child: AutoSizeText(
                            "Quantity",
                            textAlign: TextAlign.center,
                            style: const TextStyle(fontSize: 18),
                            maxLines: 1,
                            group: headingGroup,
                            minFontSize: 8,
                          )),
                          const SizedBox(
                            width: 120,
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 1,
              width: double.maxFinite,
              color: Colors.white,
            ),
            const SizedBox(
              height: 10,
            ),
            // Text(MediaQuery.of(context).size.width.toString()),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  pantryViewOrderPendingList(
                    context,
                  ),
                  pantryViewOrderAcceptedList(
                    context,
                  )
                  // pantryViewOrderList(context,catGory,catItem,itemQuantity) ?? const Text("Null"),
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

  // ================================================Accepted order API =============================
  pantryViewOrderAcceptedList(BuildContext context) {
    return FutureBuilder(
        future: client.acceptedOrderByPantry(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return SizedBox(
              height: MediaQuery.of(context).size.height * .1,
              child: const Center(
                  child: Image(
                      image: AssetImage("image/ge office assistant.gif"))),
            );
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          } else if (snapshot.hasData) {
            return ListView.builder(
                padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.09,
                    right: MediaQuery.of(context).size.width * 0.09),
                itemCount: snapshot.data?.data?.length,
                itemBuilder: (BuildContext context, int index) {
                  DateFormat inputFormat = DateFormat('yyyy-MM-dd hh:mm:ss a');
                  DateTime dateTime = inputFormat
                      .parse(snapshot.data?.data?[index].createdAt ?? "");
                  String formattedTime = DateFormat('h:mm a').format(dateTime);
                  String formatdate = DateFormat("dd-MM-yyyy").format(dateTime);
                  return customListViewAcceptedOrder(
                      context,
                      (snapshot.data?.data ?? [])[index],
                      formatdate,
                      formattedTime,
                      index,
                      itemListGroup);
                });
          }
          return Container();
        });
  }

  // =================================================pending=======================================================

  pantryViewOrderPendingList(BuildContext context) {
    return FutureBuilder(
        future: client.pendingOrderForPantry(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return SizedBox(
              height: MediaQuery.of(context).size.height * .1,
              child: const Center(
                  child: Image(
                      image: AssetImage("image/ge office assistant.gif"))),
            );
          } else if (snapshot.hasError) {
            print(snapshot.error);
          } else if (snapshot.hasData) {
            if (snapshot.data?.data?.length == 0) {
              return const Center(child: Text("Please Check Accepted Orders"));
            } else {
              return ListView.builder(
                  padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.09,
                      right: MediaQuery.of(context).size.width * 0.09),
                  itemCount: snapshot.data?.data?.length,
                  itemBuilder: (BuildContext context, int index) {
                    // DateTime dateTime = DateTime.parse(
                    //      ?? "");
                    // String date = DateFormat('dd-MM-yyyy').format(dateTime);
                    // String formattedTime = DateFormat('HH:mm').format(dateTime);
                    DateFormat inputFormat =
                        DateFormat('yyyy-MM-dd hh:mm:ss a');
                    DateTime dateTime = inputFormat
                        .parse(snapshot.data?.data?[index].createdAt ?? "");
                    String formattedTime =
                        DateFormat('h:mm a').format(dateTime);
                    String formatdate =
                        DateFormat("dd-MM-yyyy").format(dateTime);
                    return customListVieworder(
                        context,
                        (snapshot.data?.data ?? [])[index],
                        formatdate,
                        formattedTime,
                        index,
                        itemListGroup);
                  });
            }
          }
          return Container();
        });
  }

  // =============================================changing order status==================================================

  changeStatusOfTheOrder(BuildContext context, orderId, stOrderId, modifiedBy) {
    return FutureBuilder(
        future: client.changeOrderStatus(orderId, stOrderId, modifiedBy),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            print("running");
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            print(snapshot.error);
          } else if (snapshot.hasData) {
            if (snapshot.data?.messagecode == "1001") {
              setState(() {});
            }
          }
          return Container();
        });
  }

  // alertbox(context, orderId, statusOrderId, modifiedBy) {
  //   return showDialog<void>(
  //     context: context,
  //     barrierDismissible: false, // user must tap button!
  //     builder: (BuildContext context) {
  //       return AlertDialog(
  //         title: const Text('AlertDialog Title'),
  //         content: SingleChildScrollView(
  //             child: FutureBuilder(
  //                 future: client.changeOrderStatus(
  //                     orderId, statusOrderId, modifiedBy),
  //                 builder: (context, snapshot) {
  //                   if (snapshot.connectionState == ConnectionState.waiting) {
  //                     //  print("running");
  //                     return const Center(child: CircularProgressIndicator());
  //                   } else if (snapshot.hasError) {
  //                     print(snapshot.error);
  //                   } else if (snapshot.hasData) {
  //                     if (snapshot.data?.messagecode == "1001") {
  //                       WidgetsBinding.instance.addPostFrameCallback((_) {
  //                         setState(() {});
  //                         Navigator.pop(context);
  //                       });
  //                     }
  //                   }
  //                   return Container();
  //                 })),
  //       );
  //     },
  //   );
  // }
   
}


