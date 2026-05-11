import 'package:flutter/material.dart';

import 'package:merckfoundation_252026/Utility/APIManager.dart';
import 'package:merckfoundation_252026/main.dart';

class TestimonialService {
  final APIManager _apiManager = APIManager();

  Future<dynamic> fetchTestimonials(
   
    String categoryId,
  ) async {
    return await _apiManager.apiRequest(
      routeGlobalKey.currentContext!,
      API.testimonialarticles,
      jsonval: {"category_id": categoryId ?? ""},
    );
  }
}
