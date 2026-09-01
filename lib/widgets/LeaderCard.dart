import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:merckfoundation_252026/Utility/ResponsiveFlutter.dart';
import 'package:merckfoundation_252026/CommonUtils/common_images.dart';
import 'package:merckfoundation_252026/CommonUtils/customcolor.dart';
import 'package:merckfoundation_252026/screens/DetailsScreen/DetailScreen.dart';
import 'package:merckfoundation_252026/widgets/CommonWidget/CommonFunctions.dart';
import 'package:merckfoundation_252026/widgets/CommonWidget/CommonLoader.dart';
import 'package:merckfoundation_252026/widgets/CommonWidget/ImageShimmer.dart';

import 'package:merckfoundation_252026/widgets/SmartHtmlWidget.dart';

class LeaderCard extends StatelessWidget {
  final List content;
  final String shareLink;
  final String menuID;

   LeaderCard({super.key, required this.content, required this.shareLink, required this.menuID});
final Set<String> _displayedLeaderSubtitles = {};
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: content.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (_, index) {
        return leaderContent(content[index], context);
      },
    );
  }
Widget leaderContent(dynamic content, BuildContext context) {
  final responsive = ResponsiveFlutter.of(context);

  final String subtitle =
      stripHtml(content['subtitle']?.toString() ?? '').trim();

  // Check whether this subtitle was already displayed
  final bool showSubtitle =
      subtitle.isNotEmpty &&
      !_displayedLeaderSubtitles.contains(subtitle);

  // Mark subtitle as displayed
  if (showSubtitle) {
    _displayedLeaderSubtitles.add(subtitle);
  }

  return Padding(
    padding: const EdgeInsets.symmetric(
      horizontal: 12,
      vertical: 12,
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [

        // =====================================================
        // SUBTITLE
        // =====================================================

        if (showSubtitle)
          Text(
            subtitle,
            style: TextStyle(
              color: Customcolor.pinkColor,
              fontSize: responsive.fontSize(2.9),
              fontWeight: FontWeight.w600,
              decoration: TextDecoration.underline,
              decorationColor: Customcolor.pinkColor,
              fontFamily: "Verdana",
              decorationThickness: 0.7,
            ),
          ),

        if (showSubtitle)
          4.0.heightBox,

        // =====================================================
        // IMAGE
        // =====================================================

        (content['rashaweb_url'] == "false" ||
                content['rashaweb_url'] == "" ||
                content['rashaweb_url'] == false)
            ? Container()
            : ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: content['thumbnail'] != null &&
                        content['thumbnail']
                            .toString()
                            .isNotEmpty
                    ? CachedNetworkImage(
                        imageUrl:
                            content['thumbnail'].toString(),
                        fit: BoxFit.contain,
                        memCacheHeight: 1000,
                        memCacheWidth: 800,
                        fadeInDuration: Duration.zero,
                        fadeOutDuration: Duration.zero,
                        filterQuality: FilterQuality.low,

                        placeholder: (context, url) {
                          return const ImageShimmer();
                        },

                        errorWidget:
                            (context, url, error) {
                          return Container(
                            color: Colors.grey.shade300,
                            alignment: Alignment.center,
                            child: Image.asset(
                              CommonImagePath.placeHolder,
                              width: double.infinity,
                              height: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          );
                        },
                      )
                    : Container(),
              ),

        8.0.heightBox,

        // =====================================================
        // TITLE
        // =====================================================

        SmartHtmlWidget(
          html: content['title'] ?? "",
          textColor: Customcolor.colorVoilet,
          fontSize: responsive.fontSize(3),
          fontWeight: FontWeight.w800,
        ),

        8.0.heightBox,

        // =====================================================
        // DESCRIPTION
        // =====================================================

        SmartHtmlWidget(
          html: content['subdescription'] ?? "",
        ),

        8.0.heightBox,

        // =====================================================
        // VIEW BIO
        // =====================================================

        (content['substack_url'] == "false" ||
                content['substack_url'] == "")
            ? Container()
            : GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => DetailScreen(
                        articleId:
                            content['id'].toString(),
                        isLeadership: true,
                        content['subdescription'],
                        content['description'],
                        title: content['title'],
                        image: content['thumbnail'],
                        shareLink: shareLink,
                        menuID: menuID,
                        isLeader: true,
                        isDetailApiCalled: false,
                      ),
                    ),
                  );
                },
                child: Text(
                  "((View Bio))",
                  style: TextStyle(
                    color: Customcolor.pinkColor,
                    fontSize: responsive.fontSize(3),
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),

        8.0.heightBox,
      ],
    ),
  );
}
//   Widget leaderContent(dynamic content, BuildContext context) {
//     final responsive = ResponsiveFlutter.of(context);

