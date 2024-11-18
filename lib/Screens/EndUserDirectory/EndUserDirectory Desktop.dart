import 'dart:ffi';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ge_assistant/Constants/appconst.dart';
import 'package:ge_assistant/Constants/popupmenu.dart';
import 'package:ge_assistant/models/crmloginmodel.dart';
import 'package:ge_assistant/models/directorymodel.dart';
import 'package:ge_assistant/services/apiservices.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../../Constants/expandablelisttile.dart';
import '../../provider/departmant_provider.dart';

// int? selectedTileIndex = -1;
class UserDirectoryDesktop extends StatefulWidget {
  const UserDirectoryDesktop({Key? key, required this.director})
      : super(key: key);

  final List<DirectoryModel> director;

  @override
  State<UserDirectoryDesktop> createState() => _UserDirectoryDesktopState();
}

class _UserDirectoryDesktopState extends State<UserDirectoryDesktop> {
  IconData _expandedIcon = Icons.keyboard_arrow_down;
  String text = "";
  bool isSlted = false;
  ApiProvider client = ApiProvider();
  int _searchIndex = 0;
  final alphabets =
      List.generate(26, (index) => String.fromCharCode(index + 65));
  final ItemScrollController _itemScrollController = ItemScrollController();
  final ItemPositionsListener _itemPositionsListener =
      ItemPositionsListener.create();
  List<Datum> check = [];
  late List<DirectoryModel> directoryFilter = [];
  late List<DirectoryModel> actualDirectory = [];
  late List<Record> compareLists = [];
  late Future<Crmuserslogin> status;

  @override
  void initState() {
    actualDirectory.addAll(widget.director);
    directoryFilter = widget.director;
    status = client.getloginusers(AppConstants.token ?? "");
    super.initState();
  }

  void setSearchIndex(String searchLetter) {
    setState(() {
      _searchIndex = (directoryFilter.first.data ?? [])
          .indexWhere((element) => element.employeename?[0] == searchLetter);
      print(_searchIndex);
      if (_searchIndex >= 0) _itemScrollController.jumpTo(index: _searchIndex);
    });
  }

  List<String> unFildepartments = [];
  // = 'PARTS DEPARTMENT'; // Initialize with a default item if needed
  TextEditingController _textEditingController = TextEditingController();
  TextEditingController _departmenttextEditingController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    final stringProvider = Provider.of<StringProvider>(context);
    String selectedItem = stringProvider.stringValue;
    unFildepartments.clear();
    // List<String> dropdownItems = ['PROJECT', 'ACCOUNTS', 'Item 3', 'Item 4'];
    // var listgroup = AutoSizeGroup();
    var headinggroup = AutoSizeGroup();
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    List<Datum> modeltemp = actualDirectory.first.data ?? [];
    List<Datum> listOfContactbyDepartment = [];
    Set<String> uniqueDepartments = {};
    unFildepartments.insert(0, "All Departments");
    for (int i = 0; i < actualDirectory.first.data!.length; i++) {
      // unFildepartments.add(actualDirectory.first.data?[i].departmentname);
      String? departmentName = actualDirectory.first.data?[i].departmentname;

      if (!uniqueDepartments.contains(departmentName)) {
        unFildepartments.add(departmentName!);
        uniqueDepartments.add(departmentName!);
      }
    }

