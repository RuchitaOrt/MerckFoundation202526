import 'package:flutter/material.dart';
import 'package:merckfoundation_252026/Utility/APIManager.dart';
import 'package:merckfoundation_252026/model/PhotoAlbumModel.dart';


class PhotoAlbumService {
  final APIManager _apiManager = APIManager();

  Future<PhotoAlbumResponse> fetchPhotoAlbums(
    BuildContext context,
    String? photocategoryid,
  ) async {

    final response = await _apiManager.apiRequest(
      context,
      API.getphotoalbum,
      jsonval: {
        "photo_category_id": photocategoryid,
      },
    );

    return PhotoAlbumResponse.fromJson(response);
  }
}