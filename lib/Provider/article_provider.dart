import 'package:flutter/material.dart';
import 'package:merckfoundation_252026/model/ArticleModel.dart';
import 'package:merckfoundation_252026/service/ArticleService.dart';

class ArticleProvider extends ChangeNotifier {
  final ArticleService _service = ArticleService();

  List<ArticleModel> articleList = [];

  int currentPage = 1;

  bool isLoading = false;

  bool hasMore = true;

  bool isDetailLoading = false;

  ArticleModel? articleDetail;

  /// ✅ CURRENT SELECTED LANGUAGE
  String selectedLanguageId = "10";

  /// ✅ AVAILABLE LANGUAGES
  List<dynamic> availableLanguages = [];

  Future<void> loadInitial(BuildContext context) async {
    if (isLoading) return;

    isLoading = true;

    notifyListeners();

    final response = await _service.fetchArticle(context, 1);

    articleList = (response['data'] as List)
        .map((e) => ArticleModel.fromJson(e))
        .toList();

    currentPage = 1;

    hasMore = response['next'] != null;

    isLoading = false;

    notifyListeners();
  }

  Future<void> loadMore(BuildContext context) async {
    if (!hasMore || isLoading) return;

    isLoading = true;

    notifyListeners();

    final nextPage = currentPage + 1;

    final response = await _service.fetchArticle(context, nextPage);

    final newList = (response['data'] as List)
        .map((e) => ArticleModel.fromJson(e))
        .toList();

    articleList.addAll(newList);

    currentPage = nextPage;

    hasMore = response['next'] != null;

    isLoading = false;

    notifyListeners();
  }

  /// ✅ DETAIL API
  // String selectedLanguageId = "";

  Future<void> loadArticleDetail(
    BuildContext context, {
    required String articleId,
    required String languageId,
  }) async {
    try {
      isDetailLoading = true;

      notifyListeners();

      final response = await _service.fetchArticleDetail(
        context,
        articleId: articleId,
        languageId: languageId,
      );

      if (response == null) {
        isDetailLoading = false;

        notifyListeners();

        return;
      }

      articleDetail = ArticleModel.fromJson(response['data']);

      selectedLanguageId = articleDetail?.language_id ?? "";
    } catch (e) {
      debugPrint("DETAIL ERROR $e");
    }

    isDetailLoading = false;

    notifyListeners();
  }

  /// ✅ CHANGE LANGUAGE
  Future<void> changeLanguage(
    BuildContext context, {
    required String articleId,
    required String languageId,
  }) async {
    await loadArticleDetail(
      context,
      articleId: articleId,
      languageId: languageId,
    );
  }
}
// import 'package:flutter/material.dart';
// import 'package:merckfoundation_252026/model/ArticleModel.dart';
// import 'package:merckfoundation_252026/service/ArticleService.dart';
// class  ArticleProvider extends ChangeNotifier {
//   final ArticleService _service = ArticleService();

//   List<ArticleModel> articleList = [];
//   int currentPage = 1;
//   bool isLoading = false;
//   bool hasMore = true;
//   bool isDetailLoading = false;
//  ArticleModel? articleDetail;
//   Future<void> loadInitial(BuildContext context) async {
//     if (isLoading) return;

//     isLoading = true;
//     notifyListeners();

//     final response = await _service.fetchArticle(context, 1);

//     articleList = (response['data'] as List)
//         .map((e) => ArticleModel.fromJson(e))
//         .toList();

//     currentPage = 1;
//     hasMore = response['next'] != null;

//     isLoading = false;
//     notifyListeners();
//   }

//   Future<void> loadMore(BuildContext context) async {
//     if (!hasMore || isLoading) return;

//     isLoading = true;
//     notifyListeners();

//     final nextPage = currentPage + 1;

//     final response = await _service.fetchArticle(context, nextPage);

//     final newList = (response['data'] as List)
//         .map((e) => ArticleModel.fromJson(e))
//         .toList();

//     articleList.addAll(newList);
//     currentPage = nextPage;
//     hasMore = response['next'] != null;

//     isLoading = false;
//     notifyListeners();
//   }

//   /// DETAIL API
//   Future<void> loadArticleDetail(
//     BuildContext context, {
//     required String articleId,
//     required String languageId,
//   }) async {

//     isDetailLoading = true;

//     notifyListeners();
// final response = await _service.fetchArticleDetail(
//   context,
//   articleId: articleId,
//   languageId: languageId,
// );

// if (response == null) {

//   isDetailLoading = false;

//   notifyListeners();

//   return;
// }

//     articleDetail = ArticleModel.fromJson(response['data']);

//     isDetailLoading = false;

//     notifyListeners();
//   }
// }
