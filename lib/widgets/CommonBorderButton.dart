import 'package:flutter/material.dart';

class CommonBorderButton extends StatelessWidget {
  final String title;
  
  final VoidCallback onTap;

  final Color borderColor;
  final Color textColor;
  final double borderRadius;
  final EdgeInsetsGeometry padding;
  final double borderWidth;
  final TextStyle? textStyle;

  const CommonBorderButton({
    super.key,
    required this.title,
    required this.onTap,
    this.borderColor = Colors.orange,
    this.textColor = Colors.black,
    this.borderRadius = 8,
    this.borderWidth = 2,
    this.padding =
        const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: padding,
        decoration: BoxDecoration(
          border: Border.all(
            color: borderColor,
            width: borderWidth,
          ),
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: Text(
          title,
          style:
              textStyle ??
              TextStyle(
                fontWeight: FontWeight.bold,
                color: textColor,
              ),
        ),
      ),
    );
  }
}