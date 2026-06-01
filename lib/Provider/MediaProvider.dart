
import 'package:flutter/material.dart';

import 'package:merckfoundation_252026/Utility/api_status.dart';

import 'package:merckfoundation_252026/model/MediaModel.dart';

import 'package:merckfoundation_252026/service/MediaService.dart';

class MediaProvider
    extends ChangeNotifier {

  final MediaService _service =
      MediaService();

  /// =========================
  /// API STATUS
  /// =========================

  ApiStatus status =
      ApiStatus.initial;

  String errorMessage = "";

  /// =========================
  /// DATA
  /// =========================

  List<MediaModel> mediaList = [];

  int currentPage = 1;

  bool isLoading = false;

  bool hasMore = true;

  /// =========================
  /// INITIAL LOAD
  /// =========================

  Future<void> loadInitial(
    BuildContext context,
  ) async {

    if (isLoading) return;

    isLoading = true;

    status = ApiStatus.loading;

    notifyListeners();

    final result =
        await _service.fetchMedia(
      context,
      1,
    );

    status = result.status;

    if (result.isSuccess) {

      final response = result.data;

      mediaList =
          (response['data'] as List)
              .map(
                (e) =>
                    MediaModel.fromJson(
                  e,
                ),
              )
              .toList();

      currentPage = 1;

      hasMore =
          response['next'] != null;

    } else {

      errorMessage =
          result.message ?? "";
    }

    isLoading = false;

    notifyListeners();
  }

  /// =========================
  /// LOAD MORE
  /// =========================

  Future<void> loadMore(
    BuildContext context,
  ) async {

    if (!hasMore ||
        isLoading) return;

    isLoading = true;

    notifyListeners();

    final nextPage =
        currentPage + 1;

    final result =
        await _service.fetchMedia(
      context,
      nextPage,
    );

    /// IMPORTANT
    /// DO NOT CHANGE STATUS
    /// during pagination
    /// otherwise full UI changes

    if (result.isSuccess) {

      final response = result.data;

      final newList =
          (response['data'] as List)
              .map(
                (e) =>
                    MediaModel.fromJson(
                  e,
                ),
              )
              .toList();

      mediaList.addAll(newList);

      currentPage = nextPage;

      hasMore =
          response['next'] != null;

    } else {

      errorMessage =
          result.message ?? "";
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
}