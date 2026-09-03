class EpisodeInfoResponse {
  final EpisodeInfo data;
  final ResponseInfo response;

  EpisodeInfoResponse({
    required this.data,
    required this.response,
  });

  factory EpisodeInfoResponse.fromJson(Map<String, dynamic> json) {
    return EpisodeInfoResponse(
      data: EpisodeInfo.fromJson(json['data']),
      response: ResponseInfo.fromJson(json['response']),
    );
  }
}

class EpisodeInfo {
  final int id;
  final String albumName;
  final int seasonId;
  final String episodeName;
  final String videoLink;
  final String showBrief;
  final String episodeBrief;
  final String guestInfo;
  final String credits;
  final String relatedNews;
  final String albumNameId;
  final String photosGalleryId;
  final int position;
  final bool status;
  final String Photo_category;
  final List<PhotoGallery> photoGalleryList;
  final String album_id;

  EpisodeInfo({
    required this.id,
    required this.albumName,
    required this.seasonId,
    required this.episodeName,
    required this.videoLink,
    required this.showBrief,
    required this.episodeBrief,
    required this.guestInfo,
    required this.credits,
    required this.relatedNews,
    required this.albumNameId,
    required this.photosGalleryId,
    required this.position,
    required this.status,
    required this.photoGalleryList,
    required this.Photo_category,
    required this.album_id
  });

  // factory EpisodeInfo.fromJson(Map<String, dynamic> json) {
  //   return EpisodeInfo(
  //     id: json['id'],
  //     albumName: json['album_name'] ?? '',
  //     seasonId: json['season_id'] ?? 0,
  //     episodeName: json['episode_name'] ?? '',
  //     videoLink: json['video_link'] ?? '',
  //     showBrief: json['show_brief'] ?? '',
  //     episodeBrief: json['episode_brief'] ?? '',
  //     guestInfo: json['guest_info'] ?? '',
  //     credits: json['credits'] ?? '',
  //     relatedNews: json['related_news'] ?? '',
  //     albumNameId: json['album_name_id'] ?? 0,
  //     photosGalleryId: json['photos_gallery_id'] ?? '',
  //     position: json['position'] ?? 0,
  //     status: json['status'] ?? false,
  //     Photo_category:json['Photo_category'],
  //     album_id:json['album_id'],
  //     photoGalleryList: (json['photo_gallery_list'] as List)
  //         .map((e) => PhotoGallery.fromJson(e))
  //         .toList(),
  //   );
  // }
  factory EpisodeInfo.fromJson(Map<String, dynamic> json) {
  return EpisodeInfo(
    id: json['id'] ?? 0,

    albumName: json['album_name']?.toString() ?? '',

    seasonId: json['season_id'] ?? 0,

    episodeName: json['episode_name']?.toString() ?? '',

    videoLink: json['video_link']?.toString() ?? '',

    showBrief: json['show_brief']?.toString() ?? '',

    episodeBrief: json['episode_brief']?.toString() ?? '',

    guestInfo: json['guest_info']?.toString() ?? '',

    credits: json['credits']?.toString() ?? '',

    relatedNews: json['related_news']?.toString() ?? '',

    albumNameId: json['album_name_id']?.toString() ?? '',

    photosGalleryId: json['photos_gallery_id']?.toString() ?? '',

    position: json['position'] ?? 0,

    status: json['status'] ?? false,

    Photo_category: json['Photo_category']?.toString() ?? '',

    album_id: json['album_id']?.toString() ?? '',

    photoGalleryList:
        (json['photo_gallery_list'] as List? ?? [])
            .map((e) => PhotoGallery.fromJson(e))
            .toList(),
  );
}
}

class PhotoGallery {
  final int id;
  final String photo;
  final String photoDescription;
  final String altTag;

  PhotoGallery({
    required this.id,
    required this.photo,
    required this.photoDescription,
    required this.altTag,
  });

  factory PhotoGallery.fromJson(Map<String, dynamic> json) {
    return PhotoGallery(
      id: json['id'],
      photo: json['photo'] ?? '',
      photoDescription: json['photo_description'] ?? '',
      altTag: json['alt_tag'] ?? '',
    );
  }
}

class ResponseInfo {
  final int n;
  final String msg;
  final String status;

  ResponseInfo({
    required this.n,
    required this.msg,
    required this.status,
  });

  factory ResponseInfo.fromJson(Map<String, dynamic> json) {
    return ResponseInfo(
      n: json['n'] ?? 0,
      msg: json['msg'] ?? '',
      status: json['status'] ?? '',
    );
  }
}