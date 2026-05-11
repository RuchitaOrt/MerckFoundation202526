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

  /// ✅ FIX
  final String language_id;

  /// ✅ LANGUAGES
  final List<AvailableLanguage> availableLanguages;

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
    required this.language_id,
    required this.availableLanguages,
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
      articleTypeDisplay:
          json['article_type_display'] ?? "",

      /// ✅ IMPORTANT FIX
      language_id:
          (json['language_id'] ?? "").toString(),

      /// ✅ PARSE LANGUAGE LIST
      availableLanguages:
          (json['available_languages'] as List? ?? [])
              .map(
                (e) => AvailableLanguage.fromJson(e),
              )
              .toList(),
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

  factory AvailableLanguage.fromJson(
      Map<String, dynamic> json) {
    return AvailableLanguage(
      articleId: json['article_id'] ?? 0,

      /// ✅ IMPORTANT FIX
      languageId:
          (json['language_id'] ?? "").toString(),

      language: json['language'] ?? "",
      abbr: json['abbr'] ?? "",
    );
  }
}
// class AvailableLanguage {
//   final int articleId;
//   final String languageId;
//   final String language;
//   final String abbr;
//   final String? googleLangCode;

//   AvailableLanguage({
//     required this.articleId,
//     required this.languageId,
//     required this.language,
//     required this.abbr,
//     this.googleLangCode,
//   });

//   factory AvailableLanguage.fromJson(Map<String, dynamic> json) {
//     return AvailableLanguage(
//       articleId: json['article_id'] ?? 0,
//       languageId: json['language_id'] ?? "",
//       language: json['language'] ?? "",
//       abbr: json['abbr'] ?? "",
//       googleLangCode: json['google_lang_code'],
//     );
//   }
// }

// class ArticleModel {
//   final int id;
//   final String title;
//   final String? subtitle;
//   final String shortDescription;
//   final String details;
//   final String image;
//   final String detailsPageUrl;
//   final String createdAt;
//   final String articleTypeDisplay;
//   final String? language_id;

//   /// ✅ AVAILABLE LANGUAGES
//   final List<AvailableLanguage> availableLanguages;

//   ArticleModel({
//     required this.id,
//     required this.title,
//     this.subtitle,
//     required this.shortDescription,
//     required this.details,
//     required this.image,
//     required this.detailsPageUrl,
//     required this.createdAt,
//     required this.articleTypeDisplay,
//     this.language_id,
//     required this.availableLanguages,
//   });

//   factory ArticleModel.fromJson(Map<String, dynamic> json) {
//     return ArticleModel(
//       id: json['id'] ?? 0,
//       title: json['title'] ?? "",
//       subtitle: json['subtitle'],
//       shortDescription: json['short_description'] ?? "",
//       details: json['details'] ?? "",
//       image: json['image'] ?? "",
//       detailsPageUrl: json['details_page_url'] ?? "",
//       createdAt: json['createdAt'] ?? "",
//       articleTypeDisplay: json['article_type_display'] ?? "",
//       language_id: json['language_id'] ?? "",

//       /// ✅ AVAILABLE LANGUAGES PARSE
//       availableLanguages: (json['available_languages'] as List? ?? [])
//           .map((e) => AvailableLanguage.fromJson(e))
//           .toList(),
//     );
//   }
// }
// // class ArticleModel {
// //   final int id;
// //   final String title;
// //   final String? subtitle;
// //   final String shortDescription;
// //   final String details;
// //   final String image;
// //   final String detailsPageUrl;
// //   final String createdAt;
// //   final String articleTypeDisplay;
// //   final String? language_id;

// //   ArticleModel({
// //     required this.id,
// //     required this.title,
// //     this.subtitle,
// //     required this.shortDescription,
// //     required this.details,
// //     required this.image,
// //     required this.detailsPageUrl,
// //     required this.createdAt,
// //     required this.articleTypeDisplay,
// //     this.language_id
// //   });

// //   factory ArticleModel.fromJson(Map<String, dynamic> json) {
// //     return ArticleModel(
// //       id: json['id'] ?? 0,
// //       title: json['title'] ?? "",
// //       subtitle: json['subtitle'],
// //       shortDescription: json['short_description'] ?? "",
// //       details: json['details'] ?? "",
// //       image: json['image'] ?? "",
// //       detailsPageUrl: json['details_page_url'] ?? "",
// //       createdAt: json['createdAt'] ?? "",
// //       articleTypeDisplay: json['article_type_display'] ?? "",
// //       language_id:json['language_id'] ?? ""
// //     );
// //   }
// // }