    print("length actual ${actualDirectory.first.data?.length}");
    print(unFildepartments);
    return Scaffold(
        backgroundColor: const Color(0xff303030),
        // backgroundColor: Colors.white,
        // appBar: AppBar(
        //   title: Text('image/end user directory banner.jpg'),
        // ),
        body: Column(
          children: [
            // FutureBuilder(
            //     future: client.getloginusers(),
            //     builder: (context, snapshot) {
            //       if (snapshot.hasData) {
            //         if (snapshot.connectionState == ConnectionState.waiting) {
            //           print("Loading......");
            //         }
            //         if (snapshot.connectionState == ConnectionState.done) {
            //           print(snapshot.data?.count.toString());
            //           return SizedBox(
            //             height: 0,
            //             child: ListView.builder(
            //                 itemCount: directoryFilter.length,
            //                 itemBuilder: (context, index) {
            //                   //print(snapshot.data?.records?[index].sLoginName)
            // List<String> comparisonResults = actualDirectory
            //     .first.data!
            //     .map((object1) =>
            //         (snapshot.data?.records ?? []).any(
            //                 (element) =>
            //                     object1.crmusercode ==
            //                     element.sLoginName)
            //             ? 'x'
            //             : '0')
            //     .toList();

            //                   print('Comparison results: $comparisonResults');
            //                 }),
            //           );
            //         }
            //         return SizedBox();
            //       } else if (snapshot.hasError) {
            //         return const Center(
            //           child: Text('Error'),
            //         );
            //       } else {
            //         const SizedBox.shrink();
            //       }
            //       return const SizedBox.shrink();
            //     }),
            Container(
                width: double.maxFinite,
                height: MediaQuery.of(context).size.height * 0.25,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage("image/end user directory banner.jpg"),
                  fit: BoxFit.fill,
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
                          child: PopUpMen(
                            menuList: [
                              PopupMenuItem(
                                  child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Hello ${AppConstants.name}"
                                            .toUpperCase(),
                                        style: const TextStyle(
                                            color: Colors.black),
                                      ),
                                      const Icon(Icons.close)
                                    ],
                                  ),
                                  // Row(
                                  //   children: [
                                  //     Text(
                                  //       AppConstants.username.toString(),
                                  //       style: TextStyle(color: Colors.black),
                                  //     ),
                                  //   ],
                                  // )
                                ],
                              )),
                              const PopupMenuItem(
                                value: 1,
                                child: ListTile(
                                  leading: Icon(
                                    Icons.logout,
                                  ),
                                  title: Text("LogOut",
                                      style: TextStyle(color: Colors.black)),
                                ),
                              ),
                            ],
                            icon: const Icon(
                              Icons.menu,
                              color: Colors.white,
                            ),
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
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                AutoSizeText(
                                  "Directory",
                                  style: GoogleFonts.inriaSerif(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 96,
                                      color: Colors.white),
                                  minFontSize: 5,
                                )
                              ],
                            ),
                          ),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AutoSizeText(
                                  "Service",
                                  style: GoogleFonts.inriaSerif(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 96,
                                      color: Colors.white),
                                  minFontSize: 5,
                                )
                              ],
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
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.011),
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Padding(
                        padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width * 0.08),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width > 1276.8
                              ? MediaQuery.of(context).size.width * 0.08
                              : 100,
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
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(Icons.arrow_back_rounded,
                                    size: MediaQuery.of(context).size.width >
                                            1276.8
                                        ? MediaQuery.of(context).size.width *
                                            0.01
                                        : 13),
                                const SizedBox(width: 8),
                                Expanded(
                                    child: MediaQuery.of(context).size.width >
                                            1276.8
                                        ? Text('Go back',
                                            maxLines: 1,
                                            style: TextStyle(
                                                fontSize: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.01))
                                        : const Text(
                                            'Go back',
                                            maxLines: 1,
                                            style: TextStyle(fontSize: 10),
                                          )),
                              ],
                            ),
                          ),
                        )),
                  ),
                ),
              ],
            ),
            Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //  SizedBox(width: 15,),
                  Container(
                    // color: Colors.red,
                    // width: double.infinity,
                    width: 800,
                    height: 50,
                    alignment: Alignment.center,
                    padding: const EdgeInsets.only(right: 0),
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      children: alphabets
                          .map((alphabet) => InkWell(
                                onTap: () {
                                  setSearchIndex(alphabet);
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    alphabet,
                                    style: GoogleFonts.inriaSerif(
                                        fontSize: 16, color: Colors.white),
                                    // maxLines: 1,
                                    // group: listgroup,
                                  ),

                                  //  Text(
                                  //   alphabet,
                                  //   style: const TextStyle(
                                  //       fontSize: 16),
                                  // ),
                                ),
                              ))
                          .toList(),
                    ),
                  ),
                ],
              ),
              Container(
                // color: Colors.yellow,
                width: 800,
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 60,
                      decoration: BoxDecoration(
                          // color: Colors.red,
                          borderRadius: BorderRadiusDirectional.circular(50),
                          border: Border.all(color: Colors.white)),
                      child: Row(
                        children: [
                          Container(
                            child: SizedBox(
                              //  width:MediaQuery.of(context).size.width > 900? MediaQuery.of(context).size.width * 0.2 : MediaQuery.of(context).size.width * 0.3,
                              width: 340,
                              // height: MediaQuery.of(context).size.height * 0.08,
                              child: TextFormField(
                                controller: _departmenttextEditingController,
                                textAlign: TextAlign.center,
                                style: const TextStyle(color: Colors.white),
                                onChanged: (value) {
                                  List<Datum> dummy = modeltemp
                                      .where((Datum element) => (_departmenttextEditingController
                                              .text.isNotEmpty
                                          ? (element.employeename ?? "")
                                                  .toLowerCase()
                                                  .contains(_textEditingController.text
                                                      .toLowerCase()) &&
                                              (element.departmentname ?? "")
                                                  .toLowerCase()
                                                  .contains(_departmenttextEditingController.text
                                                      .toLowerCase())
                                          : (element.employeename ?? "")
                                              .toLowerCase()
                                              .contains(_textEditingController.text.toLowerCase())))
                                      .toList();

                                  setState(() {
                                    directoryFilter.clear();
                                    directoryFilter
                                        .addAll([DirectoryModel(data: dummy)]);
                                  });
                                },
                                decoration: InputDecoration(
                                  hintText: "Search  Department",
                                  hintStyle: const TextStyle(
                                      color: Colors.white, fontSize: 14),
                                  // contentPadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
                                  suffixIcon: const Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      Icon(
                                        Icons.search,
                                        color: Colors.white,
                                        size: 0,
                                      ), // First widget
                                    ],
                                  ),
                                  border: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: Colors.transparent),
                                      borderRadius: BorderRadius.circular(50)),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: Colors.transparent),
                                      borderRadius: BorderRadius.circular(50)),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: Colors.transparent),
                                      borderRadius: BorderRadius.circular(50)),
                                ),
                                //onChanged: searchcontact(),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          SizedBox(
                            // height: MediaQuery.of(context).size.height * 0.1,
                            height: 60,
                            width: 2,
                            child: Container(
                              color: Colors.white,
                            ),
                          ),

                          // =============================================DROPDOWNUNDERLINED    sTART =======================

                          SizedBox(
                            // width:MediaQuery.of(context).size.width > 900? MediaQuery.of(context).size.width * 0.2 : MediaQuery.of(context).size.width * 0.3,
                            width: 325,
                            // height: MediaQuery.of(context).size.height * 0.08,
                            child: TextFormField(
                              controller: _textEditingController,
                              textAlign: TextAlign.center,
                              style: const TextStyle(color: Colors.white),
                              onChanged: (value) {
                                List<Datum> dummy = modeltemp
                                    .where((Datum element) => (_textEditingController
                                            .text.isNotEmpty
                                        ? (element.employeename ?? "")
                                                .toLowerCase()
                                                .contains(_textEditingController.text
                                                    .toLowerCase()) &&
                                            (element.departmentname ?? "")
                                                .toLowerCase()
                                                .contains(_departmenttextEditingController.text
                                                    .toLowerCase())
                                        : (element.departmentname ?? "")
                                            .toLowerCase()
                                            .contains(_departmenttextEditingController.text.toLowerCase())))
                                    .toList();

                                setState(() {
                                  directoryFilter.clear();
                                  directoryFilter
                                      .addAll([DirectoryModel(data: dummy)]);
                                });
                              },
                              decoration: InputDecoration(
                                hintText: "Search by Name",
                                hintStyle: const TextStyle(
                                    color: Colors.white, fontSize: 14),
                                // contentPadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),

                                suffixIcon: const Icon(
                                  Icons.search,
                                  color: Colors.white,
                                ),

                                border: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: Colors.transparent),
                                    borderRadius: BorderRadius.circular(50)),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: Colors.transparent),
                                    borderRadius: BorderRadius.circular(50)),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: Colors.transparent),
                                    borderRadius: BorderRadius.circular(50)),
                              ),
                              //onChanged: searchcontact(),
                            ),
                          ),
                          // SizedBox(
                          //   height: 60,
                          //   // MediaQuery.of(context).size.height *
                          //   // 0.15,
                          //   width: 2,
                          //   child: Container(
                          //     color: Colors.white,
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              // Text(MediaQuery.of(context).size.width.toString()),
              Padding(
                padding: MediaQuery.of(context).size.width > 1300
                    ? EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.2,
                        right: MediaQuery.of(context).size.width * 0.2)
                    : EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.1,
                        right: MediaQuery.of(context).size.width * 0.1),
                child: ExpansionTile(
                  trailing: Visibility(
                    visible: false,
                    child: SizedBox(
                        child: SvgPicture.asset(
                            'image/iconmonstr-angel-down-circle-thin.svg')),
                  ),
                  title: Row(
                    children: [
                      Expanded(
                        child: SizedBox(
                            child: Text(
                          "Name",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.inriaSerif(
                              fontSize: 17, color: Colors.white),
                          maxLines: 1,
                          // group: listgroup,
                        )),
                      ),
                      Expanded(
                        child: SizedBox(
                            child: Text(
                          "Branch",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.inriaSerif(
                              fontSize: 17, color: Colors.white),
                          maxLines: 1,
                          // group: listgroup,
                        )),
                      ),
                      Expanded(
                        child: SizedBox(
                            child: Text(
                          "Department",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.inriaSerif(
                              fontSize: 16, color: Colors.white),
                          maxLines: 1,
                          // group: listgroup,
                        )),
                      ),
                      Expanded(
                        child: SizedBox(
                            child: Text(
                          "Extension",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.inriaSerif(
                              fontSize: 17, color: Colors.white),
                          maxLines: 1,
                          // group: listgroup,
                        )),
                      ),
                      Expanded(
                        child: SizedBox(
                          child: Text(
                            "Status",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.inriaSerif(
                                fontSize: 17, color: Colors.white),
                            maxLines: 1,
                            // group: listgroup,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ]),
            (directoryFilter.first.data ?? []).isNotEmpty
                ? Expanded(
                    child: ScrollablePositionedList.builder(
                        itemScrollController: _itemScrollController,
                        itemPositionsListener: _itemPositionsListener,
                        itemCount: (directoryFilter.first.data ?? []).length,
                        itemBuilder: (context, index) {
                          //myList..sort((a, b) => a.name.toLowerCase().compareTo(b.name.toLowerCase()));

                          final sortedItems = (directoryFilter.first.data ?? [])
                            ..sort((a, b) => a.employeename!
                                .toLowerCase()
                                .compareTo(b.employeename!.toLowerCase()));
                          final directoryList = sortedItems[index];
                          //
                          return Padding(
                            padding: MediaQuery.of(context).size.width > 1300
                                ? EdgeInsets.only(
                                    left:
                                        MediaQuery.of(context).size.width * .2,
                                    right:
                                        MediaQuery.of(context).size.width * .2)
                                : EdgeInsets.only(
                                    left:
                                        MediaQuery.of(context).size.width * .1,
                                    right:
                                        MediaQuery.of(context).size.width * .1),
                            child: Container(
                                color: index % 2 == 0
                                    ? const Color(0xff5A5858)
                                    : const Color(0xff424242),
                                child: customListExpanded(
                                    context, directoryList, status)),
                          );
                        }),
                  )
                : const Expanded(
                    child: Text("No Data Found !!"
                        "")),
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

  // setSearchIndex(String searchLetter, Datum names) {
  //   print(names);
  //   setState(() {
  //     _searchIndex = check.indexWhere((element) => element[0] == searchLetter);
  //     if (_searchIndex >= 0) {
  //       _itemScrollController.jumpTo(index: _searchIndex);
  //     }
  //   });
  // }
}

// searchcontact(String query, List<Datum> datums) {
//   final suggestions = datums.where((element) {
//     final contactname = element.employeename?.toLowerCase();
//     final input = query.toLowerCase();
//     return contactname!.contains(input);
//   }).toList();
// }
