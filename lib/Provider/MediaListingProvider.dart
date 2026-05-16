// import 'package:flutter/material.dart';
// import 'package:merckfoundation_252026/Utility/showdailog.dart';
// import 'package:merckfoundation_252026/enum/commonEnum.dart';
// import 'package:merckfoundation_252026/model/StoryModel.dart';

// import 'package:merckfoundation_252026/service/MediaListiingService.dart';

// class MediaListingProvider extends ChangeNotifier {
//   final MediaListingService _service = MediaListingService();

//   List<StoryModel> storyList = [];

//   int currentPage = 1;
//   bool isLoading = false;
//   bool hasMore = true;

//   /// 🔥 STORE FILTERS HERE
//   MediaType? currentType;
//   String countryId = "";
//   String categoryId = "";
//   String languageId = "";
// String albumID = "";
//   /// 🔹 INITIAL LOAD
//   Future<void> loadInitial({
//     required BuildContext context,
//     required MediaType type,
//     String countryId = "",
//     String categoryId = "",
//     String languageId = "",
//     String albumID = "",
//   }) async {
//     if (isLoading) return;

//     currentType = type;
//     this.countryId = countryId;
//     this.categoryId = categoryId;

//     currentPage = 1;
//     storyList.clear();
//     hasMore = true;

//     isLoading = true;
//     notifyListeners();

//     try {
//       final response = await _service.fetchMedia(
//         context,
//         currentPage,
//         type,
//         countryId: countryId,
//         categoryId: categoryId,
//         languageId: languageId,
//         albumID: albumID,
//       );

//       final data = response['data'] ?? [];

//       storyList = data.map<StoryModel>((e) => StoryModel.fromJson(e)).toList();

//       hasMore = type == MediaType.photoGallery
//     ? false
//     : response['next'] != null;
//     } catch (e) {
//       debugPrint("Initial Load Error: $e");

//       /// ✅ SHOW ERROR TO USER
//       showToast(e.toString());
//     } finally {
//       isLoading = false;
//       notifyListeners();
//     }
//   }

//   /// 🔹 PAGINATION
//   Future<void> loadMore(BuildContext context) async {
//     if (!hasMore || isLoading || currentType == null) return;

//     isLoading = true;
//     notifyListeners();

//     try {
//       final nextPage = currentPage + 1;

//       final response = await _service.fetchMedia(
//         context,
//         nextPage,
//         currentType!,
//         countryId: countryId,
//         categoryId: categoryId,
//         languageId: languageId,
//         albumID: albumID,
//       );

//       final data = response['data'] ?? [];

//       storyList.addAll(
//         data.map<StoryModel>((e) => StoryModel.fromJson(e)).toList(),
//       );

//       currentPage = nextPage;
//       hasMore = response['next'] != null;
//     } catch (e) {
//       debugPrint("Load More Error: $e");

//       /// ✅ SHOW ERROR
//       showToast(e.toString());
//     } finally {
//       isLoading = false;
//       notifyListeners();
//     }
//   }
// }
import 'package:flutter/material.dart';

import 'package:merckfoundation_252026/Utility/api_status.dart';

import 'package:merckfoundation_252026/enum/commonEnum.dart';

import 'package:merckfoundation_252026/model/StoryModel.dart';

import 'package:merckfoundation_252026/service/MediaListiingService.dart';

class MediaListingProvider
    extends ChangeNotifier {

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

    final data =
        response['data'] ?? [];

    storyList = data
        .map<StoryModel>(
          (e) =>
              StoryModel.fromJson(e),
        )
        .toList();

    hasMore = type ==
            MediaType.photoGallery
        ? false
        : response['next'] != null;

  } else {

    errorMessage =
        result.message ?? "";
  }

  isLoading = false;

  notifyListeners();
}
  // Future<void> loadInitial({
  //   required BuildContext context,
  //   required MediaType type,
  //   String countryId = "",
  //   String categoryId = "",
  //   String languageId = "",
  //   String albumID = "",
  // }) async {

  //   if (isLoading) return;

  //   currentType = type;

  //   this.countryId = countryId;

  //   this.categoryId = categoryId;

  //   this.languageId = languageId;

  //   this.albumID = albumID;

  //   currentPage = 1;

  //   storyList.clear();

  //   hasMore = true;

  //   isLoading = true;

  //   status = ApiStatus.loading;

  //   notifyListeners();

  //   final result =
  //       await _service.fetchMedia(
  //     context,
  //     currentPage,
  //     type,
  //     countryId: countryId,
  //     categoryId: categoryId,
  //     languageId: languageId,
  //     albumID: albumID,
  //   );

  //   status = result.status;

  //   if (result.isSuccess) {

  //     final response =
  //         result.data ?? {};

  //     final data =
  //         response['data'] ?? [];

  //     storyList = data
  //         .map<StoryModel>(
  //           (e) =>
  //               StoryModel.fromJson(e),
  //         )
  //         .toList();

  //     hasMore = type ==
  //             MediaType.photoGallery
  //         ? false
  //         : response['next'] != null;

  //   } else {

  //     errorMessage =
  //         result.message ?? "";
  //   }

  //   isLoading = false;

  //   notifyListeners();
  // }

  /// PAGINATION
  Future<void> loadMore(
    BuildContext context,
  ) async {

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