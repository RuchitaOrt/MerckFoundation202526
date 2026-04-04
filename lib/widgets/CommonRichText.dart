import 'package:flutter/material.dart';

import '../Utility/ResponsiveFlutter.dart';
import '../Utils/customcolor.dart';

class CommonRichText extends StatelessWidget {
  final String title;
  final String subtitle;
  final EdgeInsetsGeometry padding;
  final TextAlign textAlign;
  final double? titleSize;
  final double? SubtitleSize;
  final Color? titleColor;
  final Color? subTitleColor;
  final FontWeight? titlefontWeight;
  final FontWeight? subTitlefontWeight;
  final String? SubTitledescription;

  CommonRichText({
    super.key,
    required this.title,
    required this.subtitle,
    this.padding = const EdgeInsets.only(left: 15),
    this.textAlign = TextAlign.start,
    this.titleSize,
    this.SubtitleSize,
    this.titleColor,
    this.SubTitledescription,
    this.subTitleColor, this.titlefontWeight, this.subTitlefontWeight,
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
             style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w800, 
                 
                  color: Customcolor.text_blue,
                ),
            ),
            TextSpan(
              text: subtitle,
              style: TextStyle(
                color: subTitleColor ?? Customcolor.pink_col,
                fontSize: SubtitleSize ?? responsive.fontSize(3.5),
                fontWeight: subTitlefontWeight ?? FontWeight.bold,
              ),
            ),
            TextSpan(
              text: SubTitledescription,
             style: TextStyle(
                color: titleColor ?? Customcolor.textsubtitlecolor,
                fontSize: titleSize ?? responsive.fontSize(2.8),
                fontWeight:titlefontWeight?? FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
