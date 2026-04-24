import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import 'package:merckfoundation_252026/Utility/ResponsiveFlutter.dart';
import 'package:merckfoundation_252026/Utility/customappbar.dart';
import 'package:merckfoundation_252026/Utils/common_strings.dart';

import 'package:merckfoundation_252026/Utils/customcolor.dart';
import 'package:merckfoundation_252026/data/model/CommonModel.dart';
import 'package:merckfoundation_252026/enum/commonEnum.dart';
import 'package:merckfoundation_252026/main.dart';
import 'package:merckfoundation_252026/providers/program_provider.dart';
import 'package:merckfoundation_252026/screens/OurPrograms/MoreThanMotherMovement/MFMoreThanMotherMovement.dart';
import 'package:merckfoundation_252026/widgets/FooterFlowerImage.dart';
import 'package:merckfoundation_252026/widgets/Homewidget.dart/homeSlider.dart';
import 'package:merckfoundation_252026/widgets/botttomlink.dart';
import 'package:merckfoundation_252026/widgets/formLabel.dart';
import 'package:provider/provider.dart';

class OurProgramScreen extends StatelessWidget {
  const OurProgramScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final programs = context.watch<ProgramProvider>().programs;
    final responsive = ResponsiveFlutter.of(context);

    return Scaffold(
      backgroundColor: Customcolor.background,
      appBar: CommonAppBar(
        type: AppBarType.inner,
        title: CommonStrings.ourPrograms,

        onSearch: () {},
        onShare: () {},
        shareLink: "",
      ),
      body: CustomScrollView(
        slivers: [
           SliverToBoxAdapter(child: const HomeSlider(content: [],)),

          SliverPadding(
            padding: const EdgeInsets.all(12),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
                return _ProgramCard(
                  program: programs[index],
                  fontSize: responsive.fontSize(1.9),
                  
                );
              }, childCount: programs.length),
            ),
          ),

          const SliverToBoxAdapter(child: FooterFlowerImage()),
          const SliverToBoxAdapter(child: Bottomcardlink()),
        ],
      ),
    );
  }
}

class _ProgramCard extends StatelessWidget {
  final ProgramModel program;
  final double fontSize;

  const _ProgramCard({required this.program, required this.fontSize});

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveFlutter.of(routeGlobalKey.currentContext!);
    return AnimationConfiguration.staggeredList(
      position: 0,
      duration: const Duration(milliseconds: 400),
      child: SlideAnimation(
        verticalOffset: 30,
        child: FadeInAnimation(
          child: GestureDetector(
            onTap: program.onTap,
            child: Container(
              margin: const EdgeInsets.only(bottom: 12),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: program.bgColor,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 6,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Expanded(
                    child: FormLabel(
                      text: program.title,
            
                      fontSize: responsive.fontSize(2),
                      labelColor: Colors.white,
                      fontweight: FontWeight.w600,
                    ),
                  ),
                  const Icon(
                    Icons.arrow_forward_ios,
                    size: 18,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
