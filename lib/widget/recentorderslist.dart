import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_svg/svg.dart';
import 'package:ge_assistant/Constants/appconst.dart';
import 'package:ge_assistant/Screens/End%20userselection%20page/EmdUserSelectionDesktop.dart';
import 'package:ge_assistant/models/check_order_lmit/checkuserorderlimitmodel.dart';
import 'package:ge_assistant/services/apiservices.dart';
import 'package:ge_assistant/utils/common_class/console_print.dart';
import 'package:ge_assistant/utils/common_class/snackbar_utils.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:flutter_inset_shadow/flutter_inset_shadow.dart';
import '../Constants/alertdylog_order_success.dart';
import '../models/recentorders.dart';

// color: index%2==0? const Color(0xff5A5858) : const Color(0xff424242),
Widget customRecentOrderListExpanded(
  BuildContext context,
  listgroup,
  Datum orderitem,
) {
  final List<Map<String, dynamic>> orderDetails = [];

  List image = [
    "image/pednding.png", //pending
    "image/accepted.png", //accept
    "image/completed.png", //completed
    "image/cancelled.png", // cancelled
  ];
  double height = MediaQuery.of(context).size.height;
  double width = MediaQuery.of(context).size.width;
  var headgroup = AutoSizeGroup();
  var isexpanded = false;
  DateFormat inputFormat = DateFormat('yyyy-MM-dd hh:mm:ss a');
  DateTime dateTime = inputFormat.parse(orderitem.createdAt ?? "");
  String formattedTime = DateFormat('h:mm a').format(dateTime);
  String formatdate = DateFormat("dd-MM-yyyy").format(dateTime);
  int status = orderitem.statusorderid! - 1;
  print(formatdate);
  print(formattedTime);

  bool isCheckingLimit = false;

  Future<bool?> checkOrderLimit(StateSetter setState,
      {int? foodcategoryid, required int? qty}) async {
    if (isCheckingLimit) return null;
    final categoryId = foodcategoryid;
    if (categoryId == null) {
      ScaffoldMessenger.of(context).clearSnackBars();
      showSnackBarTop(message: 'Missing category ID.');

      // ScaffoldMessenger.of(context).showSnackBar(
      //   const SnackBar(content: Text('Missing category ID.')),
      // );
      return null;
    }

    try {
      setState(() => isCheckingLimit = true);

      final client = ApiProvider();
      // The API client returns a single nullable object, not a list.
      final CheckUserOrderLimit? model =
          await client.checkUserOrderLimit(categoryId);

      if (model == null) {
        ScaffoldMessenger.of(context).clearSnackBars();
        showSnackBarTop(message: 'Unable to verify order limit.');
        // ScaffoldMessenger.of(context).showSnackBar(
        //   const SnackBar(
        //     content: Text('Unable to verify order limit.'),
        //   ),
        // );
        return null;
      }

      final data = model.data;

      if (data == null) {
        ScaffoldMessenger.of(context).clearSnackBars();
        showSnackBarTop(message: 'Invalid limit data received.');
        // ScaffoldMessenger.of(context).showSnackBar(
        //   const SnackBar(content: Text('Invalid limit data received.')),
        // );
        return true;
      }

      // Condition 1: Unlimited category
      if (data.hasUserLimit == false || data.categoryType == 'unlimited') {
        return true;
      }
      // Condition 2: Limited category
      else if (data.hasUserLimit == true && data.categoryType == 'limited') {
        // final cartProvider = Provider.of<CartProvider>(context, listen: false);
        int quantityInCart = qty ?? 0;
        // for (var cartItem in cartProvider.cartItems) {
        //   if (cartItem.item.foodcategoryid == categoryId) {
        //     quantityInCart += cartItem.quantity;
        //   }
        // }

        if (quantityInCart < (data.balance ?? 0)) {
          // provider.addToCart(menuitem);
          // ScaffoldMessenger.of(context).clearSnackBars();
          // ScaffoldMessenger.of(context).showSnackBar(
          //   const SnackBar(content: Text('Added to cart.')),
          // );
          return true;
        } else {
          // ScaffoldMessenger.of(context).clearSnackBars();
          // ScaffoldMessenger.of(context).showSnackBar(
          //   const SnackBar(
          //     content:
          //         Text('You have reached your order limit for this category.'),
          //   ),
          // );
          return false;
        }
      } else {
        ScaffoldMessenger.of(context).clearSnackBars();
        showSnackBarTop(message: 'Could not determine order eligibility.');
        // ScaffoldMessenger.of(context).showSnackBar(
        //   const SnackBar(
        //       content: Text('Could not determine order eligibility.')),
        // );
        return false;
      }
    } catch (e) {
      ScaffoldMessenger.of(context).clearSnackBars();
      showSnackBarTop(message: 'Error: ${e.toString()}');
      // ScaffoldMessenger.of(context).showSnackBar(
      //   SnackBar(content: Text('Error: ${e.toString()}')),
      // );
      return false;
    } finally {
      setState(() => isCheckingLimit = false);
    }
  }

  return StatefulBuilder(
      builder: (BuildContext context, void Function(void Function()) setState) {
    return Container(
      // width: width * .7,
      margin: const EdgeInsets.all(1),
      // Optional margin for the inner shadow
      decoration: isexpanded
          ? const BoxDecoration(
              boxShadow: [
                BoxShadow(
                    color: Colors.black,
                    offset: Offset(1, 1),
                    blurRadius: 4,
                    spreadRadius: 0,
                    inset: true),
                BoxShadow(
                    color: Colors.grey,
                    offset: Offset(-1, -1),
                    blurRadius: 4,
                    spreadRadius: 0,
                    inset: true),
              ], //
              //
              //color: Color(0xff5A5858),// Container background color
            )
          : const BoxDecoration(),
      child: Theme(
        data: ThemeData().copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          // tilePadding: EdgeInsets.zero,
          shape: Border.all(color: Colors.transparent),
          // collapsedBackgroundColor: Colors.transparent,
          trailing: isexpanded
              ? SizedBox(
                  child: SvgPicture.asset(
                      'image/iconmonstr-angel-up-circle-thin.svg'))
              : SizedBox(
                  child: SvgPicture.asset(
                      'image/iconmonstr-angel-down-circle-thin.svg')),
          // trailing: Icon(
          //   isexpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
          //   color: Colors.white, // Specify the icon for the collapsed state
          // ),
          title: !isexpanded
              ? Row(
                  children: [
                    SizedBox(
                      width: width > 944 ? width * .1 : width * .1,
                      // color: Colors.red,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0, right: 4),
                        child: AutoSizeText(
                          formatdate,
                          textAlign: TextAlign.center,
                          style: GoogleFonts.inriaSerif(
                              fontSize: 20, color: Colors.white),
                          maxLines: 1,
                          minFontSize: 8,
                          //group: listgroup,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: width > 944 ? width * .08 : width * .08,
                      // color: Colors.yellow,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0, right: 4),
                        child: AutoSizeText(
                          formattedTime,
                          textAlign: TextAlign.center,
                          style: GoogleFonts.inriaSerif(
                              fontSize: 18, color: Colors.white),
                          maxLines: 1,
                          minFontSize: 8,
                          //group: listgroup,
                        ),
                      ),
                    ),
                    const Spacer(),
                    SizedBox(
                        width: width * 0.1,
                        // color: Colors.blue,
                        height: 16,
                        child: Image(image: AssetImage(image[status]))),
                    // const Spacer(
                    //   flex: 2,
                    // ),
                    const Spacer(
                      flex: 2,
                    ),
                    ElevatedButton(
                      onPressed: status != 2
                          ? null
                          : () async {
                              bool? hasLimitIssue = false;
                              for (int i = 0;
                                  i < orderitem.orderdetails!.length;
                                  i++) {
                                consolePrint(
                                    "INFO - ${orderitem?.orderdetails?.first?.categoryname}");
                                orderDetails.add({
                                  "qty": orderitem.orderdetails?[i].qty,
                                  "menuid": orderitem.orderdetails?[i].menuid,
                                  "pantryid": AppConstants.pantryId ?? ""
                                });

                                bool? needdToAdd = await checkOrderLimit(
                                    setState,
                                    foodcategoryid:
                                        orderitem.orderdetails?[i].categoryid,
                                    qty: orderitem.orderdetails?[i].qty);
                                consolePrint("needdToAdd - $needdToAdd");
                                if (needdToAdd != true) {
                                  hasLimitIssue = true;
                                }
                              }
                              consolePrint(
                                  "has limit issue*** - $hasLimitIssue");
                              if (hasLimitIssue == false) {
                                showOrderSuccessDialog(context, orderDetails,
                                    ""); //TODO:commented for testing 26 Nov 25 26 11 25
                              } else {
                                ScaffoldMessenger.of(context).clearSnackBars();
                                showSnackBarTop(
                                    message:
                                        'You have reached your order limit for this category.');
                                // ScaffoldMessenger.of(context).showSnackBar(
                                //   const SnackBar(
                                //     content: Text(
                                //       'You have reached your order limit for this category.',
                                //     ),
                                //   ),
                                // );
                              }
                            },
                      style: ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll(status == 2
                              ? Colors.white
                              : Colors.grey.shade600)),
                      child: const Text(
                        "Repeat Order",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ],
                )
              : Row(
                  children: [
                    Expanded(
                      flex: 4,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              // SizedBox(width: width*0.038,),
                              SizedBox(
                                width: width > 944 ? width * .1 : width * .1,
                                // color: Colors.red,
                                child: AutoSizeText(
                                  formatdate,
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.inriaSerif(
                                      fontSize: 20, color: Colors.white),
                                  maxLines: 1,
                                  minFontSize: 8,
                                  group: listgroup,
                                ),
                              ),
                              SizedBox(
                                width: width > 944 ? width * .08 : width * .08,
                                // color: Colors.yellow,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 8.0, right: 8),
                                  child: AutoSizeText(
                                    formattedTime,
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.inriaSerif(
                                        fontSize: 20, color: Colors.white),
                                    maxLines: 1,
                                    minFontSize: 8,
                                    group: listgroup,
                                  ),
                                ),
                              ),
                              const Spacer(),
                              SizedBox(
                                  width: width * 0.1,
                                  // color: Colors.blue,
                                  height: 16,
                                  child:
                                      Image(image: AssetImage(image[status]))),
                              // Expanded(flex: 2,child: Container()),
                              // const Spacer(
                              //   flex: 2,
                              // ),
                              const Spacer(),
                              SizedBox(
                                width: width > 944 ? 80 : 60,
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          // ============List of items start here==============================
                          SizedBox(
                            // color: Colors.red,
                            height: 200,
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    SizedBox(
                                      width: width * .25,
                                      child: AutoSizeText(
                                        "Item name",
                                        textAlign: TextAlign.start,
                                        style: GoogleFonts.inriaSerif(
                                            fontSize: 20, color: Colors.white),
                                        maxLines: 1,
                                        minFontSize: 8,
                                        group: listgroup,
                                      ),
                                    ),
                                    SizedBox(
                                      width: width * .08,
                                      child: AutoSizeText(
                                        "Category",
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.inriaSerif(
                                            fontSize: 20, color: Colors.white),
                                        maxLines: 1,
                                        minFontSize: 8,
                                        group: listgroup,
                                      ),
                                    ),
                                    SizedBox(
                                      width: width * .1,
                                      child: AutoSizeText(
                                        "Quantity",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(color: Colors.white),
                                        maxLines: 1,
                                        group: listgroup,
                                      ),
                                    ),
                                  ],
                                ),
                                Container(
                                  color: Colors.white,
                                  width: double.maxFinite,
                                  height: 1,
                                ),
                                Expanded(
                                  child: ScrollConfiguration(
                                    behavior: ScrollConfiguration.of(context)
                                        .copyWith(scrollbars: false),
                                    child: ListView.builder(
                                        itemCount:
                                            orderitem.orderdetails?.length,
                                        itemBuilder: (_, index) {
                                          return SizedBox(
                                            height: height * .03,
                                            // color: Colors.brown,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: [
                                                SizedBox(
                                                  width: width * .25,
                                                  // color:Colors.red,
                                                  child: Row(
                                                    children: [
                                                      SizedBox(
                                                        child: FadeInImage
                                                            .assetNetwork(
                                                          placeholder:
                                                              'image/ge office assistant.gif',
                                                          imageErrorBuilder:
                                                              (context, error,
                                                                  stackTrace) {
                                                            return Image.asset(
                                                                'image/ge office assistant.gif',
                                                                width:
                                                                    width * .1,
                                                                fit: BoxFit
                                                                    .fitWidth);
                                                          },
                                                          image: (orderitem
                                                                  .orderdetails?[
                                                                      index]
                                                                  .itemimgpath
                                                                  .toString() ??
                                                              ""),
                                                          fit: BoxFit.fill,
                                                        ),
                                                      ),
                                                      Expanded(
                                                          child: AutoSizeText(
                                                        orderitem
                                                                .orderdetails?[
                                                                    index]
                                                                .itemname ??
                                                            "",
                                                        group: listgroup,
                                                        style: GoogleFonts
                                                            .inriaSerif(
                                                                fontSize: 20,
                                                                color: Colors
                                                                    .white),
                                                      )),
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(
                                                    // color: Colors.blue,
                                                    width: width * .1,
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 8.0,
                                                              right: 8),
                                                      child: AutoSizeText(
                                                          orderitem
                                                                  .orderdetails?[
                                                                      index]
                                                                  .categoryname ??
                                                              "",
                                                          group: listgroup,
                                                          style: GoogleFonts
                                                              .inriaSerif(
                                                                  fontSize: 20,
                                                                  color: Colors
                                                                      .white),
                                                          textAlign:
                                                              TextAlign.center),
                                                    )),
                                                SizedBox(
                                                    width: width * .1,
                                                    // color: Colors.green,
                                                    child: AutoSizeText(
                                                      orderitem
                                                              .orderdetails?[
                                                                  index]
                                                              .qty
                                                              .toString() ??
                                                          "",
                                                      group: listgroup,
                                                      style: GoogleFonts
                                                          .inriaSerif(
                                                              fontSize: 20,
                                                              color:
                                                                  Colors.white),
                                                      textAlign:
                                                          TextAlign.center,
                                                    )),
                                              ],
                                            ),
                                          );
                                        }),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    // =====Fist part of row end here =============================
                    Expanded(
                      child: SizedBox(
                        height: 225,
                        width: 850,
                        // color: Colors.yellow,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            SizedBox(
                              child: ElevatedButton(
                                onPressed: status != 2
                                    ? null
                                    : () async {
                                        bool? hasLimitIssue = false;

                                        // Navigator.pushReplacement(
                                        //     context, MaterialPageRoute(builder: (context) => const EndViewOrderBasePage()));
                                        print(status);
                                        for (int i = 0;
                                            i < orderitem.orderdetails!.length;
                                            i++) {
                                          orderDetails.add({
                                            "qty":
                                                orderitem.orderdetails?[i].qty,
                                            "menuid": orderitem
                                                .orderdetails?[i].menuid,
                                            "pantryid":
                                                AppConstants.pantryId.toString()
                                          });
                                          bool? needdToAdd =
                                              await checkOrderLimit(setState,
                                                  foodcategoryid: orderitem
                                                      .orderdetails?[i]
                                                      .categoryid,
                                                  qty: orderitem
                                                      .orderdetails?[i].qty);
                                          consolePrint(
                                              "needdToAdd - $needdToAdd");
                                          if (needdToAdd != true) {
                                            hasLimitIssue = true;
                                          }
                                        }
                                        // showOrderSuccessDialog(
                                        //     context, orderDetails, "");

                                        consolePrint(
                                            "has limit issue*** - $hasLimitIssue");
                                        if (hasLimitIssue == false) {
                                          showOrderSuccessDialog(
                                              context, orderDetails, "");
                                        } else {
                                          ScaffoldMessenger.of(context)
                                              .clearSnackBars();
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            const SnackBar(
                                              content: Text(
                                                'You have reached your order limit for this category.',
                                              ),
                                            ),
                                          );
                                        }
                                      },
                                style: ButtonStyle(
                                    backgroundColor: MaterialStatePropertyAll(
                                        status == 2
                                            ? Colors.white
                                            : Colors.grey.shade600)),
                                child: const AutoSizeText(
                                  "Repeat Order",
                                  textAlign: TextAlign.center,
                                  maxLines: 2,
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),

          onExpansionChanged: (value) {
            isexpanded = value;
            setState(() {});
          },
        ),
      ),
    );
  });
}
