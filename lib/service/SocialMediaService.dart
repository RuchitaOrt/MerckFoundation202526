import 'package:flutter/material.dart';
import 'package:merckfoundation_252026/Utility/APIManager.dart';
import 'package:merckfoundation_252026/Utility/api_result.dart';

class SocialMediaService {


  Future<ApiResult<dynamic>> fetchSocialMediaDrawer(
    BuildContext context,
   
  ) async {
    return await APIManager().apiRequest(
      context,
      API.mobiledrawermedia,
   
    );
  }
}