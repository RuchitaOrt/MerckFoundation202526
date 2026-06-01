import 'package:flutter/material.dart';
import 'package:merckfoundation_252026/Utility/ApiStatusHandler.dart';
import 'package:merckfoundation_252026/Utility/api_status.dart';
import 'package:merckfoundation_252026/CommonUtils/common_strings.dart';
import 'package:merckfoundation_252026/widgets/CommonList/HorizontalMediaSection.dart';
import 'package:merckfoundation_252026/widgets/CommonWidget/CommonLoader.dart';
import 'package:merckfoundation_252026/widgets/EmptyStateWidget.dart';
import 'package:merckfoundation_252026/widgets/FooterFlowerImage.dart';
import 'package:merckfoundation_252026/widgets/Bottomcardlink.dart';
import 'package:provider/provider.dart';

import 'package:merckfoundation_252026/Provider/EpisodeProvider.dart';
import 'package:merckfoundation_252026/widgets/CommonWidget/customappbar.dart';
import 'package:merckfoundation_252026/CommonUtils/customcolor.dart';
import 'package:merckfoundation_252026/enum/commonEnum.dart';


class EpisodeListingScreen extends StatefulWidget {
   final String menuID;
  final String title;
  

  final String? shareLink;
  const EpisodeListingScreen({super.key, required this.menuID, required this.title, this.shareLink});

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
  final provider = context.watch<EpisodeProvider>();

  Widget body;
 if (provider.status != ApiStatus.success &&
    provider.status != ApiStatus.loading &&
    provider.status != ApiStatus.initial) {

  body= ApiStatusHandler(
    status: provider.status,
    errorMessage: provider.errorMessage,
    onRetry: () {
        provider.retryEpisodes(context);
      },
  );
}
 
   else if (provider.isLoading) {
    body = const Center(child: CommonLoader());
  }

  /// =========================
  /// EMPTY
  /// =========================
  else if (provider.seasons.isEmpty) {
    body = Column(
      children: const [
        Expanded(child: EmptyStateWidget()),
        FooterFlowerImage(),
        Bottomcardlink(),
      ],
    );
  }

  /// =========================
  /// SUCCESS
  /// =========================
  else {
    body = ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: provider.seasons.length + 2,
      itemBuilder: (context, index) {
        if (index == provider.seasons.length) {
          return const FooterFlowerImage();
        }

        if (index == provider.seasons.length + 1) {
          return const Bottomcardlink();
        }

        final season = provider.seasons[index];

        return Padding(
          padding: const EdgeInsets.only(top: 10, bottom: 20),
          child: HorizontalMediaSection(
            title: season.seasonName,
            buttonText: CommonStrings.viewAll,
            seasonID: season.id.toString(),
            showMenu: true,
            buttonLink: HomeLayoutType.season.name,
            menuID: "",
            shareLink: widget.shareLink,
            type: HomeLayoutType.season,
            content: season.episodes.map((e) => e.toMap()).toList(),
            
          ),
        );
      },
    );
  }

  /// =========================
  /// SINGLE SCAFFOLD (IMPORTANT)
  /// =========================
  return Scaffold(
    backgroundColor: Customcolor.background,
    appBar: CommonAppBar(
      type: AppBarType.inner,
      title: widget.title, // keep dynamic
      onSearch: () {},
      shareLink: widget.shareLink ?? "",
      menuID: widget.menuID,
      onBack: ()
      {
        Navigator.pop(context);
      },
    ),
    body: body,
  );
}

}