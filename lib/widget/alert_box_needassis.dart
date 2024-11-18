import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:ge_assistant/Screens/EndPantrymenu/Desktop_end_pantrymenu.dart';

Future<void> showAssistanceSuccessDialog(
  BuildContext context,
) async {
  await showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return FutureBuilder(
        future: client.createAssistance(),
        builder: (BuildContext context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(
              child: Text("Error"),
            );
          } else {
            if (snapshot.data?.messagecode == "1001") {
              return AlertDialog(
                  backgroundColor: Colors.transparent,
                  title: Padding(
                    padding: const EdgeInsets.only(top: 180.0),
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.6,
                      width: MediaQuery.of(context).size.width * 0.28,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              InkWell(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: Colors
                                            .white, // Replace with your desired border color
                                        width:
                                            0.9, // Replace with your desired border width
                                      ),
                                    ),
                                    child: const CircleAvatar(
                                      radius: 11,
                                      backgroundColor: Colors.transparent,
                                      child: Icon(
                                        Icons.close,
                                        size: 13,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ))
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.3,
                                width: MediaQuery.of(context).size.width * 0.23,
                                child: const Image(
                                  image: AssetImage(
                                    "image/f469f659f60053c25df8aeca3a7556f1.gif",
                                  ),
                                  fit: BoxFit.fill,
                                )),
                          ),
                          const Column(
                            children: [
                              AutoSizeText(
                                "Call  initiated.",
                                maxLines: 1,
                                style: TextStyle(color: Colors.white),
                              ),
                              // AutoSizeText(
                              //   "Thank you, see you soon.",
                              //   maxLines: 1,
                              //   style: TextStyle(color: Colors.white),
                              // ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                              // Navigator.pushReplacement(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) =>
                              //             const EndUserPantrymenuBasePage()));
                            },
                            style: ButtonStyle(
                              backgroundColor: const MaterialStatePropertyAll(
                                  Colors.transparent),
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(3.0),
                                    side: const BorderSide(
                                        color: Colors
                                            .white) // Replace with your desired border color
                                    ),
                              ),
                            ),
                            child: const Text("Ok"),
                          ),
                        ],
                      ),
                    ),
                  ));
            } else {
              return const Center(child: Text("error"));
            }
          }
        },
      );
    },
  );
}
