class ArticleModel {
  final int id;
  final String title;
  final String? subtitle;
  final String shortDescription;
  final String details;
  final String image;
  final String detailsPageUrl;
  final String createdAt;
  final String articleTypeDisplay;

  ArticleModel({
    required this.id,
    required this.title,
    this.subtitle,
    required this.shortDescription,
    required this.details,
    required this.image,
    required this.detailsPageUrl,
    required this.createdAt,
    required this.articleTypeDisplay,
  });

  factory ArticleModel.fromJson(Map<String, dynamic> json) {
    return ArticleModel(
      id: json['id'] ?? 0,
      title: json['title'] ?? "",
      subtitle: json['subtitle'],
      shortDescription: json['short_description'] ?? "",
      details: json['details'] ?? "",
      image: json['image'] ?? "",
      detailsPageUrl: json['details_page_url'] ?? "",
      createdAt: json['createdAt'] ?? "",
      articleTypeDisplay: json['article_type_display'] ?? "",
    );
  }
}