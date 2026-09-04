
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

// class TestimonialArticleProvider extends ChangeNotifier {
//   final TestimonialService _service = TestimonialService();

//   ApiStatus status = ApiStatus.initial;

//   String errorMessage = "";

//   bool isLoading = false;

//   /// API / UI LIST
//   List<TestimonialModel> testimonials = [];

//   /// LOCAL PAGINATION
//   List<TestimonialModel> _allLocalTestimonials = [];

//   int _currentPage = 1;

//   final int _pageSize = 10;

//   bool hasMore = true;

//   bool useLocalPagination = false;

//   /// =========================================================
//   /// API FETCH
//   /// =========================================================

//   Future<void> fetchTestimonials(
//     BuildContext context,
//     String categoryId,
//     String country_id
//   ) async {
//     useLocalPagination = false;

//     isLoading = true;

//     status = ApiStatus.loading;

//     notifyListeners();

//     final result =
//         await _service.fetchTestimonials(
//       context,
//       categoryId,country_id,
//       1,
//     );

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

//   /// =========================================================
//   /// LOCAL DATA INIT
//   /// =========================================================

//   void loadLocalTestimonials(
//     List<TestimonialModel> data,
//   ) {
//     useLocalPagination = true;

//     _allLocalTestimonials = data;

//     testimonials = [];

//     _currentPage = 1;

//     hasMore = true;

//     status = ApiStatus.success;

//     _loadMoreLocal();
//   }

//   /// =========================================================
//   /// LOCAL PAGINATION
//   /// =========================================================

//   void loadMoreLocal() {
//     if (!useLocalPagination) return;

//     _loadMoreLocal();
//   }

//   void _loadMoreLocal() {
//     if (!hasMore || isLoading) return;

//     isLoading = true;

//     notifyListeners();

//     final start = (_currentPage - 1) * _pageSize;

//     final end = start + _pageSize;

//     if (start >= _allLocalTestimonials.length) {
//       hasMore = false;

//       isLoading = false;

//       notifyListeners();

//       return;
//     }

//     final newItems =
//         _allLocalTestimonials.sublist(
//       start,
//       end > _allLocalTestimonials.length
//           ? _allLocalTestimonials.length
//           : end,
//     );

//     testimonials.addAll(newItems);

//     _currentPage++;

//     hasMore =
//         testimonials.length <
//         _allLocalTestimonials.length;

//     isLoading = false;

//     notifyListeners();
//   }

//   /// =========================================================
//   /// RETRY
//   /// =========================================================

//   Future<void> retry(
//     BuildContext context,
//   ) async {
//     if (useLocalPagination) {
//       loadLocalTestimonials(
//         _allLocalTestimonials,
//       );
//     } else {
//       await fetchTestimonials(
//         context,
//         "",""
//       );
//     }
//   }
// }
class TestimonialArticleProvider extends ChangeNotifier {
  final TestimonialService _service = TestimonialService();

  ApiStatus status = ApiStatus.initial;
  String errorMessage = "";
  bool isLoading = false;

  List<TestimonialModel> testimonials = [];

  // =========================================================
  // LOCAL PAGINATION
  // =========================================================

  List<TestimonialModel> _allLocalTestimonials = [];

  int _localCurrentPage = 1;

  final int _pageSize = 10;

  bool hasMore = true;

  bool useLocalPagination = false;

  // =========================================================
  // API PAGINATION
  // =========================================================

  int _currentPage = 1;

  String _categoryId = "";
  String _countryId = "";

  // =========================================================
  // API FIRST PAGE
  // =========================================================

  Future<void> fetchTestimonials(
    BuildContext context,
    String categoryId,
    String countryId,
  ) async {
    useLocalPagination = false;

    _categoryId = categoryId;
    _countryId = countryId;

    _currentPage = 1;
    hasMore = true;

    testimonials.clear();

    isLoading = true;
    status = ApiStatus.loading;

    notifyListeners();

    final result = await _service.fetchTestimonials(
      context,
      categoryId,
      countryId,
      1,
    );

    if (result.isSuccess && result.data != null) {
      testimonials = result.data!.data;

      hasMore = result.data!.next != null;

      status = ApiStatus.success;
      errorMessage = "";
    } else {
      testimonials = [];

      status = result.status;
      errorMessage = result.message ?? "";
    }

    isLoading = false;

    notifyListeners();
  }

  // =========================================================
  // API LOAD MORE
  // =========================================================

  Future<bool> loadMoreTestimonials(
    BuildContext context,
  ) async {
    if (isLoading || !hasMore) {
      return false;
    }

    isLoading = true;
    notifyListeners();

    final nextPage = _currentPage + 1;

    final result = await _service.fetchTestimonials(
      context,
      _categoryId,
      _countryId,
      nextPage,
    );

    bool loaded = false;

    if (result.isSuccess && result.data != null) {
      final newItems = result.data!.data;

      if (newItems.isNotEmpty) {
        testimonials.addAll(newItems);

        _currentPage = nextPage;

        loaded = true;
      }

      // 🔥 Check API next
      hasMore = result.data!.next != null;

      errorMessage = "";
    } else {
      errorMessage = result.message ?? "";
    }

    isLoading = false;

    notifyListeners();

    return loaded;
  }

  // =========================================================
  // LOCAL DATA INIT
  // =========================================================

  void loadLocalTestimonials(
    List<TestimonialModel> data,
  ) {
    useLocalPagination = true;

    _allLocalTestimonials = data;

    testimonials = [];

    _localCurrentPage = 1;

    hasMore = true;

    status = ApiStatus.success;

    _loadMoreLocal();
  }

  // =========================================================
  // LOCAL LOAD MORE
  // =========================================================

  void loadMoreLocal() {
    if (!useLocalPagination) return;

    _loadMoreLocal();
  }

  void _loadMoreLocal() {
    if (!hasMore || isLoading) return;

    isLoading = true;

    notifyListeners();

    final start = (_localCurrentPage - 1) * _pageSize;

    final end = start + _pageSize;

    if (start >= _allLocalTestimonials.length) {
      hasMore = false;

      isLoading = false;

      notifyListeners();

      return;
    }

    final newItems = _allLocalTestimonials.sublist(
      start,
      end > _allLocalTestimonials.length
          ? _allLocalTestimonials.length
          : end,
    );

    testimonials.addAll(newItems);

    _localCurrentPage++;

    hasMore =
        testimonials.length < _allLocalTestimonials.length;

    isLoading = false;

    notifyListeners();
  }

  // =========================================================
  // RETRY
  // =========================================================

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
        _categoryId,
        _countryId,
      );
    }
  }
}