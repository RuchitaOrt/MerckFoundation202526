
import 'package:flutter/material.dart';
import 'package:merckfoundation_252026/Utility/APIManager.dart';
import 'package:merckfoundation_252026/Utility/api_result.dart';

class ArticleService {
  Future<ApiResult<dynamic>> fetchArticle(
    BuildContext context,
    int page,{
  String languageId = "",
}
  ) async {
    return await APIManager().apiRequest(
      context,
      API.getnewslettersarticles,
      queryParams: {"p": page, "language_id": languageId,},
    );
  }

  Future<ApiResult<dynamic>> fetchArticleDetail(
    BuildContext context, {
    required String articleId,
    required String languageId,
  }) async {
    print("articleId ${articleId} ${languageId}");
    return await APIManager().apiRequest(
      context,
      API.getnewsletterarticlebylanguage,
      jsonval: {
        "article_id": articleId,
        "language_id": languageId,
      },
      
    );
  }
}