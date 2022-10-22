// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class Land extends StatefulWidget {
   const Land({
     Key? key,
    required this.duration,
    required this.isFullSun,
  }) : super(key: key);

  final Duration duration;
  final bool isFullSun;

  @override
  State<Land> createState() => _LandState();
}

class _LandState extends State<Land> {
  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      duration:  widget.duration,
       curve: Curves.easeInOut,
      bottom: -60,
      left: 0,
      right: 0,
      child: Image.asset(
       "assets/images/tree_dark.png",
        height: 370,
        fit: BoxFit.fitHeight,
      ),
    );
  }
}
