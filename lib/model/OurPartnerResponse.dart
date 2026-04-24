class PageResponse {
  final PageData? data;
  final ApiResponse? response;

  PageResponse({this.data, this.response});

  factory PageResponse.fromJson(Map<String, dynamic>? json) {
    if (json == null) return PageResponse();

    return PageResponse(
      data: PageData.fromJson(json['data']),
      response: ApiResponse.fromJson(json['response']),
    );
  }
}
class PageData {
  final JsonData? jsonData;
  final List<MenuItem> pageMenuList;
  final int? currentMenuId;
  final String? channel;

  PageData({
    this.jsonData,
    this.pageMenuList = const [],
    this.currentMenuId,
    this.channel,
  });

  factory PageData.fromJson(Map<String, dynamic>? json) {
    if (json == null) return PageData();

    return PageData(
      jsonData: JsonData.fromJson(json['json_data']),
      pageMenuList: (json['page_menu_list'] as List?)
              ?.map((e) => MenuItem.fromJson(e))
              .toList() ??
          [],
      currentMenuId: json['current_menu_id'],
      channel: json['channel'],
    );
  }
}
class JsonData {
  final List<LayoutSection> slider;
  final List<LayoutSection> top;
  final List<LayoutSection> middleLeft;
  final List<LayoutSection> middleRight;
  final List<LayoutSection> bottom;

  JsonData({
    this.slider = const [],
    this.top = const [],
    this.middleLeft = const [],
    this.middleRight = const [],
    this.bottom = const [],
  });

  factory JsonData.fromJson(Map<String, dynamic>? json) {
    if (json == null) return JsonData();

    List<LayoutSection> parseList(dynamic list) {
      return (list as List?)
              ?.map((e) => LayoutSection.fromJson(e))
              .toList() ??
          [];
    }

    return JsonData(
      slider: parseList(json['slider']),
      top: parseList(json['top']),
      middleLeft: parseList(json['middle_left']),
      middleRight: parseList(json['middle_right']),
      bottom: parseList(json['bottom']),
    );
  }
}
class LayoutSection {
  final int? layoutId;
  final String? layoutType;
  final int? layoutIndex;
  final String? title;
  final List<ContentItem> content;

  LayoutSection({
    this.layoutId,
    this.layoutType,
    this.layoutIndex,
    this.title,
    this.content = const [],
  });

  factory LayoutSection.fromJson(Map<String, dynamic>? json) {
    if (json == null) return LayoutSection();

    return LayoutSection(
      layoutId: json['layout_id'],
      layoutType: json['layout_type'],
      layoutIndex: json['layout_index'],
      title: json['title'],
      content: (json['content'] as List?)
              ?.where((e) => e != null) // 👈 handles "=" or null
              .map((e) => ContentItem.fromJson(e))
              .toList() ??
          [],
    );
  }
}
class ContentItem {
  final int? id;
  final int? position;
  final String? title;
  final String? subtitle;
  final String? description;
  final String? subdescription;
  final String? thumbnail;

  ContentItem({
    this.id,
    this.position,
    this.title,
    this.subtitle,
    this.description,
    this.subdescription,
    this.thumbnail,
  });

  factory ContentItem.fromJson(Map<String, dynamic>? json) {
    if (json == null) return ContentItem();

    return ContentItem(
      id: json['id'],
      position: json['position'],
      title: json['title'] ?? '',
      subtitle: json['subtitle'] ?? '',
      description: json['description'] ?? '',
      subdescription: json['subdescription'] ?? '',
      thumbnail: json['thumbnail'] ?? '',
    );
  }
}
class MenuItem {
  final int? id;
  final String? menuName;
  final String? menuUrl;
  final String? menuTitle;

  MenuItem({
    this.id,
    this.menuName,
    this.menuUrl,
    this.menuTitle,
  });

  factory MenuItem.fromJson(Map<String, dynamic>? json) {
    if (json == null) return MenuItem();

    return MenuItem(
      id: json['id'],
      menuName: json['menu_name'],
      menuUrl: json['menu_url'],
      menuTitle: json['menu_title'],
    );
  }
}
class ApiResponse {
  final String? msg;
  final String? status;

  ApiResponse({this.msg, this.status});

  factory ApiResponse.fromJson(Map<String, dynamic>? json) {
    if (json == null) return ApiResponse();

    return ApiResponse(
      msg: json['msg'],
      status: json['status'],
    );
  }
}