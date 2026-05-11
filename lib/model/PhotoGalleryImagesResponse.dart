// ========================= PHOTO GALLERY MODEL =========================
// PhotoGalleryImagesModel.dart

class PhotoGalleryImagesResponse {
  final String? status;
  final int? count;
  final String? next;
  final String? previous;
  final String? albumName;
  final List<PhotoGalleryImage> data;

  PhotoGalleryImagesResponse({
    this.status,
    this.count,
    this.next,
    this.previous,
    this.albumName,
    required this.data,
  });

  factory PhotoGalleryImagesResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return PhotoGalleryImagesResponse(
      status: json["status"],
      count: json["count"],
      next: json["next"],
      previous: json["previous"],
      albumName: json["album_name"],
      data: json["data"] == null
          ? []
          : List<PhotoGalleryImage>.from(
              json["data"].map(
                (x) => PhotoGalleryImage.fromJson(x),
              ),
            ),
    );
  }
}

class PhotoGalleryImage {
  final int? id;
  final bool? isActive;
  final int? photoCategory;
  final int? album;
  final String? photo;
  final String? photoDescription;
  final String? altTag;
  final int? year;
  final int? position;
  final bool? status;
  final bool? isFeatured;

  PhotoGalleryImage({
    this.id,
    this.isActive,
    this.photoCategory,
    this.album,
    this.photo,
    this.photoDescription,
    this.altTag,
    this.year,
    this.position,
    this.status,
    this.isFeatured,
  });

  factory PhotoGalleryImage.fromJson(
    Map<String, dynamic> json,
  ) {
    return PhotoGalleryImage(
      id: json["id"],
      isActive: json["isActive"],
      photoCategory: json["photo_category"],
      album: json["album"],
      photo: json["photo"],
      photoDescription: json["photo_description"],
      altTag: json["alt_tag"],
      year: json["year"],
      position: json["position"],
      status: json["status"],
      isFeatured: json["is_featured"],
    );
  }
}