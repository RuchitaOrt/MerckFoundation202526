class TestimonialModel {
  final String image;
  final String title;
  final String testimonial_name;
  final String departmentName;
  final String shortDescription;
  final String details;

  TestimonialModel({
    required this.image,
    required this.title,
    required this.testimonial_name,
    required this.departmentName,
    required this.shortDescription,
    required this.details,
  });

  factory TestimonialModel.fromJson(Map<String,dynamic> json){
    return TestimonialModel(
      image: json['image'] ?? "",
      testimonial_name:json['testimonial_name']?? "",
      title: json['title'] ?? "",
      departmentName: json['department_name'] ?? "",
      shortDescription: json['short_description'] ?? "",
      details: json['details'] ?? "",
    );
  }
}