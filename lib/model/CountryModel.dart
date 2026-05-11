class CountryModel {
  final int id;
  final String name;
  final String code;
  final bool isActive;
  final String? catgname;

  CountryModel({
    required this.id,
    required this.name,
    required this.code,
    required this.isActive,
     this.catgname
  });

  factory CountryModel.fromJson(Map<String, dynamic> json) {
    return CountryModel(
      id: json['id'] ?? 0,
      name: json['country_name'] ?? "",
      code: json['country_code'] ?? "",
      isActive: json['isActive'] ?? false,
      catgname:json['catg_name'] ?? ""
    );
  }
}
class CategoryModel {
  final int id;
  final String name;
  final String? catgname;

  CategoryModel({
    required this.id,
    required this.name,
    this.catgname
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'] ?? 0,
      name: json['category_name'] ?? "", // ✅ FIX HERE
      catgname:json["catg_name"] ??""
    );
  }
}