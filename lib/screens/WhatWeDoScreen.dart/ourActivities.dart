import 'package:flutter/material.dart';
import 'package:merckfoundation_252026/Utility/ResponsiveFlutter.dart';
import 'package:merckfoundation_252026/Utility/customappbar.dart';
import 'package:merckfoundation_252026/Utils/common_strings.dart';
import 'package:merckfoundation_252026/Utils/customcolor.dart';
import 'package:merckfoundation_252026/enum/commonEnum.dart';
import 'package:merckfoundation_252026/providers/ouractivities_provider.dart';

import 'package:merckfoundation_252026/widgets/CommonSliverGrid.dart';
import 'package:merckfoundation_252026/widgets/FooterFlowerImage.dart';
import 'package:merckfoundation_252026/widgets/botttomlink.dart';
import 'package:merckfoundation_252026/widgets/mediaCard.dart';
import 'package:provider/provider.dart';
class OurActivities extends StatefulWidget {
  const OurActivities({super.key});

  @override
  State<OurActivities> createState() => _OurActivitiesState();
}

class _OurActivitiesState extends State<OurActivities> {
  @override
void initState() {
  super.initState();
  WidgetsBinding.instance.addPostFrameCallback((_) {
    context.read<OurActivityProvider>().loadStaticStories();
  });
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        type: AppBarType.inner,
        title: CommonStrings.ourActivities,
        onBack: () => Navigator.pop(context),
        onSearch: () {},
        onShare: () {},
       
        shareLink: "",
      ),
      backgroundColor: Customcolor.background,
      body: Consumer<OurActivityProvider>(
        builder: (context, provider, _) {
          return CustomScrollView(
            slivers: [
              /// 🔹 STORIES GRID
              CommonSliverGrid(
                    items: provider.cards,
                    itemBuilder: (context, item, index) {
                      return MediaCard(data: item,fontColor: Customcolor.colorBlue,);
                    },
                  ),

              /// 🔹 FOOTER IMAGE
              const SliverToBoxAdapter(
                child: FooterFlowerImage(),
              ),

             SliverToBoxAdapter(child:  8.0.heightBox,),

              /// 🔹 BOTTOM LINKS
              const SliverToBoxAdapter(
                child: Bottomcardlink(),
              ),

            
            ],
          );
        },
      ),
    );
  }
}
