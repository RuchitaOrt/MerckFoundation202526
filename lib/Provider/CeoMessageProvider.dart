import 'package:flutter/material.dart';
import 'package:merckfoundation_252026/Utility/api_status.dart';
import 'package:merckfoundation_252026/CommonUtils/common_strings.dart';
import 'package:merckfoundation_252026/model/ArticleModel.dart';
import 'package:merckfoundation_252026/service/CeoMessageService.dart';

class CeoMessageProvider extends ChangeNotifier {

  final CeoMessageService _service =
      CeoMessageService();

  ApiStatus status = ApiStatus.initial;

  String errorMessage = "";

  List<ArticleModel> ceoMessageList = [];

  int currentPage = 1;

  bool hasMore = true;

  bool isLoading = false;

  /// =========================
  /// INITIAL LOAD
  /// =========================

  Future<void> loadInitial(
    BuildContext context,
  ) async {

    isLoading = true;

    status = ApiStatus.loading;

    notifyListeners();

    try {

      final result =
          await _service.fetchCeoMessages(
        context,
        1,
      );

      status = result.status;

      if (result.isSuccess) {

        final response = result.data;

        ceoMessageList =
            (response['data'] as List)
                .map(
                  (e) => ArticleModel.fromJson(e),
                )
                .toList();

        currentPage = 1;

        hasMore =
            response['next'] != null;

      } else {

        status = ApiStatus.error;

        errorMessage =
            result.message ?? "";
      }

    } catch (e) {

      status = ApiStatus.noInternet;

      errorMessage =
        CommonStrings.noInternetConnection;
    }

    isLoading = false;

    notifyListeners();
  }

  /// =========================
  /// RETRY
  /// =========================

  Future<void> retryInitial(
    BuildContext context,
  ) async {

    await loadInitial(context);
  }

  /// =========================
  /// LOAD MORE
  /// =========================

  Future<void> loadMore(
    BuildContext context,
  ) async {

    if (!hasMore || isLoading) return;

    isLoading = true;

    notifyListeners();

    final nextPage =
        currentPage + 1;

    try {

      final result =
          await _service.fetchCeoMessages(
        context,
        nextPage,
      );

      if (result.isSuccess) {

        final response = result.data;

        final newList =
            (response['data'] as List)
                .map(
                  (e) => ArticleModel.fromJson(e),
                )
                .toList();

        ceoMessageList.addAll(newList);

        currentPage = nextPage;

        hasMore =
            response['next'] != null;

      } else {

        status = ApiStatus.error;

        errorMessage =
            result.message ?? "";
      }

    } catch (e) {

      status = ApiStatus.noInternet;

      errorMessage =
         CommonStrings.noInternetConnection;
    }

    isLoading = false;

    notifyListeners();
  }
}