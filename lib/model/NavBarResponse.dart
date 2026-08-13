
// // class NavBarResponse {
// //   final List<MenuItem> data;
// //   final List<MobileBottomMenu> mobileBottomMenus;
// //   final String liveWebsiteUrl;
// //   final ResponseModel response;

// //   NavBarResponse({
// //     required this.data,
// //     required this.mobileBottomMenus,
// //     required this.liveWebsiteUrl,
// //     required this.response,
// //   });

// //   factory NavBarResponse.fromJson(Map<String, dynamic> json) {
// //     return NavBarResponse(
// //       data: (json['data'] as List<dynamic>?)
// //               ?.map((e) => MenuItem.fromJson(e))
// //               .toList() ??
// //           [],
// //       mobileBottomMenus:
// //           (json['mobile_bottom_menus'] as List<dynamic>?)
// //                   ?.map((e) => MobileBottomMenu.fromJson(e))
// //                   .toList() ??
// //               [],
// //       liveWebsiteUrl: json['live_website_url'] ?? '',
// //       response: ResponseModel.fromJson(json['response'] ?? {}),
// //     );
// //   }

// //   Map<String, dynamic> toJson() {
// //     return {
// //       'data': data.map((e) => e.toJson()).toList(),
// //       'mobile_bottom_menus':
// //           mobileBottomMenus.map((e) => e.toJson()).toList(),
// //       'live_website_url': liveWebsiteUrl,
// //       'response': response.toJson(),
// //     };
// //   }
// // }

// // class MenuItem {
// //   final int id;
// //   final String menuName;
// //   final String menuTitle;
// //   final String menuUrl;
// //   final String menuType;
// //   final bool shareLink;
// //   final String mobilelogo;
// //   final List<SubMenu> submenu;

// //   MenuItem({
// //     required this.id,
// //     required this.menuName,
// //     required this.menuTitle,
// //     required this.menuUrl,
// //     required this.menuType,
// //     required this.shareLink,
// //     required this.submenu, required this.mobilelogo,
// //   });

// //   factory MenuItem.fromJson(Map<String, dynamic> json) {
// //     return MenuItem(
// //       id: json['id'] ?? 0,
// //       menuName: json['menu_name'] ?? '',
// //       menuTitle: json['menu_title'] ?? '',
// //       menuUrl: json['menu_url'] ?? '',
// //       menuType: json['menu_type'] ?? '',
// //       shareLink: json['share_link'] ?? false,
// //       submenu: (json['submenu'] as List<dynamic>?)
// //               ?.map((e) => SubMenu.fromJson(e))
// //               .toList() ??
// //           [],
// //           mobilelogo:json['mobile_logo']
// //     );
// //   }

// //   Map<String, dynamic> toJson() {
// //     return {
// //       'id': id,
// //       'menu_name': menuName,
// //       'menu_title': menuTitle,
// //       'menu_url': menuUrl,
// //       'menu_type': menuType,
// //       'share_link': shareLink,
// //       'submenu': submenu.map((e) => e.toJson()).toList(),
// //       "mobile_logo":mobilelogo
// //     };
// //   }
// // }

// // class SubMenu {
// //   final int id;
// //   final String menuName;
// //   final String menuTitle;
// //   final String menuUrl;
// //   final String menuType;
// //   final bool shareLink;
// //   final String mobilelogo;

// //   SubMenu({
// //     required this.id,
// //     required this.menuName,
// //     required this.menuTitle,
// //     required this.menuUrl,
// //     required this.menuType,
// //     required this.shareLink,
// //     required this.mobilelogo,
// //   });

// //   factory SubMenu.fromJson(Map<String, dynamic> json) {
// //     return SubMenu(
// //       id: json['id'] ?? 0,
// //       menuName: json['menu_name'] ?? '',
// //       menuTitle: json['menu_title'] ?? '',
// //       menuUrl: json['menu_url'] ?? '',
// //       menuType: json['menu_type'] ?? '',
// //       shareLink: json['share_link'] ?? false,
// //        mobilelogo:json['mobile_logo']
// //     );
// //   }

// //   Map<String, dynamic> toJson() {
// //     return {
// //       'id': id,
// //       'menu_name': menuName,
// //       'menu_title': menuTitle,
// //       'menu_url': menuUrl,
// //       'menu_type': menuType,
// //       'share_link': shareLink,
// //        "mobile_logo":mobilelogo
// //     };
// //   }
// // }

// // class MobileBottomMenu {
// //   final int id;
// //   final String menuName;
// //   final String menuTitle;
// //   final String menuUrl;
// //   final bool shareLink;
// //   final String mobilelogo;

// //   MobileBottomMenu({
// //     required this.id,
// //     required this.menuName,
// //     required this.menuTitle,
// //     required this.menuUrl,
// //     required this.shareLink, required this.mobilelogo,
// //   });

