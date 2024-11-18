import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:ge_assistant/Constants/appconst.dart';
import 'package:ge_assistant/models/directorymodel.dart';
import 'package:ge_assistant/widget/completedordermobilelist.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../Constants/popupmenu.dart';
import '../../../services/apiservices.dart';
import '../notification/notification.dart';

class DesktopPantryCompletedOrder extends StatelessWidget {
  const DesktopPantryCompletedOrder({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    List time = ["sfcds", "dgdf", "dfgfdg", "sadsad"];
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    var headingGroup = AutoSizeGroup();
    var listgroup = AutoSizeGroup();
    ApiProvider client = ApiProvider();
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
                  const Spacer(),
                  const AutoSizeText(
                    "Completed orders",
                    style: TextStyle(color: Colors.white, fontSize: 32),
                  ),
                  const Spacer(
                    flex: 2,
                  ),
                  // SizedBox(
                  //   width: MediaQuery.of(context).size.width * 0.03,
                  // ),
                ],
              ),
            ),
            // SizedBox(
            //   height: MediaQuery.of(context).size.height * 0.01,
            // ),
            // Spacer(),
            const SizedBox(
              height: 15,
            ),
            Container(
              height: 1,
              width: double.maxFinite,
              color: Colors.white,
            ),
            Padding(
              padding: EdgeInsets.only(left: width * 0.13, right: width * 0.13),
              child: ExpansionTile(
                trailing: const CircleAvatar(
                  radius: 0.00001,
                ),
                tilePadding: EdgeInsets.zero,
                title: Container(
                  // color: Colors.green,
                  child: Row(
                    children: [
                      Expanded(
                          child: SizedBox(
                              child: AutoSizeText(
                        "Date",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.inriaSerif(
                            fontSize: 23, color: Colors.white),
                        maxLines: 1,
                        group: headingGroup,
                      ))),
                      Expanded(
                          child: SizedBox(
                              child: AutoSizeText(
                        "Time",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.inriaSerif(
                            fontSize: 23, color: Colors.white),
                        maxLines: 1,
                        group: headingGroup,
                      ))),
                      Expanded(
                          child: SizedBox(
                              child: AutoSizeText(
                        "Office",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.inriaSerif(
                            fontSize: 23, color: Colors.white),
                        maxLines: 1,
                        group: headingGroup,
                      ))),
                      Expanded(
                          child: SizedBox(
                              child: AutoSizeText(
                        "Extension",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.inriaSerif(
                            fontSize: 23, color: Colors.white),
                        maxLines: 1,
                        group: headingGroup,
                      ))),
                      Expanded(
                        child: SizedBox(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              AutoSizeText(
                                "Status",
                                style: GoogleFonts.inriaSerif(
                                    fontSize: 20, color: Colors.white),
                                maxLines: 1,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              height: 1,
              width: double.maxFinite,
              color: Colors.white,
            ),
            const SizedBox(
              height: 10,
            ),
            FutureBuilder(
                future: client.completedAndCanceledOrders(
                    AppConstants.username.toString()),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    print("running");
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    print(snapshot.error);
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
                                  child: customCompletedOrderListExpanded(
                                      context,
                                      (snapshot.data?.data ?? [])[index],
                                      listgroup));
                            }),
                      ),
                    );
                  }
                  return Container();
                }),

            // Text(width.toString()),

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
