import 'package:flutter/material.dart';
import 'package:merckfoundation_252026/Utility/ResponsiveFlutter.dart';
import 'package:merckfoundation_252026/Utility/customappbar.dart';
import 'package:merckfoundation_252026/Utils/common_strings.dart';
import 'package:merckfoundation_252026/Utils/customcolor.dart';
import 'package:merckfoundation_252026/enum/commonEnum.dart';
import 'package:merckfoundation_252026/providers/program_provider.dart';
import 'package:merckfoundation_252026/widgets/CustomAdvFab.dart';
import 'package:merckfoundation_252026/widgets/DynamicTabView.dart';
import 'package:merckfoundation_252026/widgets/FooterFlowerImage.dart';
import 'package:merckfoundation_252026/widgets/Homewidget.dart/DynamicContent.dart';
import 'package:merckfoundation_252026/widgets/Homewidget.dart/homeSlider.dart';
import 'package:merckfoundation_252026/widgets/botttomlink.dart';
import 'package:merckfoundation_252026/widgets/dynamic_tab_builder.dart';

import 'package:provider/provider.dart';

class MFMoreThanMotherMovement extends StatefulWidget {
  const MFMoreThanMotherMovement({super.key});

  @override
  State<MFMoreThanMotherMovement> createState() =>
      _MFMoreThanMotherMovementState();
}

class _MFMoreThanMotherMovementState extends State<MFMoreThanMotherMovement> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final provider = context.read<ProgramProvider>();
      provider.loadProgramTabs();
    });
  }

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveFlutter.of(context);
    final provider = context.read<ProgramProvider>();
    return Scaffold(
      backgroundColor: Customcolor.background,
      appBar: CommonAppBar(
        type: AppBarType.inner,
        title: CommonStrings.mmtmTitle,
        onSearch: () {},
        onShare: () {},
        shareLink: "",
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 40),
        child: CustomAdvFab(
          icon: Icons.menu,
          iconColor: Customcolor.text_darkblue,
          backgroundColor: Customcolor.programyellow,
          expandedContent: ListView.separated(
            // padding: const EdgeInsets.all(12),
            itemCount: provider.programsSubList.length,
            separatorBuilder: (_, __) => Divider(),
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                    provider.programsSubList[index],
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: responsive.fontSize(2),
                      color: Customcolor.text_darkblue,
                    ),
                  ),
              );
            },
          ),
        ),
      ),
      body: Consumer<ProgramProvider>(
        builder: (context, provider, _) {
          return ListView(
            children: [
              8.0.heightBox,
              const HomeSlider(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: responsive.width(4)),
                child: DynamicSectionRenderer(
                  sections: provider.getProgramSections(),
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

              const FooterFlowerImage(),
              8.0.heightBox,
              Bottomcardlink(),
            ],
          );
        },
      ),
    );
  }
}
