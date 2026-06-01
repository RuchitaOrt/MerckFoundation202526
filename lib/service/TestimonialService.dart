import 'package:flutter/material.dart';

import 'package:merckfoundation_252026/Utility/APIManager.dart';
import 'package:merckfoundation_252026/Utility/api_result.dart';

import 'package:merckfoundation_252026/model/TestimonialModel.dart';


class TestimonialService {
  final APIManager _apiManager = APIManager();

  Future<ApiResult<List<TestimonialModel>>> fetchTestimonials(
      BuildContext context,
      String categoryId,
  ) async {

    final result = await _apiManager.apiRequest(
      context,
      API.testimonialarticles,
      jsonval: {"category_id": categoryId},
    );

    if (!result.isSuccess) {
      return ApiResult(
        status: result.status,
        message: result.message,
      );
    }

    final data = result.data['data'];

    final list = (data as List)
        .map((e) => TestimonialModel.fromJson(e))
        .toList();

    return ApiResult(
      status: result.status,
      data: list,
    );
  }
}