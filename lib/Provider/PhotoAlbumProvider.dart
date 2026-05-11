// ========================= PHOTO ALBUM PROVIDER =========================
// PhotoAlbumProvider.dart

import 'package:flutter/material.dart';
import 'package:merckfoundation_252026/model/PhotoAlbumModel.dart';

import '../Service/PhotoAlbumService.dart';

class PhotoAlbumProvider extends ChangeNotifier {
  final PhotoAlbumService _service = PhotoAlbumService();

  bool isLoading = false;

  List<PhotoAlbum> albums = [];

  Future<void> getPhotoAlbums(
    BuildContext context,
    String photocategoryid,
  ) async {
    try {
      isLoading = true;
      notifyListeners();

      final response = await _service.fetchPhotoAlbums(
        context,
        photocategoryid,
      );

      albums = response.data;
    } catch (e) {
      debugPrint("PHOTO ALBUM ERROR : $e");
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
