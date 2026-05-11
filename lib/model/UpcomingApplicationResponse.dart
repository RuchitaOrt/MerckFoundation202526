class UpcomingApplicationResponse {
  final String status;
  final int count;
  final String? next;
  final String? previous;
  final List<UpcomingApplication> data;

  UpcomingApplicationResponse({
    required this.status,
    required this.count,
    this.next,
    this.previous,
    required this.data,
  });

  factory UpcomingApplicationResponse.fromJson(Map<String, dynamic> json) {
    return UpcomingApplicationResponse(
      status: json['status'] ?? '',
      count: json['count'] ?? 0,
      next: json['next'],
      previous: json['previous'],
      data: (json['data'] as List)
          .map((e) => UpcomingApplication.fromJson(e))
          .toList(),
    );
  }
}

class UpcomingApplication {
  final int id;
  final String title;
  final int eventType;
  final String eventStartDate;
  final String eventEndDate;
  final String? pdfFile;
   final String? image;

  UpcomingApplication({
    required this.id,
    required this.title,
    required this.eventType,
    required this.eventStartDate,
    required this.eventEndDate,
    this.pdfFile,
    this.image
  });

  factory UpcomingApplication.fromJson(Map<String, dynamic> json) {
    return UpcomingApplication(
      id: json['id'] ?? 0,
      title: json['title'] ?? '',
      eventType: json['event_type'] ?? 0,
      eventStartDate: json['event_start_date'] ?? '',
      eventEndDate: json['event_end_date'] ?? '',
      pdfFile: json['pdf_file'],
      image:json["image"]
    );
  }
}