import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:merckfoundation_252026/Provider/CeoMessageProvider.dart';
import 'package:merckfoundation_252026/model/ArticleModel.dart';

import 'package:merckfoundation_252026/screens/MainScreens/CommonListingScreen.dart';

import 'package:merckfoundation_252026/screens/DetailsScreen/DetailScreen.dart';

class CeoMessageScreen extends StatelessWidget {

  final String menuID;

  final String title;

  final String? shareLink;

  const CeoMessageScreen({
    super.key,
    required this.menuID,
    required this.title,
    this.shareLink,
  });

  @override
  Widget build(BuildContext context) {

    return CommonListingScreen<
        ArticleModel,
        CeoMessageProvider>(

      title: title,

      menuID: menuID,

      shareLink: shareLink,

      getList: (provider) =>
          provider.ceoMessageList,

      isLoading: (provider) =>
          provider.isLoading,

      hasMore: (provider) =>
          provider.hasMore,

      getStatus: (provider) =>
          provider.status,

      getErrorMessage: (provider) =>
          provider.errorMessage,

      onRetry: (context) =>
          context
              .read<CeoMessageProvider>()
              .retryInitial(context),

      loadInitial: (context) =>
          context
              .read<CeoMessageProvider>()
              .loadInitial(context),

      loadMore: (context) =>
          context
              .read<CeoMessageProvider>()
              .loadMore(context),

      getImage: (item) =>
          item.image ,

      getTitle: (item) =>
          item.title ,

      onTap: (context, item) {

        Navigator.push(
          context,

          MaterialPageRoute(
            builder: (_) => DetailScreen(
              "",
              "",
              title: title,
              articleId:
                  item.id.toString(),
              languageId:
                  item.language_id ,
              isDetailApiCalled: true,
              shareLink: shareLink,
              menuID: menuID,
            ),
          ),
        );
      },
    );
  }
}