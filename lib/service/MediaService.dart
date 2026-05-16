// import 'package:flutter/material.dart';
// import 'package:merckfoundation_252026/Utility/APIManager.dart';
// class MediaService {
//   Future<Map<String, dynamic>> fetchMedia(
//       BuildContext context, int page) async {

//     final response = await APIManager().apiRequest(
//       context,
//       API.mediaList, // ✅ NEW ENUM
//       queryParams: {
//         "p": page, // ✅ page instead of full URL
//       },
//     );

//     return response;
//   }
// }
import 'package:flutter/material.dart';

import 'package:merckfoundation_252026/Utility/APIManager.dart';
import 'package:merckfoundation_252026/Utility/api_result.dart';

class MediaService {

  Future<ApiResult<dynamic>>
      fetchMedia(
    BuildContext context,
    int page,
  ) async {

    final result =
        await APIManager()
            .apiRequest(
      context,
      API.mediaList,

      queryParams: {
        "p": page,
      },
    );

    return result;
  }
}