//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         mainAxisAlignment: MainAxisAlignment.start,
//         children: [
//           Text(
//   stripHtml(content['subtitle']),
//   style: TextStyle(
//     color: Customcolor.pinkColor,
//     fontSize: responsive.fontSize(2.9),
//     fontWeight: FontWeight.w600,
//     decoration: TextDecoration.underline,
//     decorationColor: Customcolor.pinkColor,
//     fontFamily: "Verdana",
//     decorationThickness: 0.7,
//   ),
// ),
//           // Text(
//           //     stripHtml(content['subtitle']),
//           //   // content['subtitle'],
//           //   style: TextStyle(
//           //     color: Customcolor.pinkColor,
//           //     fontSize: responsive.fontSize(3),
              
//           //     fontWeight: FontWeight.w800,
//           //   ),
//           // ),
//           16.0.heightBox,
//           // AspectRatio(
//           //   aspectRatio: 4 / 4,
//           //   child:
//          (content['rashaweb_url'] == "false" || content['rashaweb_url'] == ""||content['rashaweb_url'] == false) ?Container():   ClipRRect(
//   borderRadius: BorderRadius.circular(8),
//   child: content['thumbnail'] != null &&
//           content['thumbnail'].toString().isNotEmpty
//       ? CachedNetworkImage(
//           imageUrl: content['thumbnail'].toString(),
//           fit: BoxFit.contain,
//           memCacheHeight: 1000,
//           memCacheWidth: 800,
//           fadeInDuration: Duration.zero,
//           fadeOutDuration: Duration.zero,
//           filterQuality: FilterQuality.low,
  
//           placeholder: (context, url) {
//             return const ImageShimmer();
//           },
  
//           errorWidget: (context, url, error) {
//             return Container(
//               color: Colors.grey.shade300,
//               alignment: Alignment.center,
//               child: Image.asset(
//                 CommonImagePath.placeHolder,
//                 width: double.infinity,
//                 height: double.infinity,
//                 fit: BoxFit.cover,
//               ),
//             );
//           },
//         )
//       : Container(
         
//         ),

//               //  Image.network(
//               //   content['thumbnail'],
//               //   fit: BoxFit.contain,
//               //   loadingBuilder: (c, w, l) => l == null
//               //       ? w
//               //       : const Center(child: CommonLoader()),
//               //   errorBuilder: (context, error, stackTrace) {
//               //     return Container(
//               //       color: Colors.grey.shade300,
//               //       alignment: Alignment.center,
//               //       child: Image.asset(
//               //         CommonImagePath.placeHolder,
//               //         width: double.infinity,
//               //         height: double.infinity,
//               //         fit: BoxFit.cover,
//               //       ),
//               //     );
//               //   },
//               // ),
//             // ),
//           ),
//           8.0.heightBox,

//           SmartHtmlWidget(
//             html: content['title'] ?? "",
//             textColor: Customcolor.colorVoilet,
//             fontSize: responsive.fontSize(3),
//             fontWeight: FontWeight.w800,
//           ),

//           8.0.heightBox,

//           SmartHtmlWidget(html: content['subdescription'] ?? ""),
//           8.0.heightBox,
//           (content['substack_url'] == "false" || content['substack_url'] == "")
//               ? Container()
//               : GestureDetector(
//                   onTap: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (_) => DetailScreen(
//                           articleId:  content['id'].toString(),
//                           isLeadership: true,
//                           content['subdescription'],
//                           content['description'],
//                           title: content['title'],
//                           image: content['thumbnail'],
//                           shareLink: shareLink ,
//                            menuID:  menuID,
//                            isLeader: true,
//                            isDetailApiCalled: false,
//                         ),
//                       ),
//                     );
//                   },
//                   child: Text(
//                     "((View Bio))",
//                     style: TextStyle(
//                       color: Customcolor.pinkColor,
//                       fontSize: responsive.fontSize(3),
//                       fontWeight: FontWeight.w800,
//                     ),
//                   ),
//                 ),
//           8.0.heightBox,
//         ],
//       ),
//     );
//   }
}
