import 'package:flutter/material.dart';

import 'package:merckfoundation_252026/Provider/NewsReleaseProvider.dart';

import 'package:merckfoundation_252026/Utility/showdailog.dart';
import 'package:merckfoundation_252026/Utils/common_strings.dart';

import 'package:merckfoundation_252026/model/MediaModel.dart';

import 'package:provider/provider.dart';

import 'package:merckfoundation_252026/screens/MainScreens/CommonListingScreen.dart';

class NewsRelease extends StatelessWidget {
  const NewsRelease({super.key});

  @override
  Widget build(BuildContext context) {
    return CommonListingScreen<MediaModel, NewsReleaseProvider>(
      title: CommonStrings.newsRelease,

      getList: (provider) => provider.mediaList,
      isLoading: (provider) => provider.isLoading,
      hasMore: (provider) => provider.hasMore,

      loadInitial: (context) =>
          context.read<NewsReleaseProvider>().loadInitial(context),

      loadMore: (context) =>
          context.read<NewsReleaseProvider>().loadMore(context),

      getImage: (item) =>  "assets/newImages/pdf.png",
      getTitle: (item) => item.title ?? "",

      onTap: (context, item) {
        ShowDialogs.launchURL(item.pdfFile ?? "");
      },
    );
  }
}
