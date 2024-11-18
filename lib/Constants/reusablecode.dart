import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class DesktopEndPantryMenu extends StatefulWidget {
  const DesktopEndPantryMenu({Key? key}) : super(key: key);

  @override
  State<DesktopEndPantryMenu> createState() => _DesktopEndPantryMenuState();
}

class _DesktopEndPantryMenuState extends State<DesktopEndPantryMenu> {
  @override
  Widget build(BuildContext context) {
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
                      image: AssetImage("image/end user pantry banner darkened.jpg"),
                      fit: BoxFit.fill,
                    )),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                            width: MediaQuery.of(context).size.width * 0.4,
                            height: MediaQuery.of(context).size.height * 0.05,
                            // color: Colors.red,
                            child: const Image(
                                image: AssetImage(
                                    "image/GE office assistant white.png"))),
                        Padding(
                          padding: EdgeInsets.only(
                              right: MediaQuery.of(context).size.width * 0.03),
                          child: Icon(
                            Icons.menu,
                            color: Colors.white,
                            size:
                            MediaQuery.of(context).size.shortestSide * 0.04,
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * .2,
                      // color: Colors.blue,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // AutoSizeText.rich(
                          //   TextSpan(
                          //     children: <TextSpan>[
                          //       TextSpan(text: 'Directory \n'),
                          //       TextSpan(
                          //         text: '  Service',
                          //       ),
                          //     ],
                          //   ),
                          //   style: GoogleFonts.inriaSerif(
                          //       fontWeight: FontWeight.bold,
                          //       fontSize: 96,
                          //       color: Colors.white),
                          //   minFontSize: 5,
                          // )
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [AutoSizeText("Directory",style: GoogleFonts.inriaSerif(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 96,
                                  color: Colors.white),
                                minFontSize: 5,)],
                            ),
                          ),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [AutoSizeText("Service",style: GoogleFonts.inriaSerif(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 96,
                                  color: Colors.white),
                                minFontSize: 5,)],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                )),
            SizedBox(height: MediaQuery.of(context).size.height*0.018,),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding:  EdgeInsets.only(left: MediaQuery.of(context).size.width*0.117),
                  child: InkWell(
                    onTap: (){
                      Navigator.pop(context);
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width * .063,
                      height: MediaQuery.of(context).size.width * 0.02,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.white, width: 2),borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width * .063)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.arrow_back_rounded,
                            color: Colors.white,
                            size: MediaQuery.of(context).size.width*0.015,
                          ),
                          SizedBox(width: MediaQuery.of(context).size.width*0.001,),
                          AutoSizeText(
                            "Go back",
                            minFontSize: 2,
                            maxLines: 1,
                            style: GoogleFonts.inriaSerif(
                                textStyle: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: MediaQuery.of(context).size.width*0.009,
                                )),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height*0.01,),
            SizedBox(height: MediaQuery.of(context).size.height*0.01,),
            const Spacer(),
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
        ));
  }
}
