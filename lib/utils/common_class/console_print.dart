import 'package:flutter/foundation.dart';

consolePrint(dynamic value) {
  // return;
  if (kReleaseMode == false) {
    // Is Release Mode??

    return debugPrint(value.toString());
  }
}
