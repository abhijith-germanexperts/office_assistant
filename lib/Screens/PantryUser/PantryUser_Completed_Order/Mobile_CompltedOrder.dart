import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:ge_assistant/widget/completedordermobilelist.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../services/apiservices.dart';

class MobilePantryCompletedOrder extends StatelessWidget {
  const MobilePantryCompletedOrder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List time = ["sfcds", "dgdf", "dfgfdg", "sadsad"];
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    var headingGroup = AutoSizeGroup();
    var titleGroup = AutoSizeGroup();
    ApiProvider client = ApiProvider();
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.black87,
          // backgroundColor: Colors.white,
          // appBar: AppBar(
          //   title: Text('image/end user directory banner.jpg'),
          // ),
          body: Column(
            children: [
              Container(
                  width: double.maxFinite,
                  height: MediaQuery.of(context).size.height * 0.2,
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
                          Container(
                              width: MediaQuery.of(context).size.width * 0.4,
                              height: MediaQuery.of(context).size.height * 0.05,
                              // color: Colors.red,
                              child: const Image(
                                  image: AssetImage(
                                      "image/GE office assistant white.png"))),
                          Padding(
                            padding: EdgeInsets.only(
                                right:
                                    MediaQuery.of(context).size.width * 0.03),
                            child: Icon(
                              Icons.menu,
                              color: Colors.white,
                              size: MediaQuery.of(context).size.shortestSide *
                                  0.04,
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
              Container(
                // color: Colors.yellow,
                height: MediaQuery.of(context).size.height * 0.04,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Align(
                        alignment: Alignment.topCenter,
                        child: InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Icon(
                              Icons.arrow_back_outlined,
                              color: Colors.white,
                            ))),
                    const Spacer(),
                    Expanded(
                        flex: 2,
                        child: const AutoSizeText(
                          "Completed orders",
                          maxLines: 1,
                          style: TextStyle(color: Colors.white, fontSize: 32),
                        )),
                    const Spacer(),

                    // const Spacer(flex: 2,),
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
              SizedBox(
                height: 15,
              ),
              Container(
                height: 1,
                width: double.maxFinite,
                color: Colors.white,
              ),
              ExpansionTile(
                trailing: CircleAvatar(
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
                            child: AutoSizeText(
                          "Status",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.inriaSerif(
                              fontSize: 20, color: Colors.white),
                          maxLines: 1,
                          group: headingGroup,
                        )),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: 1,
                width: double.maxFinite,
                color: Colors.white,
              ),
              SizedBox(
                height: 10,
              ),
              // Text(width.toString()),
              Expanded(
                child: ListView.builder(
                    padding: EdgeInsets.zero,
                    itemCount: time.length,
                    itemBuilder: (_, index) {
                      // final item = _items[index];
                      return Container(
                          color: index % 2 == 0
                              ? const Color(0xff5A5858)
                              : const Color(0xff424242),
                          // height: 50,
                          child: Container());
                    }),
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
          )),
    );
  }
}
