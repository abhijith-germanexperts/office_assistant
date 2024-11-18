import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ge_assistant/Constants/popupmenu.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../Constants/appconst.dart';
import '../../../models/inventorylistmodel.dart';
import '../../../services/apiservices.dart';
import '../notification/notification.dart';

class DesktopPanInventory extends StatefulWidget {
  const DesktopPanInventory({Key? key}) : super(key: key);

  @override
  State<DesktopPanInventory> createState() => _DesktopPanInventoryState();
}

late TabController _tabController;

class _DesktopPanInventoryState extends State<DesktopPanInventory>
    with TickerProviderStateMixin {
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    _tabController.animateTo(0);
  }

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
  bool _toggleValue = false;
  ApiProvider client = ApiProvider();
  @override
  Widget build(BuildContext context) {
    var headingGroup = AutoSizeGroup();
    var tabGroup = AutoSizeGroup();
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
              // color: Colors.yellow,
              height: MediaQuery.of(context).size.height < 361
                  ? MediaQuery.of(context).size.height * 0.18
                  : MediaQuery.of(context).size.height * 0.08,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  // Text(MediaQuery.of(context).size.height.toString()),
                  Padding(
                    padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.011),
                    child: Align(
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
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.03,
                  ),
                  Expanded(
                    child: Container(
                      // color: Colors.green,
                      height: 1200,
                      width: 100,
                      // color: Colors.orange,
                      child: TabBar(
                        indicatorWeight: 4,
                        indicatorColor: Colors.white,
                        indicatorSize: TabBarIndicatorSize.label,
                        indicatorPadding: const EdgeInsets.all(10),
                        controller: _tabController,
                        tabs: [
                          Tab(
                            child: Padding(
                              padding: const EdgeInsets.all(11.0),
                              child: AutoSizeText(
                                "Coffee",
                                maxLines: 1,
                                minFontSize: 10,
                                style: const TextStyle(fontSize: 30),
                                group: tabGroup,
                              ),
                            ),
                          ),
                          Tab(
                            child: Padding(
                              padding: const EdgeInsets.all(11.0),
                              child: AutoSizeText("Tea",
                                  maxLines: 1,
                                  minFontSize: 10,
                                  style: const TextStyle(fontSize: 30),
                                  group: tabGroup),
                            ),
                          ),
                          Tab(
                            child: Padding(
                              padding: const EdgeInsets.all(11.0),
                              child: AutoSizeText("Water",
                                  maxLines: 1,
                                  minFontSize: 10,
                                  style: const TextStyle(fontSize: 30),
                                  group: tabGroup),
                            ),
                          ),
                          Tab(
                            child: Padding(
                              padding: const EdgeInsets.all(11.0),
                              child: AutoSizeText("Pasteries",
                                  maxLines: 1,
                                  minFontSize: 10,
                                  style: const TextStyle(fontSize: 30),
                                  group: tabGroup),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                      width: MediaQuery.of(context).size.width > 1109
                          ? MediaQuery.of(context).size.width * 0.4
                          : MediaQuery.of(context).size.width * 0),
                  // Text(MediaQuery.of(context).size.width.toString(),)
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
                    child: Container(
                      // color:Colors.blue,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                              child: SizedBox(
                                  child: AutoSizeText(
                            "Item",
                            textAlign: TextAlign.center,
                            style: const TextStyle(fontSize: 20),
                            maxLines: 1,
                            group: headingGroup,
                          ))),
                          Expanded(
                              child: SizedBox(
                                  child: AutoSizeText(
                            "Availability",
                            textAlign: TextAlign.center,
                            style: const TextStyle(fontSize: 20),
                            maxLines: 1,
                            group: headingGroup,
                          ))),
                        ],
                      ),
                    ),
                  ),
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
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  pantryViewOrderList(context, "COFFEE"),
                  pantryViewOrderList(context, "TEA"),
                  pantryViewOrderList(context, "WATER"),
                  pantryViewOrderList(context, "PASTRIES"),
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

  pantryViewOrderList(BuildContext context, String category) {
    return FutureBuilder(
        future: client.getInventoryList(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            print(snapshot.error);
          } else if (snapshot.hasData) {
            List<Response> filteredItems = (snapshot.data?.data?.response ?? [])
                .where((item) => item.categoryname == category)
                .toList();
            return Padding(
              padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * 0.18,
                right: MediaQuery.of(context).size.width * 0.18,
              ),
              child: ListView.builder(
                itemCount: filteredItems.length,
                itemBuilder: (context, index) {
                  //print(filteredItems.length);
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: Container(
                      // height: MediaQuery.of(context).size.height * 0.11,
                      height: 82,
                      decoration: BoxDecoration(
                        color: const Color(0xff3E3E3E),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.024,
                            ),
                            SizedBox(
                                width: 100,
                                child: Image(
                                  image: NetworkImage(filteredItems[index]
                                      .itemimgpath
                                      .toString()),
                                  fit: BoxFit.cover,
                                  alignment: const Alignment(0.0, 0.5),
                                )),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                                child: AutoSizeText(
                              filteredItems[index].itemname.toString(),
                              style: const TextStyle(
                                color: Colors.white,
                              ),
                              maxLines: 2,
                              minFontSize: 12,
                            )),
                            const Spacer(),
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(

                                      // color:toggleValues[index]? CupertinoColors.activeGreen :CupertinoColors.destructiveRed, width: 2),
                                      color:
                                          filteredItems[index].menustatus == 1
                                              ? CupertinoColors.activeGreen
                                              : CupertinoColors.destructiveRed,
                                      width: 2),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(20))),
                              child: SizedBox(
                                width: 51,
                                height: 31,
                                child: Stack(
                                  children: [
                                    CupertinoSwitch(
                                      // value: toggleValues[index],
                                      value:
                                          filteredItems[index].menustatus == 1
                                              ? true
                                              : false,
                                      onChanged: (value) {
                                        // toggleValues[index] = value;
                                        alertbox(
                                            context,
                                            filteredItems[index]
                                                .menupantryid
                                                .toString(),
                                            filteredItems[index].menustatus == 1
                                                ? "0"
                                                : "1");
                                      },
                                      trackColor: Colors.transparent,
                                      activeColor: Colors.transparent,
                                      thumbColor: CupertinoColors.white,
                                    ),
                                    Align(
                                      // alignment: toggleValues[index]? Alignment.centerRight : Alignment.centerLeft,
                                      alignment:
                                          filteredItems[index].menustatus == 1
                                              ? Alignment.centerRight
                                              : Alignment.centerLeft,
                                      child: Padding(
                                        // padding:toggleValues[index] ? const EdgeInsets.all(4.0) : const EdgeInsets.all(2.8),
                                        padding:
                                            filteredItems[index].menustatus == 1
                                                ? const EdgeInsets.all(4.0)
                                                : const EdgeInsets.all(2.8),
                                        child: Icon(
                                          // toggleValues[index]? Icons.check : Icons.close,
                                          filteredItems[index].menustatus == 1
                                              ? Icons.check
                                              : Icons.close,
                                          color:
                                              filteredItems[index].menustatus ==
                                                      1
                                                  ? Colors.green
                                                  : Colors.red,
                                          // color:snapshot.data!.data!.response![index].menustatus==1? Colors.green : Colors.red,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.101,
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            );
          }
          return Container();
        });
  }
  // changestatus (BuildContext context,id,status) {
  //   return
  //     FutureBuilder(
  //         future: client.changeInventoryItemstatus(id,status),
  //         builder: (context,snapshot){
  //           if(snapshot.connectionState == ConnectionState.waiting){
  //             print("running");
  //             return const Center(child: CircularProgressIndicator());
  //           } else if (snapshot.hasError){
  //             print(snapshot.error);
  //           } else if(
  //           snapshot.hasData
  //           ){
  //             if(snapshot.data!.messagecode=="1001"){
  //               setState(() {
  //
  //               });
  //             }
  //           }
  //           return Container();
  //         }
  //     );
  // }

  alertbox(BuildContext context, id, status) {
    return showDialog<void>(
      context: context,
      // barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('AlertDialog Title'),
          content: SingleChildScrollView(
              child: FutureBuilder(
                  future: client.changeInventoryItemstatus(id, status),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      print("running");
                      return const Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      print(snapshot.error);
                    } else if (snapshot.hasData) {
                      if (snapshot.data!.messagecode == "1001") {
                        WidgetsBinding.instance!.addPostFrameCallback((_) {
                          setState(() {});
                          Navigator.pop(context);
                        });
                      }
                    }
                    return Container();
                  })),
        );
      },
    );
  }
}
