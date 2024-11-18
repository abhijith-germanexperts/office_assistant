import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:ge_assistant/models/endusermenumodel.dart';
import 'package:provider/provider.dart';

import '../models/inventorylistmodel.dart';
import '../provider/service_provider.dart';

Widget customGirdview(
    BuildContext context, Response menuitem, itemNameGroup, provider) {
  bool isSelected = false;

  return StatefulBuilder(
      builder: (BuildContext context, void Function(void Function()) setState) {
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
                  //  &&
                  //     shelfId == (oldValue.shelfno);
                }).isEmpty;
                int selectesIndex = cartItems.indexWhere(
                    (element) => element.item.itemname == menuitem.itemname);
                print(selectesIndex);
                return checkValue == true
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                              onTap: () {
                                provider.addToCart(menuitem);
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 8.0),
                                child: Icon(
                                  Icons.add_circle_outline_sharp,
                                  // opticalSize: 48,
                                  // weight: 200,
                                  color: Colors.white,
                                  size:
                                      MediaQuery.of(context).size.width * 0.03,
                                ),
                              )),
                        ],
                      )
                    : Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                                onTap: () {
                                  // isSelected = !isSelected;
                                  // setState(() {});

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
                                )),
                            Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: Colors
                                      .white, // Replace with your desired border color
                                  width:
                                      2, // Replace with your desired border width
                                ),
                              ),
                              child: CircleAvatar(
                                radius: 16,
                                backgroundColor: Colors.transparent,
                                child: Text(
                                  cartItems[selectesIndex].quantity.toString(),
                                  style: const TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                            InkWell(
                                onTap: () {
                                  cart.addToCart(cartItems[selectesIndex].item);
                                  // isSelected = !isSelected;
                                  //setState(() {});
                                },
                                child: Icon(
                                  Icons.add,
                                  opticalSize: 48,
                                  weight: 200,
                                  color: Colors.white,
                                  size:
                                      MediaQuery.of(context).size.width * 0.03,
                                )),
                          ],
                        ),
                      );
              },
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
                    menuitem.itemname ?? "",
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black),
                    group: itemNameGroup,
                  )),
                )),
          ],
        ),
      ),
    );
  });
}
