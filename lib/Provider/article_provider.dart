// import 'package:flutter/material.dart';
// import 'package:merckfoundation_252026/Utility/api_status.dart';
// import 'package:merckfoundation_252026/model/ArticleModel.dart';
// import 'package:merckfoundation_252026/service/ArticleService.dart';

// class ArticleProvider extends ChangeNotifier {
//   final ArticleService _service = ArticleService();

//   /// =========================
//   /// STATES
//   /// =========================
//   ApiStatus status = ApiStatus.initial;
//   ApiStatus detailStatus = ApiStatus.initial;

//   String errorMessage = "";

//   /// =========================
//   /// LIST
//   /// =========================
//   List<ArticleModel> articleList = [];
//   int currentPage = 1;
//   bool hasMore = true;
//   bool isLoading = false;

//   /// =========================
//   /// DETAIL
//   /// =========================
//   ArticleModel? articleDetail;
//   bool isDetailLoading = false;

//   String selectedLanguageId = "10";

//   /// =========================
//   /// LIST API (AWARD STYLE)
//   /// =========================
//   Future<void> loadInitial(BuildContext context) async {
//     isLoading = true;
//     status = ApiStatus.loading;
//     notifyListeners();

//     try {
//       final result = await _service.fetchArticle(context, 1);

//       status = result.status;

// if (result.status == ApiStatus.noInternet) {
//   status = ApiStatus.noInternet;
// } else if (!result.isSuccess) {
//   status = ApiStatus.error;
// }
//       if (result.isSuccess) {
//         final response = result.data;

//         articleList = (response['data'] as List)
//             .map((e) => ArticleModel.fromJson(e))
//             .toList();

//         currentPage = 1;
//         hasMore = response['next'] != null;
//       } else {
//         errorMessage = result.message ?? "";
//       }
//     } catch (e) {
//       status = ApiStatus.noInternet;
//       errorMessage = "No Internet Connection";
//     }

//     isLoading = false;
//     notifyListeners();
//   }

//   /// =========================
//   /// DETAIL API (AWARD STYLE)
//   /// =========================
//   Future<void> loadArticleDetail(
//     BuildContext context, {
//     required String articleId,
//     required String languageId,
//   }) async {
//     isDetailLoading = true;
//     detailStatus = ApiStatus.loading;
//     notifyListeners();

//     try {
//       final result = await _service.fetchArticleDetail(
//         context,
//         articleId: articleId,
//         languageId: languageId,
//       );

//       // detailStatus = result.status;
// detailStatus = result.status;

// if (result.status == ApiStatus.noInternet) {
//   detailStatus = ApiStatus.noInternet;
// } else if (!result.isSuccess) {
//   detailStatus = ApiStatus.error;
// }
//       if (result.isSuccess) {
//         final response = result.data;

//         articleDetail = ArticleModel.fromJson(response['data']);

//         selectedLanguageId = articleDetail?.language_id ?? "";
//       } else {
//         errorMessage = result.message ?? "";
//         detailStatus = ApiStatus.error;
//       }
//     } catch (e) {
//       detailStatus = ApiStatus.noInternet;
//       errorMessage = "No Internet Connection";
//     }

//     isDetailLoading = false;
//     notifyListeners();
//   }

//   Future<void> retryDetail(
//     BuildContext context, {
//     required String articleId,
//     required String languageId,
//   }) async {
//     await loadArticleDetail(
//       context,
//       articleId: articleId,
//       languageId: languageId,
//     );
//   }


//   Future<void> loadMore(
//     BuildContext context,
//   ) async {

//     if (!hasMore || isLoading) return;

//     isLoading = true;

//     notifyListeners();

//     final nextPage =
//         currentPage + 1;

//     final result =
//         await _service.fetchArticle(
//       context,
//       nextPage,
//     );

//     if (result.isSuccess) {

//       final response = result.data;

//       final newList =
//           (response['data'] as List)
//               .map(
//                 (e) =>
//                     ArticleModel.fromJson(e),
//               )
//               .toList();

//       articleList.addAll(newList);

//       currentPage = nextPage;

//       hasMore =
//           response['next'] != null;

//     } else {

//       errorMessage =
//           result.message ?? "";
//     }

//     isLoading = false;

//     notifyListeners();
//   }

//     Future<void> retryInitial(
//     BuildContext context,
//   ) async {

//     await loadInitial(context);
//   }

// }
// // import 'package:flutter/material.dart';
// // import 'package:merckfoundation_252026/Utility/api_status.dart';

