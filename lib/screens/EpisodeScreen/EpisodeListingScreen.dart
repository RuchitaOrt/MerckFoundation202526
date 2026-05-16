import 'package:flutter/material.dart';
import 'package:merckfoundation_252026/Utility/api_status.dart';
import 'package:merckfoundation_252026/Utils/common_strings.dart';
import 'package:merckfoundation_252026/widgets/CommonApiStatusWidget.dart';
import 'package:merckfoundation_252026/widgets/CommonList/HorizontalMediaSection.dart';
import 'package:merckfoundation_252026/widgets/CommonLoader.dart';
import 'package:merckfoundation_252026/widgets/EmptyStateWidget.dart';
import 'package:merckfoundation_252026/widgets/FooterFlowerImage.dart';
import 'package:merckfoundation_252026/widgets/botttomlink.dart';
import 'package:provider/provider.dart';

import 'package:merckfoundation_252026/Provider/EpisodeProvider.dart';
import 'package:merckfoundation_252026/Utility/customappbar.dart';
import 'package:merckfoundation_252026/Utils/customcolor.dart';
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

  /// =========================
  /// NO INTERNET
  /// =========================
  if (provider.status == ApiStatus.noInternet) {
    body = CommonApiStatusWidget(
      icon: Icons.wifi_off,
      title: CommonStrings.noInternetConnection,
      onRetry: () => provider.retryEpisodes(context),
    );
  }

  /// =========================
  /// TIMEOUT
  /// =========================
  else if (provider.status == ApiStatus.timeout) {
    body = CommonApiStatusWidget(
      icon: Icons.access_time,
      title: "Request Timeout",
      onRetry: () => provider.retryEpisodes(context),
    );
  }

  /// =========================
  /// SERVER ERROR
  /// =========================
  else if (provider.status == ApiStatus.serverError) {
    body = CommonApiStatusWidget(
      icon: Icons.cloud_off,
      title: "Server Error",
      onRetry: () => provider.retryEpisodes(context),
    );
  }

  /// =========================
  /// OTHER ERROR
  /// =========================
  else if (provider.status == ApiStatus.error) {
    body = CommonApiStatusWidget(
      icon: Icons.error_outline,
      title: provider.errorMessage,
      onRetry: () => provider.retryEpisodes(context),
    );
  }

  /// =========================
  /// LOADING
  /// =========================
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
            buttonLink: "episodes_viewall",
            menuID: widget.menuID,
            shareLink: widget.shareLink,
            type: HomeLayoutType.episodesviewall,
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
      shareLink: widget.shareLink,
    ),
    body: body,
  );
}
//   @override
//   Widget build(BuildContext context) {
//     final provider =
//         context.watch<EpisodeProvider>();
// /// NO INTERNET
// if (provider.status ==
//     ApiStatus.noInternet) {

//   return Scaffold(
//     body: CommonApiStatusWidget(
//       icon: Icons.wifi_off,
//       title: "No Internet Connection",
//       onRetry: () {
//         provider.retryEpisodes(
//           context,
//         );
//       },
//     ),
//   );
// }

// /// TIMEOUT
// if (provider.status ==
//     ApiStatus.timeout) {

//   return Scaffold(
//     body: CommonApiStatusWidget(
//       icon: Icons.access_time,
//       title: "Request Timeout",
//       onRetry: () {
//         provider.retryEpisodes(
//           context,
//         );
//       },
//     ),
//   );
// }

// /// SERVER ERROR
// if (provider.status ==
//     ApiStatus.serverError) {

//   return Scaffold(
//     body: CommonApiStatusWidget(
//       icon: Icons.cloud_off,
//       title: "Server Error",
//       onRetry: () {
//         provider.retryEpisodes(
//           context,
//         );
//       },
//     ),
//   );
// }

// /// OTHER ERROR
// if (provider.status ==
//     ApiStatus.error) {

//   return Scaffold(
//     body: CommonApiStatusWidget(
//       icon: Icons.error_outline,
//       title: provider.errorMessage,
//       onRetry: () {
//         provider.retryEpisodes(
//           context,
//         );
//       },
//     ),
//   );
// }
//     return Scaffold(
//       backgroundColor: Customcolor.background,

//       appBar: CommonAppBar(
//         type: AppBarType.inner,
//         title: "Episodes",
//         onSearch: () {},
//        shareLink: widget.shareLink,
//       ),

//     body: provider.isLoading
//     ? const Center(
//         child: CommonLoader(),
//       )
//     : provider.seasons.isEmpty? Column(
//                   children: [
//                     /// CENTER EMPTY CONTENT
//                     const Expanded(
//                       child: Center(
//                         child: Padding(
//                           padding: EdgeInsets.symmetric(horizontal: 20),
//                           child: EmptyStateWidget(),
//                         ),
//                       ),
//                     ),

//                     /// FIXED FOOTER BOTTOM
//                     FooterFlowerImage(),

//                     Bottomcardlink(),
//                   ],
//                 ):ListView.builder(
//         physics: const BouncingScrollPhysics(),
//         itemCount: provider.seasons.length + 2,
//         itemBuilder: (context, index) {

//           /// FOOTER FLOWER
//           if (index == provider.seasons.length) {
//             return const FooterFlowerImage();
//           }

//           /// BOTTOM LINKS
//           if (index == provider.seasons.length + 1) {
//             return const Bottomcardlink();
//           }

//           final season = provider.seasons[index];

//           return Padding(
//             padding: const EdgeInsets.only(
//               top: 10,
//               bottom: 20,
//             ),
//             child: HorizontalMediaSection(
//               title: season.seasonName,
//               buttonText: CommonStrings.viewAll,
//               seasonID: season.id.toString(),
//               showMenu: true,
//               buttonLink: "episodes_viewall",
//                 menuID: widget.menuID,
                     
//                         shareLink: widget.shareLink,
//               type: HomeLayoutType.episodesviewall,
//               content: season.episodes
//                   .map((e) => e.toMap())
//                   .toList(),
//             ),
//           );
//         },
//       ),
//     );
//   }
}