// import 'package:flutter/material.dart';
// import 'package:merckfoundation_252026/Utility/APIManager.dart';

// import 'package:merckfoundation_252026/model/UpcomingApplicationResponse.dart';

// class UpcomingApplicationService {
//   /// 🔹 UPCOMING API
//   Future<UpcomingApplicationResponse> fetchUpcoming(
//     BuildContext context,
//     int page,
//   ) async {
//     final response = await APIManager().apiRequest(
//       context,
//       API.getUpcomingApplication,
//       queryParams: {"p": page},
//     );

//     return UpcomingApplicationResponse.fromJson(response);
//   }

//   /// 🔹 PAST API (NEW)
//   Future<UpcomingApplicationResponse> fetchPast(
//     BuildContext context,
//     int page,
//   ) async {
//     final response = await APIManager().apiRequest(
//       context,
//       API.getpastapplication, // ✅ you said already added
//       queryParams: {"p": page},
//     );

//     return UpcomingApplicationResponse.fromJson(response);
//   }
// }
import 'package:flutter/material.dart';
import 'package:merckfoundation_252026/Utility/APIManager.dart';
import 'package:merckfoundation_252026/Utility/api_result.dart';
import 'package:merckfoundation_252026/model/UpcomingApplicationResponse.dart';

class UpcomingApplicationService {

  /// 🔹 UPCOMING API
  Future<ApiResult<UpcomingApplicationResponse>>
      fetchUpcoming(
    BuildContext context,
    int page,
  ) async {

    final result =
        await APIManager()
            .apiRequest(
      context,
      API.getUpcomingApplication,
      queryParams: {
        "p": page,
      },
    );

    /// API FAILED
    if (!result.isSuccess) {

      return ApiResult(
        status: result.status,
        message: result.message,
      );
    }

    /// SUCCESS
    return ApiResult(
      status: result.status,
      data:
          UpcomingApplicationResponse
              .fromJson(
        result.data,
      ),
    );
  }

  /// 🔹 PAST API
  Future<ApiResult<UpcomingApplicationResponse>>
      fetchPast(
    BuildContext context,
    int page,
  ) async {

    final result =
        await APIManager()
            .apiRequest(
      context,
      API.getpastapplication,
      queryParams: {
        "p": page,
      },
    );

    /// API FAILED
    if (!result.isSuccess) {

      return ApiResult(
        status: result.status,
        message: result.message,
      );
    }

    /// SUCCESS
    return ApiResult(
      status: result.status,
      data:
          UpcomingApplicationResponse
              .fromJson(
        result.data,
      ),
    );
  }
}