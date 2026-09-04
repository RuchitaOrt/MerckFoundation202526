import 'package:flutter/material.dart';
import 'package:merckfoundation_252026/CommonUtils/common_strings.dart';
import 'package:merckfoundation_252026/Provider/PageProvider.dart';
import 'package:merckfoundation_252026/Utility/showdailog.dart';
import 'package:merckfoundation_252026/main.dart';
import 'package:merckfoundation_252026/screens/DetailsScreen/DetailScreen.dart';
import 'package:merckfoundation_252026/screens/MediaAndStoriesScreen/MediaListingScreen.dart';
import 'package:merckfoundation_252026/widgets/AppDrawerfilter.dart';
import 'package:merckfoundation_252026/widgets/CommonWidget/CommonFunctions.dart';

import 'package:merckfoundation_252026/widgets/CommonWidget/customappbar.dart';
import 'package:merckfoundation_252026/CommonUtils/customcolor.dart';

import 'package:merckfoundation_252026/enum/commonEnum.dart';
import 'package:merckfoundation_252026/routes/AppNavigation.dart';

import 'package:merckfoundation_252026/screens/MainUIBody.dart/CommonBody.dart';
import 'package:merckfoundation_252026/widgets/CommonWidget/CustomAdvFab.dart';
import 'package:provider/provider.dart';

class CommonContentPage extends StatefulWidget {
  static const String route = "/commonContent";

  final String? menuID;
  final String? title;
  final String? shareLink;
  final Function(String title)? onPageTitleLoaded;
  final Function(bool shareLink)? onPageshareLoaded;

  const CommonContentPage({
    super.key,
    this.menuID,
    this.title,
    this.shareLink,
    this.onPageTitleLoaded,
    this.onPageshareLoaded,
  });

  @override
  State<CommonContentPage> createState() => _CommonContentPageState();
}

class _CommonContentPageState extends State<CommonContentPage> with RouteAware {
  bool isProgramMenuVisible = false;
  String pageTitle = "";
  bool shareLink = false;
  List<dynamic> programMenus = [];
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  final CustomAdvFabController _fabController = CustomAdvFabController();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final route = ModalRoute.of(context);

    if (route is PageRoute) {
      routeObserver.subscribe(this, route);
    }
  }

  @override
  void dispose() {
    routeObserver.unsubscribe(this);
    super.dispose();
  }
