import 'package:flutter/material.dart';
import 'package:merckfoundation_252026/Utility/ResponsiveFlutter.dart';
import 'package:merckfoundation_252026/Utils/common_strings.dart';
import 'package:merckfoundation_252026/Utils/customcolor.dart';
import 'package:merckfoundation_252026/enum/commonEnum.dart';
import 'package:merckfoundation_252026/providers/follow_us_provider.dart';
import 'package:merckfoundation_252026/providers/program_provider.dart';
import 'package:merckfoundation_252026/screens/OurPrograms/BaseProgramPage.dart';
import 'package:merckfoundation_252026/widgets/DynamicTabView.dart';
import 'package:merckfoundation_252026/widgets/FooterFlowerImage.dart';
import 'package:merckfoundation_252026/widgets/Homewidget.dart/DynamicContent.dart';
import 'package:merckfoundation_252026/widgets/Homewidget.dart/homeSlider.dart';
import 'package:merckfoundation_252026/widgets/Homewidget.dart/homefollow_us.dart';
import 'package:merckfoundation_252026/widgets/botttomlink.dart';
import 'package:merckfoundation_252026/widgets/dynamic_tab_builder.dart';
import 'package:provider/provider.dart';

class MFMoreThanMotherMovement extends StatelessWidget {
  const MFMoreThanMotherMovement({super.key});

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveFlutter.of(context);

    return BaseProgramPage(
      title: CommonStrings.mmtmTitle,
      programType: ProgramType.mtm,
      bodyBuilder: (context) {
        final provider = context.watch<ProgramProvider>();
        return ListView(
          children: [
            8.0.heightBox,
            const HomeSlider(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: responsive.width(4)),
              child: DynamicSectionRenderer(
                sections: provider.getProgramSections(ProgramType.mtm),
              ),
            ),
            8.0.heightBox,
            SizedBox(
              height: CommonStrings.tabheight,
              child: DynamicTabView(
                tabs: DynamicTabBuilder.build(context, provider.tabs),
                indicatorColor: Customcolor.pinkbg,
              ),
            ),
            FollowUsSection(
              showFlower: false,
              fontSize: responsive.fontSize(2.0),
              iconSize: 25,
              title: CommonStrings.followMerckFoundationTitle,
              icons: FollowUsProvider.merckFoundationIcons(context),
            ),
            20.0.heightBox,
            FollowUsSection(
              showFlower: false,
              iconSize: 25,
              fontSize: responsive.fontSize(2.0),
              title: CommonStrings.followMoreThanMotherMovementTitle,
              icons: FollowUsProvider.merckFoundationMOreThanAMotherMovement(
                context,
              ),
            ),

            const FooterFlowerImage(),
            Bottomcardlink(),
          ],
        );
      },
    );
  }
}
