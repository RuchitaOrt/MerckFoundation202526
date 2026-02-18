import 'package:flutter/material.dart';
import 'package:merckfoundation_252026/Utils/common_images.dart';
import 'package:merckfoundation_252026/widgets/CommonActionButton.dart';
import 'package:merckfoundation_252026/widgets/CommonRichText.dart';
import 'package:merckfoundation_252026/widgets/PauseImage.dart';

import 'package:merckfoundation_252026/Utility/ResponsiveFlutter.dart';
import '../../Utils/customcolor.dart';

class CustomCard extends StatelessWidget {
  final String headerPrefix;
  final String title;
  final String imageUrl;
  final bool showYoutubeIcon;

  final String? subtitle;
  final String? htmlSubtitle;
  final String? buttonText;

  final Color buttonColor;
  final Color buttonTextColor;

  final VoidCallback? onButtonTap;
  final VoidCallback? onCardTap;

  final bool showShareIcon;
  final bool showInfoIcon;
  final VoidCallback? onShareTap;
  final VoidCallback? onInfoTap;

  const CustomCard({
    super.key,
    this.headerPrefix = "",
    this.title = "",
    required this.imageUrl,
    this.showYoutubeIcon = false,
    this.subtitle,
    this.htmlSubtitle,
    this.buttonText,
    this.buttonColor = Colors.amber,
    this.buttonTextColor = Customcolor.text_darkblue,
    this.onButtonTap,
    this.onCardTap,
    this.showShareIcon = false,
    this.showInfoIcon = false,
    this.onShareTap,
    this.onInfoTap,
  });

  /// ✅ Robust YouTube thumbnail extraction
  String get displayImage {
    if (!showYoutubeIcon) return imageUrl;

    try {
      // embed link
      if (imageUrl.contains("/embed/")) {
        final id = imageUrl.split("/embed/").last.split("?").first;
        return "https://img.youtube.com/vi/$id/0.jpg";
      }

      // watch?v=
      if (imageUrl.contains("v=")) {
        final uri = Uri.parse(imageUrl);
        final id = uri.queryParameters['v'];
        if (id != null) {
          return "https://img.youtube.com/vi/$id/0.jpg";
        }
      }

      // youtu.be
      if (imageUrl.contains("youtu.be")) {
        final id = imageUrl.split("/").last.split("?").first;
        return "https://img.youtube.com/vi/$id/0.jpg";
      }
    } catch (_) {}

    return imageUrl;
  }

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveFlutter.of(context);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: responsive.width(3)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// HEADER
          if (headerPrefix.isNotEmpty)
            CommonRichText(
              padding: EdgeInsets.zero,
              title: "$headerPrefix ",
              subtitle: title,
            ),

          8.0.heightBox,

          /// IMAGE / VIDEO
          GestureDetector(
            onTap: onCardTap,
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: SizedBox(
                    width: double.infinity,
                    height: 200, // <-- VERY IMPORTANT
                    child: Image.network(
                      displayImage,
                      fit: BoxFit.cover,
                      errorBuilder: (_, __, ___) =>
                          Container(color: Colors.black12),
                    ),
                  ),
                
                ),

                if (showYoutubeIcon)
                  const Positioned.fill(
                    child: Center(child: PauseImage(size: 60)),
                  ),

                /// ✅ SAFE BUTTON (NO CRASH)
                if (buttonText != null && onButtonTap != null)
                  Positioned(
                    bottom: responsive.height(1.5),
                    right: responsive.width(3),
                    child: CommonActionButton(
                      text: buttonText!,
                      onTap: onButtonTap!,
                    ),
                  ),
              ],
            ),
          ),

          8.0.heightBox,

          /// SUBTITLE + ICONS
          if (subtitle != null)
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    subtitle ?? '',
                    maxLines: 2,
                  style: TextStyle(fontSize: responsive.fontSize(2.5),),
                    overflow: TextOverflow.ellipsis,
                    softWrap: true,
                  ),
                ),

                if (showInfoIcon)
                  GestureDetector(
                    onTap: onInfoTap,
                    child: const Icon(
                      Icons.info_rounded,
                      color: Customcolor.colorBlue,
                    ),
                  ),
                if (showShareIcon)
                  GestureDetector(
                    onTap: onShareTap,
                    child: Image.asset(
                      CommonImagePath.share,
                      width: 24,
                      height: 24,
                    ),
                  ),
              ],
            ),

          if (htmlSubtitle != null)
          Expanded(
                  child: Text(
                    htmlSubtitle ?? '',
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    softWrap: true,
                    style: TextStyle(color: Customcolor.pink_col,fontWeight: FontWeight.w600,fontSize: responsive.fontSize(2.2),),
                  ),
                ),
          
        ],
      ),
    );
  }
}
