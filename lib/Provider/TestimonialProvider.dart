
// import 'package:flutter/material.dart';
// import 'package:merckfoundation_252026/Utility/api_status.dart';
// import 'package:merckfoundation_252026/model/TestimonialModel.dart';
// import 'package:merckfoundation_252026/service/TestimonialService.dart';

// class TestimonialArticleProvider extends ChangeNotifier {
//   final TestimonialService _service = TestimonialService();

//   ApiStatus status = ApiStatus.initial;
//   String errorMessage = "";
//   bool isLoading = false;

//   List<TestimonialModel> testimonials = [];

//   Future<void> fetchTestimonials(
//     BuildContext context,
//     String categoryId,
//   ) async {

//     isLoading = true;
//     status = ApiStatus.loading;
//     notifyListeners();

//     final result =
//         await _service.fetchTestimonials(context, categoryId);

//     status = result.status;

//     if (result.isSuccess) {
//       testimonials = result.data ?? [];
//       errorMessage = "";
//     } else {
//       testimonials = [];
//       errorMessage = result.message ?? "";
//     }

//     isLoading = false;
//     notifyListeners();
//   }

//   Future<void> retry(BuildContext context) async {
//     await fetchTestimonials(context, "");
//   }
// }

import 'package:flutter/material.dart';
import 'package:merckfoundation_252026/Utility/api_status.dart';
import 'package:merckfoundation_252026/model/TestimonialModel.dart';
import 'package:merckfoundation_252026/service/TestimonialService.dart';

class TestimonialArticleProvider extends ChangeNotifier {
  final TestimonialService _service = TestimonialService();

  ApiStatus status = ApiStatus.initial;

  String errorMessage = "";

  bool isLoading = false;

  /// API / UI LIST
  List<TestimonialModel> testimonials = [];

  /// LOCAL PAGINATION
  List<TestimonialModel> _allLocalTestimonials = [];

  int _currentPage = 1;

  final int _pageSize = 10;

  bool hasMore = true;

  bool useLocalPagination = false;

  /// =========================================================
  /// API FETCH
  /// =========================================================

  Future<void> fetchTestimonials(
    BuildContext context,
    String categoryId,
    String country_id
  ) async {
    useLocalPagination = false;

    isLoading = true;

    status = ApiStatus.loading;

    notifyListeners();

    final result =
        await _service.fetchTestimonials(
      context,
      categoryId,country_id
    );

    status = result.status;

    if (result.isSuccess) {
      testimonials = result.data ?? [];

      errorMessage = "";
    } else {
      testimonials = [];

      errorMessage = result.message ?? "";
    }

    isLoading = false;

    notifyListeners();
  }

  /// =========================================================
  /// LOCAL DATA INIT
  /// =========================================================

  void loadLocalTestimonials(
    List<TestimonialModel> data,
  ) {
    useLocalPagination = true;

    _allLocalTestimonials = data;

    testimonials = [];

    _currentPage = 1;

    hasMore = true;

    status = ApiStatus.success;

    _loadMoreLocal();
  }

  /// =========================================================
  /// LOCAL PAGINATION
  /// =========================================================

  void loadMoreLocal() {
    if (!useLocalPagination) return;

    _loadMoreLocal();
  }

  void _loadMoreLocal() {
    if (!hasMore || isLoading) return;

    isLoading = true;

    notifyListeners();

    final start = (_currentPage - 1) * _pageSize;

    final end = start + _pageSize;

    if (start >= _allLocalTestimonials.length) {
      hasMore = false;

      isLoading = false;

      notifyListeners();

      return;
    }

    final newItems =
        _allLocalTestimonials.sublist(
      start,
      end > _allLocalTestimonials.length
          ? _allLocalTestimonials.length
          : end,
    );

    testimonials.addAll(newItems);

    _currentPage++;

    hasMore =
        testimonials.length <
        _allLocalTestimonials.length;

    isLoading = false;

    notifyListeners();
  }

  /// =========================================================
  /// RETRY
  /// =========================================================

  Future<void> retry(
    BuildContext context,
  ) async {
    if (useLocalPagination) {
      loadLocalTestimonials(
        _allLocalTestimonials,
      );
    } else {
      await fetchTestimonials(
        context,
        "",""
      );
    }
  }
}