import 'package:flutter/material.dart';
import 'package:merckfoundation_252026/Provider/MediaProvider.dart';

import 'package:merckfoundation_252026/Utility/showdailog.dart';
import 'package:merckfoundation_252026/Utils/common_strings.dart';

import 'package:merckfoundation_252026/model/MediaModel.dart';

import 'package:provider/provider.dart';


import 'package:merckfoundation_252026/screens/MainScreens/CommonListingScreen.dart';

class MediaScreen extends StatelessWidget {
  const MediaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CommonListingScreen<MediaModel, MediaProvider>(
      title:CommonStrings.merckInMedia,

      getList: (provider) => provider.mediaList,
      isLoading: (provider) => provider.isLoading,
      hasMore: (provider) => provider.hasMore,

      loadInitial: (context) =>
          context.read<MediaProvider>().loadInitial(context),

      loadMore: (context) =>
          context.read<MediaProvider>().loadMore(context),

      getImage: (item) => item.image ?? "",
      getTitle: (item) => item.title ?? "",

      onTap: (context, item) {
        ShowDialogs.launchURL(item.articleUrl ?? "");
      },
    );
  }
}