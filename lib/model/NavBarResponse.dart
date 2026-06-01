
// class NavBarResponse {
//   final List<MenuItem> data;
//   final List<MobileBottomMenu> mobileBottomMenus;
//   final String liveWebsiteUrl;
//   final ResponseModel response;

//   NavBarResponse({
//     required this.data,
//     required this.mobileBottomMenus,
//     required this.liveWebsiteUrl,
//     required this.response,
//   });

//   factory NavBarResponse.fromJson(Map<String, dynamic> json) {
//     return NavBarResponse(
//       data: (json['data'] as List<dynamic>?)
//               ?.map((e) => MenuItem.fromJson(e))
//               .toList() ??
//           [],
//       mobileBottomMenus:
//           (json['mobile_bottom_menus'] as List<dynamic>?)
//                   ?.map((e) => MobileBottomMenu.fromJson(e))
//                   .toList() ??
//               [],
//       liveWebsiteUrl: json['live_website_url'] ?? '',
//       response: ResponseModel.fromJson(json['response'] ?? {}),
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'data': data.map((e) => e.toJson()).toList(),
//       'mobile_bottom_menus':
//           mobileBottomMenus.map((e) => e.toJson()).toList(),
//       'live_website_url': liveWebsiteUrl,
//       'response': response.toJson(),
//     };
//   }
// }

// class MenuItem {
//   final int id;
//   final String menuName;
//   final String menuTitle;
//   final String menuUrl;
//   final String menuType;
//   final bool shareLink;
//   final String mobilelogo;
//   final List<SubMenu> submenu;

//   MenuItem({
//     required this.id,
//     required this.menuName,
//     required this.menuTitle,
//     required this.menuUrl,
//     required this.menuType,
//     required this.shareLink,
//     required this.submenu, required this.mobilelogo,
//   });

//   factory MenuItem.fromJson(Map<String, dynamic> json) {
//     return MenuItem(
//       id: json['id'] ?? 0,
//       menuName: json['menu_name'] ?? '',
//       menuTitle: json['menu_title'] ?? '',
//       menuUrl: json['menu_url'] ?? '',
//       menuType: json['menu_type'] ?? '',
//       shareLink: json['share_link'] ?? false,
//       submenu: (json['submenu'] as List<dynamic>?)
//               ?.map((e) => SubMenu.fromJson(e))
//               .toList() ??
//           [],
//           mobilelogo:json['mobile_logo']
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'id': id,
//       'menu_name': menuName,
//       'menu_title': menuTitle,
//       'menu_url': menuUrl,
//       'menu_type': menuType,
//       'share_link': shareLink,
//       'submenu': submenu.map((e) => e.toJson()).toList(),
//       "mobile_logo":mobilelogo
//     };
//   }
// }

// class SubMenu {
//   final int id;
//   final String menuName;
//   final String menuTitle;
//   final String menuUrl;
//   final String menuType;
//   final bool shareLink;
//   final String mobilelogo;

//   SubMenu({
//     required this.id,
//     required this.menuName,
//     required this.menuTitle,
//     required this.menuUrl,
//     required this.menuType,
//     required this.shareLink,
//     required this.mobilelogo,
//   });

//   factory SubMenu.fromJson(Map<String, dynamic> json) {
//     return SubMenu(
//       id: json['id'] ?? 0,
//       menuName: json['menu_name'] ?? '',
//       menuTitle: json['menu_title'] ?? '',
//       menuUrl: json['menu_url'] ?? '',
//       menuType: json['menu_type'] ?? '',
//       shareLink: json['share_link'] ?? false,
//        mobilelogo:json['mobile_logo']
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'id': id,
//       'menu_name': menuName,
//       'menu_title': menuTitle,
//       'menu_url': menuUrl,
//       'menu_type': menuType,
//       'share_link': shareLink,
//        "mobile_logo":mobilelogo
//     };
//   }
// }

// class MobileBottomMenu {
//   final int id;
//   final String menuName;
//   final String menuTitle;
//   final String menuUrl;
//   final bool shareLink;
//   final String mobilelogo;

//   MobileBottomMenu({
//     required this.id,
//     required this.menuName,
//     required this.menuTitle,
//     required this.menuUrl,
//     required this.shareLink, required this.mobilelogo,
//   });

//   factory MobileBottomMenu.fromJson(Map<String, dynamic> json) {
//     return MobileBottomMenu(
//       id: json['id'] ?? 0,
//       menuName: json['menu_name'] ?? '',
//       menuTitle: json['menu_title'] ?? '',
//       menuUrl: json['menu_url'] ?? '',
//       shareLink: json['share_link'] ?? false,
//       mobilelogo: json['mobile_logo']
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'id': id,
//       'menu_name': menuName,
//       'menu_title': menuTitle,
//       'menu_url': menuUrl,
//       'share_link': shareLink,
//       "mobile_logo":mobilelogo
//     };
//   }
// }