@override
void didPopNext() {
  _fabController.collapseImmediately();
}
  // @override
  // void didPopNext() {
  //   // Called when another page is popped and
  //   // CommonContentPage becomes visible again.

  //   _fabController.collapse();
  // }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Customcolor.background,

      appBar: CommonAppBar(
        type: AppBarType.inner,
        title: pageTitle ?? "",

        //title: widget.title,
        shareLink: shareLink ? widget.shareLink : "", //widget.shareLink ?? "",
        menuID: widget.menuID ?? "",
        onBack: () {
         _fabController.collapseImmediately();
          Navigator.pop(context);
        },
      ),
      body: CommonBody(
        widget.menuID,
        onPageTitleLoaded: (title) {
          setState(() {
            pageTitle = title;
          });
        },
        onPageshareLoaded: (share) {
          setState(() {
            shareLink = share;
          });
        },
        onProgramMenuChanged: (visible, menus) {
          setState(() {
            isProgramMenuVisible = visible;
            programMenus = menus;
          });
        },
      ),
      floatingActionButton: isProgramMenuVisible && programMenus.isNotEmpty
          ? Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: CustomAdvFab(
                controller: _fabController,
                expandedHeight:programMenus.length ==3? size.height * 0.30:programMenus.length ==5? size.height * 0.40:programMenus.length ==6? size.height * 0.45:programMenus.length ==7? size.height * 0.55: size.height * 0.60,
                icon: Icons.menu,
                iconColor: Colors.white,
                backgroundColor: Customcolor.textBlueColor,
                expandedContent: ListView.builder(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  itemCount: programMenus.length,
                  itemBuilder: (context, index) {
                    final item = programMenus[index];

                    final List submenus = item['submenus'] ?? [];

                    final bool hasSubmenus = submenus.isNotEmpty;

                    /// ✅ WITH SUBMENUS
                    if (hasSubmenus) {
                      return Container(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color:
                              item['color_code'] ?? Customcolor.textBlueColor,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Theme(
                          data: Theme.of(context).copyWith(
                            dividerColor: Colors.transparent,
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                          ),
                          child: ExpansionTile(
                            tilePadding: const EdgeInsets.symmetric(
                              horizontal: 14,
                            ),

                            childrenPadding: const EdgeInsets.only(
                              left: 12,
                              right: 12,
                              bottom: 8,
                            ),

                            title: Text(
                              stripHtml(item['menu_name'] ?? ""),
                              // item['menu_name'] ?? "",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Customcolor.white,
                                fontSize: 12,
                              ),
                            ),

                            trailing: const Icon(
                              Icons.keyboard_arrow_down,
                              color: Customcolor.white,
                            ),

                            /// ✅ OPEN MAIN PAGE ALSO
                            onExpansionChanged: (expanded) {
                              onExpansionTap(expanded, item);
                            },

                            children: submenus.map<Widget>((submenu) {
                              return Container(
                                margin: const EdgeInsets.only(bottom: 6),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: ListTile(
                                  dense: true,
                                  title: Text(
                                    submenu['menu_name'] ?? "",
                                    style: const TextStyle(
                                      color: Customcolor.textBlueColor,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  trailing: const Icon(
                                    Icons.arrow_forward_ios,
                                    size: 12,
                                  ),
                                  onTap: () {
                                    SubMenuTap(submenu);
                                  },
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                      );
                    }
                    final Color color = Color(
                      int.tryParse(item['color_code'] ?? '') ?? 0xff0e69af,
                    );

                    /// ✅ WITHOUT SUBMENUS
                    return Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: color,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: ListTile(
                        title: Text(
                          item['menu_name'] ?? "",
                          style: const TextStyle(
                            color: Customcolor.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 12,
                          ),
                        ),
                        onTap: () {
                          MenuWithoutSubmenu(
                            context,
                            Map<String, dynamic>.from(item),
                          );
                        },
                      ),
                    );
                  },
                ),
              ),
            )
          : null,
    );
  }

  // ignore: non_constant_identifier_names
  Future<void> MenuWithoutSubmenu(
    BuildContext context,
    Map<String, dynamic> item,
  ) async {
    print("HIT1");

    //   final provider = Provider.of<PageProvider>(
    //     context,
    //     listen: false,
    //   );

    //   final data = await provider.fetchWatchMorePage(
    //     context,
    //     item['id'].toString(),
    //   );

    //   if (!mounted) return;

    //   debugPrint("WATCH MORE DATA = $data");

    //   if (data == null) {
    //     debugPrint("WATCH MORE: DATA IS NULL");
    //     return;
    //   }

    //   final root = data['data'];

    //   if (root == null || root is! Map) {
    //     debugPrint("WATCH MORE: INVALID ROOT");
    //     debugPrint("ROOT = $root");
    //     return;
    //   }

    //   // Convert to Map<String, dynamic>
    //   final menu = Map<String, dynamic>.from(root);
    // print("MENU ${item['id'].toString()}");
    // --------------------------------------------------
    // STATIC MENU
    // --------------------------------------------------
    if (item['menu_type'] == "static") {
      // NEWSLETTER
      if (item['is_newsletter'] == true) {
        debugPrint("NAVIGATING -> NEWSLETTER");

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => DetailScreen(
              "",
              "",
              title: item['menu_title']?.toString() ?? "",
              articleId: item['newsletter_id']?.toString() ?? "",
              languageId: "",
              isDetailApiCalled: true,
              shareLink: "",
              menuID: item['id'].toString(),
            ),
          ),
        );

        return;
      } else
      // AWARDS
      if (item['is_awards'] == true) {
        debugPrint("NAVIGATING -> AWARDS");

        AppNavigation.navigateByMenuId(
          context,
          menuId: item['award_id']?.toString() ?? "",
          title: item['menu_name']?.toString() ?? "",
        );

        return;
      } else
      // VIDEO
      if (item['is_video'] == true) {
        debugPrint(" RUCHITA RANENAVIGATING -> VIDEO");

        final videoCategories = item['video_category_array'];

        debugPrint("VIDEO CATEGORY = $videoCategories");
debugPrint("VIDEO CATEGORYMEnu = $item['menu_title']?.toString() ");
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => MediaListingScreen(
              type: MediaType.all,
              categoryID: videoCategories is List
                  ? videoCategories.join(',')
                  : "",
              albumID: "",
              albumName: "",
              menuID: item['id'].toString(),
              title: item['menu_title']?.toString() ?? "",
              shareLink: item['share_link']?.toString() ?? "",
            ),
          ),
        );

        return;
      } else
      // DIGITAL LIBRARY
      if (item['is_dglibrary'] == true) {
        debugPrint("NAVIGATING -> DIGITAL LIBRARY");

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => MediaListingScreen(
              type: MediaType.digitalLibraryall,
              categoryID: item['digital_library_id']?.toString() ?? "",
              albumID: "",
              albumName: "",
              menuID: item['id'].toString(),
              shareLink: "",
              title: "Digital Library",
              digitalLibraryCategoryName: "",
            ),
          ),
        );

        return;
      } else
      // PHOTO
      if (item['is_photo'] == true) {
        debugPrint("NAVIGATING -> PHOTO");

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => MediaListingScreen(
              type: MediaType.photoAlbum,
              categoryID: item['photo_category_id']?.toString() ?? "",
              albumID: item['photo_album_id']?.toString() ?? "",
              albumName: item['menu_title']?.toString() ?? "",
              menuID: item['id'].toString(),
              shareLink: "",
              title: item['menu_title']?.toString() ?? "",
            ),
          ),
        );

        return;
      } else {
        // PDF / EXTERNAL URL
        debugPrint("NAVIGATING -> URL");

        ShowDialogs.launchURL(item['full_url']?.toString() ?? "");

        return;
      }
    } else {
      // --------------------------------------------------
      // NORMAL MENU
      // --------------------------------------------------
      final provider = Provider.of<PageProvider>(context, listen: false);

      final data = await provider.fetchWatchMorePage(
        context,
        item['id'].toString(),
      );

      if (!context.mounted) return;

      final root = data?['data'];

      if (root is Map) {
        final dataType = (root['data_type'] ?? '').toString().toLowerCase();

        debugPrint("MENU ID: ");
        debugPrint("DATA TYPE: $dataType");

        if (dataType == 'pdf' || dataType == 'redirectionlink') {
          final pdfUrl = root['pdf_data']?['pdf_url']?.toString() ?? '';

          if (pdfUrl.isNotEmpty) {
            await ShowDialogs.launchURL(pdfUrl);
          }

          return;
        } else {
          debugPrint("NAVIGATING -> APP NAVIGATION");

          AppNavigation.navigateByMenuId(
            context,
            menuId: item['id']?.toString() ?? "",
            title: item['menu_name']?.toString() ?? "",
            shareLink: item['menu_url']?.toString(),
          );
        }
      }
    }
  }

  Future<void> SubMenuTap(Map<String, dynamic> submenu) async {
    print(" SubMenuTap HIT submenu");

    if (submenu['menu_type'] == "static") {
      if (submenu['is_newsletter'] == true) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => DetailScreen(
              "",
              "",
              title: submenu['menu_name'],
              articleId: submenu['newsletter_id'].toString(),
              languageId: "",
              isDetailApiCalled: true,
              shareLink: "",
              menuID: submenu['id'].toString(),
            ),
          ),
        );
      } else if (submenu['is_awards'] == true) {
        print("HIT submenu awards");

        AppNavigation.navigateByMenuId(
          context,
          menuId: submenu['award_id'].toString(),
          title: submenu['menu_name'],
        );
      } else if (submenu['is_video'] == true) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => MediaListingScreen(
              type: MediaType.all,
              categoryID: submenu['video_category_id'].join(','),
              albumID: "",
              albumName: "",
              menuID: submenu['id'].toString(),
              title: submenu['menu_name'],
              shareLink: "",
            ),
          ),
        );
      } else if (submenu['is_dglibrary'] == true) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => MediaListingScreen(
              type: MediaType.digitalLibrary,
              categoryID: submenu['digital_library_id'],
              albumID: "",
              albumName: "",
              menuID: submenu['id'].toString(),
              shareLink: "",
              title: "Digital Library",
              digitalLibraryCategoryName: "",
            ),
          ),
        );
      } else if (submenu['is_photo'] == true) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => MediaListingScreen(
              type: MediaType.photoAlbum,
              categoryID: submenu['photo_category_id'].toString(),
              albumID: submenu['photo_album_id'].toString(),
              albumName: submenu['menu_title'],
              menuID: submenu['id'].toString(),
              shareLink: "",
              title: submenu['menu_title'],
            ),
          ),
        );
      } else {
        ShowDialogs.launchURL(submenu['full_url'] ?? "");
      }
    } else {
      print(" SubMenuTap HIT submenu else");
      final provider = Provider.of<PageProvider>(context, listen: false);

      final data = await provider.fetchWatchMorePage(
        context,
        submenu['id'].toString(),
      );

      if (!context.mounted) return;

      final root = data?['data'];

      if (root is Map) {
        final dataType = (root['data_type'] ?? '').toString().toLowerCase();
        print(dataType);
        debugPrint("MENU ID: ");
        debugPrint("DATA TYPE DATA TYPE: $dataType");

        if (dataType == 'pdf' || dataType == 'redirectionlink') {
          final pdfUrl = root['pdf_data']?['pdf_url']?.toString() ?? '';
          print("pdfUrl");
          print(pdfUrl);
          if (pdfUrl.isNotEmpty) {
            await ShowDialogs.launchURL(pdfUrl);
          }

          return;
        } else {
          print("caaoled");
          AppNavigation.navigateByMenuId(
            context,
            menuId: submenu['id'].toString(),
            title: submenu['menu_name'],
            shareLink: submenu['menu_url'],
          );
        }
      }
    }
  }

  Future<void> onExpansionTap(bool expanded, Map<String, dynamic> item) async {
    print("ONExpansion");
    if (!expanded) return;

    final List submenus = item['submenus'] ?? [];
    final bool hasSubmenus = submenus.isNotEmpty;

    if (hasSubmenus) return;

    if (item['menu_type'] == "static") {
      if (item['is_newsletter'] == true) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => DetailScreen(
              "",
              "",
              title: item['menu_name'],
              articleId: item['newsletter_id'].toString(),
              languageId: "",
              isDetailApiCalled: true,
              shareLink: "",
              menuID: item['id'].toString(),
            ),
          ),
        );
      } else if (item['is_awards'] == true) {
        AppNavigation.navigateByMenuId(
          context,
          menuId: item['award_id'].toString(),
          title: item['menu_name'],
        );
      } else if (item['is_video'] == true) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => MediaListingScreen(
              type: MediaType.all,
              categoryID: item['video_category_id'].join(','),
              albumID: "",
              albumName: "",
              menuID: item['id'].toString(),
              title: item['menu_name'],
              shareLink: "",
            ),
          ),
        );
      } else if (item['is_dglibrary'] == true) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => MediaListingScreen(
              type: MediaType.digitalLibrary,
              categoryID: item['digital_library_id'],
              albumID: "",
              albumName: "",
              menuID: item['id'].toString(),
              shareLink: "",
              title: "Digital Library",
              digitalLibraryCategoryName: "",
            ),
          ),
        );
      } else if (item['is_photo'] == true) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => MediaListingScreen(
              type: MediaType.photoAlbum,
              categoryID: item['photo_category_id'],
              albumID: item['photo_album_id'],
              albumName: item['menu_title'],
              menuID: item['id'].toString(),
              shareLink: "",
              title: item['menu_title'],
            ),
          ),
        );
      } else {
        ShowDialogs.launchURL(item['full_url'] ?? "");
      }
    } else {
      final provider = Provider.of<PageProvider>(context, listen: false);

      final data = await provider.fetchWatchMorePage(
        context,
        item['id'].toString(),
      );

      if (!context.mounted) return;

      final root = data?['data'];

      if (root is Map) {
        final dataType = (root['data_type'] ?? '').toString().toLowerCase();

        debugPrint("MENU ID: ");
        debugPrint("DATA TYPE: $dataType");

        if (dataType == 'pdf' || dataType == 'redirectionlink') {
          final pdfUrl = root['pdf_data']?['pdf_url']?.toString() ?? '';

          if (pdfUrl.isNotEmpty) {
            await ShowDialogs.launchURL(pdfUrl);
          }

          return;
        } else {
          AppNavigation.navigateByMenuId(
            context,
            menuId: item['id'].toString(),
            title: item['menu_name'],
            shareLink: item['menu_url'],
          );
        }
      }
    }
  }
}
