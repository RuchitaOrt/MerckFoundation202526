import 'package:flutter/material.dart';
import 'package:merckfoundation_252026/Utility/ResponsiveFlutter.dart';
import 'package:merckfoundation_252026/Utils/common_strings.dart';
import 'package:merckfoundation_252026/Utils/customcolor.dart';
import 'package:merckfoundation_252026/enum/commonEnum.dart';
import 'package:merckfoundation_252026/providers/program_provider.dart';
import 'package:merckfoundation_252026/screens/OurPrograms/BaseProgramPage.dart';
import 'package:merckfoundation_252026/widgets/DynamicTabView.dart';
import 'package:merckfoundation_252026/widgets/FooterFlowerImage.dart';
import 'package:merckfoundation_252026/widgets/Homewidget.dart/DynamicContent.dart';
import 'package:merckfoundation_252026/widgets/Homewidget.dart/homeSlider.dart';
import 'package:merckfoundation_252026/widgets/botttomlink.dart';
import 'package:merckfoundation_252026/widgets/dynamic_tab_builder.dart';

import 'package:provider/provider.dart';

class MFCapacityAdvancementProgram extends StatefulWidget {
  const MFCapacityAdvancementProgram({super.key});

  @override
  State<MFCapacityAdvancementProgram> createState() =>
      _MFCapacityAdvancementProgramState();
}

class _MFCapacityAdvancementProgramState extends State<MFCapacityAdvancementProgram> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {

    });
  }

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveFlutter.of(context);
   
    return BaseProgramPage(
      title: CommonStrings.capacityTitle,
      programType: ProgramType.capacity,
      bodyBuilder: (context) {
        final provider = context.watch<ProgramProvider>();
        return ListView(
          children: [
            8.0.heightBox,
            const HomeSlider(content: [],),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: responsive.width(4)),
              child: DynamicSectionRenderer(
                sections: provider.getProgramSections(ProgramType.strategy),
              ),
            ),
         provider.tabs.isEmpty?SizedBox():   SizedBox(
              height: CommonStrings.tabheight,
              child: DynamicTabView(
                tabs: DynamicTabBuilder.build(context, provider.tabs),
                indicatorColor: Customcolor.pinkbg,
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
