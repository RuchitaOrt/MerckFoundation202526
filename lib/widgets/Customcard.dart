import 'package:flutter/material.dart';
import 'package:merckfoundation_252026/Utils/common_images.dart';
import 'package:merckfoundation_252026/widgets/CommonRichText.dart';
import 'package:merckfoundation_252026/widgets/PauseImage.dart';

import '../../Utils/customcolor.dart';
import '../../Utility/ResponsiveFlutter.dart';

class CustomCard extends StatelessWidget {
  // HEADER & TITLE
  final String headerPrefix; // e.g., cardsubtitle
  final String title;        // main title
  final Color? headerColor;
  final Color? titleColor;

  // IMAGE & VIDEO
  final String imageUrl;
  final bool showYoutubeIcon;
  final int? youtubeicon; // for Episode card logic

  // SUBTITLE
  final String? subtitle;     // normal text
  final String? htmlSubtitle; // optional HTML content

  // BUTTON
  final String? buttonText;
  final Color buttonColor;
  final Color buttonTextColor;
  final VoidCallback? onButtonTap;

  // CARD TAP
  final VoidCallback? onCardTap;

  // SHARE / INFO ACTIONS
  final bool showShareIcon;
  final bool showInfoIcon;
  final VoidCallback? onShareTap;
  final VoidCallback? onInfoTap;

  // SCREENSHOT controller for share
 

  const CustomCard({
    super.key,
    required this.headerPrefix,
    required this.title,
    required this.imageUrl,
    this.headerColor,
    this.titleColor,
    this.showYoutubeIcon = false,
    this.youtubeicon,
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

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveFlutter.of(context);

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: responsive.width(3),
        vertical: responsive.height(1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // HEADER
            CommonRichText(
              padding: EdgeInsetsGeometry.all(0),
              title: "$headerPrefix ",
              subtitle: title,
            ),
        
          8.0.heightBox,
          // IMAGE + BUTTON + YOUTUBE ICON
          GestureDetector(
            onTap: onCardTap,
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: AspectRatio(
                    aspectRatio: 16 / 9,
                    child: Image.network(
                      imageUrl,
                      fit: BoxFit.cover,
                      errorBuilder: (_, __, ___) => Container(
                        color: Colors.grey.shade300,
                        child: const Icon(Icons.image_not_supported),
                      ),
                    ),
                  ),
                ),
               if (showYoutubeIcon)
  const Positioned.fill(
    child: Center(
      child: PauseImage(size: 60,),
    ),
  ),

                if (buttonText != null)
                  Positioned(
                    bottom: responsive.height(1.5),
                    right: responsive.width(3),
                    child: GestureDetector(
                      onTap: onButtonTap,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: responsive.width(4),
                          vertical: responsive.height(0.9),
                        ),
                        decoration: BoxDecoration(
                          color: buttonColor,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Text(
                          buttonText!,
                          style: TextStyle(
                            color: buttonTextColor,
                            fontWeight: FontWeight.w700,
                            fontSize: responsive.fontSize(1.8),
                          ),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),

           8.0.heightBox,

          // SUBTITLE / HTML
          if (subtitle != null)
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(width: (showInfoIcon || showShareIcon)?responsive.fontSize(50): responsive.fontSize(58),
                  child: Text(
                    subtitle!,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: responsive.fontSize(2.2),
                      fontWeight: FontWeight.w500,
                      color: Colors.black87,
                    ),
                  ),
                ),
                 if (showInfoIcon || showShareIcon)
            8.0.heightBox,
          if (showInfoIcon || showShareIcon)
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                if (showInfoIcon)
                  GestureDetector(
                    onTap: onInfoTap,
                    child: Icon(
                      Icons.info_rounded,
                      color: Customcolor.colorBlue,
                    ),
                  ),
                if (showInfoIcon && showShareIcon)
                  8.0.widthBox,
                if (showShareIcon)
                  GestureDetector(
                    onTap: onShareTap,
                    child: Image.asset(
                   CommonImagePath.share,
                      width: 25,
                      height: 25,
                    ),
                  ),
              ],
            ),
              ],
            ),
          if (htmlSubtitle != null)

           Text(
              htmlSubtitle!,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
             fontSize: responsive.fontSize(2),
                  color: Customcolor.pink_col,
                  fontWeight: FontWeight.w600,
              ),
            ),
            

          // SHARE & INFO ICONS (Episode card specific)
         
        ],
      ),
    );
  }
}
