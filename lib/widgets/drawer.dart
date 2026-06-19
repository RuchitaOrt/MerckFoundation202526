import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:merckfoundation_252026/Provider/SocialProvider.dart';
import 'package:merckfoundation_252026/Provider/navbar_provider.dart';
import 'package:merckfoundation_252026/Utility/ResponsiveFlutter.dart';
import 'package:merckfoundation_252026/routes/AppNavigation.dart';
import 'package:merckfoundation_252026/CommonUtils/common_images.dart';

import 'package:merckfoundation_252026/screens/MainScreens/HomeNewScreen.dart';

import 'package:merckfoundation_252026/screens/MainScreens/dashboard.dart';
import 'package:merckfoundation_252026/CommonUtils/customcolor.dart';
import 'package:merckfoundation_252026/widgets/CommonWidget/CommonLoader.dart';
import 'package:merckfoundation_252026/widgets/FollowSocialSection.dart';
import 'package:merckfoundation_252026/widgets/formLabel.dart';
import 'package:provider/provider.dart';

Map<String, bool> expansionState = {};

class AppDrawer extends StatefulWidget {
  @override
  _AppDrawerState createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  double socialIconSize = 5.5;

  void closeOpenExpansionList(String expansionName) {}

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveFlutter.of(context);
    final navbarProvider = Provider.of<NavbarProvider>(context);

    return Drawer(
      child: Container(
        color: Customcolor.babyBlue,
        child: Column(
          children: [
            /// Scrollable drawer content
            Expanded(
              child: navbarProvider.isLoading
                  ? Center(child: CommonLoader())
                  : ListView(
                      padding: EdgeInsets.zero,
                      children: [
                        _buildHeader(context, "1", "", "", ""),
                        16.0.heightBox,

                        ...navbarProvider.menuList.map((item) {
                          Widget widget;

                          if (item.submenu.isEmpty) {
                            widget = DrawerWidget(
                              value: item.menuName,
                              image: item.mobileLogo,
                              onTapfun: () {
                                AppNavigation.navigateByMenuId(
                                  context,
                                  menuId: item.id.toString(),
                                  title: item.menuName,
                                  shareLink: item.menuUrl,
                                );
                              },
                            );
                          } else {
                            widget = CustomExpansion(
                              title: item.menuName,
                              leadingIcon: item.mobileLogo,
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
                                  // image: sub.mobileLogo,
                                  onTapfun: () {
                                    AppNavigation.navigateByMenuId(
                                      context,
                                      menuId: sub.id.toString(),
                                      title: sub.menuName,
                                      shareLink: sub.menuUrl,
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

            Consumer<SocialProvider>(
              builder: (context, provider, child) {
                if (provider.isLoading) {
                  return const CircularProgressIndicator();
                }

                return FollowSocialDrawer(
                  title: "",
                  iconSize: 14,
                  // position: int.tryParse(item['position'].toString()) ?? 0,
                  socialLinks: provider.socialMediaList,
                );
              },
            ),
            // FollowSection(title: "", iconSize: 15),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(
    BuildContext context,
    String menuId,
    String title,
    String shareLink,
    String mennuLogo,
  ) {
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
                      MaterialPageRoute(
                        builder: (_) => Dashboard(
                          index: 0,
                          menuID: menuId,
                          shareLink: shareLink,
                          menuLogo: mennuLogo,
                        ),
                      ),
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
                if (leadingIcon.isNotEmpty) ...[
                  Image.network(
                    leadingIcon,
                    width: responsive.width(5),
                    height: responsive.width(5),
                  ),
                  16.0.widthBox,
                ],
                Expanded(
                  child: FormLabel(
                    text: title,
                    labelColor: Customcolor.textDarkBlueColor,
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
                  color: Customcolor.textDarkBlueColor,
                ),
              ],
            ),
          ),
        ),
        if (expanded)
          Padding(
            padding: const EdgeInsets.only(left: 38),
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
              Image.network(
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
                labelColor: Customcolor.textDarkBlueColor,
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
