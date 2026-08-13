
import 'package:flutter/material.dart';
import 'package:merckfoundation_252026/Utility/api_status.dart';
import 'package:merckfoundation_252026/CommonUtils/common_strings.dart';
import 'package:merckfoundation_252026/model/ArticleModel.dart';
import 'package:merckfoundation_252026/service/ArticleService.dart';

class ArticleProvider extends ChangeNotifier {
  final ArticleService _service = ArticleService();
List<ArticleModel> _allLocalArticles = [];

bool useLocalPagination = false;

final int localPageSize = 10;
  ApiStatus status = ApiStatus.initial;
  ApiStatus detailStatus = ApiStatus.initial;

  String errorMessage = "";

  List<ArticleModel> articleList = [];
  ArticleModel? articleDetail;

  int currentPage = 1;
  bool hasMore = true;
  bool isLoading = false;
  bool isDetailLoading = false;

  String selectedLanguageId = "10";
void loadLocalArticles(
  List<ArticleModel> articles,
) {
  useLocalPagination = true;

  _allLocalArticles = articles;

  articleList = [];

  currentPage = 1;

  hasMore = true;

  status = ApiStatus.success;

  loadMoreLocal();
}
void loadMoreLocal() {
  if (!hasMore || isLoading) return;

  isLoading = true;
  notifyListeners();

  final start = articleList.length;

  final end =
      (start + localPageSize) >
              _allLocalArticles.length
          ? _allLocalArticles.length
          : start + localPageSize;

  final newItems =
      _allLocalArticles.sublist(
    start,
    end,
  );

  articleList.addAll(newItems);

  hasMore =
      articleList.length <
      _allLocalArticles.length;

  isLoading = false;

  notifyListeners();
}
  /// =========================
  /// LIST API
  /// =========================
  Future<void> loadInitial(BuildContext context) async {
    if (useLocalPagination) return;
    isLoading = true;
    status = ApiStatus.loading;
    notifyListeners();

    try {
      final result = await _service.fetchArticle(context, 1);

      status = result.status;

      if (result.isSuccess) {
        final response = result.data;

        articleList = (response['data'] as List)
            .map((e) => ArticleModel.fromJson(e))
            .toList();

        currentPage = 1;
        hasMore = response['next'] != null;
      } else {
        status = ApiStatus.error;
        errorMessage = result.message ?? "";
      }
    } catch (e) {
      status = ApiStatus.noInternet;
      errorMessage = CommonStrings.noInternetConnection;
    }

    isLoading = false;
    notifyListeners();
  }

  /// =========================
  /// DETAIL API
  /// =========================
  Future<void> loadArticleDetail(
    BuildContext context, {
    required String articleId,
    required String languageId,
  }) async {
    isDetailLoading = true;
    detailStatus = ApiStatus.loading;
    notifyListeners();
 print("loadArticleDetail 2");
    try {
      final result = await _service.fetchArticleDetail(
        context,
        articleId: articleId,
        languageId: languageId,
      );
 print("loadArticleDetail 3");
      detailStatus = result.status;
 print("loadArticleDetail ${detailStatus}");
      if (result.isSuccess) {
        final response = result.data;

        articleDetail = ArticleModel.fromJson(response['data']);
        selectedLanguageId = articleDetail?.language_id ?? "";
         print("availabe labguage");
      print(articleDetail!.availableLanguages!.length);
      } else {
        detailStatus = ApiStatus.error;
        errorMessage = result.message ?? "";
         print("loadArticleDetail 4");
      }
    } catch (e) {
      detailStatus = ApiStatus.noInternet;
      errorMessage =  CommonStrings.noInternetConnection;
       print("loadArticleDetail 5 ${e.toString()}");
    }

    isDetailLoading = false;
    notifyListeners();
  }

  Future<void> retryDetail(
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

  Future<void> retryInitial(BuildContext context) async {
    await loadInitial(context);
  }

  /// =========================
  /// LOAD MORE
  /// =========================
  Future<void> loadMore(BuildContext context) async {

 /// LOCAL PAGINATION
  if (useLocalPagination) {
    loadMoreLocal();
    return;
  }

    if (!hasMore || isLoading) return;

    isLoading = true;
    notifyListeners();

    final nextPage = currentPage + 1;

    final result = await _service.fetchArticle(context, nextPage);

    if (result.isSuccess) {
      final response = result.data;

      final newList = (response['data'] as List)
          .map((e) => ArticleModel.fromJson(e))
          .toList();
         
      articleList.addAll(newList);

      currentPage = nextPage;
      hasMore = response['next'] != null;
    } else {
      errorMessage = result.message ?? "";
      status = ApiStatus.error;
    }

    isLoading = false;
    notifyListeners();
  }
}