// // import 'package:merckfoundation_252026/model/ArticleModel.dart';
// // import 'package:merckfoundation_252026/service/ArticleService.dart';

// // class ArticleProvider extends ChangeNotifier {

// //   final ArticleService _service =
// //       ArticleService();

// //   /// =========================
// //   /// STATUS
// //   /// =========================

// //   ApiStatus status =
// //       ApiStatus.initial;

// //   ApiStatus detailStatus =
// //       ApiStatus.initial;

// //   String errorMessage = "";

// //   /// =========================
// //   /// ARTICLE LIST
// //   /// =========================

// //   List<ArticleModel> articleList = [];

// //   int currentPage = 1;

// //   bool isLoading = false;

// //   bool hasMore = true;

// //   /// =========================
// //   /// ARTICLE DETAIL
// //   /// =========================

// //   bool isDetailLoading = false;

// //   ArticleModel? articleDetail;

// //   /// =========================
// //   /// LANGUAGE
// //   /// =========================

// //   String selectedLanguageId = "10";

// //   List<dynamic> availableLanguages = [];

// //   /// =========================
// //   /// INITIAL LOAD
// //   /// =========================

// //   Future<void> loadInitial(
// //     BuildContext context,
// //   ) async {

// //     if (isLoading) return;

// //     isLoading = true;

// //     status = ApiStatus.loading;

// //     notifyListeners();

// //     final result =
// //         await _service.fetchArticle(
// //       context,
// //       1,
// //     );

// //     status = result.status;

// //     if (result.isSuccess) {

// //       final response = result.data;

// //       articleList =
// //           (response['data'] as List)
// //               .map(
// //                 (e) =>
// //                     ArticleModel.fromJson(e),
// //               )
// //               .toList();

// //       currentPage = 1;

// //       hasMore =
// //           response['next'] != null;

// //     } else {

// //       errorMessage =
// //           result.message ?? "";
// //     }

// //     isLoading = false;

// //     notifyListeners();
// //   }

// //   /// =========================
// //   /// LOAD MORE
// //   /// =========================

// //   Future<void> loadMore(
// //     BuildContext context,
// //   ) async {

// //     if (!hasMore || isLoading) return;

// //     isLoading = true;

// //     notifyListeners();

// //     final nextPage =
// //         currentPage + 1;

// //     final result =
// //         await _service.fetchArticle(
// //       context,
// //       nextPage,
// //     );

// //     if (result.isSuccess) {

// //       final response = result.data;

// //       final newList =
// //           (response['data'] as List)
// //               .map(
// //                 (e) =>
// //                     ArticleModel.fromJson(e),
// //               )
// //               .toList();

// //       articleList.addAll(newList);

// //       currentPage = nextPage;

// //       hasMore =
// //           response['next'] != null;

// //     } else {

// //       errorMessage =
// //           result.message ?? "";
// //     }

// //     isLoading = false;

// //     notifyListeners();
// //   }

// //   /// =========================
// //   /// ARTICLE DETAIL
// //   /// =========================

// //   Future<void> loadArticleDetail(
// //     BuildContext context, {
// //     required String articleId,
// //     required String languageId,
// //   }) async {

// //     isDetailLoading = true;

// //     detailStatus =
// //         ApiStatus.loading;

// //     notifyListeners();

// //     final result =
// //         await _service
// //             .fetchArticleDetail(
// //       context,
// //       articleId: articleId,
// //       languageId: languageId,
// //     );

// //     detailStatus = result.status;

// //     if (result.isSuccess) {

// //       final response = result.data;

// //       articleDetail =
// //           ArticleModel.fromJson(
// //         response['data'],
// //       );

// //       selectedLanguageId =
// //           articleDetail?.language_id ??
// //               "";

// //     } else {

// //       errorMessage =
// //           result.message ?? "";
// //     }

// //     isDetailLoading = false;

// //     notifyListeners();
// //   }

// //   /// =========================
// //   /// CHANGE LANGUAGE
// //   /// =========================

// //   Future<void> changeLanguage(
// //     BuildContext context, {
// //     required String articleId,
// //     required String languageId,
// //   }) async {

// //     await loadArticleDetail(
// //       context,
// //       articleId: articleId,
// //       languageId: languageId,
// //     );
// //   }

// //   /// =========================
// //   /// RETRY METHODS
// //   /// =========================

// //   Future<void> retryInitial(
// //     BuildContext context,
// //   ) async {

// //     await loadInitial(context);
// //   }

