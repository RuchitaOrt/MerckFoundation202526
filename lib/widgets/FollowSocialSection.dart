
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:merckfoundation_252026/Utility/showdailog.dart';
import 'package:merckfoundation_252026/CommonUtils/common_images.dart';
import 'package:merckfoundation_252026/CommonUtils/customcolor.dart';
import 'package:merckfoundation_252026/main.dart';

class FollowSocialSection extends StatelessWidget {
  final String title;
  final double? iconSize;
  final int position;
  final List<dynamic> socialLinks;

  const FollowSocialSection({
    super.key,
    required this.title,
    required this.socialLinks,
    this.iconSize,
    this.position = 0,
  });
@override
Widget build(BuildContext context) {
  final screenWidth = MediaQuery.of(context).size.width;

  // Alternate flower position
  final bool showFlowerRight = position % 2 != 0;
  // final bool showFlowerBottom = position % 2== 0;
return Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    // =========================================================
    // TITLE + FLOWER
    // =========================================================
    SizedBox(
      width: double.infinity,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          // =====================================================
          // TITLE
          // Keep original LEFT position
          // =====================================================
          Padding(
            padding: const EdgeInsets.fromLTRB(
              16,
              0,
              80,
              0,
            ),
            child: Text(
              title,
              maxLines: 4,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: screenWidth * 0.055,
                fontWeight: FontWeight.w800,
                color: Customcolor.textBlueColor,
              ),
            ),
          ),

          // =====================================================
          // FLOWER
          // Does NOT take layout space
          // =====================================================
          if (showFlowerRight)
            Positioned(
              right: 20,
              top: -18,
              child: IgnorePointer(
                child: Image.asset(
                  CommonImagePath.followusflower,
                  height: 70,
                ),
              ),
            ),
        ],
      ),
    ),

    // =========================================================
    // SMALL GAP
    // =========================================================
    const SizedBox(height: 8),

    // =========================================================
    // SOCIAL ICONS
    // Keep original horizontal position
    // =========================================================
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Wrap(
        alignment: WrapAlignment.start,
        spacing: 8,
        runSpacing: 14,
        children: socialLinks.map<Widget>((social) {
          return SocialIcon(
            social['social_media_image'] ?? '',
            iconSize: iconSize,
            onTap: () async {
              final link =
                  social['social_media_link'] ?? '';

              if (link.isNotEmpty) {
                await ShowDialogs.launchURL(link);
              }
            },
          );
        }).toList(),
      ),
    ),
  ],
);
  // return Column(
  //   crossAxisAlignment: CrossAxisAlignment.start,
  //   children: [
  //     Row(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //         Expanded(
  //           child: Padding(
  //             padding: const EdgeInsets.fromLTRB(16, 0, 10, 0),
  //             child: Text(
  //               title,
  //               maxLines: 4,
  //               overflow: TextOverflow.ellipsis,
  //               style: TextStyle(
  //                 fontSize: screenWidth * 0.055,
  //                 fontWeight: FontWeight.w800,
  //                 color: Customcolor.textBlueColor,
  //               ),
  //             ),
  //           ),
  //         ),

  //          if (showFlowerRight)
  //           // Transform.translate(
  //           //   offset: const Offset(0, -5),
  //           //   child: 
  //             Padding(
  //               padding: const EdgeInsets.only(right: 20),
  //               child: Image.asset(
  //                 CommonImagePath.followusflower,
  //                 height: 70,
  //               ),
  //             ),
  //           // ),
  //       ],
  //     ),

  //     const SizedBox(height: 12),

  //     Padding(
  //       padding: const EdgeInsets.symmetric(horizontal: 10),
  //       child: Wrap(
  //         alignment: WrapAlignment.start,
  //         spacing: 14,
  //         runSpacing: 14,
  //         children: socialLinks.map<Widget>((social) {
  //           return SocialIcon(
  //             social['social_media_image'] ?? '',
  //             iconSize: iconSize,
  //             onTap: () async {
  //               final link = social['social_media_link'] ?? '';
  //               if (link.isNotEmpty) {
  //                 await ShowDialogs.launchURL(link);
  //               }
  //             },
  //           );
  //         }).toList(),
  //       ),
  //     ),

  //     // if (showFlowerBottom)
  //     //   Padding(
  //     //     padding: const EdgeInsets.only(top: 10),
  //     //     child: Image.asset(
  //     //       CommonImagePath.homeFlowerNew,
  //     //       height: 70,
  //     //     ),
  //     //   ),
  //   ],
  // );
}
// @override
// Widget build(BuildContext context) {
//   final screenWidth = MediaQuery.of(context).size.width;

//   final bool showFlowerRight = title.length <= 25;
//   final bool showFlowerBottom = title.length > 25;

//   return Column(
//     crossAxisAlignment: CrossAxisAlignment.start,
//     mainAxisAlignment: MainAxisAlignment.start,
//     children: [
//       Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Expanded(
//             child: Padding(
//               padding: const EdgeInsets.fromLTRB(16, 0, 10, 0),
//               child: Text(
//                 title,
//                 maxLines: 3,
//                 overflow: TextOverflow.ellipsis,
//                 style: TextStyle(
//                   fontSize: screenWidth * 0.055,
//                   fontWeight: FontWeight.w800,
//                   color: Customcolor.textBlueColor,
//                 ),
//               ),
//             ),
//           ),

//           if (showFlowerRight)
//             Transform.translate(
//     offset: const Offset(0, -30), // Move 12 pixels up
//     child: Image.asset(
//       CommonImagePath.homeFlowerNew,
//       height: 70,
     
