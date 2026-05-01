class StoryModel {
  final int id;
  final String title;
  final String? subtitle;
  final String videoLink;
  final String videoDesc;
  final int year;
  final int country;
  final List<String> categories;

  StoryModel({
    required this.id,
    required this.title,
    this.subtitle,
    required this.videoLink,
    required this.videoDesc,
    required this.year,
    required this.country,
    required this.categories,
  });

  factory StoryModel.fromJson(Map<String, dynamic> json) {
    return StoryModel(
      id: json['id'] ?? 0,
      title: json['title'] ?? "",
      subtitle: json['subtitle'],
      videoLink: json['video_link'] ?? "",
      videoDesc: json['video_desc'] ?? "",
      year: json['year'] ?? 0,
      country: json['country'] ?? 0,
      categories: (json['category_names'] as List? ?? [])
          .map((e) => e['name']?.toString() ?? "")
          .toList(),
    );
  }
}