// //   factory MobileBottomMenu.fromJson(Map<String, dynamic> json) {
// //     return MobileBottomMenu(
// //       id: json['id'] ?? 0,
// //       menuName: json['menu_name'] ?? '',
// //       menuTitle: json['menu_title'] ?? '',
// //       menuUrl: json['menu_url'] ?? '',
// //       shareLink: json['share_link'] ?? false,
// //       mobilelogo: json['mobile_logo']
// //     );
// //   }

// //   Map<String, dynamic> toJson() {
// //     return {
// //       'id': id,
// //       'menu_name': menuName,
// //       'menu_title': menuTitle,
// //       'menu_url': menuUrl,
// //       'share_link': shareLink,
// //       "mobile_logo":mobilelogo
// //     };
// //   }
// // }

// // class ResponseModel {
// //   final int n;
// //   final String msg;
// //   final String status;

// //   ResponseModel({
// //     required this.n,
// //     required this.msg,
// //     required this.status,
// //   });

// //   factory ResponseModel.fromJson(Map<String, dynamic> json) {
// //     return ResponseModel(
// //       n: json['n'] ?? 0,
// //       msg: json['msg'] ?? '',
// //       status: json['status'] ?? '',
// //     );
// //   }

// //   Map<String, dynamic> toJson() {
// //     return {
// //       'n': n,
// //       'msg': msg,
// //       'status': status,
// //     };
// //   }
// // }
// class NavBarResponse {
//   final List<MenuItem> data;
//   final List<MobileBottomMenu> mobileBottomMenus;
//   final String liveWebsiteUrl;
//   final ResponseModel? response;

//   NavBarResponse({
//     required this.data,
//     required this.mobileBottomMenus,
//     required this.liveWebsiteUrl,
//     this.response,
//   });

//   factory NavBarResponse.fromJson(Map<String, dynamic> json) {
//     return NavBarResponse(
//       data: (json['data'] as List?)
//               ?.map((e) => MenuItem.fromJson(e))
//               .toList() ??
//           [],

//       mobileBottomMenus:
//           (json['mobile_bottom_menus'] as List?)
//                   ?.map((e) => MobileBottomMenu.fromJson(e))
//                   .toList() ??
//               [],

//       liveWebsiteUrl:
//           json['live_website_url']?.toString() ?? "",

//       response: json['response'] != null
//           ? ResponseModel.fromJson(json['response'])
//           : null,
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       "data": data.map((e) => e.toJson()).toList(),
//       "mobile_bottom_menus":
//           mobileBottomMenus.map((e) => e.toJson()).toList(),
//       "live_website_url": liveWebsiteUrl,
//       "response": response?.toJson(),
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
//   final String mobileLogo;
//   final List<SubMenu> submenu;

//   MenuItem({
//     required this.id,
//     required this.menuName,
//     required this.menuTitle,
//     required this.menuUrl,
//     required this.menuType,
//     required this.shareLink,
//     required this.mobileLogo,
//     required this.submenu,
//   });

//   factory MenuItem.fromJson(Map<String, dynamic> json) {
//     return MenuItem(
//       id: json['id'] ?? 0,
//       menuName: json['menu_name']?.toString() ?? "",
//       menuTitle: json['menu_title']?.toString() ?? "",
//       menuUrl: json['menu_url']?.toString() ?? "",
//       menuType: json['menu_type']?.toString() ?? "",
//       shareLink: json['share_link'] ?? false,
//       mobileLogo: json['mobile_logo']?.toString() ?? "",

//       submenu: (json['submenu'] as List?)
//               ?.map((e) => SubMenu.fromJson(e))
//               .toList() ??
//           [],
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       "id": id,
//       "menu_name": menuName,
//       "menu_title": menuTitle,
//       "menu_url": menuUrl,
//       "menu_type": menuType,
//       "share_link": shareLink,
//       "mobile_logo": mobileLogo,
//       "submenu": submenu.map((e) => e.toJson()).toList(),
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
//   final String mobileLogo;

//   SubMenu({
//     required this.id,
//     required this.menuName,
//     required this.menuTitle,
//     required this.menuUrl,
//     required this.menuType,
//     required this.shareLink,
//     required this.mobileLogo,
//   });

//   factory SubMenu.fromJson(Map<String, dynamic> json) {
//     return SubMenu(
//       id: json['id'] ?? 0,
//       menuName: json['menu_name']?.toString() ?? "",
//       menuTitle: json['menu_title']?.toString() ?? "",
//       menuUrl: json['menu_url']?.toString() ?? "",
//       menuType: json['menu_type']?.toString() ?? "",
//       shareLink: json['share_link'] ?? false,
//       mobileLogo: json['mobile_logo']?.toString() ?? "",
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       "id": id,
//       "menu_name": menuName,
//       "menu_title": menuTitle,
//       "menu_url": menuUrl,
//       "menu_type": menuType,
//       "share_link": shareLink,
//       "mobile_logo": mobileLogo,
//     };
//   }
// }

