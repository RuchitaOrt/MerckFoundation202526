import 'package:flutter/material.dart';
import 'package:merckfoundation_252026/Utils/common_images.dart';

class FooterFlowerImage extends StatelessWidget {
  final double height;
  final Alignment alignment;
  final EdgeInsets padding;

  const FooterFlowerImage({
    super.key,
    this.height = 140,
    this.alignment = Alignment.topRight,
    this.padding = EdgeInsets.zero,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Align(
        alignment: alignment,
        child: Image.asset(
         CommonImagePath.flowerFooter,
          height: height,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
