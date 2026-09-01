
import 'package:flutter/material.dart';
import 'package:merckfoundation_252026/Utility/APIManager.dart';
import 'package:merckfoundation_252026/Utility/api_result.dart';

class FilterService {

  /// COUNTRY
  Future<ApiResult<dynamic>> fetchCountries(
    BuildContext context,
  ) async {

    return await APIManager().apiRequest(
      context,
      API.getcountrylist,
    );
  }

  /// VIDEO CATEGORY
  Future<ApiResult<dynamic>> fetchCategories(
    BuildContext context,
    String countryID,
  ) async {

    return await APIManager().apiRequest(
      context,
      API.getvideocategorylist,
      jsonval: {
        "video_category_id": countryID,
      },
    );
  }

  /// TESTIMONIAL CATEGORY
  Future<ApiResult<dynamic>>
      fetchTestimonialCategories(
    BuildContext context,
    String countryID,
  ) async {

    return await APIManager().apiRequest(
      context,
      API.getvideocategorytestimoniallist,
      jsonval: {
        "video_category_id": countryID,
      },
    );
  }

  /// COUNTRY BY VIDEO CATEGORY
  Future<ApiResult<dynamic>>
      fetchCountryVideoLibraryCategories(
    BuildContext context,
    String categoryID,
  ) async {

    return await APIManager().apiRequest(
      context,
      API.getcountrybyvcat,
      jsonval: {
        "video_category_id": categoryID,
      },
    );
  }

  /// DIGITAL LIBRARY LANGUAGE
  Future<ApiResult<dynamic>>
      fetchLanguageByDigitalCategories(
    BuildContext context,
    String categoryID,
  ) async {

    return await APIManager().apiRequest(
      context,
      API.getlangbydigitalcat,
      jsonval: {
        "digital_category_id": categoryID,
      },
    );
  }

  /// DIGITAL LIBRARY CATEGORY
  Future<ApiResult<dynamic>>
      fetchListDigitalCategories(
    BuildContext context,
  ) async {

    return await APIManager().apiRequest(
      context,
      API.listdglibrarycategory,
    );
  }

  /// TESTIMONIAL ARTICLE CATEGORY
  Future<ApiResult<dynamic>>
      fetchTestimonialArticleCategories(
    BuildContext context,
  ) async {

    return await APIManager().apiRequest(
      context,
      API.testimonialcategory,
    );
  }
 Future<ApiResult<dynamic>>
      fetchCountryByTestimonialCategories(
    BuildContext context,
    String categoryID,
  ) async {
print("categoryID ${categoryID}");
    return await APIManager().apiRequest(
      context,
      API.getcountrybytestimonialcategory,
      jsonval: {
        "category_id": categoryID,
      },
    );
    
  }

  /// NEWS / ARTICLE LANGUAGE
Future<ApiResult<dynamic>> fetchNewsLanguages(
  BuildContext context,
) async {
  return await APIManager().apiRequest(
    context,
    API.getlanguagelistbyarticles,
  );
}
}