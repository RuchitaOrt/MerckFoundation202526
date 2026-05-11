class OurPartnersResponse {
  final String status;
  final int count;
  final String? next;
  final String? previous;
  final List<PartnerItem> data;

  OurPartnersResponse({
    required this.status,
    required this.count,
    this.next,
    this.previous,
    required this.data,
  });

  factory OurPartnersResponse.fromJson(Map<String, dynamic> json) {
    return OurPartnersResponse(
      status: json['status'] ?? '',
      count: json['count'] ?? 0,
      next: json['next'],
      previous: json['previous'],
      data: (json['data'] as List? ?? [])
          .map((e) => PartnerItem.fromJson(e))
          .toList(),
    );
  }
}

class PartnerItem {
  final int id;
  final String title;
  final String? subtitle;
  final String pageUrl;
  final String image;
  final String? altText;
  final bool status;

  PartnerItem({
    required this.id,
    required this.title,
    this.subtitle,
    required this.pageUrl,
    required this.image,
    this.altText,
    required this.status,
  });

  factory PartnerItem.fromJson(Map<String, dynamic> json) {
    return PartnerItem(
      id: json['id'] ?? 0,
      title: json['title'] ?? '',
      subtitle: json['subtitle'],
      pageUrl: json['page_url'] ?? '',
      image: json['image'] ?? '',
      altText: json['alt_text'],
      status: json['status'] ?? false,
    );
  }
}