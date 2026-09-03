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
  final String language;
final String? leader_lang;
  /// ✅ FIX
  final String language_id;

  /// ✅ LANGUAGES
  final List<AvailableLanguage> availableLanguages;
  final BoilerPlateData? boilerPlateData;

  ArticleModel({
    required this.id,
    required this.title,
    this.subtitle,
    required this.shortDescription,
    required this.details,
    required this.image,
    required this.detailsPageUrl,
    required this.createdAt,
    required this.language,
    required this.articleTypeDisplay,
    required this.language_id,
    required this.availableLanguages,
    this.boilerPlateData,
    this.leader_lang
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
      language:json['language']??"",

      /// ✅ IMPORTANT FIX
      language_id: (json['language_id'] ?? "").toString(),

      /// ✅ PARSE LANGUAGE LIST
      availableLanguages: (json['available_languages'] as List? ?? [])
          .map((e) => AvailableLanguage.fromJson(e))
          .toList(),
      boilerPlateData: json['boiler_plate_data'] is Map<String, dynamic>
          ? BoilerPlateData.fromJson(json['boiler_plate_data'])
          : null,
          leader_lang:json['leader_lang'] ?? ""
    );
  }
}

class AvailableLanguage {
  final int articleId;
  final String languageId;
  final String language;
  final String abbr;

  AvailableLanguage({
    required this.articleId,
    required this.languageId,
    required this.language,
    required this.abbr,
  });

  factory AvailableLanguage.fromJson(Map<String, dynamic> json) {
    return AvailableLanguage(
      articleId: json['article_id'] ?? 0,

      /// ✅ IMPORTANT FIX
      languageId: (json['language_id'] ?? "").toString(),

      language: json['language'] ?? "",
      abbr: json['abbr'] ?? "",
    );
  }
}

class BoilerPlateData {
  final int? id;
  final String? createdAt;
  final String? updatedAt;
  final String? createdBy;
  final String? updatedBy;
  final bool? isActive;
  final dynamic deletedBy;
  final dynamic deletedAt;
  final dynamic viewedBy;
  final dynamic viewedAt;
  final String? title;
  final String? subtitle;
  final String? description;
  final String? content;
  final bool? status;

  BoilerPlateData({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.createdBy,
    this.updatedBy,
    this.isActive,
    this.deletedBy,
    this.deletedAt,
    this.viewedBy,
    this.viewedAt,
    this.title,
    this.subtitle,
    this.description,
    this.content,
    this.status,
  });

  factory BoilerPlateData.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return BoilerPlateData();
    }

    return BoilerPlateData(
      id: json['id'] is int
          ? json['id']
          : int.tryParse(json['id']?.toString() ?? ''),

      createdAt: json['createdAt']?.toString(),

      updatedAt: json['updatedAt']?.toString(),

      createdBy: json['createdBy']?.toString(),

      updatedBy: json['updatedBy']?.toString(),

      isActive: json['isActive'] is bool ? json['isActive'] : null,

      deletedBy: json['deletedBy'],

      deletedAt: json['deletedAt'],

      viewedBy: json['viewedBy'],

      viewedAt: json['viewedAt'],

      title: json['title']?.toString(),

      subtitle: json['subtitle']?.toString(),

      description: json['description']?.toString(),

      content: json['content']?.toString(),

      status: json['status'] is bool ? json['status'] : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'createdBy': createdBy,
      'updatedBy': updatedBy,
      'isActive': isActive,
      'deletedBy': deletedBy,
      'deletedAt': deletedAt,
      'viewedBy': viewedBy,
      'viewedAt': viewedAt,
      'title': title,
      'subtitle': subtitle,
      'description': description,
      'content': content,
      'status': status,
    };
  }
}
