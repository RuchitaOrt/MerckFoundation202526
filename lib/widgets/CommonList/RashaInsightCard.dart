import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:merckfoundation_252026/Provider/RashaInsightsProvider.dart';
import 'package:merckfoundation_252026/Utility/AppSizes.dart';

import 'package:merckfoundation_252026/Utility/ResponsiveFlutter.dart';
import 'package:merckfoundation_252026/CommonUtils/common_images.dart';
import 'package:merckfoundation_252026/CommonUtils/customcolor.dart';
import 'package:merckfoundation_252026/Utility/showdailog.dart';
import 'package:merckfoundation_252026/enum/commonEnum.dart';
import 'package:merckfoundation_252026/screens/DetailsScreen/DetailScreen.dart';
import 'package:merckfoundation_252026/widgets/CommonWidget/CommonFunctions.dart';
import 'package:merckfoundation_252026/widgets/CommonWidget/ImageShimmer.dart';
import 'package:merckfoundation_252026/widgets/CommonWidget/customappbar.dart';
import 'package:merckfoundation_252026/widgets/SmartHtmlWidget.dart';
import 'package:provider/provider.dart';

// class RashaKelejCard extends StatelessWidget {
//   // final String title;
//   // final List content;
//   // final String shareLink;
//   final String menuID;

//   const RashaKelejCard({
//     super.key,
//     // required this.content,
//     // required this.shareLink,
//     required this.menuID,
//     // required this.title,
//   });

//   @override
//   Widget build(BuildContext context) {

//     final responsive = ResponsiveFlutter.of(context);

//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           // =====================================================
//           // COMMON TITLE
//           // =====================================================
//           SmartHtmlWidget(
//             html: title ?? "",

//             // textColor: Customcolor.textBlueColor,
//             // ignorefontStyles: true,
//           ),

//           const SizedBox(height: 16),

