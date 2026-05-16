// import 'package:flutter/material.dart';
// import 'package:merckfoundation_252026/Utility/APIManager.dart';
// import 'package:merckfoundation_252026/model/PhotoAlbumModel.dart';


// class PhotoAlbumService {
//   final APIManager _apiManager = APIManager();

//   Future<PhotoAlbumResponse> fetchPhotoAlbums(
//     BuildContext context,
//     String? photocategoryid,
//   ) async {

//     final response = await _apiManager.apiRequest(
//       context,
//       API.getphotoalbum,
//       jsonval: {
//         "photo_category_id": photocategoryid,
//       },
//     );

//     return PhotoAlbumResponse.fromJson(response);
//   }
// }
import 'package:flutter/material.dart';

import 'package:merckfoundation_252026/Utility/APIManager.dart';
import 'package:merckfoundation_252026/Utility/api_result.dart';

import 'package:merckfoundation_252026/model/PhotoAlbumModel.dart';

class PhotoAlbumService {

  final APIManager _apiManager =
      APIManager();

  Future<ApiResult<List<PhotoAlbum>>>
      fetchPhotoAlbums(
    BuildContext context,
    String? photocategoryid,
  ) async {

    final result =
        await _apiManager.apiRequest(
      context,
      API.getphotoalbum,
      jsonval: {
        "photo_category_id":
            photocategoryid,
      },
    );

    /// API FAILED
    if (!result.isSuccess) {

      return ApiResult(
        status: result.status,
        message: result.message,
      );
    }

    /// PARSE RESPONSE
    final response =
        PhotoAlbumResponse.fromJson(
      result.data,
    );

    /// SUCCESS
    return ApiResult(
      status: result.status,
      data: response.data,
    );
  }
}