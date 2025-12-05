import 'package:flutter/material.dart';
import 'package:one_context/one_context.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

void showSnackBarTop({String? message}) {
  final BuildContext? ctx = OneContext().context;
  final OverlayState? overlay = ctx == null ? null : Overlay.of(ctx);

  if (overlay != null) {
    showTopSnackBar(
      overlay,
      CustomSnackBar.info(
        message: message ?? 'Operation completed',
        backgroundColor: const Color(0xff303030),
        textStyle: const TextStyle(fontSize: 20),
      ),
    );
    return;
  }

  // Fallback: show a normal SnackBar if overlay is unavailable (prevents silent failure)
  if (ctx != null) {
    final snack = SnackBar(
      content: Text(message ?? 'Operation completed'),
      behavior: SnackBarBehavior.floating,
      margin: const EdgeInsets.only(top: 12, left: 12, right: 12),
    );
    ScaffoldMessenger.of(ctx).showSnackBar(snack);
  }
}
// void showSnackBarTop({String? message}) {
//   final BuildContext? ctx = OneContext().context;
//   if (ctx == null) return;
//   showTopSnackBar(
//     Overlay.of(ctx),
//     CustomSnackBar.info(
//       message:
//           message ?? "Good job, your release is successful. Have a nice day",
//       backgroundColor: Color(0xff303030),
//       textStyle: TextStyle(fontSize: 20),
//     ),
//   );
// }
