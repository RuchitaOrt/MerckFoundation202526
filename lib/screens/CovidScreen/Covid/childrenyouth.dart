import 'package:flutter/material.dart';
import 'package:merckfoundation_252026/Utility/ResponsiveFlutter.dart';
import 'package:merckfoundation_252026/widgets/CommonWidget/customappbar.dart';
import 'package:merckfoundation_252026/CommonUtils/common_images.dart';
import 'package:merckfoundation_252026/CommonUtils/common_strings.dart';
import 'package:merckfoundation_252026/CommonUtils/customcolor.dart';
import 'package:merckfoundation_252026/enum/commonEnum.dart';
import 'package:merckfoundation_252026/widgets/CommonWidget/CommonRichText.dart';

import 'package:merckfoundation_252026/widgets/FooterFlowerImage.dart';
import 'package:merckfoundation_252026/widgets/Bottomcardlink.dart';
import 'package:merckfoundation_252026/widgets/formLabel.dart';

class Childrenyouth extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ChildrenyouthState();
  }
}

class ChildrenyouthState extends State<Childrenyouth>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Customcolor.background,
      appBar: CommonAppBar(
        type: AppBarType.inner,
        title: CommonStrings.communityYouth,
        onSearch: () {},
      
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 0),
            child: ListView(
              shrinkWrap: true,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    left: 15,
                    right: 15,
                    top: 8,
                    bottom: 15,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      8.0.heightBox,
                      CommonRichText(
                        title:
                            "Merck Foundation launched an inspiring storybook called",
                        titleSize: ResponsiveFlutter.of(context).fontSize(2.3),
                        SubtitleSize: ResponsiveFlutter.of(
                          context,
                        ).fontSize(2.3),
                        subTitleColor: Customcolor.tablebordercolor,
                        subtitle: "‘Make the Right Choice’ ",
                        SubTitledescription:
                            "in partnership with 18 African First Ladies. The story aims to raise awareness about coronavirus prevention amongst children and youth as it provides facts about the pandemic and how to stay safe and healthy during the outbreak. It also promotes honesty, hard-work and the ability to make the right choices even during the most challenging times.",
                      ),

                      8.0.heightBox,
                      FormLabel(
                        text:
                            "The storybook has been released in three languages: English, French and Portuguese.",
                        labelColor: Colors.black54,
                        fontSize: ResponsiveFlutter.of(context).fontSize(2),
                        fontweight: FontWeight.w500,
                      ),
                      8.0.heightBox,
                      Center(
                        child: Image.asset(CommonImagePath.youth, height: 290),
                      ),
                      8.0.heightBox,
                      Center(
                        child: FormLabel(
                          text:
                              "Make the Right Choice English | French | Portuguese",
                          labelColor: Colors.black54,
                          fontSize: ResponsiveFlutter.of(context).fontSize(2),
                          fontweight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),

                8.0.heightBox,
                const FooterFlowerImage(),
                8.0.heightBox,
                Bottomcardlink(),
              ],
            ),
          ),

          // TextSpan(

          // ),
        ],
      ),
    );
  }
}
