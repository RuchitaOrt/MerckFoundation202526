// class SearchModel {
//   List<SearchData> data;
//   int total;
//   SearchResponse? response;

//   SearchModel({
//     this.data = const [],
//     this.total = 0,
//     this.response,
//   });

//   factory SearchModel.fromJson(Map<String, dynamic>? json) {
//     if (json == null) {
//       return SearchModel();
//     }

//     return SearchModel(
//       data: (json['data'] as List?)
//               ?.map((e) => SearchData.fromJson(e))
//               .toList() ??
//           [],
//       total: json['total'] ?? 0,
//       response: json['response'] != null
//           ? SearchResponse.fromJson(json['response'])
//           : null,
//     );
//   }
// }
class SearchModel {
  int? count;
  int? currentPage;
  int? pageSize;
  int? totalPages;
  int? next;
  int? previous;

  List<SearchData>? results;

  SearchModel.fromJson(Map<String,dynamic> json){
    count = json["count"];
    currentPage = json["current_page"];
    pageSize = json["page_size"];
    totalPages = json["total_pages"];
    next = json["next"];
    previous = json["previous"];

    results = (json["results"] as List)
        .map((e)=>SearchData.fromJson(e))
        .toList();
  }
}
class SearchResponse {
  int n;
  String msg;
  String status;

  SearchResponse({
    this.n = 0,
    this.msg = '',
    this.status = '',
  });

  factory SearchResponse.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return SearchResponse();
    }

    return SearchResponse(
      n: json['n'] ?? 0,
      msg: json['msg']?.toString() ?? '',
      status: json['status']?.toString() ?? '',
    );
  }
}

class SearchData {
  String? id;
  String source;
  String sourceType;
  String itemId;
  int? pageMenuId;
  int? sectionId;
  String sectionName;
  String channel;
  String layoutId;
  String layoutType;
  String layoutTitle;
  String title;
  String subtitle;
  String description;
  String subdescription;
  String thumbnail;
  String pageUrl;
  String substackUrl;
  String rashawebUrl;

  SearchData({
    this.id,
    this.source = '',
    this.sourceType = '',
    this.itemId = '',
    this.pageMenuId,
    this.sectionId,
    this.sectionName = '',
    this.channel = '',
    this.layoutId = '',
    this.layoutType = '',
    this.layoutTitle = '',
    this.title = '',
    this.subtitle = '',
    this.description = '',
    this.subdescription = '',
    this.thumbnail = '',
    this.pageUrl = '',
    this.substackUrl = '',
    this.rashawebUrl = '',
  });

  factory SearchData.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return SearchData();
    }

    return SearchData(
      id: json['id']?.toString() ?? '',
      source: json['source']?.toString() ?? '',
      sourceType: json['source_type']?.toString() ?? '',
      itemId: json['item_id']?.toString() ?? '',
      pageMenuId: json['page_menu_id'],
      sectionId: json['section_id'],
      sectionName: json['section_name']?.toString() ?? '',
      channel: json['channel']?.toString() ?? '',
      layoutId: json['layout_id']?.toString() ?? '',
      layoutType: json['layout_type']?.toString() ?? '',
      layoutTitle: json['layout_title']?.toString() ?? '',
      title: json['title']?.toString() ?? '',
      subtitle: json['subtitle']?.toString() ?? '',
      description: json['description']?.toString() ?? '',
      subdescription: json['subdescription']?.toString() ?? '',
      thumbnail: json['thumbnail']?.toString() ?? '',
      pageUrl: json['page_url']?.toString() ?? '',
      substackUrl: json['substack_url']?.toString() ?? '',
      rashawebUrl: json['rashaweb_url']?.toString() ?? '',
    );
  }
}