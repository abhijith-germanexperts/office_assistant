import 'dart:ffi';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ge_assistant/Constants/appconst.dart';
import 'package:ge_assistant/Constants/popupmenu.dart';
import 'package:ge_assistant/Screens/EndUserDirectory/models/image_model.dart';
import 'package:ge_assistant/models/crmloginmodel.dart';
import 'package:ge_assistant/models/directorymodel.dart';
import 'package:ge_assistant/services/apiservices.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:speech_to_text/speech_to_text.dart';

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
  // --- NEW VARIABLES FOR SPEECH TO TEXT ---
  final SpeechToText _speechToText = SpeechToText();
  bool _speechEnabled = false;

// --- SPEECH TO TEXT METHODS ---
  void _initSpeech() async {
    try {
      _speechEnabled = await _speechToText.initialize(
        onStatus: (status) {
          if (mounted) setState(() {});
        },
        onError: (error) => print('Speech Error: $error'),
      );
    } catch (e) {
      print("Speech recognition failed to initialize: $e");
      _speechEnabled = false; // Flags the device as unsupported
    }
    if (mounted) setState(() {});
  }

  void _startListening() async {
    await _speechToText.listen(onResult: _onSpeechResult);
    setState(() {});
  }

  void _stopListening() async {
    await _speechToText.stop();
    setState(() {});
  }

  void _onSpeechResult(result) {
    setState(() {
      _textEditingController.text = result.recognizedWords;

      // ADD THIS: Moves the blinking cursor to the end of the spoken words
      _textEditingController.selection = TextSelection.fromPosition(
        TextPosition(offset: _textEditingController.text.length),
      );

      applyFilters();
    });
  }

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
  List<DirecotoryModelDatum> check = [];
  late List<DirectoryModel> directoryFilter = [];
  late List<DirectoryModel> actualDirectory = [];
  late List<Record> compareLists = [];
  late Future<Crmuserslogin> status;

  // --- VARIABLES FOR DROPDOWNS ---
  String selectedBranch = 'All';
  String selectedDepartment = 'All';
  List<String> branchList = ['All'];
  List<String> departmentList = ['All'];

  // --- NEW VARIABLE FOR REFRESH TIME ---
  String lastRefreshTime = "";

  TextEditingController _textEditingController = TextEditingController();
  TextEditingController _departmenttextEditingController =
  TextEditingController();

  // --- UNIFIED FILTER FUNCTION ---
  void applyFilters() {
    List<DirecotoryModelDatum> allData = actualDirectory.first.data ?? [];

    List<DirecotoryModelDatum> filteredData = allData.where((element) {
      // 1. Check Name Search text box
      bool matchesName = _textEditingController.text.isEmpty ||
          (element.employeename ?? "")
              .toLowerCase()
              .contains(_textEditingController.text.toLowerCase());

      // 2. Check Branch Dropdown
      bool matchesBranch = selectedBranch == 'All' ||
          (element.branchName ?? "") == selectedBranch;

      // 3. Check Department Dropdown
      bool matchesDepartment = selectedDepartment == 'All' ||
          (element.departmentname ?? "") == selectedDepartment;

      // 4. Check Top Department Search box (if still used)
      bool matchesTopDeptSearch = _departmenttextEditingController
          .text.isEmpty ||
          (element.departmentname ?? "")
              .toLowerCase()
              .contains(_departmenttextEditingController.text.toLowerCase());

      return matchesName &&
          matchesBranch &&
          matchesDepartment &&
          matchesTopDeptSearch;
    }).toList();

    setState(() {
      directoryFilter.clear();
      directoryFilter.add(DirectoryModel(data: filteredData));
    });
  }

