import 'package:flutter/material.dart';
import 'package:merckfoundation_252026/enum/commonEnum.dart';
import 'package:merckfoundation_252026/model/StoryModel.dart';

import 'package:merckfoundation_252026/service/MediaListiingService.dart';
import 'package:flutter/material.dart';
import 'package:merckfoundation_252026/model/StoryModel.dart';
import 'package:merckfoundation_252026/service/MediaListiingService.dart';
import '../enum/commonEnum.dart';

class MediaListingProvider extends ChangeNotifier {
  final MediaListingService _service = MediaListingService();

  List<StoryModel> storyList = [];

  int currentPage = 1;
  bool isLoading = false;
  bool hasMore = true;

  /// 🔥 STORE FILTERS HERE
  MediaType? currentType;
  String countryId = "";
  String categoryId = "";

  /// 🔹 INITIAL LOAD
  Future<void> loadInitial({
    required BuildContext context,
    required MediaType type,
    String countryId = "",
    String categoryId = "",
  }) async {
    if (isLoading) return;

    currentType = type;
    this.countryId = countryId;
    this.categoryId = categoryId;

    currentPage = 1;
    storyList.clear();
    hasMore = true;

    isLoading = true;
    notifyListeners();

    final response = await _service.fetchMedia(
      context,
      currentPage,
      type,
      countryId: countryId,
      categoryId: categoryId,
    );

    final data = response['data'] ?? [];

    storyList = data
        .map<StoryModel>((e) => StoryModel.fromJson(e))
        .toList();

    hasMore = response['next'] != null;

    isLoading = false;
    notifyListeners();
  }

  /// 🔹 PAGINATION
  Future<void> loadMore(BuildContext context) async {
    if (!hasMore || isLoading || currentType == null) return;

    isLoading = true;
    notifyListeners();

    final nextPage = currentPage + 1;

    final response = await _service.fetchMedia(
      context,
      nextPage,
      currentType!,
      countryId: countryId,
      categoryId: categoryId,
    );

    final data = response['data'] ?? [];

    storyList.addAll(
      data.map<StoryModel>((e) => StoryModel.fromJson(e)).toList(),
    );

    currentPage = nextPage;
    hasMore = response['next'] != null;

    isLoading = false;
    notifyListeners();
  }
}