// class NavBarResponse {
//   final List<MenuItem> data;
//   final ResponseInfo response;
//   final String 
//   NavBarResponse({
//     required this.data,
//     required this.response,
//   });

//   factory NavBarResponse.fromJson(Map<String, dynamic> json) {
//     return NavBarResponse(
//       data: (json['data'] as List)
//           .map((e) => MenuItem.fromJson(e))
//           .toList(),
//       response: ResponseInfo.fromJson(json['response']),
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'data': data.map((e) => e.toJson()).toList(),
//       'response': response.toJson(),
//     };
//   }
// }
// class MenuItem {
//   final int id;
//   final String menuName;
//   final String menuUrl;
//   final String menuType;
//   final List<MenuItem> submenu;

//   MenuItem({
//     required this.id,
//     required this.menuName,
//     required this.menuUrl,
//     required this.menuType,
//     required this.submenu,
//   });

//   factory MenuItem.fromJson(Map<String, dynamic> json) {
//     return MenuItem(
//       id: json['id'] ?? 0,
//       menuName: json['menu_name'] ?? '',
//       menuUrl: json['menu_url'] ?? '',
//       menuType: json['menu_type'] ?? '',
//       submenu: json['submenu'] != null
//           ? (json['submenu'] as List)
//               .map((e) => MenuItem.fromJson(e))
//               .toList()
//           : [],
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'id': id,
//       'menu_name': menuName,
//       'menu_url': menuUrl,
//       'menu_type': menuType,
//       'submenu': submenu.map((e) => e.toJson()).toList(),
//     };
//   }
// }
// class ResponseInfo {
//   final int n;
//   final String msg;
//   final String status;

//   ResponseInfo({
//     required this.n,
//     required this.msg,
//     required this.status,
//   });

//   factory ResponseInfo.fromJson(Map<String, dynamic> json) {
//     return ResponseInfo(
//       n: json['n'] ?? 0,
//       msg: json['msg'] ?? '',
//       status: json['status'] ?? '',
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'n': n,
//       'msg': msg,
//       'status': status,
//     };
//   }
// }
class NavBarResponse {
  final List<MenuItem> data;
  final List<MobileBottomMenu> mobileBottomMenus;
  final String liveWebsiteUrl;
  final ResponseModel response;

  NavBarResponse({
    required this.data,
    required this.mobileBottomMenus,
    required this.liveWebsiteUrl,
    required this.response,
  });

  factory NavBarResponse.fromJson(Map<String, dynamic> json) {
    return NavBarResponse(
      data: (json['data'] as List<dynamic>?)
              ?.map((e) => MenuItem.fromJson(e))
              .toList() ??
          [],
      mobileBottomMenus:
          (json['mobile_bottom_menus'] as List<dynamic>?)
                  ?.map((e) => MobileBottomMenu.fromJson(e))
                  .toList() ??
              [],
      liveWebsiteUrl: json['live_website_url'] ?? '',
      response: ResponseModel.fromJson(json['response'] ?? {}),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'data': data.map((e) => e.toJson()).toList(),
      'mobile_bottom_menus':
          mobileBottomMenus.map((e) => e.toJson()).toList(),
      'live_website_url': liveWebsiteUrl,
      'response': response.toJson(),
    };
  }
}

class MenuItem {
  final int id;
  final String menuName;
  final String menuTitle;
  final String menuUrl;
  final String menuType;
  final bool shareLink;
  final List<SubMenu> submenu;

  MenuItem({
    required this.id,
    required this.menuName,
    required this.menuTitle,
    required this.menuUrl,
    required this.menuType,
    required this.shareLink,
    required this.submenu,
  });

  factory MenuItem.fromJson(Map<String, dynamic> json) {
    return MenuItem(
      id: json['id'] ?? 0,
      menuName: json['menu_name'] ?? '',
      menuTitle: json['menu_title'] ?? '',
      menuUrl: json['menu_url'] ?? '',
      menuType: json['menu_type'] ?? '',
      shareLink: json['share_link'] ?? false,
      submenu: (json['submenu'] as List<dynamic>?)
              ?.map((e) => SubMenu.fromJson(e))
              .toList() ??
          [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'menu_name': menuName,
      'menu_title': menuTitle,
      'menu_url': menuUrl,
      'menu_type': menuType,
      'share_link': shareLink,
      'submenu': submenu.map((e) => e.toJson()).toList(),
    };
  }
}

class SubMenu {
  final int id;
  final String menuName;
  final String menuTitle;
  final String menuUrl;
  final String menuType;
  final bool shareLink;

  SubMenu({
    required this.id,
    required this.menuName,
    required this.menuTitle,
    required this.menuUrl,
    required this.menuType,
    required this.shareLink,
  });

  factory SubMenu.fromJson(Map<String, dynamic> json) {
    return SubMenu(
      id: json['id'] ?? 0,
      menuName: json['menu_name'] ?? '',
      menuTitle: json['menu_title'] ?? '',
      menuUrl: json['menu_url'] ?? '',
      menuType: json['menu_type'] ?? '',
      shareLink: json['share_link'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'menu_name': menuName,
      'menu_title': menuTitle,
      'menu_url': menuUrl,
      'menu_type': menuType,
      'share_link': shareLink,
    };
  }
}

class MobileBottomMenu {
  final int id;
  final String menuName;
  final String menuTitle;
  final String menuUrl;
  final bool shareLink;

  MobileBottomMenu({
    required this.id,
    required this.menuName,
    required this.menuTitle,
    required this.menuUrl,
    required this.shareLink,
  });

  factory MobileBottomMenu.fromJson(Map<String, dynamic> json) {
    return MobileBottomMenu(
      id: json['id'] ?? 0,
      menuName: json['menu_name'] ?? '',
      menuTitle: json['menu_title'] ?? '',
      menuUrl: json['menu_url'] ?? '',
      shareLink: json['share_link'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'menu_name': menuName,
      'menu_title': menuTitle,
      'menu_url': menuUrl,
      'share_link': shareLink,
    };
  }
}

class ResponseModel {
  final int n;
  final String msg;
  final String status;

  ResponseModel({
    required this.n,
    required this.msg,
    required this.status,
  });

  factory ResponseModel.fromJson(Map<String, dynamic> json) {
    return ResponseModel(
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