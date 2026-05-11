import 'package:flutter/material.dart';
import 'package:merckfoundation_252026/Utility/APIManager.dart';

import 'package:flutter/material.dart';
import 'package:merckfoundation_252026/Utility/APIManager.dart';

class FilterService {

  /// COUNTRY
  Future<Map<String, dynamic>> fetchCountries(BuildContext context) async {
    return await APIManager().apiRequest(
      context,
      API.getcountrylist,
    );
  }

  /// CATEGORY
  Future<Map<String, dynamic>> fetchCategories(BuildContext context,String countryID) async {
    return await APIManager().apiRequest(
      context,
      API.getvideocategorylist,
      jsonval: {
      "video_category_id": countryID ?? "",
    },
    );
  }

    Future<Map<String, dynamic>> fetchTestimonialCategories(BuildContext context,String countryID) async {
    return await APIManager().apiRequest(
      context,
      API.getvideocategorytestimoniallist,
      jsonval: {
      "video_category_id": countryID ?? "",
    },
    );
  }
   Future<Map<String, dynamic>> fetchCountryVideoLibraryCategories(BuildContext context,String countryID) async {
    return await APIManager().apiRequest(
      context,
      API.getcountrybyvcat,
      jsonval: {
      "video_category_id": countryID ?? "",
    },
    );
  }


   Future<Map<String, dynamic>> fetchLanguageByDigitalCategories(BuildContext context,String countryID) async {
    return await APIManager().apiRequest(
      context,
      API.getlangbydigitalcat,
      jsonval: {
      "digital_category_id": countryID ?? "",
    },
    );
  }

   Future<Map<String, dynamic>> fetchListDigitalCategories(BuildContext context,String countryID) async {
    return await APIManager().apiRequest(
      context,
      API.listdglibrarycategory,
      
    );
  }



   Future<Map<String, dynamic>> fetchTestimonialArticleCategories(BuildContext context,String countryID) async {
    return await APIManager().apiRequest(
      context,
      API.testimonialcategory,
      
    );
  }
}