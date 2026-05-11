// ========================= PHOTO ALBUM MODEL =========================
// photo_album_model.dart

class PhotoAlbumResponse {
  final List<PhotoAlbum> data;

  PhotoAlbumResponse({
    required this.data,
  });

  factory PhotoAlbumResponse.fromJson(Map<String, dynamic> json) {
    return PhotoAlbumResponse(
      data: (json['data'] as List? ?? [])
          .map((e) => PhotoAlbum.fromJson(e))
          .toList(),
    );
  }
}

class PhotoAlbum {
  final int id;
  final String albumName;
  final String url;
  final List<AlbumImage> imagelist;

  PhotoAlbum({
    required this.id,
    required this.albumName,
    required this.url,
    required this.imagelist,
  });

  factory PhotoAlbum.fromJson(Map<String, dynamic> json) {
    return PhotoAlbum(
      id: json['id'] ?? 0,
      albumName: json['album_name'] ?? "",
      url: json['url'] ?? "",
      imagelist: (json['imagelist'] as List? ?? [])
          .map((e) => AlbumImage.fromJson(e))
          .toList(),
    );
  }
}

class AlbumImage {
  final int id;
  final String photo;
  final String photoDescription;
  final String altTag;

  AlbumImage({
    required this.id,
    required this.photo,
    required this.photoDescription,
    required this.altTag,
  });

  factory AlbumImage.fromJson(Map<String, dynamic> json) {
    return AlbumImage(
      id: json['id'] ?? 0,
      photo: json['photo'] ?? "",
      photoDescription: json['photo_description'] ?? "",
      altTag: json['alt_tag'] ?? "",
    );
  }
}