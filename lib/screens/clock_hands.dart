// ignore_for_file: avoid_unnecessary_containers

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_clock/clock/hours.dart';
import 'package:flutter_clock/clock/minutes.dart';
import 'package:flutter_clock/clock/seconds.dart';

class ClockHands extends StatefulWidget {
  const ClockHands({Key? key}) : super(key: key);

  @override
  _ClockHandsState createState() => _ClockHandsState();
}

class _ClockHandsState extends State<ClockHands> {
  Timer? _timer;
  DateTime? dateTime;

  @override
  void initState() {
    super.initState();
    dateTime = DateTime.now();
    _timer = Timer.periodic(const Duration(seconds: 1), setTime);
  }

  void setTime(Timer timer) {
    setState(() {
      dateTime = DateTime.now();
    });
  }

  @override
  void dispose() {
    _timer!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          child: CustomPaint(
            size: const Size(250, 250),
            painter: Seconds(
              seconds: dateTime!.second,
            ),
          ),
        ),
        Container(
          child: CustomPaint(
            size: const Size(250, 250),
            painter: Minutes(
              minutes: dateTime!.minute,
              seconds: dateTime!.second,
            ),
          ),
        ),
        Container(
          child: CustomPaint(
            size: const Size(250, 250),
            painter: Hours(
              hours: dateTime!.hour,
              minutes: dateTime!.minute,
            ),
          ),
        )
      ],
    );
  }
}
