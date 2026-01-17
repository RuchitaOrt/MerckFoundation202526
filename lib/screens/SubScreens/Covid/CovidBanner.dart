import 'package:flutter/material.dart';
import 'package:merckfoundation_252026/Utility/ResponsiveFlutter.dart';
import 'package:merckfoundation_252026/Utils/common_images.dart';
import 'package:merckfoundation_252026/Utils/common_strings.dart';

import 'package:merckfoundation_252026/Utils/customcolor.dart';
import 'package:merckfoundation_252026/screens/SubScreens/Covid/CovidFlipSection.dart';
import 'package:merckfoundation_252026/widgets/formLabel.dart';

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
        FormLabel(
         text:  CommonStrings.covidTitle,
          fontSize: r.fontSize(2.2),
            fontweight: FontWeight.bold,
            labelColor: Customcolor.colorBlue,
        ),
        8.0.heightBox,
        FormLabel(
         text:  CommonStrings.covidIntro,
           fontSize: r.fontSize(1.6),
            fontheight: 1.4,
        ),
      ],
    );
  }
}
