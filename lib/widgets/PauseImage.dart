
import 'package:flutter/material.dart';
import 'package:merckfoundation_252026/CommonUtils/common_images.dart';

class PauseImage extends StatelessWidget {
  final double size;

  const PauseImage({
    super.key,
    this.size = 36,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
     
      child: Padding(
        padding: const EdgeInsets.all(6),
        child: Image.asset(
          CommonImagePath.pauseButton,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
