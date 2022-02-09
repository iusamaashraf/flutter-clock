import 'package:flutter/material.dart';

class ClockFace extends StatelessWidget {
  final double width;
  final double height;

  // ignore: use_key_in_widget_constructors
  const ClockFace({this.width = 320, this.height = 320});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
      ),
      child: Center(
        child: Container(
          width: 5.0,
          height: 5.0,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
