import 'package:flutter/material.dart';
import 'package:merckfoundation_252026/Provider/MediaProvider.dart';
import 'package:merckfoundation_252026/Provider/NewsReleaseProvider.dart';
import 'package:merckfoundation_252026/Provider/navbar_provider.dart';
import 'package:merckfoundation_252026/Utility/ResponsiveFlutter.dart';
import 'package:merckfoundation_252026/Utils/common_images.dart';
import 'package:merckfoundation_252026/Utils/common_strings.dart';
import 'package:merckfoundation_252026/enum/commonEnum.dart';
import 'package:merckfoundation_252026/screens/MainScreens/HomeNewScreen.dart';
import 'package:merckfoundation_252026/screens/MediaAndStoriesScreen/MediaListingScreen.dart';
import 'package:merckfoundation_252026/screens/MediaAndStoriesScreen/MediaScreen.dart';
import 'package:merckfoundation_252026/screens/MediaAndStoriesScreen/NewsRelease.dart';
import 'package:merckfoundation_252026/screens/OurPartnersScreen/OurPartnersScreen.dart';

import 'package:merckfoundation_252026/screens/WhoWeAreScreen.dart/CommonContentPage.dart';
import 'package:merckfoundation_252026/screens/dashboard.dart';
import 'package:merckfoundation_252026/Utils/customcolor.dart';
import 'package:merckfoundation_252026/widgets/CommonLoader.dart';
import 'package:merckfoundation_252026/widgets/formLabel.dart';
import 'package:provider/provider.dart';

Map<String, bool> expansionState = {};

class AppDrawer extends StatefulWidget {
  @override
  _AppDrawerState createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  final expansionList = [
    CommonStrings.whoWeAre,
    CommonStrings.whatWeDo,
    CommonStrings.mediaStories,
  ];

  double socialIconSize = 5.5;

  void closeOpenExpansionList(String expansionName) {
    expansionList.forEach((name) {
      if (name != expansionName) expansionState[name] = false;
    });
    setState(() {
      expansionState[expansionName] = true;
    });
  }

  @override
  void initState() {
    super.initState();
    expansionList.forEach((name) {
      expansionState.putIfAbsent(name, () => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveFlutter.of(context);
    final navbarProvider = Provider.of<NavbarProvider>(context);

    return Drawer(
      child: Container(
        color: Customcolor.baby_blue,
        child: Column(
          children: [
            /// Scrollable drawer content
            Expanded(
              child: navbarProvider.isLoading
                  ? Center(child: CommonLoader())
                  : ListView(
                      padding: EdgeInsets.zero,
                      children: [
                        _buildHeader(context,"1","",""),
                        16.0.heightBox,

                        ...navbarProvider.menuList.map((item) {
                          Widget widget;

                          if (item.submenu.isEmpty) {
                            widget = DrawerWidget(
                              value: item.menuName,
                              onTapfun: () {
                                print("Main MENU");
                                handleNavigation(
                                  context,
                                  item.menuUrl,
                                  item.id.toString(),
                                  item.menuName,
                                  item.menuUrl,
                                );
                              },
                            );
                          } else {
                            widget = CustomExpansion(
                              title: item.menuName,
                              leadingIcon: CommonImagePath.home,
                              expanded: expansionState[item.menuName] ?? false,
                              onTap: () {
                                setState(() {
                                  expansionState[item.menuName] =
                                      !(expansionState[item.menuName] ?? false);
                                });
                              },
                              children: item.submenu.map((sub) {
                                return DrawerWidget(
                                  value: sub.menuName,
                                  onTapfun: () {
                                    handleNavigation(
                                      context,
                                      sub.menuUrl,
                                      sub.id.toString(),
                                      sub.menuName,
                                      sub.menuUrl,
                                    );
                                  },
                                );
                              }).toList(),
                            );
                          }

                          /// ✅ ADD SPACE BETWEEN ITEMS
                          return Column(
                            children: [
                              widget,
                              SizedBox(
                                height: responsive.height(1.5),
                              ), // 🔥 control spacing here
                            ],
                          );
                        }).toList(),

                        16.0.heightBox,
                      ],
                    ),
            ),
            FollowSection(title: "", iconSize: 15),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context ,String menuId,
    String title,
    String shareLink,) {
    final responsive = ResponsiveFlutter.of(context);

    return Container(
      color: Customcolor.background,
      padding: EdgeInsets.all(responsive.width(3)),
      child: Column(
        children: [
          16.0.heightBox,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                CommonImagePath.drawerLogo,
                width: responsive.width(40),
                height: responsive.height(12),
                fit: BoxFit.contain,
              ),
              Padding(
                padding: EdgeInsets.only(top: 30),
                child: GestureDetector(
                  onTap: () {
                    print("Clicked on aarow");
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (_) => Dashboard(index: 0, menuID: menuId, shareLink: shareLink)),
                    );
                  },
                  child: Container(
                    color: Colors.transparent,
                    child: Image.asset(
                      CommonImagePath.arrowForward,
                      width: responsive.width(5),
                      height: responsive.width(5),
                    ),
                  ),
                ),
              ),
            ],
          ),
          16.0.heightBox,
        ],
      ),
    );
  }

  void handleNavigation(
    BuildContext context,
    String url,
    String menuId,
    String title,
    String shareLink,
  ) {
    switch (menuId) {
      /// HOME
      case '1':
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (_) =>
                Dashboard(index: 0, menuID: menuId, shareLink: shareLink),
          ),
        );
        break;

      /// VISION
      case '3':

      /// LEADERSHIP
      case '4':

      /// MESSAGE
      case '5':

      /// OVERVIEW
      case '6':

      /// CONTACT US
      case '7':

      /// MISSION
      case '9':

      /// POLICIES
      case '10':

      /// PRIVACY
      case '13':

      /// POLITICAL
      case '14':
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => CommonContentPage(
              title: title,
              menuID: menuId,
              shareLink: shareLink,
            ),
          ),
        );
        break;

