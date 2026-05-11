import 'package:flutter/material.dart';
import 'package:merckfoundation_252026/widgets/CommonList/HorizontalMediaSection.dart';
import 'package:merckfoundation_252026/widgets/FooterFlowerImage.dart';
import 'package:merckfoundation_252026/widgets/botttomlink.dart';
import 'package:provider/provider.dart';

import 'package:merckfoundation_252026/Provider/EpisodeProvider.dart';
import 'package:merckfoundation_252026/Utility/customappbar.dart';
import 'package:merckfoundation_252026/Utils/customcolor.dart';
import 'package:merckfoundation_252026/enum/commonEnum.dart';


class EpisodeListingScreen extends StatefulWidget {
  const EpisodeListingScreen({super.key});

  @override
  State<EpisodeListingScreen> createState() =>
      _EpisodeListingScreenState();
}

class _EpisodeListingScreenState
    extends State<EpisodeListingScreen> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<EpisodeProvider>()
          .getEpisodes(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider =
        context.watch<EpisodeProvider>();

    return Scaffold(
      backgroundColor: Customcolor.background,

      appBar: CommonAppBar(
        type: AppBarType.inner,
        title: "Episodes",
        onSearch: () {},
        onShare: () {},
      ),

    body: provider.isLoading
    ? const Center(
        child: CircularProgressIndicator(),
      )
    : ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: provider.seasons.length + 2,
        itemBuilder: (context, index) {

          /// FOOTER FLOWER
          if (index == provider.seasons.length) {
            return const FooterFlowerImage();
          }

          /// BOTTOM LINKS
          if (index == provider.seasons.length + 1) {
            return const Bottomcardlink();
          }

          final season = provider.seasons[index];

          return Padding(
            padding: const EdgeInsets.only(
              top: 10,
              bottom: 20,
            ),
            child: HorizontalMediaSection(
              title: season.seasonName,
              
              seasonID: season.id.toString(),
              showMenu: true,
              type: HomeLayoutType.episodesviewall,
              content: season.episodes
                  .map((e) => e.toMap())
                  .toList(),
            ),
          );
        },
      ),
    );
  }
}