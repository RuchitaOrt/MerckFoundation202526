import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:merckfoundation_252026/Utility/ResponsiveFlutter.dart';
import 'package:merckfoundation_252026/widgets/CommonWidget/CommonFunctions.dart';
import 'package:merckfoundation_252026/widgets/CommonWidget/customappbar.dart';
import 'package:merckfoundation_252026/CommonUtils/common_images.dart';
import 'package:merckfoundation_252026/CommonUtils/customcolor.dart';
import 'package:merckfoundation_252026/enum/commonEnum.dart';
import 'package:merckfoundation_252026/main.dart';
import 'package:merckfoundation_252026/routes/AppNavigation.dart';
import 'package:merckfoundation_252026/screens/MainUIBody.dart/CommonBody.dart';
import 'package:merckfoundation_252026/widgets/drawer.dart';

class MerckHomeScreen extends StatelessWidget {
  final String menuID;
  final String title;
  final String mennuLogo;

  final String? shareLink;

  MerckHomeScreen({
    super.key,
    required this.menuID,
    required this.title,
    this.shareLink,
    required this.mennuLogo,
  });
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveFlutter.of(context);

    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Customcolor.background,
      appBar: CommonAppBar(
        shareLink: "",
        type: AppBarType.home,
        onDrawer: () => _scaffoldKey.currentState?.openDrawer(),
        onSearch: () {},
        height: Platform.isAndroid? responsive.height(8):  responsive.height(8),
        mennuLogo: mennuLogo,
      ),

      drawer: Theme(
        data: Theme.of(context).copyWith(canvasColor: Colors.transparent),
        child: AppDrawer(),
      ),
      body: CommonBody(menuID),
    );
  }
}
class CategorySection extends StatefulWidget {
  final List content;

  const CategorySection({
    super.key,
    required this.content,
  });

  @override
  State<CategorySection> createState() => _CategorySectionState();
}

class _CategorySectionState extends State<CategorySection> {
  final ScrollController _scrollController = ScrollController();

  Timer? _timer;

  int _currentIndex = 0;

  static const int itemsPerScroll = 3;