//           // =====================================================
//           // VERTICAL LIST
//           // =====================================================
//           ListView.builder(
//             itemCount: content.length,
//             shrinkWrap: true,
//             physics: const NeverScrollableScrollPhysics(),
//             itemBuilder: (context, index) {
//               return _buildRashaItem(context, content[index]);
//             },
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildRashaItem(BuildContext context, dynamic item) {
//     final responsive = ResponsiveFlutter.of(context);

//     final String imageUrl = item['thumbnail']?.toString() ?? "";

//     final String title = item['title']?.toString() ?? "";

//     final String description = item['description']?.toString() ?? "";

//     final bool showImage =
//         item['rashaweb_url'] != "false" &&
//         item['rashaweb_url'] != false &&
//         item['rashaweb_url'] != null &&
//         item['rashaweb_url'].toString().isNotEmpty &&
//         imageUrl.isNotEmpty;

//     final bool showViewBio =
//         item['substack_url'] != "false" &&
//         item['substack_url'] != false &&
//         item['substack_url'] != null &&
//         item['substack_url'].toString().isNotEmpty;

//     return Container(
//       width: double.infinity,
//       margin: const EdgeInsets.only(bottom: 24),
//       padding: const EdgeInsets.all(12),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(10),
//         // boxShadow: [
//         //   BoxShadow(
//         //     color: Colors.black.withOpacity(0.08),
//         //     blurRadius: 6,
//         //     offset: const Offset(0, 2),
//         //   ),
//         // ],
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           // =====================================================
//           // IMAGE
//           // =====================================================
//           if (showImage)
//             ClipRRect(
//               borderRadius: BorderRadius.circular(8),
//               child: CachedNetworkImage(
//                 imageUrl: imageUrl,

//                 width: double.infinity,

//                 fit: BoxFit.contain,

//                 placeholder: (context, url) {
//                   return const ImageShimmer();
//                 },

//                 errorWidget: (context, url, error) {
//                   return Container(
//                     width: double.infinity,
//                     height: 200,
//                     color: Colors.grey.shade300,
//                     alignment: Alignment.center,
//                     child: Image.asset(
//                       CommonImagePath.placeHolder,
//                       fit: BoxFit.contain,
//                     ),
//                   );
//                 },
//               ),
//             ),

//           if (showImage) const SizedBox(height: 12),

//           // =====================================================
//           // TITLE
//           // =====================================================
//           SmartHtmlWidget(
//             html: title,
//             textColor: Customcolor.blackSubTitle,
//              fontSize: responsive.fontSize(2.5),
//              fontWeight: FontWeight.w600,
//           ),

//           const SizedBox(height: 10),

//           // =====================================================
//           // DESCRIPTION
//           // =====================================================
//           //  SmartHtmlWidget(html: description),
//         ExpandableHtmlDescription(
//   html: description,

// ),
//           const SizedBox(height: 16),

//           // =====================================================
//           // TWO BUTTONS HORIZONTALLY
//           // =====================================================
//           Row(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               _buildButton(
//                 title: "Substack",
//                 icon:  Image.asset(CommonImagePath.substack,width: 20,height: 20,color: Customcolor.colorBlue,),
//                 onTap: () {
//                   ShowDialogs.launchURL(item['substack_url']?.toString() ?? "");
//                 },
//               ),

//               const SizedBox(width: 10),

//               if (showViewBio)
//                 _buildButton(
//                   title: "rasha-kelej.com",
//                   icon: const Icon(Icons.language, size: 15),
//                   onTap: () {
//                     ShowDialogs.launchURL(
//                       item['rashaweb_url']?.toString() ?? "",
//                     );
//                   },
//                 ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }

//   // ===========================================================
//   // BUTTON
//   // ===========================================================

//   Widget _buildButton({
//     required String title,
//     required VoidCallback onTap,
//     required Widget icon,
//   }) {
//     return SizedBox(
//       height: 30,
//       child: ElevatedButton(
//         onPressed: onTap,
//         style: ElevatedButton.styleFrom(
//           backgroundColor: Customcolor.yellow,
//           foregroundColor: Customcolor.colorBlue,
//           elevation: 0,
//           padding: const EdgeInsets.symmetric(horizontal: 10),
//           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
//         ),
//         child: Row(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             icon,
//             const SizedBox(width: 5),
//             Text(
//               title,
//               maxLines: 1,
//               overflow: TextOverflow.ellipsis,
//               style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w700),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

class ExpandableHtmlDescription extends StatefulWidget {
  final String html;

  const ExpandableHtmlDescription({
    super.key,
    required this.html,
  });

  @override
  State<ExpandableHtmlDescription> createState() =>
      _ExpandableHtmlDescriptionState();
}

class _ExpandableHtmlDescriptionState
    extends State<ExpandableHtmlDescription> {
  bool isExpanded = false;

  bool shouldShowReadMore(String html) {
    final text = html
        .replaceAll(RegExp(r'<[^>]*>'), ' ')
        .replaceAll(RegExp(r'\s+'), ' ')
        .trim();

    return text.length > 250;
  }

  @override
  Widget build(BuildContext context) {
    if (widget.html.trim().isEmpty) {
      return const SizedBox();
    }

    final bool showReadMore =
        shouldShowReadMore(widget.html);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SmartHtmlWidget(
          html: widget.html,
          textColor: Customcolor.blackSubTitle,
          fontSize: AppSizes.body(context),
          fontWeight: FontWeight.w300,
          applyMaxLines: showReadMore,
          maxLines: isExpanded ? 9999 : 5,
        ),

        if (showReadMore) ...[
          const SizedBox(height: 4),

          GestureDetector(
            onTap: () {
              setState(() {
                isExpanded = !isExpanded;
              });
            },
            child: Text(
              isExpanded ? "Read Less" : "Read More",
              style: TextStyle(
                color: Customcolor.colorBlue,
                fontSize: 13,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ],
      ],
    );
  }
}

class RashaKelejCard extends StatelessWidget {
  final String menuID;

  const RashaKelejCard({super.key, required this.menuID});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => RashaInsightsProvider()..getRashaInsights(context),
      child: _RashaKelejContent(menuID: menuID),
    );
  }
}

class _RashaKelejContent extends StatelessWidget {
  final String menuID;

  const _RashaKelejContent({required this.menuID});

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveFlutter.of(context);

    return Scaffold(
      backgroundColor: Customcolor.background,
      appBar: CommonAppBar(
        type: AppBarType.inner,
        title: "Senator Dr. Rasha Kelej, CEO of Merck Foundation",
        onSearch: () {},
        shareLink: "",
        menuID: menuID,
      ),
      body: Consumer<RashaInsightsProvider>(
        builder: (context, provider, child) {
          // ==============================
          // LOADING
          // ==============================
          if (provider.isLoading) {
            return const Center(
              child: Padding(
                padding: EdgeInsets.all(30),
                child: CircularProgressIndicator(),
              ),
            );
          }

          // ==============================
          // ERROR
          // ==============================
          if (provider.errorMessage != null) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Text(
                  provider.errorMessage!,
                  textAlign: TextAlign.center,
                ),
              ),
            );
          }

          // ==============================
          // NO DATA
          // ==============================
          if (provider.content.isEmpty) {
            return const SizedBox();
          }

