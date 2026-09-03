import 'package:flutter/material.dart';
import 'package:merckfoundation_252026/Utility/api_result.dart';
import 'package:merckfoundation_252026/Utility/api_status.dart';
import 'package:merckfoundation_252026/Utility/APIManager.dart';

class RashaInsightsProvider extends ChangeNotifier {
  bool isLoading = false;
  String? errorMessage;

  dynamic rashaInsightsData;

  List<dynamic> content = [];
  String pageTitle = "";

  Future<void> getRashaInsights(BuildContext context) async {
    isLoading = true;
    errorMessage = null;
    notifyListeners();

    try {
      ApiResult<dynamic> result = await APIManager().apiRequest(
        context,
        API.rashainsights,
      );

      if (result.status == ApiStatus.success) {
        rashaInsightsData = result.data;

        _parseResponse(result.data);

        print("✅ Rasha Insights loaded");
        print("📦 Data: ${result.data}");
      } else {
        errorMessage = result.message ?? "Something went wrong";
      }
    } catch (e) {
      errorMessage = e.toString();
      print("❌ Rasha Insights Provider Error: $e");
    }

    isLoading = false;
    notifyListeners();
  }

  void _parseResponse(dynamic data) {
    content = [];
    pageTitle = "";

    if (data == null) {
      return;
    }

    if (data is List) {
      content = List<dynamic>.from(data);
      return;
    }

    if (data is Map) {
      // Try common response structures
      final dynamic responseData =
          data['data'] ??
          data['result'] ??
          data['content'] ??
          data['items'];

      if (responseData is List) {
        content = List<dynamic>.from(responseData);
      } else if (responseData is Map) {
        _extractMapData(responseData);
      }

      // Title
      pageTitle =
          data['title']?.toString() ??
          data['page_title']?.toString() ??
          data['name']?.toString() ??
          "";

      // If the API directly contains items
      if (content.isEmpty) {
        if (data['items'] is List) {
          content = List<dynamic>.from(data['items']);
        }
      }
    }
  }

  void _extractMapData(Map data) {
    pageTitle =
        data['title']?.toString() ??
        data['page_title']?.toString() ??
        data['name']?.toString() ??
        "";

    final items =
        data['items'] ??
        data['content'] ??
        data['data'] ??
        data['results'];

    if (items is List) {
      content = List<dynamic>.from(items);
    }
  }

  void clearData() {
    rashaInsightsData = null;
    content = [];
    pageTitle = "";
    errorMessage = null;
    notifyListeners();
  }
}