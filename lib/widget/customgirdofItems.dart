// dart
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:ge_assistant/models/check_order_lmit/checkuserorderlimitmodel.dart';
import 'package:ge_assistant/models/endusermenumodel.dart';
import 'package:ge_assistant/services/apiservices.dart';
import 'package:provider/provider.dart';

import '../models/inventorylistmodel.dart';
import '../provider/service_provider.dart';

Widget customGirdview(
    BuildContext context, Response menuitem, itemNameGroup, provider) {
  bool isSelected = false;
  bool isCheckingLimit = false;



  Future<void> checkOrderLimit(StateSetter setState) async {
    if (isCheckingLimit) return;
    final categoryId = menuitem?.foodcategoryid;
    if (categoryId == null) {
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Missing category ID.')),
      );
      return;
    }

    try {
      setState(() => isCheckingLimit = true);

      final client = ApiProvider();
      // The API client returns a single nullable object, not a list.
      final CheckUserOrderLimit? model =
      await client.checkUserOrderLimit(categoryId);

      if (model == null) {
        ScaffoldMessenger.of(context).clearSnackBars();
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Unable to verify order limit.')),
        );
        return;
      }

      final data = model.data;

      if (data == null) {
        ScaffoldMessenger.of(context).clearSnackBars();
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Invalid limit data received.')),
        );
        return;
      }

      // Condition 1: Unlimited category
      if (data.hasUserLimit == false || data.categoryType == 'unlimited') {
        provider.addToCart(menuitem);
        ScaffoldMessenger.of(context).clearSnackBars();
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Added to cart.')),
        );
      }
      // Condition 2: Limited category
      else if (data.hasUserLimit == true && data.categoryType == 'limited') {
        final cartProvider = Provider.of<CartProvider>(context, listen: false);
        int quantityInCart = 0;
        for (var cartItem in cartProvider.cartItems) {
          if (cartItem.item.foodcategoryid == categoryId) {
            quantityInCart += cartItem.quantity;
          }
        }

        if (quantityInCart < (data.balance ?? 0)) {
          provider.addToCart(menuitem);
          ScaffoldMessenger.of(context).clearSnackBars();
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Added to cart.')),
          );
        } else {
          ScaffoldMessenger.of(context).clearSnackBars();
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('You have reached your order limit for this category.'),
            ),
          );
        }
      } else {
        ScaffoldMessenger.of(context).clearSnackBars();
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Could not determine order eligibility.')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: ${e.toString()}')),
      );
    } finally {
      setState(() => isCheckingLimit = false);
    }
  }



  // Future<void> checkOrderLimit(StateSetter setState) async {
  //   if (isCheckingLimit) return;
  //   final categoryId = menuitem?.foodcategoryid;
  //   if (categoryId == null) {
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       const SnackBar(content: Text('Missing category ID.')),
  //     );
  //     return;
  //   }
  //
  //   try {
  //     setState(() => isCheckingLimit = true);
  //
  //     final client = ApiProvider();
  //     final CheckUserOrderLimit? model =
  //     await client.checkUserOrderLimit(categoryId);
  //
  //     final hasLimit = model?.data?.hasUserLimit;
  //     if (hasLimit == false) {
  //       provider.addToCart(menuitem);
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         const SnackBar(content: Text('Added to cart.')),
  //       );
  //     } else if (hasLimit == true) {
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         const SnackBar(
  //           content: Text('You have reached your order limit for this category.'),
  //         ),
  //       );
  //     } else {
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         const SnackBar(content: Text('Unable to verify order limit.')),
  //       );
  //     }
  //   } catch (e) {
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(content: Text('Error: ${e.toString()}')),
  //     );
  //   } finally {
  //     setState(() => isCheckingLimit = false);
  //   }
  // }

  return StatefulBuilder(
    builder: (BuildContext context, StateSetter setState) {
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
              Expanded(
                child: FadeInImage.assetNetwork(
                  placeholder: 'image/ge office assistant.gif',
                  image: menuitem.itemimgpath.toString(),
                  fit: BoxFit.fill,
                ),
              ),
              Consumer<CartProvider>(
                builder: (context, cart, child) {
                  final cartItems = cart.cartItems;
                  var checkValue = cartItems.where((oldValue) {
                    return menuitem.itemname == (oldValue.item.itemname);
                  }).isEmpty;
                  int selectesIndex = cartItems.indexWhere(
                          (element) => element.item.itemname == menuitem.itemname);
                  return checkValue == true
                      ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          checkOrderLimit(setState);
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: Icon(
                            Icons.add_circle_outline_sharp,
                            color: Colors.white,
                            size:
                            MediaQuery.of(context).size.width * 0.03,
                          ),
                        ),
                      ),
                    ],
                  )
                      : Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            cart.removeFromCart(
                                cartItems[selectesIndex].item);
                          },
                          child: Icon(
                            Icons.remove,
                            opticalSize: 48,
                            weight: 200,
                            color: Colors.white,
                            size:
                            MediaQuery.of(context).size.width * 0.03,
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.white,
                              width: 2,
                            ),
                          ),
                          child: CircleAvatar(
                            radius: 16,
                            backgroundColor: Colors.transparent,
                            child: Text(
                              cartItems[selectesIndex]
                                  .quantity
                                  .toString(),
                              style:
                              const TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            checkOrderLimit(setState);

                            // cart.addToCart(
                            //     cartItems[selectesIndex].item);
                          },
                          child: Icon(
                            Icons.add,
                            opticalSize: 48,
                            weight: 200,
                            color: Colors.white,
                            size:
                            MediaQuery.of(context).size.width * 0.03,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
              Container(
                width: double.maxFinite,
                height: MediaQuery.of(context).size.height * 0.05,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Center(
                    child: AutoSizeText(
                      menuitem.itemname ?? "",
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black),
                      group: itemNameGroup,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}

// import 'package:auto_size_text/auto_size_text.dart';
// import 'package:flutter/material.dart';
// import 'package:ge_assistant/models/check_order_lmit/checkuserorderlimitmodel.dart';
// import 'package:ge_assistant/models/endusermenumodel.dart';
// import 'package:ge_assistant/services/apiservices.dart';
// import 'package:provider/provider.dart';
//
// import '../models/inventorylistmodel.dart';
// import '../provider/service_provider.dart';
//
// Widget customGirdview(
//     BuildContext context, Response menuitem, itemNameGroup, provider) {
//   bool isSelected = false;
//
//   // dart
//   bool isCheckingLimit = false;
//
//   Future<void> checkOrderLimit() async {
//     if (isCheckingLimit) return;
//     final categoryId = menuitem?.foodcategoryid;
//     if (categoryId == null) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('Missing category ID.')),
//       );
//       return;
//     }
//
//     try {
//       setState(() => isCheckingLimit = true);
//
//       final client = ApiProvider();
//       final CheckUserOrderLimit? model =
//       await client.checkUserOrderLimit(categoryId);
//
//       final hasLimit = model?.data?.hasUserLimit;
//       if (hasLimit == false) {
//         provider.addToCart(menuitem);
//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(content: Text('Added to cart.')),
//         );
//       } else if (hasLimit == true) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(
//             content: Text('You have reached your order limit for this category.'),
//           ),
//         );
//       } else {
//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(content: Text('Unable to verify order limit.')),
//         );
//       }
//     } catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Error: ${e.toString()}')),
//       );
//     } finally {
//       setState(() => isCheckingLimit = false);
//     }
//   }
//
//
//   return StatefulBuilder(
//       builder: (BuildContext context, void Function(void Function()) setState) {
//     return Card(
//       color: const Color(0xff3A3C3D),
//       elevation: 10,
//       shadowColor: Colors.black,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(10),
//       ),
//       child: ClipRRect(
//         borderRadius: BorderRadius.circular(10),
//         child: Column(
//           children: [
//             Expanded(
//               child: FadeInImage.assetNetwork(
//                 placeholder: 'image/ge office assistant.gif',
//                 image: menuitem.itemimgpath.toString(),
//                 fit: BoxFit.fill,
//               ),
//             ),
//             Consumer<CartProvider>(
//               builder: (context, cart, child) {
//                 final cartItems = cart.cartItems;
//                 var checkValue = cartItems.where((oldValue) {
//                   return menuitem.itemname == (oldValue.item.itemname);
//                   //  &&
//                   //     shelfId == (oldValue.shelfno);
//                 }).isEmpty;
//                 int selectesIndex = cartItems.indexWhere(
//                     (element) => element.item.itemname == menuitem.itemname);
//                 print(selectesIndex);
//                 return checkValue == true
//                     ? Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           InkWell(
//                               onTap: () {
//                                 // ApiProvider client = ApiProvider();
//                                 checkOrderLimit();
//                                 //TODO:here check the api before add
//                                 // client.checkUserOrderLimit(menuitem?.foodcategoryid);
//
//                                 // provider.addToCart(menuitem);
//                               },
//                               child: Padding(
//                                 padding: const EdgeInsets.only(bottom: 8.0),
//                                 child: Icon(
//                                   Icons.add_circle_outline_sharp,
//                                   // opticalSize: 48,
//                                   // weight: 200,
//                                   color: Colors.white,
//                                   size:
//                                       MediaQuery.of(context).size.width * 0.03,
//                                 ),
//                               )),
//                         ],
//                       )
//                     : Padding(
//                         padding: const EdgeInsets.only(bottom: 8.0),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             InkWell(
//                                 onTap: () {
//                                   // isSelected = !isSelected;
//                                   // setState(() {});
//
//                                   cart.removeFromCart(
//                                       cartItems[selectesIndex].item);
//                                 },
//                                 child: Icon(
//                                   Icons.remove,
//                                   opticalSize: 48,
//                                   weight: 200,
//                                   color: Colors.white,
//                                   size:
//                                       MediaQuery.of(context).size.width * 0.03,
//                                 )),
//                             Container(
//                               decoration: BoxDecoration(
//                                 shape: BoxShape.circle,
//                                 border: Border.all(
//                                   color: Colors
//                                       .white, // Replace with your desired border color
//                                   width:
//                                       2, // Replace with your desired border width
//                                 ),
//                               ),
//                               child: CircleAvatar(
//                                 radius: 16,
//                                 backgroundColor: Colors.transparent,
//                                 child: Text(
//                                   cartItems[selectesIndex].quantity.toString(),
//                                   style: const TextStyle(color: Colors.white),
//                                 ),
//                               ),
//                             ),
//                             InkWell(
//                                 onTap: () {
//                                   cart.addToCart(cartItems[selectesIndex].item);
//                                   // isSelected = !isSelected;
//                                   //setState(() {});
//                                 },
//                                 child: Icon(
//                                   Icons.add,
//                                   opticalSize: 48,
//                                   weight: 200,
//                                   color: Colors.white,
//                                   size:
//                                       MediaQuery.of(context).size.width * 0.03,
//                                 )),
//                           ],
//                         ),
//                       );
//               },
//             ),
//             Container(
//                 width: double.maxFinite,
//                 height: MediaQuery.of(context).size.width > 1000
//                     ? MediaQuery.of(context).size.height * 0.05
//                     : MediaQuery.of(context).size.height * 0.05,
//                 color: Colors.white,
//                 child: Padding(
//                   padding: const EdgeInsets.all(2.0),
//                   child: Center(
//                       child: AutoSizeText(
//                     menuitem.itemname ?? "",
//                     textAlign: TextAlign.center,
//                     style: const TextStyle(
//                         fontWeight: FontWeight.bold, color: Colors.black),
//                     group: itemNameGroup,
//                   )),
//                 )),
//           ],
//         ),
//       ),
//     );
//   });
// }
