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
}