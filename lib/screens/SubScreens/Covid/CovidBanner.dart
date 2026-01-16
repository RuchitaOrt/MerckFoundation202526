import 'package:flutter/material.dart';
import 'package:merckfoundation_252026/Utility/ResponsiveFlutter.dart';
import 'package:merckfoundation_252026/Utils/common_images.dart';
import 'package:merckfoundation_252026/Utils/common_strings.dart';

import 'package:merckfoundation_252026/Utils/customcolor.dart';
import 'package:merckfoundation_252026/screens/SubScreens/Covid/CovidFlipSection.dart';

class CovidBanner extends StatelessWidget {
  const CovidBanner({super.key});

  @override
  Widget build(BuildContext context) {
    final r = ResponsiveFlutter.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AspectRatio(
          aspectRatio: 16 / 5,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              CommonImagePath.covidBg,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
        ),
        12.0.heightBox,
         CovidFlipSection(),
          12.0.heightBox,
        Text(
          CommonStrings.covidTitle,
          style: TextStyle(
            fontSize: r.fontSize(2.2),
            fontWeight: FontWeight.bold,
            color: Customcolor.colorBlue,
          ),
        ),
        8.0.heightBox,
        Text(
          CommonStrings.covidIntro,
          style: TextStyle(
            fontSize: r.fontSize(1.6),
            height: 1.4,
          ),
        ),
      ],
    );
  }
}
