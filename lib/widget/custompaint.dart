import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class _RenderInnerShadow extends RenderProxyBox {
  double? blur;
  Color? color;
  double? dx;
  double? dy;
  Color? topLeftColor; // New property for the top-left color

  @override
  void paint(PaintingContext context, Offset offset) {
    if (child == null) return;

    final Rect rectOuter = offset & size;
    final Rect rectInner = Rect.fromLTWH(
      offset.dx,
      offset.dy,
      size.width - dx!,
      size.height - dy!,
    );
    final Canvas canvas = context.canvas..saveLayer(rectOuter, Paint());
    context.paintChild(child!, offset);
    final Paint shadowPaint = Paint()
      ..blendMode = BlendMode.srcATop
      ..imageFilter = ImageFilter.blur(sigmaX: blur ?? 0, sigmaY: blur ?? 0)
      ..colorFilter = ColorFilter.mode(color!, BlendMode.srcOut);

    canvas
      ..saveLayer(rectOuter, shadowPaint)
      ..saveLayer(rectInner, Paint())
      ..translate(dx!, dy!);

    // Draw the top-left portion with a different color
    final Rect topLeftRect = Rect.fromLTWH(0, 0, dx!, dy!);
    final Paint topLeftPaint = Paint()..color = topLeftColor ?? Colors.transparent;
    canvas.drawRect(topLeftRect, topLeftPaint);

    context.paintChild(child!, offset);
    context.canvas..restore()..restore()..restore();
  }
}