  @override
  void initState() {
    super.initState();

    // Start automatic scrolling after 10 seconds
    _timer = Timer.periodic(
      const Duration(seconds: 5),
      (_) {
        _scrollThreeItems();
      },
    );
  }

void _scrollThreeItems() {
  if (!mounted || !_scrollController.hasClients) {
    return;
  }

  if (widget.content.length <= itemsPerScroll) {
    return;
  }

  final int nextIndex =
      _currentIndex + itemsPerScroll;

  // If there are more items, move to the next group
  if (nextIndex < widget.content.length) {
    _currentIndex = nextIndex;
  } else {
    // Reached the end, start again
    _currentIndex = 0;
  }

  const double itemWidth = 110;
  const double spacing = 10;

  double scrollPosition =
      _currentIndex * (itemWidth + spacing);

  // Never scroll beyond the maximum available position
  final double maxScroll =
      _scrollController.position.maxScrollExtent;

  if (scrollPosition > maxScroll) {
    scrollPosition = maxScroll;
  }

  _scrollController.animateTo(
    scrollPosition,
    duration: const Duration(milliseconds: 700),
    curve: Curves.easeInOut,
  );
}
  @override
  void dispose() {
    _timer?.cancel();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.content.isEmpty) {
      return const SizedBox();
    }

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 5,
      ),
      child: SizedBox(
        height: 100,
        child: SingleChildScrollView(
          controller: _scrollController,
          scrollDirection: Axis.horizontal,
          child: Row(
            children: widget.content.map<Widget>((e) {
              final String title =
                  e['title'] is String
                      ? e['title']
                      : "";

              final int menuID =
                  e['id'] is int
                      ? e['id']
                      : 0;

              final String colorString =
                  e['subdescription'] is String
                      ? e['subdescription'].toString().trim()
                      : "";

              final String menuurl =
                  e['description'] is String
                      ? e['description'].toString()
                      : "";

              Color color = Customcolor.colorBlue;

              try {
                String value = colorString;

                // Handle #RRGGBB
                if (value.startsWith('#')) {
                  value = value.substring(1);

                  if (value.length == 6) {
                    value = 'FF$value';
                  }

                  color = Color(
                    int.parse(
                      value,
                      radix: 16,
                    ),
                  );
                }

                // Handle 0xFFRRGGBB
                else if (
                    value.startsWith('0x') ||
                    value.startsWith('0X')) {
                  color = Color(
                    int.parse(value),
                  );
                }

                // Handle plain integer
                else {
                  color = Color(
                    int.parse(value),
                  );
                }
              } catch (e) {
                color = Customcolor.colorBlue;
              }

              return Padding(
                padding: const EdgeInsets.only(
                  right: 10,
                ),
                child: GestureDetector(
                  onTap: () {
                    AppNavigation.navigateByMenuId(
                      context,
                      menuId: menuID.toString(),
                      title: title,
                      shareLink: menuurl,
                    );
                  },
                  child: Container(
                    width: 110,
                    height: 130,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 10,
                    ),
                    decoration: BoxDecoration(
                      color: color,
                      borderRadius:
                          BorderRadius.circular(6),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black
                              .withOpacity(0.12),
                          blurRadius: 4,
                          offset:
                              const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Center(
                      child: Text(
                        title,
                        textAlign: TextAlign.center,
                        maxLines: 4,
                        overflow:
                            TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight:
                              FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}

// class CategorySection extends StatelessWidget {
//   final List content;

//   const CategorySection({
//     super.key,
//     required this.content,
//   });

//   @override
//   Widget build(BuildContext context) {
//     if (content.isEmpty) {
//       return const SizedBox();
//     }

//     return Container(
//       width: double.infinity,
//       padding: const EdgeInsets.symmetric(
//         horizontal: 16,
//         vertical: 5,
//       ),
//       child: SizedBox(
//         height: 100,

//         child: SingleChildScrollView(
//           scrollDirection: Axis.horizontal,

//           child: Row(
//             children: content.map<Widget>((e) {
//               final String title =
//                   e['title'] is String
//                       ? e['title']
//                       : "";

//               final int menuID =
//                   e['id'] is int
//                       ? e['id']
//                       : 0;

//               // final String colorString =
//               //     e['subdescription'] is String
//               //         ? e['subdescription']
//               //         : "0xFF000000";

//               // final String menuurl =
//               //     e['description'] is String
//               //         ? e['description']
//               //         : "";

//               // final Color color =
//               //     Color(int.parse(colorString));
// final String colorString =
//     e['subdescription'] is String
//         ? e['subdescription'].toString().trim()
//         : "";

// final String menuurl =
//     e['description'] is String
//         ? e['description'].toString()
//         : "";

// Color color = Customcolor.colorBlue;

// try {
//   String value = colorString;

//   // Handle #RRGGBB
//   if (value.startsWith('#')) {
//     value = value.substring(1);

//     // Add FF for opacity if only RRGGBB is provided
//     if (value.length == 6) {
//       value = 'FF$value';
//     }

//     color = Color(int.parse(value, radix: 16));
//   }
//   // Handle 0xFFRRGGBB
//   else if (value.startsWith('0x') || value.startsWith('0X')) {
//     color = Color(int.parse(value));
//   }
//   // Handle plain integer
//   else {
//     color = Color(int.parse(value));
//   }
// } catch (e) {
//   color = Customcolor.colorBlue;
// }
//               return Padding(
//                 padding: const EdgeInsets.only(
//                   right: 10,
//                 ),

//                 child: GestureDetector(
//                   onTap: () {
//                     // Your existing navigation logic

//         AppNavigation.navigateByMenuId(
//           context,
//           menuId: menuID.toString(),
//           title: title,
//           shareLink: menuurl,
//         );
//                   },

//                   child: Container(
//                     width: 110, // ⭐ SAME WIDTH FOR ALL BOXES
//                     height: 130,  // ⭐ BOX HEIGHT

//                     padding: const EdgeInsets.symmetric(
//                       horizontal: 10,
//                       vertical: 10,
//                     ),

//                     decoration: BoxDecoration(
//                       color: color,
//                       borderRadius:
//                           BorderRadius.circular(6),

//                       boxShadow: [
//                         BoxShadow(
//                           color: Colors.black
//                               .withOpacity(0.12),
//                           blurRadius: 4,
//                           offset:
//                               const Offset(0, 2),
//                         ),
//                       ],
//                     ),

//                     child: Center(
//                       child: Text(
//                         title,
//                         textAlign: TextAlign.center,
//                         maxLines: 4,
//                         overflow: TextOverflow.ellipsis,

//                         style: const TextStyle(
//                           color: Colors.white,
//                           fontSize: 14,
//                           fontWeight:
//                               FontWeight.w600,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               );
//             }).toList(),
//           ),
//         ),
//       ),
//     );
//   }
// }





// class CategorySection extends StatelessWidget {
//   final List content;

//   const CategorySection({super.key, required this.content});

//   @override
//   Widget build(BuildContext context) {
//     if (content.isEmpty) return const SizedBox();

//     return Container(
//       width: double.infinity, // ⭐ IMPORTANT: forces full width alignment
//       padding: const EdgeInsets.symmetric(
//         horizontal: 16,
//         vertical: 5,
//       ), // match other sections
//       child: Wrap(
//         alignment: WrapAlignment.start, // ⭐ key fix
//         runAlignment: WrapAlignment.start,
//         crossAxisAlignment: WrapCrossAlignment.start,
//         spacing: 10,
//         runSpacing: 10,
//         children: content.map<Widget>((e) {
//           final String title = e['title'] is String ? e['title'] : "";
//           final int menuID = e['id'] is int ? e['id'] : "";

//           final String colorString = e['subdescription'] is String
//               ? e['subdescription']
//               : "0xFF000000";
//           final String menuurl = e['description'] is String
//               ? e['description']
//               : "";
//           final Color color = Color(int.parse(colorString));

//           return CategoryChip(
//             title: title,
//             color: color,
//             menuID: menuID.toString(),
//             menuurl: menuurl,
//           );
//         }).toList(),
//       ),
//     );
//   }
// }

class CategoryChip extends StatelessWidget {
  final String title;
  final Color color;
  final String menuID;
  final String menuurl;

  const CategoryChip({
    super.key,
    required this.title,
    required this.color,
    required this.menuID,
    required this.menuurl,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: () {
     

        AppNavigation.navigateByMenuId(
          context,
          menuId: menuID,
          title: title,
          shareLink: menuurl,
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: color, width: 2),
        ),
        child: Text(
          stripHtml(title),
          // title,
          textAlign: TextAlign.center,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontSize: width * 0.035,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}

class FollowSection extends StatelessWidget {
  final String title;
  final double? iconSize;
  final int position;
  const FollowSection({
    super.key,
    required this.title,
    this.iconSize,
    this.position = 0,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 10, 0),
                child: Text(
                  stripHtml(title),
                  // title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: screenWidth * 0.055,
                    fontWeight: FontWeight.w800,
                    color: Customcolor.textBlueColor,
                  ),
                ),
              ),
            ),
            position == 0
                ? Container()
                : position == 1
                ? Image.asset(CommonImagePath.homeFlowerNew, height: 70)
                : Container(),
          ],
        ),
        const SizedBox(height: 12),
        Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SocialIcon(
                CommonImagePath.instagram,
                iconSize: iconSize,
                onTap: () {},
              ),

              SocialIcon(
                CommonImagePath.facebook,
                iconSize: iconSize,
                onTap: () {},
              ),
              SocialIcon(
                CommonImagePath.twitter,
                iconSize: iconSize,
                onTap: () {},
              ),
              SocialIcon(
                CommonImagePath.youtube,
                iconSize: iconSize,
                onTap: () {},
              ),
              SocialIcon(
                CommonImagePath.flicker,
                iconSize: iconSize,
                onTap: () {},
              ),

              SocialIcon(
                CommonImagePath.thread,
                iconSize: iconSize,
                onTap: () {},
              ),
            ],
          ),
        ),
        position == 0
            ? Container()
            : position == 1
            ? Container()
            : Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Image.asset(CommonImagePath.homeFlowerNew, height: 70),
              ),
      ],
    );
  }
}

class SocialIcon extends StatelessWidget {
  final String icon;
  final double? iconSize;
  final VoidCallback onTap;

  const SocialIcon(this.icon, {super.key, this.iconSize, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final size =
        MediaQuery.of(routeGlobalKey.currentContext!).size.width * 0.12;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(size * 0.25),
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
        ),
        child: SvgPicture.asset(
          icon,
          width: iconSize ?? size * 0.5,
          height: iconSize ?? size * 0.5,
        ),
      ),
    );
  }
}
