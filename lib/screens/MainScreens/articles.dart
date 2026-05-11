
import 'package:flutter/material.dart';
import 'package:merckfoundation_252026/Utils/common_strings.dart';
import 'package:provider/provider.dart';

import 'package:merckfoundation_252026/Provider/article_provider.dart';
import 'package:merckfoundation_252026/model/ArticleModel.dart';
import 'package:merckfoundation_252026/screens/MainScreens/CommonListingScreen.dart';
import 'package:merckfoundation_252026/screens/MainUIBody.dart/DetailScreen.dart';

class ArticlesScreen extends StatelessWidget {
  const ArticlesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CommonListingScreen<ArticleModel, ArticleProvider>(
      title:CommonStrings.articles,

      getList: (provider) => provider.articleList,
      isLoading: (provider) => provider.isLoading,
      hasMore: (provider) => provider.hasMore,

      loadInitial: (context) =>
          context.read<ArticleProvider>().loadInitial(context),

      loadMore: (context) =>
          context.read<ArticleProvider>().loadMore(context),

      getImage: (item) => item.image ?? "",
      getTitle: (item) => item.title ?? "",

      onTap: (context, item) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => DetailScreen(
              "","",
              // item.title ?? "",
              // item.details ?? "",
              title: "Articles",
              articleId:item.id.toString(),
              languageId: item.language_id ?? "",
              isDetailApiCalled: true,

            ),
          ),
        );
      },
    );
  }
}