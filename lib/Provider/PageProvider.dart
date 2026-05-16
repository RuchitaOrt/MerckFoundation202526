import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:merckfoundation_252026/Utility/showdailog.dart';
import 'package:merckfoundation_252026/service/PageService.dart';

// class PageProvider extends ChangeNotifier {
//   final PageService _service = PageService();

//   bool isLoading = false;
//   dynamic pageData;

//   Future<void> fetchPage(BuildContext context,String menuId) async {
//     isLoading = true;
//     notifyListeners();

//     try {
//       final response = await _service.getPageStructure(context,menuId);

//       // 🔥 CLEAN "=" ISSUE
//       final cleanData = response;
//       // cleanJson(response);

//       pageData = cleanData;
//     } catch (e) {
//       showToast(e.toString());
//        isLoading = false;
//     }

//     isLoading = false;
//     notifyListeners();
//   }

//   /// 🔧 REMOVE "=" FROM RESPONSE
//   // dynamic _cleanJson(dynamic data) {
//   //   final jsonString = jsonEncode(data).replaceAll("=", "");
//   //   return jsonDecode(jsonString);
//   // }
// }
class PageProvider extends ChangeNotifier {
  final PageService _service = PageService();

  bool isLoading = false;
  bool hasError = false;
  String errorMessage = "";

  Map<String, dynamic>? pageData;

  Future<void> fetchPage(BuildContext context, String menuId) async {
    isLoading = true;
    hasError = false;
    errorMessage = "";
    notifyListeners();

    try {
      final result = await _service.getPageStructure(context, menuId);

      /// ✅ HANDLE ApiResult WRAPPER
      if (result is Map<String, dynamic>) {
        pageData = result;
      } else if (result is dynamic && result.data != null) {
        pageData = result.data as Map<String, dynamic>;
      } else {
        pageData = jsonDecode(jsonEncode(result));
      }

    } catch (e) {
      hasError = true;
      errorMessage = e.toString();
    }

    isLoading = false;
    notifyListeners();
  }
}