// --- NEW VARIABLE FOR REFRESH TIME ---

  bool isRefreshing = false; // <--- ADD THIS LINE
  // --- NEW REFRESH FUNCTION ---
  // --- UPDATED REFRESH FUNCTION ---
  void refreshStatus() async {
    setState(() {
      isRefreshing = true;
    });

    status = client.getloginusers(AppConstants.token ?? "");
    await status;

    if (mounted) {
      // Add if (mounted) check here
      setState(() {
        isRefreshing = false;

        DateTime now = DateTime.now();
        int hour =
        now.hour > 12 ? now.hour - 12 : (now.hour == 0 ? 12 : now.hour);
        String amPm = now.hour >= 12 ? 'PM' : 'AM';
        String minute = now.minute.toString().padLeft(2, '0');
        lastRefreshTime = "$hour:$minute $amPm";
      });
    }
  }

  @override
  void initState() {
    actualDirectory.addAll(widget.director);
    directoryFilter = List.from(widget.director);

    // Set initial status and time
    status = client.getloginusers(AppConstants.token ?? "");
    DateTime now = DateTime.now();
    int hour = now.hour > 12 ? now.hour - 12 : (now.hour == 0 ? 12 : now.hour);
    String amPm = now.hour >= 12 ? 'PM' : 'AM';
    String minute = now.minute.toString().padLeft(2, '0');
    lastRefreshTime = "$hour:$minute $amPm";

    // --- POPULATE DROPDOWNS ON LOAD ---
    Set<String> uniqueDepts = {};
    Set<String> uniqueBranches = {};
    for (var datum in actualDirectory.first.data ?? []) {
      if (datum.departmentname != null &&
          !uniqueDepts.contains(datum.departmentname)) {
        uniqueDepts.add(datum.departmentname!);
        departmentList.add(datum.departmentname!);
      }
      if (datum.branchName != null &&
          !uniqueBranches.contains(datum.branchName)) {
        uniqueBranches.add(datum.branchName!);
        branchList.add(datum.branchName!);
      }
    }
    _initSpeech(); // <--- ADD THIS LINE

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

  @override
  Widget build(BuildContext context) {
    final stringProvider = Provider.of<StringProvider>(context);
    String selectedItem = stringProvider.stringValue;

    var headinggroup = AutoSizeGroup();

    // CALCULATE SAFE HEIGHT
    // If the keyboard shrinks the screen below 800px, we force the layout height to stay at 800px.
    double rawHeight = MediaQuery.of(context).size.height;
    double height = rawHeight < 800 ? 800 : rawHeight;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
        backgroundColor: const Color(0xff303030),

        // Hides keyboard on tap outside
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          // This scroll view allows the UI to scroll up over the keyboard
          child: SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            // Forces the UI to never shrink below our safe height (800px)
            child: SizedBox(
              height: height,
              child: Column(
                children: [
                  Container(
                      width: double.maxFinite,
                      // Updated to use the safe height variable
                      height: height * 0.25,
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
                                  height: height * 0.1, // Updated
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
                            height: height * .15, // Updated
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
                    height: height * 0.018, // Updated
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
                                    ? MediaQuery.of(context).size.width * 0.10
                                    : 100,
                                child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  style: ElevatedButton.styleFrom(
                                    elevation: 4,
                                    backgroundColor: const Color(0xff303030),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(17),
                                      side: const BorderSide(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(Icons.arrow_back_rounded, color: Colors.white,
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
                                              style: TextStyle(color: Colors.white,
                                                  fontSize: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                      0.01))
                                              : const Text(
                                            'Go back',
                                            maxLines: 1,
                                            style: TextStyle(fontSize: 10,color: Colors.white,),
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
                        Container(
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
                                ),
                              ),
                            ))
                                .toList(),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      width: 800,
                      height: 50,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 60,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadiusDirectional.circular(50),
                                border: Border.all(color: Colors.white)),
                            child: Row(
                              children: [
                                Container(
                                  child: SizedBox(
                                    width: 340,
                                    child: TextFormField(
                                      controller: _departmenttextEditingController,
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(color: Colors.white),
                                      onChanged: (value) {
                                        applyFilters(); // Unified filter call
                                      },
                                      decoration: InputDecoration(
                                        hintText: "Search Department",
                                        hintStyle: const TextStyle(
                                            color: Colors.white, fontSize: 14),
                                        suffixIcon: const Stack(
                                          alignment: Alignment.center,
                                          children: [
                                            Icon(
                                              Icons.search,
                                              color: Colors.white,
                                              size: 0,
                                            ),
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
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                SizedBox(
                                  height: 60,
                                  width: 2,
                                  child: Container(
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(
                                  width: 325,
                                  child: TextFormField(
                                    controller: _textEditingController,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(color: Colors.white),
                                    onChanged: (value) {
                                      applyFilters(); // Unified filter call
                                    },
                                    decoration: InputDecoration(
                                      hintText: "Search by Name",
                                      hintStyle: const TextStyle(
                                          color: Colors.white, fontSize: 14),
                                      suffixIcon: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          // --- CONDITIONAL CHECK ADDED HERE ---
                                          if (_speechEnabled)
                                            IconButton(
                                              icon: Icon(
                                                _speechToText.isListening
                                                    ? Icons.mic
                                                    : Icons.mic_none,
                                                color: _speechToText.isListening
                                                    ? Colors.red
                                                    : Colors.white,
                                              ),
                                              onPressed: () {
                                                if (_speechEnabled) {
                                                  _speechToText.isNotListening
                                                      ? _startListening()
                                                      : _stopListening();
                                                }
                                              },
                                            ),
                                          // The existing Search Icon stays visible for everyone
                                          const Icon(
                                            Icons.search,
                                            color: Colors.white,
                                          ),
                                          const SizedBox(width: 10),
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
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
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
                                  )),
                            ),

                            // ===================================
                            // NEW BRANCH DROPDOWN
                            // ===================================
                            Expanded(
                              child: Container(
                                alignment: Alignment.center,
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton<String>(
                                    dropdownColor: const Color(0xff424242),
                                    isExpanded: true,
                                    value: selectedBranch,
                                    icon: const Icon(Icons.arrow_drop_down,
                                        color: Colors.white),
                                    style: GoogleFonts.inriaSerif(
                                        fontSize: 17, color: Colors.white),
                                    items: branchList.map((String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Center(
                                          child: Text(
                                              value == 'All' ? 'Branch' : value,
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis),
                                        ),
                                      );
                                    }).toList(),
                                    onChanged: (newValue) {
                                      setState(() {
                                        selectedBranch = newValue!;
                                      });
                                      applyFilters();
                                    },
                                  ),
                                ),
                              ),
                            ),

                            // ===================================
                            // NEW DEPARTMENT DROPDOWN
                            // ===================================
                            Expanded(
                              child: Container(
                                alignment: Alignment.center,
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton<String>(
                                    dropdownColor: const Color(0xff424242),
                                    isExpanded: true,
                                    value: selectedDepartment,
                                    icon: const Icon(Icons.arrow_drop_down,
                                        color: Colors.white),
                                    style: GoogleFonts.inriaSerif(
                                        fontSize: 16, color: Colors.white),
                                    items: departmentList.map((String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Center(
                                          child: Text(
                                              value == 'All' ? 'Department' : value,
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis),
                                        ),
                                      );
                                    }).toList(),
                                    onChanged: (newValue) {
                                      setState(() {
                                        selectedDepartment = newValue!;
                                      });
                                      applyFilters();
                                    },
                                  ),
                                ),
                              ),
                            ),

                            Expanded(flex: 1,
                              child: SizedBox(
                                  child: Text(
                                    "Extension",
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.inriaSerif(
                                        fontSize: 17, color: Colors.white),
                                    maxLines: 1,
                                  )),
                            ),

                            // ===================================
                            // UPDATED STATUS HEADER W/ REFRESH
                            // ===================================
                            Expanded(flex: 1,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Status",
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.inriaSerif(
                                            fontSize: 17, color: Colors.white),
                                      ),
                                      const SizedBox(width: 5),
                                      isRefreshing
                                          ? const SizedBox(
                                        width: 16,
                                        height: 16,
                                        child: CircularProgressIndicator(
                                          color: Colors.white,
                                          strokeWidth: 2,
                                        ),
                                      )
                                          : InkWell(
                                        onTap: () {
                                          refreshStatus();
                                        },
                                        child: const Icon(Icons.refresh,
                                            color: Colors.white, size: 18),
                                      )
                                    ],
                                  ),
                                  Text(
                                    "($lastRefreshTime)",
                                    style: GoogleFonts.inriaSerif(
                                        fontSize: 11, color: Colors.white70),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            ),
                            // ===================================
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
                          final sortedItems = (directoryFilter.first.data ?? [])
                            ..sort((a, b) => a.employeename!
                                .toLowerCase()
                                .compareTo(b.employeename!.toLowerCase()));
                          final directoryList = sortedItems[index];

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
                                    context, directoryList,status)),
                          );
                        }),
                  )
                      : const Expanded(child: Text("No Data Found !!")),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 8),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.5,
                      height: height * 0.1, // Updated
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
        ));
  }
}
// import 'dart:ffi';
//
// import 'package:auto_size_text/auto_size_text.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:ge_assistant/Constants/appconst.dart';
// import 'package:ge_assistant/Constants/popupmenu.dart';
// import 'package:ge_assistant/Screens/EndUserDirectory/models/image_model.dart';
// import 'package:ge_assistant/models/crmloginmodel.dart';
// import 'package:ge_assistant/models/directorymodel.dart';
// import 'package:ge_assistant/services/apiservices.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:provider/provider.dart';
// import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
// import 'package:speech_to_text/speech_to_text.dart';
//
// import '../../Constants/expandablelisttile.dart';
// import '../../provider/departmant_provider.dart';
//
// // int? selectedTileIndex = -1;
// class UserDirectoryDesktop extends StatefulWidget {
//   const UserDirectoryDesktop({Key? key, required this.director})
//       : super(key: key);
//
//   final List<DirectoryModel> director;
//
//   @override
//   State<UserDirectoryDesktop> createState() => _UserDirectoryDesktopState();
// }
//
// class _UserDirectoryDesktopState extends State<UserDirectoryDesktop> {
//   // --- NEW VARIABLES FOR SPEECH TO TEXT ---
//   final SpeechToText _speechToText = SpeechToText();
//   bool _speechEnabled = false;
//
//
//
// // --- SPEECH TO TEXT METHODS ---
//   void _initSpeech() async {
//     try {
//       _speechEnabled = await _speechToText.initialize(
//         onStatus: (status) {
//           if (mounted) setState(() {});
//         },
//         onError: (error) => print('Speech Error: $error'),
//       );
//     } catch (e) {
//       print("Speech recognition failed to initialize: $e");
//       _speechEnabled = false; // Flags the device as unsupported
//     }
//     if (mounted) setState(() {});
//   }
//
//   void _startListening() async {
//     await _speechToText.listen(onResult: _onSpeechResult);
//     setState(() {});
//   }
//
//   void _stopListening() async {
//     await _speechToText.stop();
//     setState(() {});
//   }
//
//   void _onSpeechResult(result) {
//     setState(() {
//       _textEditingController.text = result.recognizedWords;
//
//       // ADD THIS: Moves the blinking cursor to the end of the spoken words
//       _textEditingController.selection = TextSelection.fromPosition(
//         TextPosition(offset: _textEditingController.text.length),
//       );
//
//       applyFilters();
//     });
//   }
//
//   IconData _expandedIcon = Icons.keyboard_arrow_down;
//
//   String text = "";
//   bool isSlted = false;
//   ApiProvider client = ApiProvider();
//   int _searchIndex = 0;
//   final alphabets =
//       List.generate(26, (index) => String.fromCharCode(index + 65));
//   final ItemScrollController _itemScrollController = ItemScrollController();
//   final ItemPositionsListener _itemPositionsListener =
//       ItemPositionsListener.create();
//   List<DirecotoryModelDatum> check = [];
//   late List<DirectoryModel> directoryFilter = [];
//   late List<DirectoryModel> actualDirectory = [];
//   late List<Record> compareLists = [];
//   late Future<Crmuserslogin> status;
//
//   // --- VARIABLES FOR DROPDOWNS ---
//   String selectedBranch = 'All';
//   String selectedDepartment = 'All';
//   List<String> branchList = ['All'];
//   List<String> departmentList = ['All'];
//
//   // --- NEW VARIABLE FOR REFRESH TIME ---
//   String lastRefreshTime = "";
//
//   TextEditingController _textEditingController = TextEditingController();
//   TextEditingController _departmenttextEditingController =
//       TextEditingController();
//
//   // --- UNIFIED FILTER FUNCTION ---
//   void applyFilters() {
//     List<DirecotoryModelDatum> allData = actualDirectory.first.data ?? [];
//
//     List<DirecotoryModelDatum> filteredData = allData.where((element) {
//       // 1. Check Name Search text box
//       bool matchesName = _textEditingController.text.isEmpty ||
//           (element.employeename ?? "")
//               .toLowerCase()
//               .contains(_textEditingController.text.toLowerCase());
//
//       // 2. Check Branch Dropdown
//       bool matchesBranch = selectedBranch == 'All' ||
//           (element.branchName ?? "") == selectedBranch;
//
//       // 3. Check Department Dropdown
//       bool matchesDepartment = selectedDepartment == 'All' ||
//           (element.departmentname ?? "") == selectedDepartment;
//
//       // 4. Check Top Department Search box (if still used)
//       bool matchesTopDeptSearch = _departmenttextEditingController
//               .text.isEmpty ||
//           (element.departmentname ?? "")
//               .toLowerCase()
//               .contains(_departmenttextEditingController.text.toLowerCase());
//
//       return matchesName &&
//           matchesBranch &&
//           matchesDepartment &&
//           matchesTopDeptSearch;
//     }).toList();
//
//     setState(() {
//       directoryFilter.clear();
//       directoryFilter.add(DirectoryModel(data: filteredData));
//     });
//   }
//
// // --- NEW VARIABLE FOR REFRESH TIME ---
//
//   bool isRefreshing = false; // <--- ADD THIS LINE
//   // --- NEW REFRESH FUNCTION ---
//   // --- UPDATED REFRESH FUNCTION ---
//   void refreshStatus() async {
//     setState(() {
//       isRefreshing = true;
//     });
//
//     status = client.getloginusers(AppConstants.token ?? "");
//     await status;
//
//     if (mounted) {
//       // Add if (mounted) check here
//       setState(() {
//         isRefreshing = false;
//
//         DateTime now = DateTime.now();
//         int hour =
//             now.hour > 12 ? now.hour - 12 : (now.hour == 0 ? 12 : now.hour);
//         String amPm = now.hour >= 12 ? 'PM' : 'AM';
//         String minute = now.minute.toString().padLeft(2, '0');
//         lastRefreshTime = "$hour:$minute $amPm";
//       });
//     }
//   }
//
//
//   @override
//   void initState() {
//
//
//     actualDirectory.addAll(widget.director);
//     directoryFilter = List.from(widget.director);
//
//     // Set initial status and time
//     status = client.getloginusers(AppConstants.token ?? "");
//     DateTime now = DateTime.now();
//     int hour = now.hour > 12 ? now.hour - 12 : (now.hour == 0 ? 12 : now.hour);
//     String amPm = now.hour >= 12 ? 'PM' : 'AM';
//     String minute = now.minute.toString().padLeft(2, '0');
//     lastRefreshTime = "$hour:$minute $amPm";
//
//     // --- POPULATE DROPDOWNS ON LOAD ---
//     Set<String> uniqueDepts = {};
//     Set<String> uniqueBranches = {};
//     for (var datum in actualDirectory.first.data ?? []) {
//       if (datum.departmentname != null &&
//           !uniqueDepts.contains(datum.departmentname)) {
//         uniqueDepts.add(datum.departmentname!);
//         departmentList.add(datum.departmentname!);
//       }
//       if (datum.branchName != null &&
//           !uniqueBranches.contains(datum.branchName)) {
//         uniqueBranches.add(datum.branchName!);
//         branchList.add(datum.branchName!);
//       }
//     }
//     _initSpeech(); // <--- ADD THIS LINE
//
//     super.initState();
//   }
//
//   void setSearchIndex(String searchLetter) {
//     setState(() {
//       _searchIndex = (directoryFilter.first.data ?? [])
//           .indexWhere((element) => element.employeename?[0] == searchLetter);
//       print(_searchIndex);
//       if (_searchIndex >= 0) _itemScrollController.jumpTo(index: _searchIndex);
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final stringProvider = Provider.of<StringProvider>(context);
//     String selectedItem = stringProvider.stringValue;
//
//     var headinggroup = AutoSizeGroup();
//     double height = MediaQuery.of(context).size.height;
//     double width = MediaQuery.of(context).size.width;
//
//     return Scaffold(
//         backgroundColor: const Color(0xff303030),resizeToAvoidBottomInset: false,
//         body: GestureDetector(
//           onTap: () {
//             // Hides the keyboard when you click anywhere outside the text fields
//             FocusScope.of(context).unfocus();
//           },
//           child: SingleChildScrollView(
//             physics: const ClampingScrollPhysics(), // Prevents bouncing on Android
//             child: SizedBox(height: height,
//               child: Column(
//                 children: [
//                   Container(
//                       width: double.maxFinite,
//                       height: MediaQuery.of(context).size.height * 0.25,
//                       decoration: const BoxDecoration(
//                           image: DecorationImage(
//                         image: AssetImage("image/end user directory banner.jpg"),
//                         fit: BoxFit.fill,
//                       )),
//                       child: Column(
//                         children: [
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               SizedBox(
//                                   width: MediaQuery.of(context).size.width * 0.4,
//                                   height: MediaQuery.of(context).size.height * 0.1,
//                                   child: const Image(
//                                       image: AssetImage(
//                                           "image/GE office assistant white.png"))),
//                               Padding(
//                                 padding: EdgeInsets.only(
//                                     right: MediaQuery.of(context).size.width * 0.03),
//                                 child: PopUpMen(
//                                   menuList: [
//                                     PopupMenuItem(
//                                         child: Column(
//                                       children: [
//                                         Row(
//                                           mainAxisAlignment:
//                                               MainAxisAlignment.spaceBetween,
//                                           children: [
//                                             Text(
//                                               "Hello ${AppConstants.name}"
//                                                   .toUpperCase(),
//                                               style: const TextStyle(
//                                                   color: Colors.black),
//                                             ),
//                                             const Icon(Icons.close)
//                                           ],
//                                         ),
//                                       ],
//                                     )),
//                                     const PopupMenuItem(
//                                       value: 1,
//                                       child: ListTile(
//                                         leading: Icon(
//                                           Icons.logout,
//                                         ),
//                                         title: Text("LogOut",
//                                             style: TextStyle(color: Colors.black)),
//                                       ),
//                                     ),
//                                   ],
//                                   icon: const Icon(
//                                     Icons.menu,
//                                     color: Colors.white,
//                                   ),
//                                 ),
//                               )
//                             ],
//                           ),
//                           SizedBox(
//                             width: MediaQuery.of(context).size.width,
//                             height: MediaQuery.of(context).size.height * .15,
//                             child: Column(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 Expanded(
//                                   child: Row(
//                                     mainAxisAlignment: MainAxisAlignment.center,
//                                     crossAxisAlignment: CrossAxisAlignment.end,
//                                     children: [
//                                       AutoSizeText(
//                                         "Directory",
//                                         style: GoogleFonts.inriaSerif(
//                                             fontWeight: FontWeight.bold,
//                                             fontSize: 96,
//                                             color: Colors.white),
//                                         minFontSize: 5,
//                                       )
//                                     ],
//                                   ),
//                                 ),
//                                 Expanded(
//                                   child: Row(
//                                     mainAxisAlignment: MainAxisAlignment.center,
//                                     crossAxisAlignment: CrossAxisAlignment.start,
//                                     children: [
//                                       AutoSizeText(
//                                         "Service",
//                                         style: GoogleFonts.inriaSerif(
//                                             fontWeight: FontWeight.bold,
//                                             fontSize: 96,
//                                             color: Colors.white),
//                                         minFontSize: 5,
//                                       )
//                                     ],
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ],
//                       )),
//                   SizedBox(
//                     height: MediaQuery.of(context).size.height * 0.018,
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     children: [
//                       Padding(
//                         padding: EdgeInsets.only(
//                             left: MediaQuery.of(context).size.width * 0.011),
//                         child: Align(
//                           alignment: Alignment.topCenter,
//                           child: Padding(
//                               padding: EdgeInsets.only(
//                                   left: MediaQuery.of(context).size.width * 0.08),
//                               child: SizedBox(
//                                 width: MediaQuery.of(context).size.width > 1276.8
//                                     ? MediaQuery.of(context).size.width * 0.08
//                                     : 100,
//                                 child: ElevatedButton(
//                                   onPressed: () {
//                                     Navigator.pop(context);
//                                   },
//                                   style: ElevatedButton.styleFrom(
//                                     elevation: 4,
//                                     backgroundColor: const Color(0xff303030),
//                                     shape: RoundedRectangleBorder(
//                                       borderRadius: BorderRadius.circular(17),
//                                       side: const BorderSide(
//                                         color: Colors.white,
//                                       ),
//                                     ),
//                                   ),
//                                   child: Row(
//                                     mainAxisAlignment: MainAxisAlignment.start,
//                                     children: [
//                                       Icon(Icons.arrow_back_rounded,
//                                           size: MediaQuery.of(context).size.width >
//                                                   1276.8
//                                               ? MediaQuery.of(context).size.width *
//                                                   0.01
//                                               : 13),
//                                       const SizedBox(width: 8),
//                                       Expanded(
//                                           child: MediaQuery.of(context).size.width >
//                                                   1276.8
//                                               ? Text('Go back',
//                                                   maxLines: 1,
//                                                   style: TextStyle(
//                                                       fontSize: MediaQuery.of(context)
//                                                               .size
//                                                               .width *
//                                                           0.01))
//                                               : const Text(
//                                                   'Go back',
//                                                   maxLines: 1,
//                                                   style: TextStyle(fontSize: 10),
//                                                 )),
//                                     ],
//                                   ),
//                                 ),
//                               )),
//                         ),
//                       ),
//                     ],
//                   ),
//                   Column(mainAxisAlignment: MainAxisAlignment.center, children: [
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Container(
//                           width: 800,
//                           height: 50,
//                           alignment: Alignment.center,
//                           padding: const EdgeInsets.only(right: 0),
//                           child: ListView(
//                             scrollDirection: Axis.horizontal,
//                             shrinkWrap: true,
//                             children: alphabets
//                                 .map((alphabet) => InkWell(
//                                       onTap: () {
//                                         setSearchIndex(alphabet);
//                                       },
//                                       child: Padding(
//                                         padding: const EdgeInsets.all(8.0),
//                                         child: Text(
//                                           alphabet,
//                                           style: GoogleFonts.inriaSerif(
//                                               fontSize: 16, color: Colors.white),
//                                         ),
//                                       ),
//                                     ))
//                                 .toList(),
//                           ),
//                         ),
//                       ],
//                     ),
//                     Container(
//                       width: 800,
//                       height: 50,
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Container(
//                             height: 60,
//                             decoration: BoxDecoration(
//                                 borderRadius: BorderRadiusDirectional.circular(50),
//                                 border: Border.all(color: Colors.white)),
//                             child: Row(
//                               children: [
//                                 Container(
//                                   child: SizedBox(
//                                     width: 340,
//                                     child: TextFormField(
//                                       controller: _departmenttextEditingController,
//                                       textAlign: TextAlign.center,
//                                       style: const TextStyle(color: Colors.white),
//                                       onChanged: (value) {
//                                         applyFilters(); // Unified filter call
//                                       },
//                                       decoration: InputDecoration(
//                                         hintText: "Search Department",
//                                         hintStyle: const TextStyle(
//                                             color: Colors.white, fontSize: 14),
//                                         suffixIcon: const Stack(
//                                           alignment: Alignment.center,
//                                           children: [
//                                             Icon(
//                                               Icons.search,
//                                               color: Colors.white,
//                                               size: 0,
//                                             ),
//                                           ],
//                                         ),
//                                         border: OutlineInputBorder(
//                                             borderSide: const BorderSide(
//                                                 color: Colors.transparent),
//                                             borderRadius: BorderRadius.circular(50)),
//                                         enabledBorder: OutlineInputBorder(
//                                             borderSide: const BorderSide(
//                                                 color: Colors.transparent),
//                                             borderRadius: BorderRadius.circular(50)),
//                                         focusedBorder: OutlineInputBorder(
//                                             borderSide: const BorderSide(
//                                                 color: Colors.transparent),
//                                             borderRadius: BorderRadius.circular(50)),
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                                 const SizedBox(
//                                   width: 10,
//                                 ),
//                                 SizedBox(
//                                   height: 60,
//                                   width: 2,
//                                   child: Container(
//                                     color: Colors.white,
//                                   ),
//                                 ),
//                                 SizedBox(
//                                   width: 325,
//                                   child: TextFormField(
//                                     controller: _textEditingController,
//                                     textAlign: TextAlign.center,
//                                     style: const TextStyle(color: Colors.white),
//                                     onChanged: (value) {
//                                       applyFilters(); // Unified filter call
//                                     },
//                                     decoration: InputDecoration(
//                                       hintText: "Search by Name",
//                                       hintStyle: const TextStyle(
//                                           color: Colors.white, fontSize: 14),
//                                       suffixIcon: Row(
//                                         mainAxisSize: MainAxisSize.min,
//                                         children: [
//                                           // --- CONDITIONAL CHECK ADDED HERE ---
//                                           if (_speechEnabled)
//                                             IconButton(
//                                               icon: Icon(
//                                                 _speechToText.isListening
//                                                     ? Icons.mic
//                                                     : Icons.mic_none,
//                                                 color: _speechToText.isListening
//                                                     ? Colors.red
//                                                     : Colors.white,
//                                               ),
//                                               onPressed: () {
//                                                 if (_speechEnabled) {
//                                                   _speechToText.isNotListening
//                                                       ? _startListening()
//                                                       : _stopListening();
//                                                 }
//                                               },
//                                             ),
//                                           // The existing Search Icon stays visible for everyone
//                                           const Icon(
//                                             Icons.search,
//                                             color: Colors.white,
//                                           ),
//                                           const SizedBox(width: 10),
//                                         ],
//                                       ),
//
//                                       border: OutlineInputBorder(
//                                           borderSide: const BorderSide(
//                                               color: Colors.transparent),
//                                           borderRadius: BorderRadius.circular(50)),
//                                       enabledBorder: OutlineInputBorder(
//                                           borderSide: const BorderSide(
//                                               color: Colors.transparent),
//                                           borderRadius: BorderRadius.circular(50)),
//                                       focusedBorder: OutlineInputBorder(
//                                           borderSide: const BorderSide(
//                                               color: Colors.transparent),
//                                           borderRadius: BorderRadius.circular(50)),
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     Padding(
//                       padding: MediaQuery.of(context).size.width > 1300
//                           ? EdgeInsets.only(
//                               left: MediaQuery.of(context).size.width * 0.2,
//                               right: MediaQuery.of(context).size.width * 0.2)
//                           : EdgeInsets.only(
//                               left: MediaQuery.of(context).size.width * 0.1,
//                               right: MediaQuery.of(context).size.width * 0.1),
//                       child: ExpansionTile(
//                         trailing: Visibility(
//                           visible: false,
//                           child: SizedBox(
//                               child: SvgPicture.asset(
//                                   'image/iconmonstr-angel-down-circle-thin.svg')),
//                         ),
//                         title: Row(
//                           children: [
//                             Expanded(
//                               child: SizedBox(
//                                   child: Text(
//                                 "Name",
//                                 textAlign: TextAlign.center,
//                                 style: GoogleFonts.inriaSerif(
//                                     fontSize: 17, color: Colors.white),
//                                 maxLines: 1,
//                               )),
//                             ),
//
//                             // ===================================
//                             // NEW BRANCH DROPDOWN
//                             // ===================================
//                             Expanded(
//                               child: Container(
//                                 alignment: Alignment.center,
//                                 child: DropdownButtonHideUnderline(
//                                   child: DropdownButton<String>(
//                                     dropdownColor: const Color(0xff424242),
//                                     isExpanded: true,
//                                     value: selectedBranch,
//                                     icon: const Icon(Icons.arrow_drop_down,
//                                         color: Colors.white),
//                                     style: GoogleFonts.inriaSerif(
//                                         fontSize: 17, color: Colors.white),
//                                     items: branchList.map((String value) {
//                                       return DropdownMenuItem<String>(
//                                         value: value,
//                                         child: Center(
//                                           child: Text(
//                                               value == 'All' ? 'Branch' : value,
//                                               maxLines: 1,
//                                               overflow: TextOverflow.ellipsis),
//                                         ),
//                                       );
//                                     }).toList(),
//                                     onChanged: (newValue) {
//                                       setState(() {
//                                         selectedBranch = newValue!;
//                                       });
//                                       applyFilters();
//                                     },
//                                   ),
//                                 ),
//                               ),
//                             ),
//
//                             // ===================================
//                             // NEW DEPARTMENT DROPDOWN
//                             // ===================================
//                             Expanded(
//                               child: Container(
//                                 alignment: Alignment.center,
//                                 child: DropdownButtonHideUnderline(
//                                   child: DropdownButton<String>(
//                                     dropdownColor: const Color(0xff424242),
//                                     isExpanded: true,
//                                     value: selectedDepartment,
//                                     icon: const Icon(Icons.arrow_drop_down,
//                                         color: Colors.white),
//                                     style: GoogleFonts.inriaSerif(
//                                         fontSize: 16, color: Colors.white),
//                                     items: departmentList.map((String value) {
//                                       return DropdownMenuItem<String>(
//                                         value: value,
//                                         child: Center(
//                                           child: Text(
//                                               value == 'All' ? 'Department' : value,
//                                               maxLines: 1,
//                                               overflow: TextOverflow.ellipsis),
//                                         ),
//                                       );
//                                     }).toList(),
//                                     onChanged: (newValue) {
//                                       setState(() {
//                                         selectedDepartment = newValue!;
//                                       });
//                                       applyFilters();
//                                     },
//                                   ),
//                                 ),
//                               ),
//                             ),
//
//                             Expanded(flex: 1,
//                               child: SizedBox(
//                                   child: Text(
//                                 "Extension",
//                                 textAlign: TextAlign.center,
//                                 style: GoogleFonts.inriaSerif(
//                                     fontSize: 17, color: Colors.white),
//                                 maxLines: 1,
//                               )),
//                             ),
//
//                             // ===================================
//                             // UPDATED STATUS HEADER W/ REFRESH
//                             // ===================================
//                             Expanded(flex: 1,
//                               child: Column(
//                                 mainAxisSize: MainAxisSize.min,
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 children: [
//                                   Row(
//                                     mainAxisAlignment: MainAxisAlignment.center,
//                                     children: [
//                                       Text(
//                                         "Status",
//                                         textAlign: TextAlign.center,
//                                         style: GoogleFonts.inriaSerif(
//                                             fontSize: 17, color: Colors.white),
//                                       ),
//                                       const SizedBox(width: 5),
//                                       isRefreshing
//                                           ? const SizedBox(
//                                               width: 16,
//                                               height: 16,
//                                               child: CircularProgressIndicator(
//                                                 color: Colors.white,
//                                                 strokeWidth: 2,
//                                               ),
//                                             )
//                                           : InkWell(
//                                               onTap: () {
//                                                 refreshStatus();
//                                               },
//                                               child: const Icon(Icons.refresh,
//                                                   color: Colors.white, size: 18),
//                                             )
//                                     ],
//                                   ),
//                                   Text(
//                                     "($lastRefreshTime)",
//                                     style: GoogleFonts.inriaSerif(
//                                         fontSize: 11, color: Colors.white70),
//                                     maxLines: 1,
//                                     overflow: TextOverflow.ellipsis,
//                                   ),
//                                 ],
//                               ),
//                             ),
//                             // ===================================
//                           ],
//                         ),
//                       ),
//                     ),
//                   ]),
//                   (directoryFilter.first.data ?? []).isNotEmpty
//                       ? Expanded(
//                           child: ScrollablePositionedList.builder(
//                               itemScrollController: _itemScrollController,
//                               itemPositionsListener: _itemPositionsListener,
//                               itemCount: (directoryFilter.first.data ?? []).length,
//                               itemBuilder: (context, index) {
//                                 final sortedItems = (directoryFilter.first.data ?? [])
//                                   ..sort((a, b) => a.employeename!
//                                       .toLowerCase()
//                                       .compareTo(b.employeename!.toLowerCase()));
//                                 final directoryList = sortedItems[index];
//
//                                 return Padding(
//                                   padding: MediaQuery.of(context).size.width > 1300
//                                       ? EdgeInsets.only(
//                                           left:
//                                               MediaQuery.of(context).size.width * .2,
//                                           right:
//                                               MediaQuery.of(context).size.width * .2)
//                                       : EdgeInsets.only(
//                                           left:
//                                               MediaQuery.of(context).size.width * .1,
//                                           right:
//                                               MediaQuery.of(context).size.width * .1),
//                                   child: Container(
//                                       color: index % 2 == 0
//                                           ? const Color(0xff5A5858)
//                                           : const Color(0xff424242),
//                                       child: customListExpanded(
//                                           context, directoryList,status)),
//                                 );
//                               }),
//                         )
//                       : const Expanded(child: Text("No Data Found !!")),
//                   Padding(
//                     padding: const EdgeInsets.only(left: 8.0, right: 8),
//                     child: SizedBox(
//                       width: MediaQuery.of(context).size.width * 0.5,
//                       height: MediaQuery.of(context).size.height * 0.1,
//                       child: Align(
//                         alignment: Alignment.center,
//                         child: AutoSizeText(
//                           "Copyright 2023 © German Experts. All Rights Reserved",
//                           style: GoogleFonts.inter(
//                             textStyle: const TextStyle(color: Color(0xffFFFFFF)),
//                           ),
//                           maxLines: 1,
//                           minFontSize: 2,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ));
//   }
// }
