class TestimonialModel {
  final String image;
  final String title;
  final String departmentName;
  final String shortDescription;
  final String details;

  TestimonialModel({
    required this.image,
    required this.title,
    required this.departmentName,
    required this.shortDescription,
    required this.details,
  });

  factory TestimonialModel.fromJson(Map<String,dynamic> json){
    return TestimonialModel(
      image: json['image'] ?? "",
      title: json['title'] ?? "",
      departmentName: json['department_name'] ?? "",
      shortDescription: json['short_description'] ?? "",
      details: json['details'] ?? "",
    );
  }
}