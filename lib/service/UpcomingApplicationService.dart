import 'package:flutter/material.dart';
import 'package:merckfoundation_252026/Utility/APIManager.dart';

import 'package:merckfoundation_252026/model/UpcomingApplicationResponse.dart';

class UpcomingApplicationService {
  /// 🔹 UPCOMING API
  Future<UpcomingApplicationResponse> fetchUpcoming(
    BuildContext context,
    int page,
  ) async {
    final response = await APIManager().apiRequest(
      context,
      API.getUpcomingApplication,
      queryParams: {"p": page},
    );

    return UpcomingApplicationResponse.fromJson(response);
  }

  /// 🔹 PAST API (NEW)
  Future<UpcomingApplicationResponse> fetchPast(
    BuildContext context,
    int page,
  ) async {
    final response = await APIManager().apiRequest(
      context,
      API.getpastapplication, // ✅ you said already added
      queryParams: {"p": page},
    );

    return UpcomingApplicationResponse.fromJson(response);
  }
}