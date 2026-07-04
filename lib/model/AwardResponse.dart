class AwardModel {
  final int id;
  final bool isActive;
  final String title;
  final String? subtitle;
  final String? subdescription;
  final String pageUrl;
  final String image;
  final String? altText;
  final bool status;
  final String? colorCode;
  final int? menuId;

  AwardModel({
    required this.id,
    required this.isActive,
    required this.title,
    this.subdescription,
    this.subtitle,
    required this.pageUrl,
    required this.image,
    this.altText,
    required this.status,
    this.colorCode, required this.menuId, 
  });

  factory AwardModel.fromJson(Map<String, dynamic> json) {
    return AwardModel(
      id: json['id'] ?? 0,
      isActive: json['isActive'] ?? false,
      title: json['title'] ?? "",
      subtitle: json['subtitle'],
      pageUrl: json['page_url'] ?? "",
      image: json['image'] ?? "",
      altText: json['alt_text'],
      status: json['status'] ?? false,
      colorCode: json['color_code'],
      menuId: json['menu_id'] ,
      subdescription:json['subdescription']
    );
  }
}