          // ==============================
          // API DATA
          // ==============================
          final List<dynamic> content = provider.content;
          final String pageTitle = provider.pageTitle;

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(
    horizontal: 12,
    vertical: 10,
  ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // ==========================================
                  // COMMON TITLE
                  // ==========================================
                  // if (pageTitle.isNotEmpty)
                  //   SmartHtmlWidget(
                  //     html: pageTitle,
                  //   ),
                  Center(
                    child: SmartHtmlWidget(
                      html: "Beyond Power; Leadership, Global Influence and Impact",
                      textColor: Customcolor.textBlueColor,
                      textalign: TextAlign.center,
                      fontSize: responsive.fontSize(3.0),
                      fontFamily: "Times New Roman",
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  Center(
                    child: SmartHtmlWidget(
                      html: "A Series of Articles developed by Dr. Rasha Kelej",
                      textColor: Customcolor.colorVoilet,
                      fontSize: responsive.fontSize(3.0),
                       textalign: TextAlign.center,
                      fontFamily: "Times New Roman",
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  const SizedBox(height: 16),
              
                  // ==========================================
                  // VERTICAL LIST
                  // ==========================================
                  ListView.builder(
                    itemCount: content.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return _buildRashaItem(context, content[index], responsive);
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildRashaItem(
    BuildContext context,
    dynamic item,
    ResponsiveFlutter responsive,
  ) {
    final String imageUrl = item['image']?.toString() ?? "";

    final String title = item['title']?.toString() ?? "";

    final String description = item['description']?.toString() ?? "";

    // ==========================================
    // IMAGE
    // ==========================================
    final bool showImage = imageUrl.isNotEmpty;

    // ==========================================
    // SUBSTACK
    // ==========================================
    final bool showSubstack =
        item['substack_url'] != null &&
        item['substack_url'] != false &&
        item['substack_url'] != "false" &&
        item['substack_url'].toString().trim().isNotEmpty;

    // ==========================================
    // RASHA WEBSITE
    // ==========================================
    final bool showViewBio =
        item['rasha_web_url'] != null &&
        item['rasha_web_url'] != false &&
        item['rasha_web_url'] != "false" &&
        item['rasha_web_url'].toString().trim().isNotEmpty;

    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 24),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ==========================================
          // IMAGE
          // ==========================================
          if (showImage)
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: CachedNetworkImage(
                imageUrl: imageUrl,
                width: double.infinity,
                fit: BoxFit.contain,
                placeholder: (context, url) {
                  return const ImageShimmer();
                },
                errorWidget: (context, url, error) {
                  return Container(
                    width: double.infinity,
                    height: 200,
                    color: Colors.grey.shade300,
                    alignment: Alignment.center,
                    child: Image.asset(
                      CommonImagePath.placeHolder,
                      fit: BoxFit.contain,
                    ),
                  );
                },
              ),
            ),

          if (showImage) const SizedBox(height: 12),

          // ==========================================
          // TITLE
          // ==========================================
          SmartHtmlWidget(
            html: title,
            textColor: Customcolor.blackSubTitle,
            fontSize: responsive.fontSize(2.5),
            fontWeight: FontWeight.w600,
          ),

          const SizedBox(height: 10),

          // ==========================================
          // DESCRIPTION
          // ==========================================
          ExpandableHtmlDescription(html: description),

          const SizedBox(height: 16),

          // ==========================================
          // BUTTONS
          // ==========================================
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              // SUBSTACK
              if (showSubstack)
                _buildButton(
                  title: "Substack",
                  icon: Image.asset(
                    CommonImagePath.substack,
                    width: 20,
                    height: 20,
                    color: Customcolor.colorBlue,
                  ),
                  onTap: () {
                    ShowDialogs.launchURL(
                      item['substack_url']?.toString() ?? "",
                    );
                  },
                ),

              if (showSubstack && showViewBio) const SizedBox(width: 10),

              // RASHA WEBSITE
              if (showViewBio)
                _buildButton(
                  title: "rasha-kelej.com",
                  icon: const Icon(Icons.language, size: 15),
                  onTap: () {
                    ShowDialogs.launchURL(
                      item['rasha_web_url']?.toString() ?? "",
                    );
                  },
                ),
            ],
          ),
        ],
      ),
    );
  }
bool shouldShowReadMore(String html) {
  final text = html
      .replaceAll(RegExp(r'<[^>]*>'), ' ')
      .replaceAll(RegExp(r'\s+'), ' ')
      .trim();

  return text.length > 250;
}
  Widget _buildButton({
    required String title,
    required VoidCallback onTap,
    required Widget icon,
  }) {
    return SizedBox(
      height: 30,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: Customcolor.yellow,
          foregroundColor: Customcolor.colorBlue,
          elevation: 0,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            icon,
            const SizedBox(width: 5),
            Text(
              title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w700),
            ),
          ],
        ),
      ),
    );
  }
}
