// import 'package:merckfoundation_252026/Utility/APIManager.dart';
// import 'package:merckfoundation_252026/main.dart';
// import 'package:merckfoundation_252026/model/AwardResponse.dart';

// class AwardService {
//   Future<List<AwardModel>> fetchAward() async {
//     final response = await APIManager().apiRequest(
//       routeGlobalKey.currentContext!,
//       API.getawardlist,
//     );

//     /// response = Map<String,dynamic>

//     final List data = response['data'] ?? [];

//     return data
//         .map((e) => AwardModel.fromJson(e))
//         .toList();
//   }
// }
import 'package:flutter/material.dart';

import 'package:merckfoundation_252026/Utility/APIManager.dart';
import 'package:merckfoundation_252026/Utility/api_result.dart';

import 'package:merckfoundation_252026/model/AwardResponse.dart';

class AwardService {

  Future<ApiResult<List<AwardModel>>>
      fetchAward(
    BuildContext context,
  ) async {

    final result =
        await APIManager()
            .apiRequest(
      context,
      API.getawardlist,
    );

    /// API FAILED
    if (!result.isSuccess) {

      return ApiResult(
        status: result.status,
        message: result.message,
      );
    }

    /// SUCCESS
    final response = result.data;

    final List data =
        response['data'] ?? [];

    // final awardList = data
    //     .map(
    //       (e) =>
    //           AwardModel.fromJson(e),
    //     )
    //     .toList();
/// Remove inactive awards
  final awardList = data
      .where(
        (e) =>
            e['status'] == true,
      )
      .map(
        (e) => AwardModel.fromJson(e),
      )
      .toList();
    return ApiResult(
      status: result.status,
      data: awardList,
    );
  }
}