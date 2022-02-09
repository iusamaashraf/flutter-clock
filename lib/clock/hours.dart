import 'dart:math';

import 'package:flutter/material.dart';

class Hours extends CustomPainter {
  final Paint hourHandPaint;

  var hours;
  var minutes;

  Hours({this.hours, this.minutes}) : hourHandPaint = Paint() {
    hourHandPaint.color = Colors.black;
    hourHandPaint.style = PaintingStyle.stroke;
    hourHandPaint.strokeWidth = 5.0;
  }

  @override
  void paint(Canvas canvas, Size size) {
    final radius = size.width / 2;
    canvas.save();
    canvas.translate(radius, radius);

    canvas.rotate(this.hours >= 12
        ? 2 * pi * ((this.hours - 12) / 12 + (this.minutes / 720))
        : 2 * pi * ((this.hours / 12) + (this.minutes / 720)));

    Path path = Path();
    path.moveTo(0.0, -radius + radius / 4);
    path.lineTo(0.0, 0.0);
    canvas.drawPath(path, hourHandPaint);
    canvas.restore();
  }

  @override
  bool shouldRepaint(Hours oldDelegate) {
    return this.minutes != oldDelegate.minutes;
  }
}
