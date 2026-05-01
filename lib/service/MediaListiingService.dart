import 'package:flutter/material.dart';
import 'package:merckfoundation_252026/Utility/APIManager.dart';
import 'package:flutter/material.dart';
import 'package:merckfoundation_252026/Utility/APIManager.dart';
import 'package:merckfoundation_252026/enum/commonEnum.dart';
import 'package:flutter/material.dart';
import 'package:merckfoundation_252026/Utility/APIManager.dart';
import '../enum/commonEnum.dart';

class MediaListingService {

  Future<Map<String, dynamic>> fetchMedia(
    BuildContext context,
    int page,
    MediaType type, {
    String? countryId,
    String? categoryId,
  }) async {

    API api;
    Map<String, dynamic> body = {};

    switch (type) {

      case MediaType.stories:
        api = API.getstories;
        body = {
          "country_id": countryId ?? "",
        };
        break;

      case MediaType.testimonial:
        api = API.gettestimonials;
        body = {
          "video_category_id": categoryId ?? "",
        };
        break;

      case MediaType.videoLibrary:
        api = API.getvideolibrary;
        body = {
          "video_category_id": categoryId ?? "",
          "country_id": countryId ?? "",
        };
        break;
    }

    final response = await APIManager().apiRequest(
      context,
      api,
      queryParams: {"p": page},
      jsonval: body,
    );

    return response;
  }
}