// //   Future<void> retryDetail(
// //     BuildContext context, {
// //     required String articleId,
// //     required String languageId,
// //   }) async {

// //     await loadArticleDetail(
// //       context,
// //       articleId: articleId,
// //       languageId: languageId,
// //     );
// //   }
// // }
// // // import 'package:flutter/material.dart';
// // // import 'package:merckfoundation_252026/model/ArticleModel.dart';
// // // import 'package:merckfoundation_252026/service/ArticleService.dart';

// // // class ArticleProvider extends ChangeNotifier {
// // //   final ArticleService _service = ArticleService();

// // //   List<ArticleModel> articleList = [];

// // //   int currentPage = 1;

// // //   bool isLoading = false;

// // //   bool hasMore = true;

// // //   bool isDetailLoading = false;

// // //   ArticleModel? articleDetail;

// // //   /// ✅ CURRENT SELECTED LANGUAGE
// // //   String selectedLanguageId = "10";

// // //   /// ✅ AVAILABLE LANGUAGES
// // //   List<dynamic> availableLanguages = [];

// // //   Future<void> loadInitial(BuildContext context) async {
// // //     if (isLoading) return;

// // //     isLoading = true;

// // //     notifyListeners();

// // //     final response = await _service.fetchArticle(context, 1);

// // //     articleList = (response['data'] as List)
// // //         .map((e) => ArticleModel.fromJson(e))
// // //         .toList();

// // //     currentPage = 1;

// // //     hasMore = response['next'] != null;

// // //     isLoading = false;

// // //     notifyListeners();
// // //   }

// // //   Future<void> loadMore(BuildContext context) async {
// // //     if (!hasMore || isLoading) return;

// // //     isLoading = true;

// // //     notifyListeners();

// // //     final nextPage = currentPage + 1;

// // //     final response = await _service.fetchArticle(context, nextPage);

// // //     final newList = (response['data'] as List)
// // //         .map((e) => ArticleModel.fromJson(e))
// // //         .toList();

// // //     articleList.addAll(newList);

// // //     currentPage = nextPage;

// // //     hasMore = response['next'] != null;

// // //     isLoading = false;

// // //     notifyListeners();
// // //   }

// // //   /// ✅ DETAIL API
// // //   // String selectedLanguageId = "";

// // //   Future<void> loadArticleDetail(
// // //     BuildContext context, {
// // //     required String articleId,
// // //     required String languageId,
// // //   }) async {
// // //     try {
// // //       isDetailLoading = true;

// // //       notifyListeners();

// // //       final response = await _service.fetchArticleDetail(
// // //         context,
// // //         articleId: articleId,
// // //         languageId: languageId,
// // //       );

// // //       if (response == null) {
// // //         isDetailLoading = false;

// // //         notifyListeners();

// // //         return;
// // //       }

// // //       articleDetail = ArticleModel.fromJson(response['data']);

// // //       selectedLanguageId = articleDetail?.language_id ?? "";
// // //     } catch (e) {
// // //       debugPrint("DETAIL ERROR $e");
// // //     }

// // //     isDetailLoading = false;

// // //     notifyListeners();
// // //   }

// // //   /// ✅ CHANGE LANGUAGE
// // //   Future<void> changeLanguage(
// // //     BuildContext context, {
// // //     required String articleId,
// // //     required String languageId,
// // //   }) async {
// // //     await loadArticleDetail(
// // //       context,
// // //       articleId: articleId,
// // //       languageId: languageId,
// // //     );
// // //   }
// // // }
import 'package:flutter/material.dart';
import 'package:merckfoundation_252026/Utility/api_status.dart';
import 'package:merckfoundation_252026/model/ArticleModel.dart';
import 'package:merckfoundation_252026/service/ArticleService.dart';

class ArticleProvider extends ChangeNotifier {
  final ArticleService _service = ArticleService();

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

  /// =========================
  /// LIST API
  /// =========================
  Future<void> loadInitial(BuildContext context) async {
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
      errorMessage = "No Internet Connection";
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

    try {
      final result = await _service.fetchArticleDetail(
        context,
        articleId: articleId,
        languageId: languageId,
      );

      detailStatus = result.status;

      if (result.isSuccess) {
        final response = result.data;

        articleDetail = ArticleModel.fromJson(response['data']);
        selectedLanguageId = articleDetail?.language_id ?? "";
      } else {
        detailStatus = ApiStatus.error;
        errorMessage = result.message ?? "";
      }
    } catch (e) {
      detailStatus = ApiStatus.noInternet;
      errorMessage = "No Internet Connection";
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