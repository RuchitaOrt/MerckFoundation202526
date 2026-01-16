import 'package:flutter/material.dart';
import 'package:merckfoundation_252026/Utility/ResponsiveFlutter.dart';
import 'package:merckfoundation_252026/Utility/customappbar.dart';
import 'package:merckfoundation_252026/Utils/common_strings.dart';
import 'package:merckfoundation_252026/Utils/customcolor.dart';
import 'package:merckfoundation_252026/data/model/CommonModel.dart';
import 'package:merckfoundation_252026/enum/commonEnum.dart';
import 'package:merckfoundation_252026/widgets/CommonActionButton.dart';

import 'package:merckfoundation_252026/widgets/Customcard.dart';
import 'package:merckfoundation_252026/widgets/FooterFlowerImage.dart';
import 'package:merckfoundation_252026/widgets/botttomlink.dart';
import 'package:merckfoundation_252026/widgets/formLabel.dart';

class OurAfricaSeasonScreen extends StatelessWidget {
  const OurAfricaSeasonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final seasons = StaticSeasonData.seasons;
  

    return Scaffold(
      backgroundColor: Customcolor.background,
      appBar: CommonAppBar(
        type: AppBarType.inner,
        title: CommonStrings.ourAfrica,
        onSearch: () {},
        onShare: () {},
        shareLink: "",
      ),
      body: ListView(
        children: [
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.only(left: 8, top: 20),
            itemCount: seasons.length,
            itemBuilder: (context, index) {
              return SeasonSection(season: seasons[index]);
            },
          ),
          const FooterFlowerImage(),
          8.0.heightBox,
          Bottomcardlink(),
        ],
      ),
    );
  }
}

class SeasonSection extends StatelessWidget {
  final SeasonModel season;

  const SeasonSection({super.key, required this.season});

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveFlutter.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: FormLabel(
            text: season.seasonName,
            labelColor: Customcolor.colorBlue,
            fontSize: responsive.fontSize(2.3),
            fontweight: FontWeight.w700,
          ),
        ),

         8.0.heightBox,

        SizedBox(
          height: responsive.isTablet ? 320 : 270,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: season.episodes.length,
            separatorBuilder: (_, __) => 2.0.widthBox,
            itemBuilder: (context, index) {
              final episode = season.episodes[index];

              return
               SizedBox(
                width: responsive.isTablet
                    ? responsive.width(45)
                    : responsive.width(80),
                   
                child: 
                CustomCard(
                  showYoutubeIcon: true,
                  headerPrefix: "",
                  title: "",
                  imageUrl:
                      "https://merck-foundation.com/merckfoundation/public/uploads/testimonials/1693978262_463d0ee859a8dbd5e7c8.jpg",
                  subtitle: episode.episodeBrief,
                  showShareIcon: true,
                  showInfoIcon: true,
                  onCardTap: () {},
                  onButtonTap: () {},
                ),
              );
            },
          ),
        ),
        CommonActionButton(text: CommonStrings.watchMore, onTap: () {}),
        20.0.heightBox,
      ],
    );
  }
}
