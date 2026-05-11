class MediaModel {
  final int id;
  final String title;
  final String image;
  final String articleUrl;
  final String description;
  final String? pdfFile;

  MediaModel({
    required this.id,
    required this.title,
    required this.image,
    required this.articleUrl,
    required this.description,
    this.pdfFile
  });

  factory MediaModel.fromJson(Map<String, dynamic> json) {
    return MediaModel(
      id: json['id'] ?? 0,
      title: (json['title'] ?? "").toString(),
      image: (json['image'] ?? "").toString(),
      articleUrl: (json['media_url'] ?? "").toString(),
      description: (json['description'] ?? "").toString(),
      pdfFile:json['pdf_file'] ?? ""
    );
  }
}