
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:merckfoundation_252026/Provider/article_provider.dart';
import 'package:merckfoundation_252026/model/ArticleModel.dart';
import 'package:merckfoundation_252026/screens/MainScreens/CommonListingScreen.dart';
import 'package:merckfoundation_252026/screens/DetailsScreen/DetailScreen.dart';

class ArticlesScreen extends StatelessWidget {
  final String menuID;
  final String title;
  final String? shareLink;
  final List<ArticleModel>? initialList;
final bool useLocalPagination;

  const ArticlesScreen({
    super.key,
    required this.menuID,
    required this.title,
    this.shareLink,
    this.initialList,
  this.useLocalPagination = false,
  });

  @override
  Widget build(BuildContext context) {
    return CommonListingScreen<ArticleModel, ArticleProvider>(
      title: title,
      menuID: menuID,
      shareLink: shareLink,

      getList: (provider) => provider.articleList,
      isLoading: (provider) => provider.isLoading,
      hasMore: (provider) => provider.hasMore,
      getStatus: (provider) => provider.status,
      getErrorMessage: (provider) => provider.errorMessage,

      onRetry: (context) =>
          context.read<ArticleProvider>().retryInitial(context),
      loadInitial: (context) async {

  final provider =
      context.read<ArticleProvider>();

  if (useLocalPagination &&
      initialList != null) {

    provider.loadLocalArticles(
      initialList!,
    );

  } else {

    await provider.loadInitial(
      context,
    );
  }
},
      // loadInitial: (context) =>
      //     context.read<ArticleProvider>().loadInitial(context),

      loadMore: (context) =>
          context.read<ArticleProvider>().loadMore(context),

      getImage: (item) => item.image,
      getTitle: (item) => item.title ,

      onTap: (context, item) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => DetailScreen(
              "",
              "",
              title: "",
              articleId: item.id.toString(),
              languageId: item.language_id ,
              isDetailApiCalled: true,
              shareLink: shareLink,
              menuID:  menuID,
              // boilerPlateData: item.boilerPlateData!.content! ?? "",
            ),
          ),
        );
      },
    );
  }
}