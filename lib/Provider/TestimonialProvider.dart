// // // import 'dart:async';
// // // import 'dart:io';

// // // import 'package:flutter/material.dart';
// // // import 'package:merckfoundation_252026/Utility/APIManager.dart';
// // // import 'package:merckfoundation_252026/main.dart';
// // // import 'package:merckfoundation_252026/model/TestimonialModel.dart';
// // // import 'package:merckfoundation_252026/service/TestimonialService.dart';

// // // // // class TestimonialArticleProvider
// // // // //     extends ChangeNotifier {

// // // // //   final TestimonialService _service =
// // // // //       TestimonialService();

// // // // //   bool isLoading = false;

// // // // //   List<TestimonialModel> testimonials = [];

// // // // //   Future<void> fetchTestimonials(
// // // // //       String categoryId) async {

// // // // //     isLoading = true;
// // // // //     notifyListeners();

// // // // //     try {

// // // // //       final response =
// // // // //           await _service.fetchTestimonials(
// // // // //               categoryId);

// // // // //       testimonials =
// // // // //           (response['data'] as List)
// // // // //               .map((e) =>
// // // // //                   TestimonialModel.fromJson(e))
// // // // //               .toList();

// // // // //     } catch (e) {
// // // // //       debugPrint(e.toString());
// // // // //     }

// // // // //     isLoading = false;
// // // // //     notifyListeners();
// // // // //   }
// // // // // }
// // // // import 'package:flutter/material.dart';
// // // // import 'package:merckfoundation_252026/Utility/api_status.dart';
// // // // import 'package:merckfoundation_252026/model/TestimonialModel.dart';
// // // // import 'package:merckfoundation_252026/service/TestimonialService.dart';

// // // // class TestimonialArticleProvider extends ChangeNotifier {
// // // //   final TestimonialService _service = TestimonialService();

// // // //   bool isLoading = false;

// // // //   ApiStatus status = ApiStatus.loading;

// // // //   String errorMessage = "";

// // // //   List<TestimonialModel> testimonials = [];

// // // //   Future<void> fetchTestimonials(String categoryId) async {
// // // //     isLoading = true;
// // // //     status = ApiStatus.loading;
// // // //     notifyListeners();

// // // //     try {
// // // //       final response = await _service.fetchTestimonials(categoryId);

// // // //       final data = response['data'];

// // // //       if (data is List) {
// // // //         testimonials = data
// // // //             .map((e) => TestimonialModel.fromJson(e))
// // // //             .toList();

// // // //         status = ApiStatus.success;
// // // //       } else {
// // // //         testimonials = [];
// // // //         status = ApiStatus.error;
// // // //         errorMessage = "Invalid response format";
// // // //       }
// // // //     } catch (e) {
// // // //       debugPrint("TESTIMONIAL ERROR => $e");

// // // //       testimonials = [];

// // // //       if (e.toString().contains("SocketException")) {
// // // //         status = ApiStatus.noInternet;
// // // //       } else if (e.toString().contains("Timeout")) {
// // // //         status = ApiStatus.timeout;
// // // //       } else {
// // // //         status = ApiStatus.error;
// // // //         errorMessage = e.toString();
// // // //       }
// // // //     }

// // // //     isLoading = false;
// // // //     notifyListeners();
// // // //   }

// // // //   Future<void> retry() async {
// // // //     await fetchTestimonials("");
// // // //   }
// // // // }
// // // import 'package:flutter/material.dart';
// // // import 'package:merckfoundation_252026/Utility/api_status.dart';
// // // import 'package:merckfoundation_252026/model/TestimonialModel.dart';
// // // import 'package:merckfoundation_252026/service/TestimonialService.dart';

// // // class TestimonialArticleProvider extends ChangeNotifier {
// // //   final TestimonialService _service = TestimonialService();

// // //   bool isLoading = false;

// // //   ApiStatus status = ApiStatus.loading;

// // //   String errorMessage = "";

// // //   List<TestimonialModel> testimonials = [];
// // //   Future<void> fetchTestimonials(String categoryId) async {
// // //   isLoading = true;
// // //   status = ApiStatus.loading;
// // //   notifyListeners();

// // //   try {
// // //     final response = await _service.fetchTestimonials(categoryId);

// // //     dynamic data;

// // //     if (response is Map) {
// // //       data = response['data'];
// // //     } else if (response.toString().contains("ApiResult")) {
// // //       data = (response as dynamic).data;
// // //     }

// // //     if (data is List) {
// // //       testimonials =
// // //           data.map((e) => TestimonialModel.fromJson(e)).toList();

// // //       status = ApiStatus.success;
// // //     } else {
// // //       testimonials = [];
// // //       status = ApiStatus.error;
// // //       errorMessage = "Invalid data format";
// // //     }
// // //   } on SocketException {
// // //     testimonials = [];
// // //     status = ApiStatus.noInternet;
// // //   } on TimeoutException {
// // //     testimonials = [];
// // //     status = ApiStatus.timeout;
// // //   } catch (e) {
// // //     testimonials = [];
// // //     status = ApiStatus.error;
// // //     errorMessage = e.toString();
// // //   }

// // //   isLoading = false;
// // //   notifyListeners();
// // // }
// // // // Future<void> fetchTestimonials(String categoryId) async {
// // // //   isLoading = true;
// // // //   notifyListeners();

// // // // final response = await _service.fetchTestimonials(categoryId);

// // // // try {
// // // //   final data = response.data;