// class ResponseModel {
//   final int n;
//   final String msg;
//   final String status;

//   ResponseModel({
//     required this.n,
//     required this.msg,
//     required this.status,
//   });

//   factory ResponseModel.fromJson(Map<String, dynamic> json) {
//     return ResponseModel(
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
  final ResponseModel? response;

  NavBarResponse({
    required this.data,
    required this.mobileBottomMenus,
    required this.liveWebsiteUrl,
    this.response,
  });

  factory NavBarResponse.fromJson(Map<String, dynamic> json) {
    return NavBarResponse(
      data: (json['data'] as List?)
              ?.map((e) => MenuItem.fromJson(e))
              .toList() ??
          [],

      mobileBottomMenus:
          (json['mobile_bottom_menus'] as List?)
                  ?.map((e) => MobileBottomMenu.fromJson(e))
                  .toList() ??
              [],

      liveWebsiteUrl:
          json['live_website_url']?.toString() ?? "",

      response: json['response'] != null
          ? ResponseModel.fromJson(json['response'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "data": data.map((e) => e.toJson()).toList(),
      "mobile_bottom_menus":
          mobileBottomMenus.map((e) => e.toJson()).toList(),
      "live_website_url": liveWebsiteUrl,
      "response": response?.toJson(),
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
  final String mobileLogo;
  final List<SubMenu> submenu;

  MenuItem({
    required this.id,
    required this.menuName,
    required this.menuTitle,
    required this.menuUrl,
    required this.menuType,
    required this.shareLink,
    required this.mobileLogo,
    required this.submenu,
  });

  factory MenuItem.fromJson(Map<String, dynamic> json) {
    return MenuItem(
      id: json['id'] ?? 0,
      menuName: json['menu_name']?.toString() ?? "",
      menuTitle: json['menu_title']?.toString() ?? "",
      menuUrl: json['menu_url']?.toString() ?? "",
      menuType: json['menu_type']?.toString() ?? "",
      shareLink: json['share_link'] ?? false,
      mobileLogo: json['mobile_logo']?.toString() ?? "",

      submenu: (json['submenu'] as List?)
              ?.map((e) => SubMenu.fromJson(e))
              .toList() ??
          [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "menu_name": menuName,
      "menu_title": menuTitle,
      "menu_url": menuUrl,
      "menu_type": menuType,
      "share_link": shareLink,
      "mobile_logo": mobileLogo,
      "submenu": submenu.map((e) => e.toJson()).toList(),
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
  final String mobileLogo;

  SubMenu({
    required this.id,
    required this.menuName,
    required this.menuTitle,
    required this.menuUrl,
    required this.menuType,
    required this.shareLink,
    required this.mobileLogo,
  });

  factory SubMenu.fromJson(Map<String, dynamic> json) {
    return SubMenu(
      id: json['id'] ?? 0,
      menuName: json['menu_name']?.toString() ?? "",
      menuTitle: json['menu_title']?.toString() ?? "",
      menuUrl: json['menu_url']?.toString() ?? "",
      menuType: json['menu_type']?.toString() ?? "",
      shareLink: json['share_link'] ?? false,
      mobileLogo: json['mobile_logo']?.toString() ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "menu_name": menuName,
      "menu_title": menuTitle,
      "menu_url": menuUrl,
      "menu_type": menuType,
      "share_link": shareLink,
      "mobile_logo": mobileLogo,
    };
  }
}

class MobileBottomMenu {
  final int id;
  final String menuName;
  final String menuTitle;
  final String menuUrl;
  final bool shareLink;
  final String mobileMenuIcon;

  MobileBottomMenu({
    required this.id,
    required this.menuName,
    required this.menuTitle,
    required this.menuUrl,
    required this.shareLink,
    required this.mobileMenuIcon,
  });

  factory MobileBottomMenu.fromJson(
      Map<String, dynamic> json) {
    return MobileBottomMenu(
      id: json['id'] ?? 0,
      menuName: json['menu_name']?.toString() ?? "",
      menuTitle: json['menu_title']?.toString() ?? "",
      menuUrl: json['menu_url']?.toString() ?? "",
      shareLink: json['share_link'] ?? false,
      mobileMenuIcon:
          json['mobile_menu_icon']?.toString() ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "menu_name": menuName,
      "menu_title": menuTitle,
      "menu_url": menuUrl,
      "share_link": shareLink,
      "mobile_menu_icon": mobileMenuIcon,
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

  factory ResponseModel.fromJson(
      Map<String, dynamic> json) {
    return ResponseModel(
      n: json['n'] ?? 0,
      msg: json['msg']?.toString() ?? "",
      status: json['status']?.toString() ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "n": n,
      "msg": msg,
      "status": status,
    };
  }
}