      /// OUR PARTNERS
      case '15':
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => OurPartnersScreen(menuID: menuId, title: title, shareLink: shareLink,
            ),
          ),
        );
        break;

      /// VIDEO LIBRARY
      case '26':
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => MediaListingScreen(
              type: MediaType.videoLibrary,
              categoryID: "",
              albumID: "",
              albumName: "",  menuID: menuId,
              title: title,
            shareLink: shareLink,
            ),
          ),
        );
        break;

      /// STORIES
      case '27':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => Dashboard(index: 2,  menuID: menuId,
            shareLink: shareLink,)),
        );
        break;

      /// TESTIMONIALS
      case '28':
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => MediaListingScreen(
              type: MediaType.testimonial,
              categoryID: "",
              albumID: "",
              albumName: "",  menuID: menuId,title: title,
            shareLink: shareLink,
            ),
          ),
        );
        break;

      /// NEWS ARTICLES
      case '29':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => Dashboard(index: 3,  menuID: menuId,
            shareLink: shareLink,)),
        );
        break;

      /// UPCOMING PROGRAMS
      case '30':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => Dashboard(index: 4,  menuID: menuId,
            shareLink: shareLink,)),
        );
        break;

      /// NEWS RELEASE
      case '31':
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => ChangeNotifierProvider(
              create: (_) => NewsReleaseProvider(),
              child: NewsRelease(  menuID: menuId,
            shareLink: shareLink, title: title,),
            ),
          ),
        );
        break;

      /// MEDIA
      case '32':
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => ChangeNotifierProvider(
              create: (_) => MediaProvider(),
              child: MediaScreen(  menuID: menuId,title: title,
            shareLink: shareLink,),
            ),
          ),
        );
        break;

      /// DIGITAL LIBRARY
      case '33':
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => MediaListingScreen(
              type: MediaType.digitalLibrary,
              categoryID: "",
              albumID: "",
              albumName: "",
                menuID: menuId,
            shareLink: shareLink,title: title,
            ),
          ),
        );
        break;

      /// PHOTO GALLERY
      case '34':
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => MediaListingScreen(
              type: MediaType.photoGallery,
              categoryID: "",
              albumID: "",
              albumName: "",
                menuID: menuId,
            shareLink: shareLink,
            title: title,
            ),
          ),
        );
        break;

      default:
        debugPrint("⚠️ Unknown menuId: $menuId");
    }
  }
}

/// Custom Expansion widget (replacement for ExpansionTile)
class CustomExpansion extends StatelessWidget {
  final String title;
  final String leadingIcon;
  final bool expanded;
  final VoidCallback onTap;
  final List<Widget> children;

  const CustomExpansion({
    Key? key,
    required this.title,
    required this.leadingIcon,
    required this.expanded,
    required this.onTap,
    required this.children,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveFlutter.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
            padding: EdgeInsets.symmetric(
              vertical: responsive.height(0.8),
              horizontal: responsive.width(3),
            ),
            child: Row(
              children: [
                //   Image.asset(leadingIcon,
                //       width: responsive.width(5), height: responsive.width(5)),
                //  16.0.widthBox,
                Expanded(
                  child: FormLabel(
                    text: title,
                    labelColor: Customcolor.text_darkblue,
                    fontSize: responsive.fontSize(2.2),
                    fontweight: FontWeight.w700,
                    fontheight: 1.2,
                  ),
                ),
                Icon(
                  expanded
                      ? Icons.keyboard_arrow_up
                      : Icons.keyboard_arrow_down,
                  size: responsive.width(5),
                  color: Customcolor.text_darkblue,
                ),
              ],
            ),
          ),
        ),
        if (expanded)
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Column(
              children: children
                  .map(
                    (child) => Padding(
                      padding: const EdgeInsets.only(
                        bottom: 8,
                      ), // 🔥 spacing inside
                      child: child,
                    ),
                  )
                  .toList(),
            ),
          ),
      ],
    );
  }
}

class DrawerWidget extends StatelessWidget {
  final String? image;
  final String value;
  final VoidCallback? onTapfun;

  const DrawerWidget({Key? key, this.image, required this.value, this.onTapfun})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveFlutter.of(context);

    return GestureDetector(
      onTap: onTapfun,
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: responsive.height(0.5),
          horizontal: responsive.width(3),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            /// ✅ ONLY SHOW ICON IF EXISTS
            if (image != null && image!.isNotEmpty) ...[
              Image.asset(
                image!,
                width: responsive.width(5),
                height: responsive.width(5),
              ),
              16.0.widthBox,
            ],

            /// ✅ TEXT ALWAYS STARTS FROM LEFT IF NO ICON
            Expanded(
              child: FormLabel(
                text: value,
                maxLines: 3,
                textOverflow: TextOverflow.ellipsis,
                labelColor: Customcolor.text_darkblue,
                fontSize: responsive.fontSize(2),
                fontheight: 1.1,
                fontweight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
