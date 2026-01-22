import 'package:flutter/material.dart';
import 'package:merckfoundation_252026/Utility/ResponsiveFlutter.dart';
import 'package:merckfoundation_252026/Utility/customappbar.dart';
import 'package:merckfoundation_252026/Utils/common_strings.dart';
import 'package:merckfoundation_252026/Utils/customcolor.dart';
import 'package:merckfoundation_252026/data/model/CommonModel.dart';
import 'package:merckfoundation_252026/enum/commonEnum.dart';
import 'package:merckfoundation_252026/providers/our_award_provider.dart';
import 'package:merckfoundation_252026/widgets/CommonActionButton.dart';
import 'package:merckfoundation_252026/widgets/FooterFlowerImage.dart';
import 'package:merckfoundation_252026/widgets/SmartHtmlWidget.dart';
import 'package:merckfoundation_252026/widgets/botttomlink.dart';

import 'package:provider/provider.dart';

class OurAwardScreen extends StatelessWidget {
  const OurAwardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final awards = context.watch<OurAwardProvider>().awards;

    return Scaffold(
      backgroundColor: Customcolor.background,
      appBar: CommonAppBar(
        type: AppBarType.inner,
        title: CommonStrings.ourAwards,

        onSearch: () {},
        onShare: () {},

        shareLink: "",
      ),
    body: ListView(

  children: [
    // 1️⃣ Awards List
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: awards.length,
        separatorBuilder: (_, __) => const SizedBox(height: 12),
        itemBuilder: (context, index) {
          return AwardCard(
            award: awards[index],
            color: _cardColors[index % _cardColors.length],
          );
        },
      ),
    ),

   8.0.heightBox,
      const FooterFlowerImage(),
            8.0.heightBox,
            Bottomcardlink(),
  ],
),

    );
  }
}

class AwardCard extends StatelessWidget {
  final AwardModel award;
  final Color color;

  const AwardCard({super.key, required this.award, required this.color});

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveFlutter.of(context);
    return Card(
      color: color,
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SmartHtmlWidget(
              html: award.description,
              fontSize: responsive.fontSize(2),
            ),

            8.0.heightBox,

            CommonActionButton(
              alignment: Alignment.topLeft,
              text: CommonStrings.readMore,
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}

final List<Color> _cardColors = [
  Customcolor.prog1,
  Customcolor.prog2,
  Customcolor.prog3,
  Customcolor.prog4,
  Customcolor.prog5,
  Customcolor.prog6,
  Customcolor.prog7,
];
