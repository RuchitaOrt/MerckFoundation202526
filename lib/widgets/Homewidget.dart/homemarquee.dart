import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';
import 'package:merckfoundation_252026/Utils/customcolor.dart';
import 'package:merckfoundation_252026/Utility/showdailog.dart';

class CommonMarquee extends StatelessWidget {
  final String text;
  final String? link;
  final double height;
  final TextStyle? textStyle;
  final double velocity;

  const CommonMarquee({
    super.key,
    required this.text,
    this.link,
    this.height = 30,
    this.textStyle,
    this.velocity = 40,
  });

  @override
  Widget build(BuildContext context) {
    if (text.trim().isEmpty) {
      return const SizedBox.shrink();
    }

    return GestureDetector(
      onTap: link == null || link!.isEmpty
          ? null
          : () => ShowDialogs.launchURL(link!),
      child: SizedBox(
        height: height,
        child: Marquee(
          text: text,
          style: textStyle ??
              const TextStyle(
                fontWeight: FontWeight.w700,
                color: Customcolor.text_blue,
              ),
          scrollAxis: Axis.horizontal,
          blankSpace: 20,
          velocity: velocity,
          pauseAfterRound: const Duration(seconds: 1),
          showFadingOnlyWhenScrolling: true,
          fadingEdgeStartFraction: 0.1,
          fadingEdgeEndFraction: 0.1,
          startPadding: 10,
          accelerationDuration: const Duration(seconds: 1),
          accelerationCurve: Curves.linear,
          decelerationDuration: const Duration(milliseconds: 500),
          decelerationCurve: Curves.easeOut,
        ),
      ),
    );
  }
}
