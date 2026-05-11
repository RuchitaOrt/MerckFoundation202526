import 'package:flutter/material.dart';
import 'package:merckfoundation_252026/Utility/ResponsiveFlutter.dart';
import 'package:merckfoundation_252026/Utility/customappbar.dart';
import 'package:merckfoundation_252026/Utils/common_strings.dart';
import 'package:merckfoundation_252026/Utils/customcolor.dart';
import 'package:merckfoundation_252026/model/CommonModel.dart';
import 'package:merckfoundation_252026/enum/commonEnum.dart';
import 'package:merckfoundation_252026/providers/CovidProvider.dart';

import 'package:merckfoundation_252026/screens/SubScreens/Covid/CovidBanner.dart';
import 'package:merckfoundation_252026/screens/SubScreens/Covid/CovidDescriptionList.dart';
import 'package:merckfoundation_252026/widgets/CommonListSection.dart';
import 'package:merckfoundation_252026/widgets/Customcard.dart';

import 'package:provider/provider.dart';

class CovidResponseScreen extends StatelessWidget {
  const CovidResponseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveFlutter.of(context);
    final videoProvider = context.watch<CovidProvider>();
    return Scaffold(
      backgroundColor: Customcolor.background,
      appBar: CommonAppBar(
        type: AppBarType.inner,
        title: CommonStrings.covidResponse,

        onSearch: () {},
        onShare: () {},

        shareLink: "",
      ),
      body: Consumer<CovidProvider>(
        builder: (context, provider, _) {
          if (provider.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          return ListView(
            padding: EdgeInsets.symmetric(horizontal: responsive.width(4)),
            children: [
              8.0.heightBox,
              CovidBanner(),

              CovidDescriptionList(list: provider.descriptions),
              CommonListSection<Video>(
                title: "Our ",
                subtitle: "Videos",
                buttonText: CommonStrings.watchMore,
                items: videoProvider.videos,
                itemBuilder: (context, video) {
                  final r = ResponsiveFlutter.of(context);
                  return SizedBox(
                    width: r.width(90),
                    child: CustomCard(
                      showYoutubeIcon: true,
                     
                      imageUrl: video.videoLink!,
                      subtitle: video.videoDesc,
                      onCardTap: () {},
                      onButtonTap: () {},
                    
                    ),
                  );
                },
                onWatchMore: () {
                  // Navigate to full list
                },
              ),
              CommonListSection<Video>(
                title: "Covid 19 Latest ",
                subtitle: "Update",
                items: videoProvider.videos,
                itemBuilder: (context, video) {
                  final r = ResponsiveFlutter.of(context);
                  return SizedBox(
                    width: r.width(90),
                    child: CustomCard(
                      showYoutubeIcon: true,
                    
                      imageUrl: video.videoLink!,
                      subtitle: video.videoDesc,
                      onCardTap: () {},
                      onButtonTap: () {},
                     
                    ),
                  );
                },
                onWatchMore: () {
                  // Navigate to full list
                }, buttonText: CommonStrings.viewMore,
              ),
            ],
          );
        },
      ),
    );
  }
}
