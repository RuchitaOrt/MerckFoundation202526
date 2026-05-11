import 'package:flutter/material.dart';
import 'package:merckfoundation_252026/Utility/APIManager.dart';
class ArticleService {
  Future<Map<String, dynamic>> fetchArticle(
      BuildContext context, int page) async {

    final response = await APIManager().apiRequest(
      context,
      API.getnewslettersarticles, // ✅ NEW ENUM
      queryParams: {
        "p": page, // ✅ page instead of full URL
      },
    );

    return response;
  }
   /// DETAIL API
Future<Map<String, dynamic>?> fetchArticleDetail(
  BuildContext context, {
  required String articleId,
  required String languageId,
}) async {

  try {

    final response = await APIManager().apiRequest(
      context,
      API.getnewsletterarticlebylanguage,
      jsonval: {
        "article_id": articleId,
        "language_id": languageId,
      },
    );

    return response;

  } catch (e) {

    debugPrint(
      "DETAIL API ERROR: $e",
    );

    return null;
  }
}
}