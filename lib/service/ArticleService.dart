// import 'package:flutter/material.dart';



// import 'package:merckfoundation_252026/Utility/APIManager.dart';
// import 'package:merckfoundation_252026/Utility/api_result.dart';

// class ArticleService {

//   Future<ApiResult<dynamic>> fetchArticle(
//     BuildContext context,
//     int page,
//   ) async {

//     final response =
//         await APIManager().apiRequest(
//       context,
//       API.getnewslettersarticles,
//       queryParams: {
//         "p": page,
//       },
//     );

//     return response;
//   }

//   /// DETAIL API
//   Future<ApiResult<dynamic>> fetchArticleDetail(
//     BuildContext context, {
//     required String articleId,
//     required String languageId,
//   }) async {

//     final response =
//         await APIManager().apiRequest(
//       context,
//       API.getnewsletterarticlebylanguage,
//       jsonval: {
//         "article_id": articleId,
//         "language_id": languageId,
//       },
//     );

//     return response;
//   }
// }
import 'package:flutter/material.dart';
import 'package:merckfoundation_252026/Utility/APIManager.dart';
import 'package:merckfoundation_252026/Utility/api_result.dart';

class ArticleService {
  Future<ApiResult<dynamic>> fetchArticle(
    BuildContext context,
    int page,
  ) async {
    return await APIManager().apiRequest(
      context,
      API.getnewslettersarticles,
      queryParams: {"p": page},
    );
  }

  Future<ApiResult<dynamic>> fetchArticleDetail(
    BuildContext context, {
    required String articleId,
    required String languageId,
  }) async {
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