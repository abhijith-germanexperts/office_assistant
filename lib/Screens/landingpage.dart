import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    final PageController _pageController = PageController();
    int _currentPageIndex = 0;
    var myGroup = AutoSizeGroup();
    List image = [
      "image/aaron-huber-8qYE6LGHW-c-unsplash.jpg",
      "image/aaron-huber-8qYE6LGHW-c-unsplash.jpg",
      "image/aaron-huber-8qYE6LGHW-c-unsplash.jpg"
    ];
    List title = ["pandry", "fsdf", "dsfsd"];
    List content = [
      "Year-by-year technologies change and cast trend with their new technology. UI/UX is one such dynamic field. One has to be in the competition for the very existence. The new trending edition to the UI/UX field is the Content Placeholder(CP)!",
      "Loaders generally depict that “there is content ahead” but what Content Placeholder do is “there is so much of content available, just give it some time, it will appear”. This motive develops curiosity in the content viewers  ",
      "happens mostly in low speed internet, however, still very effective even in average and above speeds. As our expectations for mobile experiences change, so does our understanding of performance. People expect web apps to feel just as snappy ."
    ];
    @override
    void dispose() {
      _pageController.dispose();
      super.dispose();
    }

    return Scaffold(
      // backgroundColor: Color(0xffFFFFFF),
      body: Container(
        width: double.maxFinite,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('image/aaron-huber-8qYE6LGHW-c-unsplash.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.7), BlendMode.hardLight),
          ),
        ),
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
                    child: Image(
                        image:
                            AssetImage("image/GE office assistant white.png"))),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.7,
              height: MediaQuery.of(context).size.height * 0.6,
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.7),
                borderRadius: BorderRadius.circular(22),
              ),
              child: Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.5,
                    height: MediaQuery.of(context).size.height * 0.5,
                    color: Colors.green,
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
                              Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.466,
                                  height: MediaQuery.of(context).size.height *
                                      0.311,
                                  decoration: BoxDecoration(
                                    color: Colors.red.withOpacity(0.7),
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(23.0),
                                      child: Image(
                                        image: AssetImage(image[i]),
                                        fit: BoxFit.cover,
                                      ))),
                              // SizedBox(height: 20,),
                              AutoSizeText(title[i].toString().toUpperCase(),
                                  maxLines: 1,
                                  minFontSize: 2,

                                  style: GoogleFonts.inter(
                                    textStyle:
                                        TextStyle(color: Color(0xffFFFFFF)),
                                  )),
                              // SizedBox(height: 20,),
                              Container(
                                  // width: MediaQuery.of(context).size.width * 0.,
                                  // height:MediaQuery.of(context).size.height * 0.11,
                                  color: Colors.blue,
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        left:
                                            MediaQuery.of(context).size.width *
                                                0.02,
                                        right:
                                            MediaQuery.of(context).size.width *
                                                0.02),
                                    child: AutoSizeText(content[i],
                                        maxLines: 4,
                                        minFontSize: 2,
                                        group: myGroup,
                                        style: GoogleFonts.inter(
                                          textStyle: TextStyle(
                                              color: Color(0xffFFFFFF)),
                                        )),
                                  )),
                            ],
                          );
                        }),
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {},
                        child: Container(
                          color: Colors.orange,
                          child: SizedBox(
                              width: MediaQuery.of(context).size.width * 0.05,
                              height: MediaQuery.of(context).size.height * 0.05,
                              child: Center(
                                  child: AutoSizeText("Skip",
                                      maxLines: 1,
                                      minFontSize: 2,
                                      style: GoogleFonts.inter(
                                        textStyle:
                                            TextStyle(color: Color(0xffFFFFFF)),
                                      )))),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          if (_currentPageIndex < content.length - 1) {
                            _pageController.nextPage(
                              duration: Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                            );
                          }
                        },
                        child: Container(
                          color: Colors.yellow,
                          child: SizedBox(
                              width: MediaQuery.of(context).size.width * 0.05,
                              height: MediaQuery.of(context).size.height * 0.05,
                              child: Center(
                                  child: AutoSizeText("Next",
                                      maxLines: 1,
                                      minFontSize: 2,
                                      style: GoogleFonts.inter(
                                        textStyle:
                                            TextStyle(color: Color(0xffFFFFFF)),
                                      )))),
                        ),
                      ),
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

                  // Align(
                  //   alignment: Alignment.bottomCenter,
                  //   child: Padding(
                  //     padding: const EdgeInsets.only(bottom: 16.0),
                  //     child: Row(
                  //       mainAxisAlignment: MainAxisAlignment.center,
                  //       children: [
                  //         IconButton(
                  //           onPressed: () {
                  //             if (_currentPageIndex > 0) {
                  //               _pageController.previousPage(
                  //                 duration: Duration(milliseconds: 300),
                  //                 curve: Curves.easeInOut,
                  //               );
                  //             }
                  //           },
                  //           icon: Icon(Icons.arrow_back),
                  //           color: Colors.white,
                  //         ),
                  //         SizedBox(width: 8.0),
                  //         IconButton(
                  //           onPressed: () {
                  //             if (_currentPageIndex < content.length - 1) {
                  //               _pageController.nextPage(
                  //                 duration: Duration(milliseconds: 300),
                  //                 curve: Curves.easeInOut,
                  //               );
                  //             }
                  //           },
                  //           icon: Icon(Icons.arrow_forward),
                  //           color: Colors.white,
                  //         ),
                  //       ],
                  //     ),
                  //   ),
                  // ),
                ],
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
                      textStyle: TextStyle(color: Color(0xffFFFFFF)),
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
    );
  }
}
