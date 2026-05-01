import 'package:flutter/material.dart';
import 'package:merckfoundation_252026/Utility/APIManager.dart';

class PageService {
  final APIManager _apiManager = APIManager();

  Future<dynamic> getPageStructure(BuildContext context,String menuId) async {
    return await _apiManager.apiRequest(
      context,
      API.pageStructure,
      queryParams: {
        "menu_id": menuId,
        "channel": "android",
        "json_type": "preview_json",
      },
    );
  }
}