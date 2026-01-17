import 'package:flutter/material.dart';
import 'package:merckfoundation_252026/Utility/ResponsiveFlutter.dart';
import 'package:merckfoundation_252026/Utility/customappbar.dart';
import 'package:merckfoundation_252026/Utils/common_images.dart';
import 'package:merckfoundation_252026/Utils/common_strings.dart';
import 'package:merckfoundation_252026/Utils/customcolor.dart';
import 'package:merckfoundation_252026/enum/commonEnum.dart';
import 'package:merckfoundation_252026/widgets/CommonRichText.dart';
import 'package:merckfoundation_252026/widgets/FooterFlowerImage.dart';
import 'package:merckfoundation_252026/widgets/botttomlink.dart';
import 'package:merckfoundation_252026/widgets/formLabel.dart';

class Communitysupport extends StatefulWidget {
  const Communitysupport({super.key});

  @override
  State<StatefulWidget> createState() {
    return CommunitysupportState();
  }
}

class CommunitysupportState extends State<Communitysupport>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Customcolor.background,
      appBar: CommonAppBar(
        type: AppBarType.inner,
        title: CommonStrings.communitySupport,
        onSearch: () {},
        onShare: () {},
        shareLink: "",
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
                    right: 8,
                    top: 8,
                    bottom: 15,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                       8.0.heightBox,
                      FormLabel(
                        text:
                            "Merck Foundation partnered with the African First Ladies of Liberia, DRC, Niger, Chad, Burkina Faso, Zimbabwe, Malawi, and Ghana to support livelihood of thousands of women and families of casual and daily workers who are most affected by the Coronavirus (COVID -19) lockdown. The relief contribution was also undertaken in Egypt with the aim to support families of casual workers.",
                        labelColor: Colors.black54,
                        fontSize: 14,
                        fontweight: FontWeight.w500,
                      ),
                      8.0.heightBox,
                      CommonRichText(
                        title: "As part of our signature campaign",
                        subtitle: "Merck More than a Mother, ",
                        subTitleColor: Customcolor.tablebordercolor,
                        SubTitledescription:
                            "Merck Foundation’s special focus remains women, as the pandemic has led to a horrifying increase in violence against women. The confinement at home with an abusive partner has resulted in not only physical violence but also emotional violence against women, it can have disastrous consequences for their health and well-being. We know they now need our support more than ever.",
                      ),
                       8.0.heightBox,
                      FormLabel(
                        text: "GLIMPSES OF SOME OF OUR DONATION DRIVES",
                        labelColor: Customcolor.pink_col,
                        fontSize: ResponsiveFlutter.of(context).fontSize(1.9),
                        fontweight: FontWeight.w600,
                        textAlignment: TextAlign.start,
                      ),
                       8.0.heightBox,
                      FormLabel(
                        text: "LIBERIA",
                        labelColor: Colors.black,
                        fontSize: ResponsiveFlutter.of(context).fontSize(2.2),
                        fontweight: FontWeight.w600,
                        textAlignment: TextAlign.center,
                      ),
                       8.0.heightBox,
                      FormLabel(
                        text:
                            "Merck Foundation in partnership Liberia First Lady to support livelihood of women and casual workers affected by Coronavirus lockdown.",
                        labelColor: Colors.black54,
                        fontSize: 14,
                        fontweight: FontWeight.w500,
                        textAlignment: TextAlign.start,
                      ),
                      8.0.heightBox,
                      Image.asset(CommonImagePath.cS1, height: 290),
                       8.0.heightBox,
                      CommonRichText(
                        title: "Visit ",
                        subtitle: "Photo Gallery ",
                        SubTitledescription: "to view all pictures",
                      ),
                       8.0.heightBox,
                      FormLabel(
                        text: "GHANA",
                        labelColor: Colors.black,
                        fontSize: ResponsiveFlutter.of(context).fontSize(2.2),
                        fontweight: FontWeight.w600,
                        textAlignment: TextAlign.center,
                      ),
                       8.0.heightBox,
                      FormLabel(
                        text:
                            "Merck Foundation in partnership Ghana First Lady support casual and daily workers affected by Coronavirus lockdown",
                        labelColor: Colors.black54,
                        fontSize: 14,
                        fontweight: FontWeight.w500,
                        textAlignment: TextAlign.start,
                      ),
                       8.0.heightBox,
                      Image.asset(CommonImagePath.cS2, height: 290),
                       8.0.heightBox,
                      CommonRichText(
                        title: "Visit ",
                        subtitle: "Photo Gallery ",
                        SubTitledescription: "to view all pictures",
                      ),

                       8.0.heightBox,
                      FormLabel(
                        text: "NIGER",
                        labelColor: Colors.black,
                        fontSize: ResponsiveFlutter.of(context).fontSize(2.2),
                        fontweight: FontWeight.w600,
                        textAlignment: TextAlign.center,
                      ),
                   8.0.heightBox,
                      FormLabel(
                        text:
                            "Merck Foundation in partnership Niger First Lady to support livelihood of to support retired people and residents of Niamey affected by Coronavirus lockdown.",
                        labelColor: Colors.black54,
                        fontSize: 14,
                        fontweight: FontWeight.w500,
                        textAlignment: TextAlign.start,
                      ),
                      8.0.heightBox,
                      Image.asset(CommonImagePath.cS3, height: 290),
                       8.0.heightBox,
                      CommonRichText(
                        title: "Visit ",
                        subtitle: "Photo Gallery ",
                        SubTitledescription: "to view all pictures",
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
        ],
      ),
    );
  }
}
