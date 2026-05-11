// import 'package:flutter/material.dart';
// import 'package:merckfoundation_252026/model/PhotoGalleryImagesResponse.dart';

// import '../Utility/APIManager.dart';


// class PhotoGalleryImagesService {
//   final APIManager _apiManager = APIManager();

//   Future<PhotoGalleryImagesResponse> fetchPhotoGalleryImages(
//     BuildContext context, {
//     required int page,
//     required String albumId,
//     required String photocategoryid
//   }) async {

//     final response = await _apiManager.apiRequest(
//       context,
//      API.getphotogalleryimages,
//       // jsonval: {
//       //   "photo_category_id":photocategoryid,
//       //   "album_id": albumId,

//       // },
//     );

//     return PhotoGalleryImagesResponse.fromJson(response);
//   }
// }