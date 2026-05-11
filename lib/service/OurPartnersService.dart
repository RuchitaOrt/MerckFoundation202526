import 'package:flutter/material.dart';
import 'package:merckfoundation_252026/model/OurPartnerResponse.dart';
import '../Utility/APIManager.dart';


class OurPartnersService {
  final APIManager _apiManager = APIManager();

  Future<OurPartnersResponse> fetchPartners(
    BuildContext context, {
    int page = 1,
  }) async {
    final response = await _apiManager.apiRequest(
      context,
      API.ourPartners,
      queryParams: {
        "p": page,
      },
    );

    return response as OurPartnersResponse;
  }
}