import 'package:flutter/material.dart';
import 'package:merckfoundation_252026/Provider/MediaProvider.dart';

import 'package:merckfoundation_252026/Utility/showdailog.dart';

import 'package:merckfoundation_252026/model/MediaModel.dart';

import 'package:provider/provider.dart';


import 'package:merckfoundation_252026/screens/MainScreens/CommonListingScreen.dart';

class MediaScreen extends StatelessWidget {
  final String menuID;
  final String title;
  

  final String? shareLink;
  const MediaScreen({super.key, required this.menuID, required this.title, this.shareLink});

  @override
  Widget build(BuildContext context) {
    return CommonListingScreen<MediaModel, MediaProvider>(
      title:title,

      getList: (provider) => provider.mediaList,
      isLoading: (provider) => provider.isLoading,
      hasMore: (provider) => provider.hasMore,
     isCEO: true,
      /// API STATUS
      getStatus: (provider) =>
          provider.status,

      getErrorMessage:
          (provider) =>
              provider.errorMessage,

      onRetry: (context) =>
          context
              .read<MediaProvider>()
              .retryInitial(
                context,
              ),

      loadInitial: (context) =>
          context.read<MediaProvider>().loadInitial(context),

      loadMore: (context) =>
          context.read<MediaProvider>().loadMore(context),

      getImage: (item) => item.image ,
      getTitle: (item) => item.title ,
 shareLink: shareLink,
      menuID: menuID,
      onTap: (context, item) {
        ShowDialogs.launchURL(item.articleUrl );
      },
    );
  }
}