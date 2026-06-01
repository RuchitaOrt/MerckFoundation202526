

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:merckfoundation_252026/Utility/api_status.dart';
import 'package:merckfoundation_252026/CommonUtils/common_strings.dart';
import 'package:merckfoundation_252026/service/PageService.dart';

class PageProvider extends ChangeNotifier {
  final PageService _service = PageService();

  ApiStatus status = ApiStatus.initial;

  bool isLoading = false;

  String errorMessage = "";

  Map<String, dynamic>? pageData;

  Future<void> fetchPage(
    BuildContext context,
    String menuId,
  ) async {
    isLoading = true;
    status = ApiStatus.loading;
    errorMessage = "";

    notifyListeners();

    try {
      final result = await _service.getPageStructure(
        context,
        menuId,
      );

      /// ✅ API STATUS
      status = result.status;

      if (result.isSuccess) {
        /// ✅ HANDLE RESPONSE
        if (result.data is Map<String, dynamic>) {
          pageData = result.data;
        } else {
          pageData = jsonDecode(
            jsonEncode(result.data),
          );
        }
      } else {
        status = ApiStatus.error;

        errorMessage =
            result.message ?? "Something went wrong";
      }
    } catch (e) {
      status = ApiStatus.noInternet;

      errorMessage =  CommonStrings.noInternetConnection;
    }

    isLoading = false;

    notifyListeners();
  }

  Future<void> retryPage(
    BuildContext context,
    String menuId,
  ) async {
    await fetchPage(context, menuId);
  }
}