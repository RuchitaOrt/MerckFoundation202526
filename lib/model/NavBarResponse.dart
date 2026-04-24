class NavBarResponse {
  final List<MenuItem> data;
  final ResponseInfo response;

  NavBarResponse({
    required this.data,
    required this.response,
  });

  factory NavBarResponse.fromJson(Map<String, dynamic> json) {
    return NavBarResponse(
      data: (json['data'] as List)
          .map((e) => MenuItem.fromJson(e))
          .toList(),
      response: ResponseInfo.fromJson(json['response']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'data': data.map((e) => e.toJson()).toList(),
      'response': response.toJson(),
    };
  }
}
class MenuItem {
  final int id;
  final String menuName;
  final String menuUrl;
  final String menuType;
  final List<MenuItem> submenu;

  MenuItem({
    required this.id,
    required this.menuName,
    required this.menuUrl,
    required this.menuType,
    required this.submenu,
  });

  factory MenuItem.fromJson(Map<String, dynamic> json) {
    return MenuItem(
      id: json['id'] ?? 0,
      menuName: json['menu_name'] ?? '',
      menuUrl: json['menu_url'] ?? '',
      menuType: json['menu_type'] ?? '',
      submenu: json['submenu'] != null
          ? (json['submenu'] as List)
              .map((e) => MenuItem.fromJson(e))
              .toList()
          : [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'menu_name': menuName,
      'menu_url': menuUrl,
      'menu_type': menuType,
      'submenu': submenu.map((e) => e.toJson()).toList(),
    };
  }
}
class ResponseInfo {
  final int n;
  final String msg;
  final String status;

  ResponseInfo({
    required this.n,
    required this.msg,
    required this.status,
  });

  factory ResponseInfo.fromJson(Map<String, dynamic> json) {
    return ResponseInfo(
      n: json['n'] ?? 0,
      msg: json['msg'] ?? '',
      status: json['status'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'n': n,
      'msg': msg,
      'status': status,
    };
  }
}