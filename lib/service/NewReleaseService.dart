import 'package:flutter/material.dart';
import 'package:merckfoundation_252026/Utility/APIManager.dart';
class NewReleaseService {
  Future<Map<String, dynamic>> fetchNewRelease(
      BuildContext context, int page) async {

    final response = await APIManager().apiRequest(
      context,
      API.getnewsrelease, // ✅ NEW ENUM
      queryParams: {
        "p": page, // ✅ page instead of full URL
      },
    );

    return response;
  }
}