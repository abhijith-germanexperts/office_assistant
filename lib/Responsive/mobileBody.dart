import 'dart:ui';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Screens/login/LoginBasePage.dart';

class MobileOnboarding extends StatefulWidget {
  const MobileOnboarding({Key? key}) : super(key: key);

  @override
  State<MobileOnboarding> createState() => _MobileOnboardingState();
}

class _MobileOnboardingState extends State<MobileOnboarding> {
  @override
  int _currentPageIndex = 0;
  Widget build(BuildContext context) {
    final PageController _pageController = PageController();
    var myGroup = AutoSizeGroup();
    var myButtonGroup = AutoSizeGroup();
    List image = [
      "image/onboarding pantry image (1).jpg",
      "image/onboarding directory image (1).jpg",
      // "image/aaron-huber-8qYE6LGHW-c-unsplash.jpg"
    ];
    List title = ["Pantry Service", "Directory Service",
      // "dsfsd"
    ];
    List content = [
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in.",
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in.",
      // "happens mostly in low speed internet, however, still very effective even in average and above speeds. As our expectations for mobile experiences change, so does our understanding of performance. People expect web apps to feel just as snappy ."
    ];
    @override
    void dispose() {
      _pageController.dispose();
      super.dispose();
    }
    return Scaffold(backgroundColor: Colors.black,
      body: SafeArea(
        child: Container(
          width: double.maxFinite,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: const AssetImage('image/aaron-huber-8qYE6LGHW-c-unsplash.jpg'),
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
                        width: MediaQuery.of(context).size.width * 0.6,
                        height: MediaQuery.of(context).size.height * 0.1,
                        child: const Image(
                            image:
                            AssetImage("image/GE office assistant white.png"))),
                  ),
                ),
                Padding(
                  padding:  EdgeInsets.only(left: MediaQuery.of(context).size.width*0.1,right: MediaQuery.of(context).size.width*0.101),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 1.1,
                    height: MediaQuery.of(context).size.height * 0.7,
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
// color: Colors.cyan,
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
                                        padding:  EdgeInsets.only(left: MediaQuery.of(context).size.width*0.01, right: MediaQuery.of(context).size.width*0.01,top: MediaQuery.of(context).size.height*0.01,),
                                        child: Container(
                                            width: MediaQuery.of(context).size.width * 1.9,
                                            height: MediaQuery.of(context).size.height * 0.3,
                                            decoration: BoxDecoration(
                                              color: Colors.black,
                                              borderRadius: BorderRadius.circular(50),
                                            ),
                                            child: ClipRRect(
                                                borderRadius: BorderRadius.circular(23.0),
                                                child: Image(
                                                  image: AssetImage(image[i]),
                                                  fit: BoxFit.cover,
                                                ))),
                                      ),
                                      // SizedBox(height: 20,),
                                      SizedBox(
                                        width: double.maxFinite,
                                        height: MediaQuery.of(context).size.height * 0.05,
                                        // color: Colors.red,
                                        child: Center(
                                          child: AutoSizeText(title[i].toString(),
                                              maxLines: 1,
                                              minFontSize: 2,
                                              group: myGroup,
                                              style: GoogleFonts.inter(
                                                textStyle:
                                                const TextStyle(color: Color(0xffFFFFFF),fontSize: 25),
                                              )),
                                        ),
                                      ),
                                      // SizedBox(height: 20,),
                                      Expanded(
                                        child: Padding(
                                          padding:  const EdgeInsets.only(left:4, right: 4,top:4,),
                                          child: SizedBox(
                                              width: MediaQuery.of(context).size.width * 0.7,
                                              height:MediaQuery.of(context).size.height * 0.11,
                                              // color: Colors.blue,
                                              child: AutoSizeText(content[i],
                                                  maxLines: 8,
                                                  minFontSize: 15,
                                                  // group: myGroup,
                                                  style: GoogleFonts.inter(
                                                    textStyle: const TextStyle(
                                                        color: Color(0xffFFFFFF),fontSize: 40),
                                                  ))),
                                        ),
                                      ),
                                    ],
                                  );
                                }),
                          ),
                        ),

                        Padding(
                          padding:  EdgeInsets.only(left: MediaQuery.of(context).size.width*0.02, right: MediaQuery.of(context).size.width*0.02,top: MediaQuery.of(context).size.height*0.04,),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              _currentPageIndex < content.length - 1? InkWell(
                                onTap: () {
                                  Navigator.pushReplacement(
                                      context, MaterialPageRoute(builder: (context) => const LoginBasePage()));
                                },
                                child: SizedBox(
                                    width: MediaQuery.of(context).size.width * 0.05,
                                    height: MediaQuery.of(context).size.height * 0.05,
                                    child: Center(
                                        child: AutoSizeText("skip",
                                            maxLines: 1,
                                            minFontSize: 2,
                                            // group: myGroup,
                                            style: GoogleFonts.inter(
                                              textStyle:
                                              const TextStyle(color: Color(0xffFFFFFF)),
                                            )))),
                              ) : Container(),
                              DotsIndicator(
                                dotsCount: title.length,
                                position: _currentPageIndex,
                                decorator: DotsDecorator(
                                    size: Size.square(MediaQuery.of(context).size.height* 0.01),
                                    activeSize:Size(MediaQuery.of(context).size.width* 0.05, MediaQuery.of(context).size.height* 0.01),
                                    activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(MediaQuery.of(context).size.height* 0.01)),
                                    activeColor: Colors.white
                                ),
                              ),
                              _currentPageIndex < content.length - 1?  InkWell(
                                onTap: () {
                                  if (_currentPageIndex < content.length - 1) {
                                    _pageController.nextPage(
                                      duration: const Duration(milliseconds: 300),
                                      curve: Curves.easeInOut,
                                    );
                                  }
                                  // print(_currentPageIndex);
                                },
                                child: SizedBox(
                                    width: MediaQuery.of(context).size.width * 0.09,
                                    height: MediaQuery.of(context).size.height * 0.09,
                                    child: Center(
                                        child: AutoSizeText("next",
                                            maxLines: 1,
                                            minFontSize: 8,
                                            group: myButtonGroup,
                                            style: GoogleFonts.inter(
                                              textStyle:
                                              const TextStyle(color: Color(0xffFFFFFF)),
                                            )))),
                              ) :   InkWell(
                                onTap: () {
                                  Navigator.pushReplacement(
                                      context, MaterialPageRoute(builder: (context) => const LoginBasePage()));
                                },
                                child: SizedBox(
                                    width: MediaQuery.of(context).size.width * 0.12,
                                    height: MediaQuery.of(context).size.height * 0.05,
                                    child: Center(
                                        child: AutoSizeText("Continue",
                                            maxLines: 1,
                                            minFontSize: 8,
                                            group: myButtonGroup,
                                            style: GoogleFonts.inter(
                                              textStyle:
                                              const TextStyle(color: Color(0xffFFFFFF)),
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