// // // //   if (data is List) {
// // // //     testimonials = data
// // // //         .map((e) => TestimonialModel.fromJson(e))
// // // //         .toList();
// // // //   } else if (data is Map && data['data'] is List) {
// // // //     testimonials = (data['data'] as List)
// // // //         .map((e) => TestimonialModel.fromJson(e))
// // // //         .toList();
// // // //   } else {
// // // //     testimonials = [];
// // // //   }
// // // // } catch (e) {
// // // //   debugPrint("PARSE ERROR => $e");
// // // //   testimonials = [];
// // // // }
// // // //   isLoading = false;
// // // //   notifyListeners();
// // // // }
// // //   // Future<void> fetchTestimonials(String categoryId) async {
// // //   //   isLoading = true;
// // //   //   status = ApiStatus.loading;
// // //   //   notifyListeners();

// // //   //   try {
// // //   //     final response = await _service.fetchTestimonials(categoryId);

// // //   //     final data = response['data'];

// // //   //     if (data is List) {
// // //   //       testimonials = data
// // //   //           .map((e) => TestimonialModel.fromJson(e))
// // //   //           .toList();

// // //   //       status = ApiStatus.success;
// // //   //     } else {
// // //   //       testimonials = [];
// // //   //       status = ApiStatus.error;
// // //   //       errorMessage = "Invalid response format";
// // //   //     }
// // //   //   } catch (e) {
// // //   //     debugPrint("TESTIMONIAL ERROR => $e");

// // //   //     testimonials = [];

// // //   //     if (e.toString().contains("SocketException")) {
// // //   //       status = ApiStatus.noInternet;
// // //   //     } else if (e.toString().contains("Timeout")) {
// // //   //       status = ApiStatus.timeout;
// // //   //     } else {
// // //   //       status = ApiStatus.error;
// // //   //       errorMessage = e.toString();
// // //   //     }
// // //   //   }

// // //   //   isLoading = false;
// // //   //   notifyListeners();
// // //   // }

// // //   Future<void> retry() async {
// // //     await fetchTestimonials("");
// // //   }
// // // }
// // import 'dart:async';
// // import 'dart:io';
// // import 'package:flutter/material.dart';
// // import 'package:merckfoundation_252026/Utility/api_status.dart';
// // import 'package:merckfoundation_252026/model/TestimonialModel.dart';
// // import 'package:merckfoundation_252026/service/TestimonialService.dart';

// // class TestimonialArticleProvider extends ChangeNotifier {
// //   final TestimonialService _service = TestimonialService();

// //   bool isLoading = false;

// //   ApiStatus status = ApiStatus.loading;

// //   String errorMessage = "";

// //   List<TestimonialModel> testimonials = [];

// //   Future<void> fetchTestimonials(String categoryId) async {
// //     isLoading = true;
// //     status = ApiStatus.loading;
// //     notifyListeners();

// //     try {
// //       final response = await _service.fetchTestimonials(categoryId);

// //       dynamic data;

// //       if (response is Map) {
// //         data = response['data'];
// //       } else {
// //         data = (response as dynamic).data;
// //       }

// //       if (data is List) {
// //         testimonials =
// //             data.map((e) => TestimonialModel.fromJson(e)).toList();

// //         status = ApiStatus.success;
// //       } else {
// //         testimonials = [];
// //         status = ApiStatus.error;
// //         errorMessage = "Invalid data format";
// //       }
// //     }

// //     // ⭐ IMPORTANT: NO INTERNET CASE
// //     on SocketException {
// //       testimonials = [];
// //       status = ApiStatus.noInternet;
// //       errorMessage = "No internet connection";
// //     }

// //     // ⭐ TIMEOUT CASE
// //     on TimeoutException {
// //       testimonials = [];
// //       status = ApiStatus.timeout;
// //       errorMessage = "Request timeout";
// //     }

// //     catch (e) {
// //       testimonials = [];
// //       status = ApiStatus.error;
// //       errorMessage = e.toString();
// //     }

// //     isLoading = false;
// //     notifyListeners();
// //   }

// //   Future<void> retry() async {
// //     await fetchTestimonials("");
// //   }
// // }
// import 'package:flutter/material.dart';
// import 'package:merckfoundation_252026/Utility/api_status.dart';
// import 'package:merckfoundation_252026/model/TestimonialModel.dart';
// import 'package:merckfoundation_252026/service/TestimonialService.dart';

// class TestimonialArticleProvider extends ChangeNotifier {
//   final TestimonialService _service = TestimonialService();

//   ApiStatus status = ApiStatus.initial;

//   String errorMessage = "";

//   List<TestimonialModel> testimonials = [];

//   Future<void> fetchTestimonials(
//       BuildContext context,
//       String categoryId,
//   ) async {

//     status = ApiStatus.loading;
//     notifyListeners();

//     final result =
//         await _service.fetchTestimonials(context, categoryId);

//     status = result.status;

//     if (result.isSuccess) {
//       testimonials = result.data ?? [];
//     } else {
//       testimonials = [];
//       errorMessage = result.message ?? "";
//     }

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

  List<TestimonialModel> testimonials = [];

  Future<void> fetchTestimonials(
    BuildContext context,
    String categoryId,
  ) async {

    isLoading = true;
    status = ApiStatus.loading;
    notifyListeners();

    final result =
        await _service.fetchTestimonials(context, categoryId);

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

  Future<void> retry(BuildContext context) async {
    await fetchTestimonials(context, "");
  }
}