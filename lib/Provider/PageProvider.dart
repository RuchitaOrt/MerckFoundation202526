import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:merckfoundation_252026/Utility/showdailog.dart';
import 'package:merckfoundation_252026/service/PageService.dart';

class PageProvider extends ChangeNotifier {
  final PageService _service = PageService();

  bool isLoading = false;
  dynamic pageData;

  Future<void> fetchPage(BuildContext context,String menuId) async {
    isLoading = true;
    notifyListeners();

    try {
      final response = await _service.getPageStructure(context,menuId);

      // 🔥 CLEAN "=" ISSUE
      final cleanData = response;
      // cleanJson(response);

      pageData = cleanData;
    } catch (e) {
      showToast(e.toString());
       isLoading = false;
    }

    isLoading = false;
    notifyListeners();
  }

  /// 🔧 REMOVE "=" FROM RESPONSE
  // dynamic _cleanJson(dynamic data) {
  //   final jsonString = jsonEncode(data).replaceAll("=", "");
  //   return jsonDecode(jsonString);
  // }
}