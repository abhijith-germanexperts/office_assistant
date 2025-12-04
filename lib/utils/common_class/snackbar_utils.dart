import 'package:flutter/material.dart';
import 'package:one_context/one_context.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

void showSnackBarTop({String? message}) {
  final BuildContext? ctx = OneContext().context;
  if (ctx == null) return;
  showTopSnackBar(
    Overlay.of(ctx),
    CustomSnackBar.info(
      message:
          message ?? "Good job, your release is successful. Have a nice day",
      backgroundColor: Color(0xff303030),
      textStyle: TextStyle(fontSize: 20),
    ),
  );
}
