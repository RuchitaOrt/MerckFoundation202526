
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
    return 
    Container(
      height: size,
      width: size,
     
      child: 
     
        Image.asset(
          CommonImagePath.pauseButton,
          fit: BoxFit.contain,
        ),
      );
      //  Padding(
      //   padding: const EdgeInsets.all(6),
      //   child: 
      //      Container(
      //                           decoration: const BoxDecoration(
      //                             color: Colors.black54,
      //                             shape: BoxShape.circle,
      //                           ),
      //                           padding: const EdgeInsets.all(10),
      //                           child: const Icon(
      //                             Icons.play_arrow,
      //                             color: Colors.white,
      //                           ),
      //                         ),
    // );
  }
}
