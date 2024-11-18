import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:ge_assistant/Constants/popupmenu.dart';
import 'package:ge_assistant/Screens/PantryUser/pantry_inventory/base_pan_inventory.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../Constants/appconst.dart';
import '../../End userselection page/EmdUserSelectionDesktop.dart';
import '../Pantry_View_Order/Base_Pan_ViewOrder.dart';
import '../notification/notification.dart';

class PantryHomeDesktopScreen extends StatelessWidget {
  const PantryHomeDesktopScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var myOptionGroup = AutoSizeGroup();
    print("${AppConstants.usercategoryId} category");
    print(AppConstants.fcmtoken);
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: ClipPath(
              clipper: HorizontalSplitClipper(),
              child: FractionallySizedBox(
                alignment: Alignment.centerRight,
                widthFactor: 0.5,
                child: Image.asset(
                  "image/inventory_bg.jpg",
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Positioned.fill(
            child: ClipPath(
              clipper: SlantedImageClipper(),
              child: FractionallySizedBox(
                alignment: Alignment.centerLeft,
                widthFactor: 0.6,
                child: Image.asset(
                  "image/simon-kadula--gkndM1GvSA-unsplash.jpg",
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                          style:
                                              TextStyle(color: Colors.black)),
                                    ),
                                  ),
                                  const PopupMenuItem(
                                    value: 1,
                                    child: ListTile(
                                      leading: Icon(
                                        Icons.logout,
                                      ),
                                      title: Text("LogOut",
                                          style:
                                              TextStyle(color: Colors.black)),
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
                              size: MediaQuery.of(context).size.shortestSide *
                                  .03,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                Container(
                  // width: double.maxFinite,
                  // color: Colors.cyanAccent,
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const BasePantryViewOrder()));
                    },
                    child: Row(
                      children: [
                        Column(
                          children: [
                            SizedBox(
                                width: MediaQuery.of(context).size.width * 0.6,
                                height:
                                    MediaQuery.of(context).size.height * 0.1,
                                child: Align(
                                  alignment: Alignment.center,
                                  child: AutoSizeText(
                                    "Orders",
                                    group: myOptionGroup,
                                    minFontSize: 2,
                                    maxLines: 1,
                                    style: GoogleFonts.inriaSerif(
                                        textStyle: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 90,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                )),
                          ],
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const BasePanInventory()));
                          },
                          child: Column(
                            children: [
                              SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.4,
                                  height:
                                      MediaQuery.of(context).size.height * 0.1,
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: AutoSizeText(
                                      "Inventory",
                                      group: myOptionGroup,
                                      minFontSize: 2,
                                      maxLines: 1,
                                      style: GoogleFonts.inriaSerif(
                                          textStyle: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 90,
                                              fontWeight: FontWeight.bold)),
                                    ),
                                  )),
                              // SizedBox(
                              //     width: MediaQuery.of(context).size.width * 0.4,
                              //     height: MediaQuery.of(context).size.height * 0.1,
                              //     child: Align(
                              //       alignment: Alignment.center,
                              //       child: AutoSizeText("Service",group: myOptionGroup,
                              //         minFontSize: 2,
                              //         maxLines: 1,
                              //         style: GoogleFonts.inriaSerif(
                              //             textStyle: const TextStyle(
                              //               color: Colors.white,
                              //               fontSize: 90,
                              //             )),),
                              //     )),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.5,
                    height: MediaQuery.of(context).size.height * 0.1,
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
            ),
          ),
        ],
      ),
    );
  }
}
