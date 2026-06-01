import 'package:flutter/material.dart';
import 'package:merckfoundation_252026/Utility/ResponsiveFlutter.dart';
import 'package:merckfoundation_252026/CommonUtils/customcolor.dart';
import 'package:merckfoundation_252026/widgets/formLabel.dart';


class CommonActionButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final double width;
  final double height;
  final Color backgroundColor;
  final Color textColor;
  final FontWeight fontWeight;
  final double? fontSize;
  final BorderRadius? borderRadius;
  final EdgeInsetsGeometry? padding;
  final Alignment alignment;

  const CommonActionButton({
    super.key,
    required this.text,
    required this.onTap,
    this.width = 120,
    this.height = 40,
    this.backgroundColor = Colors.amber,
    this.textColor = Customcolor.colorBlue,
    this.fontWeight = FontWeight.w500,
    this.fontSize,
    this.borderRadius,
    this.padding,
    this.alignment = Alignment.center,
  });

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveFlutter.of(context);

    return Align(
      alignment: alignment,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: width,
          height: height,
          padding: padding ?? const EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: borderRadius ?? BorderRadius.circular(5),
          ),
          child: Center(
            child: FormLabel(
              text: text,
              fontSize: fontSize ?? responsive.fontSize(1.8),
              fontweight: fontWeight,
              labelColor: textColor,
            ),
          ),
        ),
      ),
    );
  }
}
