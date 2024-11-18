import 'dart:ui';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Screens/login/LoginBasePage.dart';

class MyDesktopBody extends StatefulWidget {
  const MyDesktopBody({Key? key}) : super(key: key);

  @override
  State<MyDesktopBody> createState() => _MyDesktopBodyState();
}

class _MyDesktopBodyState extends State<MyDesktopBody> {
  int _currentPageIndex = 0;
  @override
  Widget build(BuildContext context) {
    final PageController _pageController = PageController();

    var myGroup = AutoSizeGroup();
    List image = [
      "image/onboarding pantry image (1).jpg",
      "image/onboarding directory image (1).jpg",
      // "image/aaron-huber-8qYE6LGHW-c-unsplash.jpg"
    ];
    List title = [
      "Pantry Service", "Directory Service",
      // "dsfsd"
    ];
    List content = [
      "The digital pantry service provides support to all officers and attending visitors, promptly providing water, tea, coffee. application is designed to be a dynamic inventory and grocery list generator for use. Users can choose the items with a smartphone or tablets and manually enter the information such as quantity and additional notes.  ",
      "The directory service is a database for storing and maintaining information about employees. and they store information such as name, branch, department, office room number, employee online offline status, and phone extension.",
      // "happens mostly in low speed internet, however, still very effective even in average and above speeds. As our expectations for mobile experiences change, so does our understanding of performance. People expect web apps to feel just as snappy ."
    ];
    @override
    void dispose() {
      _pageController.dispose();
      super.dispose();
    }

    return Scaffold(
      backgroundColor: Colors.black,
      // appBar: AppBar(title: Text("D E S K T O P"),),
      body: SafeArea(
        child: Container(
          width: double.maxFinite,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: const AssetImage(
                  'image/aaron-huber-8qYE6LGHW-c-unsplash.jpg'),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.7), BlendMode.hardLight),
            ),
          ),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.00),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.4,
                        height: MediaQuery.of(context).size.height * 0.1,
                        child: const Image(
                            image: AssetImage(
                                "image/GE office assistant white.png"))),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.101,
                      right: MediaQuery.of(context).size.width * 0.101),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.7,
                    height: MediaQuery.of(context).size.height * 0.6,
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(22),
                    ),
                    child: Column(
                      children: [
                        Expanded(
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.7,
                            height: MediaQuery.of(context).size.height * 0.5,
                            child: PageView.builder(
                                controller: _pageController,
                                itemCount: content.length,
                                onPageChanged: (index) {
                                  setState(() {
                                    _currentPageIndex = index;
                                  });
                                },
                                itemBuilder: (_, i) {
                                  return Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(
                                          left: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.1,
                                          right: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.1,
                                          top: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.04,
                                        ),
                                        child: Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.2,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.3,
                                            decoration: BoxDecoration(
                                              color: Colors.black,
                                              borderRadius:
                                                  BorderRadius.circular(50),
                                            ),
                                            child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(23.0),
                                                child: Image(
                                                  image: AssetImage(image[i]),
                                                  fit: BoxFit.cover,
                                                ))),
                                      ),
                                      // SizedBox(height: 20,),
                                      SizedBox(
                                        width: double.maxFinite,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.05,
                                        // color: Colors.red,
                                        child: Center(
                                          child: AutoSizeText(
                                              title[i].toString(),
                                              maxLines: 1,
                                              minFontSize: 2,
                                              group: myGroup,
                                              style: GoogleFonts.inter(
                                                textStyle: const TextStyle(
                                                    color: Color(0xffFFFFFF),
                                                    fontSize: 25),
                                              )),
                                        ),
                                      ),
                                      // SizedBox(height: 20,),
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                            left: 24,
                                            right: 24,
                                          ),
                                          child: SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.7,
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.11,
                                              // color: Colors.blue,
                                              child: AutoSizeText(content[i],
                                                  maxLines: 8,
                                                  minFontSize: 2,
                                                  group: myGroup,
                                                  style: GoogleFonts.inter(
                                                    textStyle: const TextStyle(
                                                        color:
                                                            Color(0xffFFFFFF),
                                                        fontSize: 20),
                                                  ))),
                                        ),
                                      ),
                                    ],
                                  );
                                }),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width * 0.01,
                            right: MediaQuery.of(context).size.width * 0.01,
                            top: MediaQuery.of(context).size.height * 0.04,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              _currentPageIndex < content.length - 1
                                  ? InkWell(
                                      onTap: () {
                                        Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const LoginBasePage()));
                                      },
                                      child: SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.05,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.05,
                                          child: Center(
                                              child: AutoSizeText("skip",
                                                  maxLines: 1,
                                                  minFontSize: 2,
                                                  // group: myGroup,
                                                  style: GoogleFonts.inter(
                                                    textStyle: const TextStyle(
                                                        color:
                                                            Color(0xffFFFFFF)),
                                                  )))),
                                    )
                                  : Container(),
                              DotsIndicator(
                                dotsCount: title.length,
                                position: _currentPageIndex,
                                decorator: DotsDecorator(
                                    size: Size.square(
                                        MediaQuery.of(context).size.height *
                                            0.01),
                                    activeSize: Size(
                                        MediaQuery.of(context).size.width *
                                            0.02,
                                        MediaQuery.of(context).size.height *
                                            0.01),
                                    activeShape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                            MediaQuery.of(context).size.height *
                                                0.01)),
                                    activeColor: Colors.white),
                              ),
                              _currentPageIndex < content.length - 1
                                  ? InkWell(
                                      onTap: () {
                                        if (_currentPageIndex <
                                            content.length - 1) {
                                          _pageController.nextPage(
                                            duration: const Duration(
                                                milliseconds: 300),
                                            curve: Curves.easeInOut,
                                          );
                                        }
                                        _currentPageIndex =
                                            _currentPageIndex + 1;
                                        setState(() {});
                                        // print(_currentPageIndex);
                                      },
                                      child: SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.05,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.05,
                                          child: Center(
                                              child: AutoSizeText("next",
                                                  maxLines: 1,
                                                  minFontSize: 2,
                                                  // group: myGroup,
                                                  style: GoogleFonts.inter(
                                                    textStyle: const TextStyle(
                                                        color:
                                                            Color(0xffFFFFFF)),
                                                  )))),
                                    )
                                  : InkWell(
                                      onTap: () {
                                        Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const LoginBasePage()));
                                      },
                                      child: SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.05,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.05,
                                          child: Center(
                                              child: AutoSizeText("Continue",
                                                  maxLines: 1,
                                                  minFontSize: 2,
                                                  // group: myGroup,
                                                  style: GoogleFonts.inter(
                                                    textStyle: const TextStyle(
                                                        color:
                                                            Color(0xffFFFFFF)),
                                                  )))),
                                    )
                              //         TextButton( onPressed: () {}, child: AutoSizeText("Skip",maxLines: 5,minFontSize: 2,style: GoogleFonts.inter(textStyle: TextStyle(color: Color(0xffFFFFFF)),))),
                              //         TextButton(onPressed: () {
                              //   if (_currentPageIndex < content.length - 1) {
                              //     _pageController.nextPage(
                              //       duration: Duration(milliseconds: 300),
                              //       curve: Curves.easeInOut,
                              //     );
                              //   }
                              // }, child: AutoSizeText("Next",maxLines: 5,minFontSize: 2,style: GoogleFonts.inter(textStyle: TextStyle(color: Color(0xffFFFFFF)),))),
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
        ),
      ),
    );
  }
}
