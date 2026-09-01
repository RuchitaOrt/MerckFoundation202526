class StoryModel {
  final int id;
  final String title;
  final String? subtitle;
  final String videoLink;
  final String? image;
  final String? details;
  final String videoDesc;
  final int year;
  final int country;
  final List<String> categories;
  final String? photo_category_name;
  final String? thumbnail_image;
  final String? document;
  final String? photo;
  final String? photo_description;
  final String? episode_name;
  final String? languageid;
  final String? description;
  final String? thumbnail;
  final String? pdfFile;
  final String? page_url;

  StoryModel({
    required this.id,
    required this.title,
    this.subtitle,
    required this.videoLink,
    required this.videoDesc,
    this.image,
    this.details,
    required this.year,
    required this.country,
    required this.categories,
    this.photo_category_name,
    this.thumbnail_image,
    this.document,
    this.photo,
    this.photo_description,
    this.episode_name,
    this.languageid,
    this.description,
    this.thumbnail,
    this.pdfFile,
    this.page_url
  });

  factory StoryModel.fromJson(Map<String, dynamic> json) {
    return StoryModel(
      id: json['id'] ?? 0,

      title: json['title']?.toString() ?? "",

      subtitle: json['subtitle']?.toString(),

      videoLink: json['video_link']?.toString() ?? "",

      videoDesc: json['video_desc']?.toString() ?? "",

      image: json['image']?.toString() ?? "",

      details: json['details']?.toString() ?? "",

      year: json['year'] ?? 0,

      country: json['country'] ?? 0,

      photo_category_name: json['photo_category_name']?.toString() ?? "",

      thumbnail_image: json['thumbnail_image']?.toString() ?? "",
      thumbnail: json['thumbnail']?.toString() ?? "",

      document: json['document']?.toString() ?? "",

      categories: json['category_names'] is List
          ? (json['category_names'] as List)
                .map((e) => e is Map ? e['name']?.toString() ?? "" : "")
                .toList()
          : [],
      photo: json['photo'] ?? "",
      photo_description: json['photo_description'] ?? "",
      episode_name: json['episode_name'] ?? "",
      languageid: json['language_id'] ?? "",
      description: json['description'] ?? "",
      pdfFile:json["page_url"] ??"",
      page_url:json['page_url'] ?? ""
  
    );
  }
}
