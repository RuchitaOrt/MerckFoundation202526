import 'package:flutter/material.dart';

import 'package:merckfoundation_252026/Utility/ResponsiveFlutter.dart';
import 'package:merckfoundation_252026/Utility/customappbar.dart';
import 'package:merckfoundation_252026/Utils/common_strings.dart';
import 'package:merckfoundation_252026/Utils/customcolor.dart';
import 'package:merckfoundation_252026/enum/commonEnum.dart';
import 'package:merckfoundation_252026/widgets/FooterFlowerImage.dart';
import 'package:merckfoundation_252026/widgets/botttomlink.dart';
import 'package:merckfoundation_252026/widgets/SmartHtmlWidget.dart';

class OurVision extends StatefulWidget {
  static const String route = "/ourvisiion";
  const OurVision({super.key});

  @override
  State<StatefulWidget> createState() {
    return OurVisionState();
  }
}

class OurVisionState extends State<OurVision> with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveFlutter.of(context);
    return Scaffold(
      backgroundColor: Customcolor.background,
      appBar: CommonAppBar(
        type: AppBarType.inner,
        title: CommonStrings.ourVision,
       
        onSearch: () {},
        onShare: () {},
        shareLink: "",
      ),
      body: ListView(
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        physics: ScrollPhysics(),
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
               
                SmartHtmlWidget(
                    html:
                        'A WORLD WHERE EVERYONE<br>CAN LEAD A HEALTHY AND<br>FULFILLING LIFE',
                    textColor: Customcolor.colorVoilet,
                    fontSize: responsive.fontSize(3),
                    fontWeight: FontWeight.w600),
                8.0.heightBox,
                SmartHtmlWidget(
                  html:
                      '<p style=\"margin:0in 0in 8pt\"><span style=\"font-size:12.0pt;\"><span style=\"font-family:Verdana,Geneva,sans-serif;\"><span style=\"line-height:normal\"><b><span new=\"\" roman=\"\" times=\"\"><span style=\"color:#7030a0\">Who We Are</span></span></b></span></span></span></p>\r\n\r\n<p><span style=\"font-size:12.0pt;\"><span style=\"font-family:Verdana,Geneva,sans-serif;\">Merck Foundation, established in 2017, is the philanthropic arm of Merck KGaA, Germany that aims to improve the health and wellbeing of people and advance their lives through Science and Technology.</span></span></p>\r\n\r\n<p><span style=\"font-size:12.0pt;\"><span style=\"font-family:Verdana,Geneva,sans-serif;\">Our efforts are primarily focused on improving access to quality and equitable healthcare solutions, building healthcare, scientific research &amp; media capacity, breaking infertility stigma and supporting girl&nbsp;education.</span></span></p>\r\n\r\n<p style=\"margin:0in 0in 8pt\"><span style=\"font-size:12.0pt;\"><span style=\"font-family:Verdana,Geneva,sans-serif;\"><span style=\"line-height:normal\"><b><span new=\"\" roman=\"\" times=\"\"><span style=\"color:#7030a0\">Merck Foundation Strives to</span></span></b></span></span></span></p>\r\n\r\n<p style=\"margin:0in 0in 8pt\"><span style=\"font-family:Verdana,Geneva,sans-serif;\"><span style=\"font-size:11pt\"><span style=\"line-height:normal\"><span style=\"font-size:12.0pt\"><span new=\"\" roman=\"\" times=\"\">work closely with partners that are <strong>First Ladies of Africa, Ministries of Health, Education,Information &amp; Communication, Gender, Academia, Research Institutions, Media and Art</strong> in building healthcare capacity and addressing health, social &amp; economic challenges in developing countries and under-served communities.</span></span></span></span></span></p>\r\n\r\n<p style=\"margin:0in 0in 8pt\"><br />\r\n<span style=\"font-size:12.0pt;\"><span style=\"font-family:Verdana,Geneva,sans-serif;\"><span style=\"line-height:normal\"><span new=\"\" roman=\"\" times=\"\">Merck Foundation has been recognized as the <strong>2024 and 2022 NGO of the Year</strong>,<strong> the Most Influential NGO Shaping Africa&rsquo;s Future</strong> and also received the<strong> &lsquo;Best Health Sector Philanthropy&rsquo; Award 2023.</strong></span></span></span></span></p>\r\n',
                ),
              ],
            ),
          ),
          const FooterFlowerImage(),
          8.0.heightBox,
          Bottomcardlink(),
        ],
      ),
    );
  }
}
