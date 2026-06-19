import 'package:flutter/material.dart';
import 'package:merckfoundation_252026/Utility/APIManager.dart';
import 'package:merckfoundation_252026/Utility/api_result.dart';
import 'package:merckfoundation_252026/model/OurPartnerResponse.dart';

class OurPartnersService {
  final APIManager _apiManager = APIManager();

  Future<ApiResult<OurPartnersResponse>> fetchPartners(
    BuildContext context, {
    int page = 1,
  }) async {
    final result = await _apiManager.apiRequest(
      context,
      API.ourPartners,
      queryParams: {
        "p": page,
      },
    );

    if (!result.isSuccess) {
      return ApiResult(
        status: result.status,
        message: result.message,
      );
    }

    final data = result.data;

    OurPartnersResponse response;

    /// ✅ CASE 1: already parsed model
    if (data is OurPartnersResponse) {
      response = data;
    }

    /// ✅ CASE 2: raw JSON map
    else if (data is Map<String, dynamic>) {
      response = OurPartnersResponse.fromJson(data);
    }

    /// ❌ INVALID FORMAT
    else {
      return ApiResult(
        status: result.status,
        message: "Invalid response format",
      );
    }

    return ApiResult(
      status: result.status,
      data: response,
    );
  }
}