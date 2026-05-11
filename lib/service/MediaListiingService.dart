import 'package:flutter/material.dart';
import 'package:merckfoundation_252026/Utility/APIManager.dart';
import 'package:merckfoundation_252026/enum/commonEnum.dart';

class MediaListingService {
  Future<Map<String, dynamic>> fetchMedia(
    BuildContext context,
    int page,
    MediaType type, {
    String? countryId,
    String? categoryId,
    String? languageId,

    String? albumID,
  }) async {
    API api;
    Map<String, dynamic> body = {};

    switch (type) {
      case MediaType.stories:
        api = API.getstories;
        body = {"country_id": countryId ?? ""};
        break;

      case MediaType.testimonial:
        api = API.gettestimonials;
        body = {"video_category_id": categoryId ?? ""};
        break;

      case MediaType.videoLibrary:
        api = API.getvideolibrary;
        body = {
          "video_category_id": categoryId ?? "",
          "country_id": countryId ?? "",
        };
        break;

      case MediaType.photoGallery:
        api = API.getphotogallerycategory;

        break;

      case MediaType.activity:
        api = API.getactivities;

        break;

      case MediaType.digitalLibrary:
        api = API.getdigitallibrary;
        body = {
          "digital_category_id": categoryId ?? "",
          "language_id": languageId ?? "",
        };

        break;

      case MediaType.testimonialArticle:
        api = API.testimonialarticles;

        break;

      case MediaType.photoAlbum:
        api = API.getphotogalleryimages;
        body = {"photo_category_id": categoryId, "album_id": albumID};
        break;


         case MediaType.episodes:
        api = API.gethomeepisodelist;
        body = {"season_id": categoryId,};
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
