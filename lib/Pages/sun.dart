import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Sun extends StatelessWidget {
  const Sun({
    Key? key,
    required this.duration,
    required this.isFullSun,
  }) : super(key: key);

  final Duration duration;
  final bool isFullSun;

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      duration: duration,
      curve: Curves.easeInOut,
      left: 30,
      bottom: isFullSun ? -40 : -120,
    child: SvgPicture.asset("assets/icons/sunn.svg"),
    );
  }
}
