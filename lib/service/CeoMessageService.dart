import 'package:flutter/material.dart';
import 'package:merckfoundation_252026/Utility/APIManager.dart';
import 'package:merckfoundation_252026/Utility/api_result.dart';

class CeoMessageService {

  Future<ApiResult<dynamic>> fetchCeoMessages(
    BuildContext context,
    int page,
  ) async {

    return await APIManager().apiRequest(
      context,
      API.getceomessages,
      queryParams: {
        "p": page,
      },
    );
  }
}