import 'package:flutter/material.dart';
import '../Utility/ResponsiveFlutter.dart';
import '../Utils/customcolor.dart';


class CommonRichText extends StatelessWidget {
  final String title;
  final String subtitle;
  final EdgeInsetsGeometry padding;
  final TextAlign textAlign;

  const CommonRichText({
    super.key,
    required this.title,
    required this.subtitle,
    this.padding = const EdgeInsets.all(8.0),
    this.textAlign = TextAlign.start,
  });

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveFlutter.of(context);

    return Padding(
      padding: padding,
      child: RichText(
        textAlign: textAlign,
        text: TextSpan(
          children: [
            TextSpan(
              text: "$title",
              style: TextStyle(
                color: Customcolor.textsubtitlecolor,
                fontSize: responsive.fontSize(2.8),
                fontWeight: FontWeight.w400,
               
              ),
            ),
            TextSpan(
              text: subtitle,
              style: TextStyle(
                color: Customcolor.pink_col,
                fontSize: responsive.fontSize(2.8),
                fontWeight: FontWeight.bold,
               
              ),
            ),
          ],
        ),
      ),
    );
  }
}
