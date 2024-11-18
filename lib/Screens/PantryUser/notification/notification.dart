import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:ge_assistant/Constants/popupmenu.dart';
import 'package:ge_assistant/widget/customlistnotification.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../../../Constants/appconst.dart';
import '../../../models/pantryusernotification.dart';
import '../../../services/apiservices.dart';

class Notificationpage extends StatefulWidget {
  const Notificationpage({Key? key}) : super(key: key);

  @override
  State<Notificationpage> createState() => _NotificationpageState();
}

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
late TabController _tabController;

class _NotificationpageState extends State<Notificationpage>
    with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.animateTo(0);
  }

  ApiProvider client = ApiProvider();
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
                                            style: const TextStyle(
                                                color: Colors.black),
                                          ),
                                          const Icon(Icons.close)
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
                        ]),
                  ),
                  // ===============================================second column=============================================
                  Expanded(
                    flex: 2,
                    child: Column(
                      children: [
                        const Align(
                            alignment: Alignment.center,
                            child: AutoSizeText(
                              "Notification",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 33),
                            )),
                        const SizedBox(
                          height: 10,
                        ),
                        TabBar(
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
                                  "UnRead",
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
                                  "Read",
                                  maxLines: 1,
                                  minFontSize: 15,
                                  style: TextStyle(fontSize: 30),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Expanded(
                          child: TabBarView(
                            controller: _tabController,
                            children: [
                              SizedBox(
                                  width: double.maxFinite,
                                  child: FutureBuilder(
                                      future: client.pantryNotifications(
                                          AppConstants.username.toString()),
                                      builder: (context, snapshot) {
                                        if (snapshot.connectionState ==
                                            ConnectionState.waiting) {
                                          return SizedBox(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                .1,
                                            child: const Center(
                                                child: Image(
                                                    image: AssetImage(
                                                        "image/ge office assistant.gif"))),
                                          );
                                        } else if (snapshot.hasError) {
                                        } else if (snapshot.hasData) {
                                          if (snapshot.data?.messagecode ==
                                              "1001") {
                                            final DateTime now = DateTime.now();

                                            // something like 2013-04-20
                                            DateFormat inputFormat =
                                                DateFormat('dd-MM-yyyy');
                                            final String formattedDate =
                                                inputFormat.format(now);

                                            List<Datum> filteredItems =
                                                (snapshot.data?.data ?? [])
                                                    .where((item) =>
                                                        item.isreaded == false)
                                                    .toList();
                                            List<Datum> todaysItem =
                                                filteredItems.where((item) {
                                              DateFormat inputFormat =
                                                  DateFormat(
                                                      'yyyy-MM-dd hh:mm:ss a');
                                              DateTime dateTime = inputFormat
                                                  .parse(item.createdAt ?? "");
                                              String formatdate =
                                                  DateFormat("dd-MM-yyyy")
                                                      .format(dateTime);

                                              return formatdate ==
                                                  formattedDate;
                                            }).toList();

                                            return ListView.builder(
                                                itemCount: todaysItem.length,
                                                itemBuilder: (cntxt, index) {
                                                  return customNotification(
                                                      context,
                                                      todaysItem[index]);
                                                });
                                          }
                                        }
                                        return Container();
                                      })),
                              SizedBox(
                                  width: double.maxFinite,
                                  child: FutureBuilder(
                                      future: client.pantryNotifications(
                                          AppConstants.username.toString()),
                                      builder: (context, snapshot) {
                                        if (snapshot.connectionState ==
                                            ConnectionState.waiting) {
                                          return SizedBox(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                .1,
                                            child: const Center(
                                                child: Image(
                                                    image: AssetImage(
                                                        "image/ge office assistant.gif"))),
                                          );
                                        } else if (snapshot.hasError) {
                                        } else if (snapshot.hasData) {
                                          if (snapshot.data?.messagecode ==
                                              "1001") {
                                            final DateTime now = DateTime.now();

                                            // something like 2013-04-20
                                            DateFormat inputFormat =
                                                DateFormat('dd-MM-yyyy');
                                            final String formattedDate =
                                                inputFormat.format(now);

                                            List<Datum> filteredItems =
                                                (snapshot.data?.data ?? [])
                                                    .where((item) =>
                                                        item.isreaded == true)
                                                    .toList();
                                            List<Datum> todaysItem =
                                                filteredItems.where((item) {
                                              DateFormat inputFormat =
                                                  DateFormat(
                                                      'yyyy-MM-dd hh:mm:ss a');
                                              DateTime dateTime = inputFormat
                                                  .parse(item.createdAt ?? "");
                                              String formatdate =
                                                  DateFormat("dd-MM-yyyy")
                                                      .format(dateTime);
                                              return formatdate ==
                                                  formattedDate;
                                            }).toList();
                                            return ListView.builder(
                                                itemCount: todaysItem.length,
                                                itemBuilder: (cntxt, index) {
                                                  return customNotification(
                                                      context,
                                                      todaysItem[index]);
                                                });
                                          }
                                        }
                                        return Container();
                                      })),
                              // pantryViewOrderList(context,catGory,catItem,itemQuantity) ?? const Text("Null"),
                            ],
                          ),
                        ),
                        const SizedBox(height: 10),
                      ],
                    ),
                  ),

                  // ====================================================third column================================================
                  const Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [],
                    ),
                  )
                ],
              ),
            ),
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
