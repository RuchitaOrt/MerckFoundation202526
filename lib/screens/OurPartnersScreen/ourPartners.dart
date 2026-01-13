import 'package:flutter/material.dart';
import 'package:merckfoundation_252026/Utility/ResponsiveFlutter.dart';
import 'package:merckfoundation_252026/Utility/customappbar.dart';
import 'package:merckfoundation_252026/Utils/common_strings.dart';
import 'package:merckfoundation_252026/Utils/customcolor.dart';
import 'package:merckfoundation_252026/enum/commonEnum.dart';
import 'package:merckfoundation_252026/providers/ouractivities_provider.dart';
import 'package:merckfoundation_252026/widgets/CommonSliverGrid.dart';
import 'package:merckfoundation_252026/widgets/FooterFlowerImage.dart';
import 'package:merckfoundation_252026/widgets/SmartHtmlWidget.dart';
import 'package:merckfoundation_252026/widgets/botttomlink.dart';
import 'package:merckfoundation_252026/widgets/mediaCard.dart';
import 'package:provider/provider.dart';


class Ourpatner extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return OurpatnerState();
  }
}

class OurpatnerState extends State<Ourpatner> {
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
      backgroundColor: Customcolor.background,
      appBar: CommonAppBar(
        type: AppBarType.inner,
        title: CommonStrings.ourPartners,
        onBack: () => Navigator.pop(context),
        onSearch: () {},
        onShare: () {},
        shareLink: "",
      ),
      body:
       Consumer<OurActivityProvider>(
        builder: (context, provider, _) {
          return CustomScrollView(
            slivers: [
               const SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.all(20.0),
                  child: SmartHtmlWidget(
                    html:
                        '<p class=\"txt-dblue\" style=\"text-align: justify;\"><span style=\"color:#2980b9;\"><span style=\"font-size:11.0pt;\"><span style=\"font-family:Verdana,Geneva,sans-serif;\"><strong>We know we can make a greater difference in people&rsquo;s lives when working together with others. We cooperate with governments, academic institutions, global and local communities, donors, patient associations, international organizations and NGOs.</strong></span></span></span></p>\r\n\r\n<ul>\r\n\t<li style=\"text-align: justify;\"><span style=\"font-size:11.0pt;\"><span style=\"font-family:Verdana,Geneva,sans-serif;\">We are open to partner in programs that contribute to our goal of improving the health and well being.</span></span></li>\r\n\t<li style=\"text-align: justify;\"><span style=\"font-size:11.0pt;\"><span style=\"font-family:Verdana,Geneva,sans-serif;\">We care for people living in underserved communities and want to advance their lives through science and technology.</span></span></li>\r\n\t<li style=\"text-align: justify;\"><span style=\"font-size:11.0pt;\"><span style=\"font-family:Verdana,Geneva,sans-serif;\">We are dedicated to sharing our expertise to jointly develop and implement those programs.</span></span></li>\r\n</ul>\r\n<gdiv></gdiv>',
                  ),
                ),
              ),

                 
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
