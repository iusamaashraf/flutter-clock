import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_clock/screens/clock_dialog.dart';
import 'package:flutter_clock/screens/clock_face.dart';

import 'clock_hands.dart';

class Clock extends StatelessWidget {
  const Clock({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          const Center(
            child: ClockFace(
              height: 320,
              width: 320,
            ),
          ),
          Center(
            // ignore: avoid_unnecessary_containers
            child: Container(
              child: CustomPaint(
                size: const Size(300, 300),
                painter: ClockDialog(),
              ),
            ),
          ),
          const Center(
            child: ClockHands(),
          )
        ],
      ),
    );
  }
}
