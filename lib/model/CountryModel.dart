class CountryModel {
  final int id;
  final String name;
  final String code;
  final bool isActive;

  CountryModel({
    required this.id,
    required this.name,
    required this.code,
    required this.isActive,
  });

  factory CountryModel.fromJson(Map<String, dynamic> json) {
    return CountryModel(
      id: json['id'] ?? 0,
      name: json['country_name'] ?? "",
      code: json['country_code'] ?? "",
      isActive: json['isActive'] ?? false,
    );
  }
}
class CategoryModel {
  final int id;
  final String name;

  CategoryModel({
    required this.id,
    required this.name,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'] ?? 0,
      name: json['category_name'] ?? "", // ✅ FIX HERE
    );
  }
}