import 'package:flutter/material.dart';
import 'package:merckfoundation_252026/Provider/MediaProvider.dart';
import 'package:merckfoundation_252026/Provider/NewsReleaseProvider.dart';
import 'package:merckfoundation_252026/Provider/navbar_provider.dart';
import 'package:merckfoundation_252026/Utility/ResponsiveFlutter.dart';
import 'package:merckfoundation_252026/Utils/common_images.dart';
import 'package:merckfoundation_252026/Utils/common_strings.dart';
import 'package:merckfoundation_252026/enum/commonEnum.dart';
import 'package:merckfoundation_252026/providers/follow_us_provider.dart';
import 'package:merckfoundation_252026/screens/ContactUs/ContactUs.dart';
import 'package:merckfoundation_252026/screens/MainScreens/CallforApplication.dart';
import 'package:merckfoundation_252026/screens/MainScreens/HomeNewScreen.dart';
import 'package:merckfoundation_252026/screens/MediaAndStoriesScreen/MediaListingScreen.dart';
import 'package:merckfoundation_252026/screens/MediaAndStoriesScreen/MediaScreen.dart';
import 'package:merckfoundation_252026/screens/MediaAndStoriesScreen/NewsRelease.dart';
import 'package:merckfoundation_252026/screens/OurPartnersScreen/OurPartnersScreen.dart';

import 'package:merckfoundation_252026/screens/WhoWeAreScreen.dart/ContentCarouselWidget.dart';
import 'package:merckfoundation_252026/screens/WhoWeAreScreen.dart/CommonContentPage.dart';
import 'package:merckfoundation_252026/screens/dashboard.dart';
import 'package:merckfoundation_252026/Utils/customcolor.dart';
import 'package:merckfoundation_252026/widgets/CommonLoader.dart';
import 'package:merckfoundation_252026/widgets/Homewidget.dart/homefollow_us.dart';
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
                        _buildHeader(context),
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

  Widget _buildHeader(BuildContext context) {
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
                      MaterialPageRoute(builder: (_) => Dashboard(index: 0)),
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
  ) {
    switch (url) {
      case '':
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => Dashboard(index: 0)),
        );
        break;

      case '/media':
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (_) => ChangeNotifierProvider(
              create: (_) => MediaProvider(),
              child: MediaScreen(),
            ),
          ),
        );
        break;
      case '/News-Releases':
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (_) => ChangeNotifierProvider(
              create: (_) => NewsReleaseProvider(),
              child: NewsRelease(),
            ),
          ),
        );
        break;

      case '/who-we-are/Vision':
      case '/what-we-do/Privacy-Statement':
      case '/what-we-do/Legal-Disclaimer':
      case '/what-we-do/Our-Policies':
      case '/what-we-do/Mission':
      case '/what-we-do/political-neutrality-declaration':
      case '/who-we-are/Leadership-Team':
      case '/merck-foundation-overview':
      case '/who-we-are/Leadership-Team-Message':
      case '/message-from-leadership-team':
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => CommonContentPage(menuID: menuId, title: title),
          ),
        );
        break;

      case '/our-partners':
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => OurPartnersScreen(menuID: menuId, title: title),
          ),
        );
        break;

      case '/contact-uss':
      case '/who-we-are/Contact-Us':
        Navigator.push(context, MaterialPageRoute(builder: (_) => ContactUs()));
        break;
          case '/News-Articles':
        Navigator.push(context, MaterialPageRoute(builder: (_) => Dashboard(index: 3,)));
        break;
         case '/Upcoming-Programs-&-Call-For-Applications':
        Navigator.push(context, MaterialPageRoute(builder: (_) => Dashboard(index: 4,)));
        break;

      case '/videos':
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => MediaListingScreen(
              type: MediaType.videoLibrary,
              categoryID: "",
              albumID: "",
              albumName: "",
            ),
          ),
        );
        break;
      case '/Merck-Foundation-Alumni-Testimonials':
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => MediaListingScreen(
              type: MediaType.testimonial,
              categoryID: "",
              albumID: "",
              albumName: "",
            ),
          ),
        );
        break;
      case '/Photo-Gallery':
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => MediaListingScreen(
              type: MediaType.photoGallery,
              categoryID: "",
              albumID: "",
              albumName: "",
            ),
          ),
        );
        break;
      case '/what-we-do/Our-Activities':
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => MediaListingScreen(
              type: MediaType.activity,
              categoryID: "",
              albumID: "",
              albumName: "",
            ),
          ),
        );
        break;
      case '/Digital-Library':
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => MediaListingScreen(
              type: MediaType.digitalLibrary,
              categoryID: "",
              albumID: "",
              albumName: "",
            ),
          ),
        );
        break;

      default:
        print("⚠️ Unknown route: $url");
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
