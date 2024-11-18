import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../Constants/mobileRecentOrderList.dart';

class MobileRecentOrder extends StatefulWidget {
  const MobileRecentOrder({Key? key}) : super(key: key);

  @override
  State<MobileRecentOrder> createState() => _MobileRecentOrderState();
}

class _MobileRecentOrderState extends State<MobileRecentOrder> {
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

  @override
  var listgroup = AutoSizeGroup();
  var titleGroup = AutoSizeGroup();

  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
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
                    image:
                        AssetImage("image/end user pantry banner darkened.jpg"),
                    fit: BoxFit.fill,
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
                                    Expanded(
                                      child: AutoSizeText(
                                        "Pantry Service",
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.inriaSerif(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 40,
                                            color: Colors.white),
                                        minFontSize: 5,
                                        maxLines: 1,
                                      ),
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
                height: MediaQuery.of(context).size.height * 0.05,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width * 0.03),
                        child: InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Icon(
                              Icons.arrow_back_outlined,
                              color: Colors.white,
                            )),
                        // child: ElevatedButton(
                        //   onPressed: () {
                        //     Navigator.pop(context);
                        //   },
                        //   style: ElevatedButton.styleFrom(
                        //     elevation: 4,
                        //     backgroundColor: const Color(0xff303030),
                        //     // foregroundColor: Colors.white,
                        //     // shape: RoundedRectangleBorder(
                        //     //   borderRadius: BorderRadius.circular(17), // Set border radius of 3
                        //     //   side: const BorderSide(
                        //     //     color: Colors.white,
                        //     //   ),
                        //     // ),
                        //   ),
                        //   child: Icon(Icons.arrow_back_rounded),
                        // )
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.03,
                    ),
                    const Spacer(),
                    Expanded(
                        flex: 2,
                        child: SizedBox(
                            width: width < 610 ? 10 : 10,
                            child: const AutoSizeText(
                              "Recent orders ",
                              maxLines: 1,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 36),
                            ))),
                    const Spacer(),
                  ],
                ),
              ),
              // SizedBox(
              //   height: MediaQuery.of(context).size.height * 0.01,
              // ),
              // Padding(
              //   padding:  EdgeInsets.only(left: width*0.01,right: width*0.13),
              //   child: Row(children: [
              //     AutoSizeText("Date",textAlign:TextAlign.start,style: TextStyle(fontSize: 20),),
              //     Spacer(),
              //     AutoSizeText("Time",style: TextStyle(fontSize: 20),),
              //     Spacer(),
              //     AutoSizeText("Status",style: TextStyle(fontSize: 20),),
              //     Spacer(flex: 2,)
              //     // Spacer(flex: 5,)
              //   ],),
              // ),
              ExpansionTile(
                  tilePadding: EdgeInsets.zero,
                  trailing: CircleAvatar(
                    radius: 0.00001,
                  ),
                  title: Row(
                    children: [
                      Expanded(
                        child: SizedBox(
                            child: AutoSizeText(
                          "Date",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.inriaSerif(
                              fontSize: 20, color: Colors.white),
                          maxLines: 1,
                          group: titleGroup,
                        )),
                      ),
                      Expanded(
                        child: SizedBox(
                            child: Padding(
                          padding: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width * 0.03,
                              right: 8),
                          child: AutoSizeText(
                            "Time",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.inriaSerif(
                                fontSize: 20, color: Colors.white),
                            maxLines: 1,
                            group: titleGroup,
                          ),
                        )),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width * 0.03,
                            right: 8),
                        child: Container(
                            height: 16,
                            child: AutoSizeText(
                              "Status",
                              group: titleGroup,
                            )),
                      ),
                      // const Spacer(
                      //   flex: 6,
                      // ),
                      SizedBox(
                        width: 100,
                        child: SizedBox(
                          child: const AutoSizeText(
                            "",
                            textAlign: TextAlign.center,
                            maxLines: 2,
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ),
                    ],
                  )),
              // SizedBox(height: 10,),
              // Text(width.toString()),
              Expanded(
                child: Padding(
                  padding:
                      EdgeInsets.only(left: width * 0.01, right: width * 0.01),
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
                          // child: customRecentOrderListExpanded(
                          //     context,
                          //     listgroup,
                          //     date[index],
                          //     time[index],
                          //     image[index])
                        );
                      }),
                ),
              ),
              // Spacer(),
              SizedBox(
                height: 10,
              ),
              // Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.03,
                  ),
                  Row(
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
                      SizedBox(
                        // height: MediaQuery.of(context).size.width,
                        child: const AutoSizeText(
                          "Need Assistance?",
                          style: TextStyle(color: Colors.white),
                        ),
                      )
                    ],
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
          )),
    );
  }
}