// class MobileBottomMenu {
//   final int id;
//   final String menuName;
//   final String menuTitle;
//   final String menuUrl;
//   final bool shareLink;
//   final String mobileMenuIcon;

//   MobileBottomMenu({
//     required this.id,
//     required this.menuName,
//     required this.menuTitle,
//     required this.menuUrl,
//     required this.shareLink,
//     required this.mobileMenuIcon,
//   });

//   factory MobileBottomMenu.fromJson(
//       Map<String, dynamic> json) {
//     return MobileBottomMenu(
//       id: json['id'] ?? 0,
//       menuName: json['menu_name']?.toString() ?? "",
//       menuTitle: json['menu_title']?.toString() ?? "",
//       menuUrl: json['menu_url']?.toString() ?? "",
//       shareLink: json['share_link'] ?? false,
//       mobileMenuIcon:
//           json['mobile_menu_icon']?.toString() ?? "",
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       "id": id,
//       "menu_name": menuName,
//       "menu_title": menuTitle,
//       "menu_url": menuUrl,
//       "share_link": shareLink,
//       "mobile_menu_icon": mobileMenuIcon,
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

//   factory ResponseModel.fromJson(
//       Map<String, dynamic> json) {
//     return ResponseModel(
//       n: json['n'] ?? 0,
//       msg: json['msg']?.toString() ?? "",
//       status: json['status']?.toString() ?? "",
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       "n": n,
//       "msg": msg,
//       "status": status,
//     };
//   }
// }
class NavBarResponse {
  final List<MenuItem> data;
  final List<MobileBottomMenu> mobileBottomMenus;
  final String? liveWebsiteUrl;
  final ResponseData? response;

  NavBarResponse({
    required this.data,
    required this.mobileBottomMenus,
    this.liveWebsiteUrl,
    this.response,
  });

  factory NavBarResponse.fromJson(Map<String, dynamic> json) {
    return NavBarResponse(
      data: (json['data'] as List<dynamic>?)
              ?.map((e) => MenuItem.fromJson(e))
              .toList() ??
          [],
      mobileBottomMenus: (json['mobile_bottom_menus'] as List<dynamic>?)
              ?.map((e) => MobileBottomMenu.fromJson(e))
              .toList() ??
          [],
      liveWebsiteUrl: json['live_website_url'],
      response: json['response'] != null
          ? ResponseData.fromJson(json['response'])
          : null,
    );
  }

  Map<String, dynamic> toJson() => {
        "data": data.map((e) => e.toJson()).toList(),
        "mobile_bottom_menus":
            mobileBottomMenus.map((e) => e.toJson()).toList(),
        "live_website_url": liveWebsiteUrl,
        "response": response?.toJson(),
      };
}
class MenuItem {
  final int id;
  final String? menuName;
  final String? menuTitle;
  final String? menuUrl;
  final String? menuType;
  final bool? shareLink;
  final String? mobileLogo;
  final List<String> menuKeywords;
  final String? menuMetaTags;
  final String? menuMetaDesc;
  final List<MenuItem> submenu;

  final bool? isAwards;
  final int? awardId;

  final bool? isVideo;
  final List<int> videoCategoryArray;

  final bool? isPhoto;
  final int? photoCategoryId;
  final int? photoAlbumId;

  final bool? isNewsletter;
  final int? newsletterId;

  final bool? isDglibrary;
  final int? digitalLibraryId;

  MenuItem({
   required this.id,
    this.menuName,
    this.menuTitle,
    this.menuUrl,
    this.menuType,
    this.shareLink,
    this.mobileLogo,
    required this.menuKeywords,
    this.menuMetaTags,
    this.menuMetaDesc,
    required this.submenu,
    this.isAwards,
    this.awardId,
    this.isVideo,
    required this.videoCategoryArray,
    this.isPhoto,
    this.photoCategoryId,
    this.photoAlbumId,
    this.isNewsletter,
    this.newsletterId,
    this.isDglibrary,
    this.digitalLibraryId,
  });