//     ),
//   ),
//         ],
//       ),

//       const SizedBox(height: 12),

//       Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 10),
//         child: Wrap(
//           alignment: WrapAlignment.start,
//           spacing: 14,
//           runSpacing: 14,
//           children: socialLinks.map<Widget>((social) {
//             return SocialIcon(
//               social['social_media_image'] ?? '',
//               iconSize: iconSize,
//               onTap: () async {
//                 final link = social['social_media_link'] ?? '';
//                 if (link.isNotEmpty) {
//                   await ShowDialogs.launchURL(link);
//                 }
//               },
//             );
//           }).toList(),
//         ),
//       ),

//       if (showFlowerBottom)
//         Padding(
//           padding: const EdgeInsets.only(top: 10),
//           child: Image.asset(
//             CommonImagePath.homeFlowerNew,
//             height: 70,
//           ),
//         ),
//     ],
//   );
// }
  // @override
  // Widget build(BuildContext context) {
  //   final screenWidth = MediaQuery.of(context).size.width;

  //   return Column(
  //     crossAxisAlignment: CrossAxisAlignment.start,
  //     children: [
  //       /// TITLE
  //       Row(
  //         mainAxisAlignment:
  //             MainAxisAlignment.spaceBetween,
  //         children: [
  //           Expanded(
  //             child: Padding(
  //               padding:
  //                   const EdgeInsets.fromLTRB(
  //                 16,
  //                 0,
  //                 10,
  //                 0,
  //               ),
  //               child: Text(
  //                 title,
  //                 maxLines: 2,
  //                 overflow:
  //                     TextOverflow.ellipsis,
  //                 style: TextStyle(
  //                   fontSize:
  //                       screenWidth * 0.055,
  //                   fontWeight:
  //                       FontWeight.w800,
  //                   color:
  //                       Customcolor.textBlueColor,
  //                 ),
  //               ),
  //             ),
  //           ),

  //           /// TOP FLOWER
  //           if (position == 1)
  //             Image.asset(
  //               CommonImagePath.homeFlowerNew,
  //               height: 70,
  //             ),
  //         ],
  //       ),

  //       const SizedBox(height: 12),

  //       /// SOCIAL ICONS
  //       Padding(
  //         padding: const EdgeInsets.symmetric(
  //           horizontal: 10,
  //         ),
  //         child: Wrap(
  //           alignment: WrapAlignment.center,
  //           spacing: 14,
  //           runSpacing: 14,
  //           children:
  //               socialLinks.map<Widget>((social) {
  //             final image =
  //                 social['social_media_image']
  //                         ?.toString() ??
  //                     "";

  //             final link =
  //                 social['social_media_link']
  //                         ?.toString() ??
  //                     "";

  //             return SocialIcon(
  //               image,
  //               iconSize: iconSize,
  //               onTap: () async {
  //                 if (link.isNotEmpty) {
  //                   await ShowDialogs
  //                       .launchURL(link);
  //                 }
  //               },
  //             );
  //           }).toList(),
  //         ),
  //       ),

  //       /// BOTTOM FLOWER
  //       if (position == 2)
  //         Padding(
  //           padding:
  //               const EdgeInsets.only(top: 10),
  //           child: Image.asset(
  //             CommonImagePath.homeFlowerNew,
  //             height: 70,
  //           ),
  //         ),
  //     ],
  //   );
  // }
}
class FollowSocialDrawer extends StatelessWidget {
  final String title;
  final double? iconSize;
  final int position;
  final List<dynamic> socialLinks;

  const FollowSocialDrawer({
    super.key,
    required this.title,
    required this.socialLinks,
    this.iconSize,
    this.position = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 2,
      ),
      child: Wrap(
        alignment: WrapAlignment.center,
        spacing: 7,
        runSpacing: 14,
        children: socialLinks.map<Widget>((social) {
          final image =
              social['social_media_image']
                      ?.toString() ??
                  '';

          final link =
              social['social_media_link']
                      ?.toString() ??
                  '';

          return SocialIcon(
            image,
            iconSize: iconSize,
            onTap: () async {
              if (link.isNotEmpty) {
                await ShowDialogs.launchURL(link);
              }
            },
          );
        }).toList(),
      ),
    );
  }
}
class SocialIcon extends StatelessWidget {
  final String icon;
  final double? iconSize;
  final VoidCallback onTap;

  const SocialIcon(
    this.icon, {
    super.key,
    this.iconSize,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final size =
        MediaQuery.of(
          routeGlobalKey.currentContext!,
        ).size.width *
            0.12;

    final bool isSvg =
        icon.toLowerCase().endsWith(".svg");

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(size * 0.25),
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
        ),
        child: isSvg
            ? SvgPicture.network(
                icon,
                width:
                    iconSize ?? size * 0.5,
                height:
                    iconSize ?? size * 0.5,
                fit: BoxFit.contain,
                placeholderBuilder: (_) =>
                    const SizedBox(
                  width: 18,
                  height: 18,
                  child:
                      CircularProgressIndicator(
                    strokeWidth: 2,
                  ),
                ),
              )
            : Image.network(
                icon,
                width:
                    iconSize ?? size * 0.5,
                height:
                    iconSize ?? size * 0.5,
                fit: BoxFit.contain,
                errorBuilder:
                    (_, __, ___) =>
                        const Icon(
                  Icons.image_not_supported,
                  size: 18,
                ),
              ),
      ),
    );
  }
}