import 'package:flutter/material.dart';

import 'package:merckfoundation_252026/Provider/NewsReleaseProvider.dart';

import 'package:merckfoundation_252026/Utility/showdailog.dart';
import 'package:merckfoundation_252026/CommonUtils/common_images.dart';
import 'package:merckfoundation_252026/model/CommonModel.dart';

import 'package:merckfoundation_252026/model/MediaModel.dart';
import 'package:merckfoundation_252026/screens/MediaAndStoriesScreen/MediaEnquiryCard.dart';

import 'package:provider/provider.dart';

import 'package:merckfoundation_252026/screens/MainScreens/CommonListingScreen.dart';


class NewsRelease extends StatelessWidget {
  final String menuID;
  final String title;
  

  final String? shareLink;
   NewsRelease({super.key, required this.menuID, required this.title, this.shareLink});
 final contacts = [
    MediaContactModel(
      name: "Ms. Mehak Handa",
      phone: "+91 9319606669",
      email: "mehak.handa@external.merckgroup.com",
      image: "",
    ),
    MediaContactModel(
      name: "Mr. Harsh Sharma",
      phone: "+91 9540932090",
      email: "harsh.sharma@external.merckgroup.com",
      image: "",
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return CommonListingScreen<MediaModel, NewsReleaseProvider>(
      title:title,

      /// 🔥 ADD THIS
      topWidget: Padding(
        padding: const EdgeInsets.all(1),
        child: MediaEnquiryCard(contacts: contacts,)
      ),

      getList: (provider) => provider.mediaList,
      isLoading: (provider) => provider.isLoading,
      hasMore: (provider) => provider.hasMore,
getStatus: (provider) =>
      provider.status,

  getErrorMessage:
      (provider) =>
          provider.errorMessage,

  onRetry: (context) =>
      context
          .read<
              NewsReleaseProvider>()
          .retry(context),

      loadInitial: (context) =>
          context.read<NewsReleaseProvider>().loadInitial(context),

      loadMore: (context) =>
          context.read<NewsReleaseProvider>().loadMore(context),

      getImage: (item) => CommonImagePath.pdfImage,

      getTitle: (item) => item.title ,
 shareLink: shareLink,
      menuID: menuID,
      onTap: (context, item) {
        ShowDialogs.launchURL(item.pdfFile ?? "");
      },
    );
  }
}