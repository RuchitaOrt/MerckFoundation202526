import 'package:flutter/material.dart';

import 'package:merckfoundation_252026/Utility/APIManager.dart';
import 'package:merckfoundation_252026/Utility/api_result.dart';

import 'package:merckfoundation_252026/model/TestimonialModel.dart';


class TestimonialService {
  final APIManager _apiManager = APIManager();

  Future<ApiResult<List<TestimonialModel>>> fetchTestimonials(
      BuildContext context,
      String categoryId,
      String country_id,
      int page,
  ) async {

    final result = await _apiManager.apiRequest(
      context,
      API.testimonialarticles,
       jsonval:{ "p": page,
         "category_id": categoryId,"country_id":country_id=="0"?"":country_id
        }
  //     queryParams: {
  //   "category_id": categoryId,
  //   "country_id": country_id,
  // },
      // jsonval: {"category_id": categoryId,"country_id":country_id},
    );
print("category_id ${categoryId}");
print("country_id ${country_id}");
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