  factory MenuItem.fromJson(Map<String, dynamic> json) {
    return MenuItem(
      id: json['id'],
      menuName: json['menu_name'],
      menuTitle: json['menu_title'],
      menuUrl: json['menu_url'],
      menuType: json['menu_type'],
      shareLink: json['share_link'],
      mobileLogo: json['mobile_logo'],
      menuKeywords: (json['menu_keywords'] as List<dynamic>?)
              ?.map((e) => e.toString())
              .toList() ??
          [],
      menuMetaTags: json['menu_meta_tags'],
      menuMetaDesc: json['menu_meta_desc'],
      submenu: (json['submenu'] as List<dynamic>?)
              ?.map((e) => MenuItem.fromJson(e))
              .toList() ??
          [],
      isAwards: json['is_awards'],
      awardId: json['award_id'],
      isVideo: json['is_video'],
      videoCategoryArray: (json['video_category_array'] as List<dynamic>?)
              ?.map((e) => e as int)
              .toList() ??
          [],
      isPhoto: json['is_photo'],
      photoCategoryId: json['photo_category_id'],
      photoAlbumId: json['photo_album_id'],
      isNewsletter: json['is_newsletter'],
      newsletterId: json['newsletter_id'],
      isDglibrary: json['is_dglibrary'],
      digitalLibraryId: json['digital_library_id'],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "menu_name": menuName,
        "menu_title": menuTitle,
        "menu_url": menuUrl,
        "menu_type": menuType,
        "share_link": shareLink,
        "mobile_logo": mobileLogo,
        "menu_keywords": menuKeywords,
        "menu_meta_tags": menuMetaTags,
        "menu_meta_desc": menuMetaDesc,
        "submenu": submenu.map((e) => e.toJson()).toList(),
        "is_awards": isAwards,
        "award_id": awardId,
        "is_video": isVideo,
        "video_category_array": videoCategoryArray,
        "is_photo": isPhoto,
        "photo_category_id": photoCategoryId,
        "photo_album_id": photoAlbumId,
        "is_newsletter": isNewsletter,
        "newsletter_id": newsletterId,
        "is_dglibrary": isDglibrary,
        "digital_library_id": digitalLibraryId,
      };
}
class MobileBottomMenu {
  final int? id;
  final String? menuName;
  final String? menuTitle;
  final String? menuUrl;
  final bool? shareLink;
  final String? mobileMenuIcon;

  final bool? isAwards;
  final bool? isVideo;
  final bool? isPhoto;
  final bool? isNewsletter;
  final bool? isDglibrary;

  final int? awardId;
  final List<int> videoCategoryArray;
  final int? photoCategoryId;
  final int? photoAlbumId;
  final int? newsletterId;
  final int? digitalLibraryId;

  MobileBottomMenu({
    this.id,
    this.menuName,
    this.menuTitle,
    this.menuUrl,
    this.shareLink,
    this.mobileMenuIcon,
    this.isAwards,
    this.isVideo,
    this.isPhoto,
    this.isNewsletter,
    this.isDglibrary,
    this.awardId,
    required this.videoCategoryArray,
    this.photoCategoryId,
    this.photoAlbumId,
    this.newsletterId,
    this.digitalLibraryId,
  });

  factory MobileBottomMenu.fromJson(Map<String, dynamic> json) {
    return MobileBottomMenu(
      id: json['id'],
      menuName: json['menu_name'],
      menuTitle: json['menu_title'],
      menuUrl: json['menu_url'],
      shareLink: json['share_link'],
      mobileMenuIcon: json['mobile_menu_icon'],
      isAwards: json['is_awards'],
      isVideo: json['is_video'],
      isPhoto: json['is_photo'],
      isNewsletter: json['is_newsletter'],
      isDglibrary: json['is_dglibrary'],
      awardId: json['award_id'],
      videoCategoryArray: (json['video_category_array'] as List<dynamic>?)
              ?.map((e) => e as int)
              .toList() ??
          [],
      photoCategoryId: json['photo_category_id'],
      photoAlbumId: json['photo_album_id'],
      newsletterId: json['newsletter_id'],
      digitalLibraryId: json['digital_library_id'],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "menu_name": menuName,
        "menu_title": menuTitle,
        "menu_url": menuUrl,
        "share_link": shareLink,
        "mobile_menu_icon": mobileMenuIcon,
        "is_awards": isAwards,
        "is_video": isVideo,
        "is_photo": isPhoto,
        "is_newsletter": isNewsletter,
        "is_dglibrary": isDglibrary,
        "award_id": awardId,
        "video_category_array": videoCategoryArray,
        "photo_category_id": photoCategoryId,
        "photo_album_id": photoAlbumId,
        "newsletter_id": newsletterId,
        "digital_library_id": digitalLibraryId,
      };
}
class ResponseData {
  final int? n;
  final String? msg;
  final String? status;

  ResponseData({
    this.n,
    this.msg,
    this.status,
  });

  factory ResponseData.fromJson(Map<String, dynamic> json) {
    return ResponseData(
      n: json['n'],
      msg: json['msg'],
      status: json['status'],
    );
  }

  Map<String, dynamic> toJson() => {
        "n": n,
        "msg": msg,
        "status": status,
      };
}