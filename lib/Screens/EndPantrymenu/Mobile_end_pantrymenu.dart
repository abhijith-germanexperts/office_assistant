import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:ge_assistant/Screens/EndViewOrder/EndViewOrderBasePage.dart';
import 'package:google_fonts/google_fonts.dart';

class MobileEndPantryMenu extends StatefulWidget {
  const MobileEndPantryMenu({Key? key}) : super(key: key);

  @override
  State<MobileEndPantryMenu> createState() => _MobileEndPantryMenuState();
}

late TabController _tabController;
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

class _MobileEndPantryMenuState extends State<MobileEndPantryMenu>
    with TickerProviderStateMixin {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    _tabController.animateTo(2);
  }

  var itemNameGroup = AutoSizeGroup();
  var categoryGroup = AutoSizeGroup();
  bool isSelected = false;
  Widget build(BuildContext context) {
    return Scaffold(
        // backgroundColor: Colors.black87,
        backgroundColor: Color(0xff303030),
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
                        // Text(MediaQuery.of(context).size.width.toString()),
                        // Text(MediaQuery.of(context).size.height.toString()),
                        Container(
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
                    Container(
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
                                    "Pantry Service",
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
              height: MediaQuery.of(context).size.height * 0.03,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Align(
                          alignment: Alignment.topCenter,
                          child: Icon(
                            Icons.arrow_back_rounded,
                            color: Colors.white,
                          )),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: ElevatedButton(
                      onPressed: () {},
                      child: AutoSizeText("Recent orders"),
                      style: ButtonStyle(
                        backgroundColor:
                            const MaterialStatePropertyAll(Color(0xff303030)),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(3.0),
                              side: BorderSide(
                                  color: Colors
                                      .white) // Replace with your desired border color
                              ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              // color: Colors.yellow,
              height: MediaQuery.of(context).size.height * 0.08,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  // SizedBox(
                  //   width: MediaQuery.of(context).size.width * 0.03,
                  // ),

                  Container(
                    width: MediaQuery.of(context).size.width < 890
                        ? MediaQuery.of(context).size.width * 0.9
                        : MediaQuery.of(context).size.width * 0.5,
                    child: TabBar(
                      labelColor: Colors.black,
                      unselectedLabelColor: Colors.white,
                      indicatorPadding: const EdgeInsets.all(5),
                      indicator: BoxDecoration(
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      controller: _tabController,
                      tabs: [
                        Tab(
                          child: AutoSizeText(
                            "Coffee",
                            maxLines: 1,
                            minFontSize: 10,
                            group: categoryGroup,
                          ),
                        ),
                        Tab(
                          child: AutoSizeText(
                            "Tea",
                            maxLines: 1,
                            minFontSize: 10,
                            group: categoryGroup,
                          ),
                        ),
                        Tab(
                          child: AutoSizeText(
                            "Water",
                            maxLines: 1,
                            minFontSize: 10,
                            group: categoryGroup,
                          ),
                        ),
                        Tab(
                          child: AutoSizeText(
                            "Pastries",
                            maxLines: 1,
                            minFontSize: 10,
                            group: categoryGroup,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            // SizedBox(height: MediaQuery.of(context).size.height*0.01,),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  buildGridView(context),
                  buildGridView(context),
                  buildGridView(context),
                  buildGridView(context),
                ],
              ),
            ),
            const SizedBox(
              height: 9,
            ),
            Container(
              // color: Colors.yellow,
              child: Row(
                children: [
                  Container(
                    color: Colors.red,
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.04,
                    ),
                  ),
                  Row(
                    children: [
                      // Icon(
                      //   Icons.support_agent,
                      //   color: Colors.white,
                      //   size: MediaQuery.of(context).size.width * 0.03,
                      // ),
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors
                                .white, // Replace with your desired border color
                            width: 2, // Replace with your desired border width
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
                        width: MediaQuery.of(context).size.width * 0.005,
                      ),
                      const AutoSizeText(
                        "Need Assistance?",
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                  MediaQuery.of(context).size.width > 800
                      ? const Spacer(flex: 8)
                      : const Spacer(flex: 1),
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const EndViewOrderBasePage()));
                      },
                      child: Text(
                        "View Order",
                        style: TextStyle(color: Colors.black),
                      ),
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.white)),
                    ),
                  ),
                  // Spacer(),
                  SizedBox(
                    width: MediaQuery.of(context).size.width > 800
                        ? MediaQuery.of(context).size.width * 0.091
                        : MediaQuery.of(context).size.width * 0.0001,
                  ),
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

  buildGridView(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: MediaQuery.of(context).size.width * .01,
          right: MediaQuery.of(context).size.width * .01),
      child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: MediaQuery.of(context).size.width > 200 ? 2 : 2,
              mainAxisSpacing: 15.0,
              crossAxisSpacing: 6.0,
              childAspectRatio: .9),
          itemCount: pantryItems.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              color: const Color(0xff3A3C3D),
              elevation: 10,
              shadowColor: Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Column(
                  children: [
                    const Expanded(
                        child: Image(
                      image: AssetImage(
                          "image/20002124-d-classic_collection_espresso-cup-expressod.png"),
                      fit: BoxFit.fill,
                    )),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Visibility(
                            visible: !isSelected,
                            child: InkWell(
                                onTap: () {
                                  isSelected = !isSelected;
                                  setState(() {});
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(bottom: 8.0),
                                  child: Icon(
                                    Icons.add_circle_outline_sharp,
                                    // opticalSize: 48,
                                    // weight: 200,
                                    color: Colors.white,
                                    size: MediaQuery.of(context).size.width *
                                        0.08,
                                  ),
                                ))),
                        Visibility(
                            visible: isSelected,
                            child: InkWell(
                                onTap: () {
                                  isSelected = !isSelected;
                                  setState(() {});
                                },
                                child: Icon(
                                  Icons.remove,
                                  opticalSize: 48,
                                  weight: 200,
                                  color: Colors.white,
                                  size:
                                      MediaQuery.of(context).size.width * 0.08,
                                ))),
                        Visibility(
                          visible: isSelected,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: Colors
                                      .white, // Replace with your desired border color
                                  width:
                                      2, // Replace with your desired border width
                                ),
                              ),
                              child: const CircleAvatar(
                                radius: 16,
                                backgroundColor: Colors.transparent,
                                child: Text(
                                  "1",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Visibility(
                            visible: isSelected,
                            child: InkWell(
                                onTap: () {
                                  isSelected = !isSelected;
                                  setState(() {});
                                },
                                child: Icon(
                                  Icons.add,
                                  opticalSize: 48,
                                  weight: 200,
                                  color: Colors.white,
                                  size:
                                      MediaQuery.of(context).size.width * 0.08,
                                ))),
                      ],
                    ),
                    Container(
                        width: double.maxFinite,
                        height: MediaQuery.of(context).size.width > 1000
                            ? MediaQuery.of(context).size.height * 0.05
                            : MediaQuery.of(context).size.height * 0.05,
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Center(
                              child: AutoSizeText(
                            pantryItems[index],
                            textAlign: TextAlign.center,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                            group: itemNameGroup,
                          )),
                        )),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
