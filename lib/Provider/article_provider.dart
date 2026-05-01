import 'package:flutter/material.dart';
import 'package:merckfoundation_252026/data/model/CommonModel.dart';
import 'package:merckfoundation_252026/model/ArticleModel.dart';
import 'package:merckfoundation_252026/service/ArticleService.dart';
class  ArticleProvider extends ChangeNotifier {
  final ArticleService _service = ArticleService();

  List<ArticleModel> articleList = [];
  int currentPage = 1;
  bool isLoading = false;
  bool hasMore = true;

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
}
