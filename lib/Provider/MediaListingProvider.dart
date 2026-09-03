
import 'package:flutter/material.dart';

import 'package:merckfoundation_252026/Utility/api_status.dart';

import 'package:merckfoundation_252026/enum/commonEnum.dart';

import 'package:merckfoundation_252026/model/StoryModel.dart';

import 'package:merckfoundation_252026/service/MediaListiingService.dart';

class MediaListingProvider
    extends ChangeNotifier {
List<StoryModel> _allLocalData = [];

int _currentPage = 1;
final int _pageSize = 10;
// void setLocalData(List<StoryModel> data) {
//   useLocalPagination = true;

//   _allLocalData = data;

//   storyList.clear();

//   _currentPage = 1;

//   hasMore = true;

//   _loadNextLocalPage();
// }
void setLocalData(List<StoryModel> data) {

  useLocalPagination = true;

  _allLocalData = data;

  storyList.clear();

  _currentPage = 1;

  hasMore = true;

  /// first chunk instantly
  final initialItems = _allLocalData.take(_pageSize).toList();

  storyList.addAll(initialItems);

  _currentPage = 2;

  hasMore = storyList.length < _allLocalData.length;

  notifyListeners();
}
Future<void> _loadNextLocalPage() async {

  if (isLoading) return;

  isLoading = true;

  notifyListeners();

  /// simulate pagination loader
  await Future.delayed(const Duration(milliseconds: 800));

  final start = (_currentPage - 1) * _pageSize;

  final end = start + _pageSize;

  if (start >= _allLocalData.length) {

    hasMore = false;

    isLoading = false;

    notifyListeners();

    return;
  }

  final newItems = _allLocalData.sublist(
    start,
    end > _allLocalData.length
        ? _allLocalData.length
        : end,
  );

  storyList.addAll(newItems);

  _currentPage++;

  hasMore = storyList.length < _allLocalData.length;

  isLoading = false;

  notifyListeners();
}
// void _loadNextLocalPage() {
//   final start = (_currentPage - 1) * _pageSize;
//   final end = start + _pageSize;

//   if (start >= _allLocalData.length) {
//     hasMore = false;
//     notifyListeners();
//     return;
//   }

//   final newItems = _allLocalData.sublist(
//     start,
//     end > _allLocalData.length
//         ? _allLocalData.length
//         : end,
//   );

//   storyList.addAll(newItems);

//   _currentPage++;

//   hasMore = storyList.length < _allLocalData.length;

//   notifyListeners();
// }
  final MediaListingService _service =
      MediaListingService();

  List<StoryModel> storyList = [];

  int currentPage = 1;

  bool isLoading = false;

  bool hasMore = true;

  ApiStatus status =
      ApiStatus.initial;

  String errorMessage = "";

  /// STORE FILTERS
  MediaType? currentType;

  String countryId = "";

  String categoryId = "";

  String languageId = "";

  String albumID = "";

  /// INITIAL LOAD
  Future<void> loadInitial({
  required BuildContext context,
  required MediaType type,
  String countryId = "",
  String categoryId = "",
  String languageId = "",
  String albumID = "",
}) async {

  if (isLoading) return;

  currentType = type;

  this.countryId = countryId;

  this.categoryId = categoryId;

  this.languageId = languageId;

  this.albumID = albumID;

  currentPage = 1;

  storyList.clear();

  hasMore = true;

  isLoading = true;

  status = ApiStatus.loading;

  errorMessage = "";

  notifyListeners();

  final result =
      await _service.fetchMedia(
    context,
    currentPage,
    type,
    countryId: countryId,
    categoryId: categoryId,
    languageId: languageId,
    albumID: albumID,
  );

  status = result.status;

  if (status == ApiStatus.success) {

    final response =
        result.data ?? {};

    // final data =
    //     response['data'] ?? [];

    // storyList = data
    //     .map<StoryModel>(
    //       (e) =>
    //           StoryModel.fromJson(e),
    //     )
    //     .toList();

    // hasMore = type ==
    //         MediaType.photoGallery
    //     ? false
    //     : response['next'] != null;
final rawData = response['data'];

if (rawData is List) {
  storyList = rawData
      .map<StoryModel>(
        (e) => StoryModel.fromJson(e),
      )
      .toList();
} else {
  storyList = [];
}

hasMore = type == MediaType.photoGallery
    ? false
    : response['next'] != null;

  } 
  else {

    errorMessage =
        result.message ?? "";
  }

  isLoading = false;

  notifyListeners();
}
 
  /// PAGINAT
  bool useLocalPagination = false;
  Future<void> loadMore(
    BuildContext context,
  ) async {

      if (useLocalPagination) {
    _loadNextLocalPage();
    return;
  }

    if (!hasMore ||
        isLoading ||
        currentType == null) {
      return;
    }

    isLoading = true;

    notifyListeners();

    final nextPage =
        currentPage + 1;

    final result =
        await _service.fetchMedia(
      context,
      nextPage,
      currentType!,
      countryId: countryId,
      categoryId: categoryId,
      languageId: languageId,
      albumID: albumID,
    );

    /// IMPORTANT
    /// DON'T CHANGE STATUS
    /// DURING PAGINATION

    if (result.isSuccess) {

      final response =
          result.data ?? {};

      final data =
          response['data'] ?? [];

      storyList.addAll(
        data
            .map<StoryModel>(
              (e) =>
                  StoryModel.fromJson(e),
            )
            .toList(),
      );

      currentPage = nextPage;

      hasMore =
          response['next'] != null;
    }

    isLoading = false;

    notifyListeners();
  }

  /// RETRY
  Future<void> retry(
    BuildContext context,
  ) async {

    if (currentType == null) return;

    await loadInitial(
      context: context,
      type: currentType!,
      countryId: countryId,
      categoryId: categoryId,
      languageId: languageId,
      albumID: albumID,
    );
  }



}