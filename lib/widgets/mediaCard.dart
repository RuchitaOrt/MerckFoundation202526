import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' hide MediaType;
import 'package:merckfoundation_252026/CommonUtils/common_images.dart';
import 'package:merckfoundation_252026/CommonUtils/customcolor.dart';
import 'package:merckfoundation_252026/enum/commonEnum.dart';
import 'package:merckfoundation_252026/screens/MainScreens/EpisodeScreen/EpisodeInformation.dart';
import 'package:merckfoundation_252026/screens/MediaAndStoriesScreen/MediaListingScreen.dart';
import 'package:merckfoundation_252026/widgets/CommonWidget/CommonBorderButton.dart';
import 'package:merckfoundation_252026/widgets/CommonWidget/CommonFunctions.dart';
import 'package:merckfoundation_252026/widgets/CommonWidget/CommonLoader.dart';
import 'package:merckfoundation_252026/widgets/CommonWidget/CommonPopupMenu.dart';
import 'package:merckfoundation_252026/widgets/CommonWidget/ImageShimmer.dart';

import 'package:merckfoundation_252026/widgets/PauseImage.dart';
import 'package:merckfoundation_252026/widgets/formLabel.dart';

class MediaCard extends StatelessWidget {
  final String id;
  final String image;
  final String title;
  final VoidCallback? onTap;
  final bool showPlayIcon;
  final Color fontColor;
  final bool showmenu;
  final String menuID;
  final String subTitle;
  final HomeLayoutType? type;
  final bool content_button;
  final MediaType? mediaType;

  final String? shareLink;

  const MediaCard({
    super.key,
    required this.image,
    required this.title,
    this.onTap,
    this.showPlayIcon = false,
    this.fontColor = Colors.black87,
    this.showmenu = false,
    required this.id,
    required this.menuID,
    this.shareLink,
    this.subTitle = "",
    this.type,
    this.content_button = false,  this.mediaType,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Card(
      elevation: 3,
      margin: const EdgeInsets.all(6), // 🔥 spacing between cards
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10), // smoother radius
      ),
      child: InkWell(
        onTap: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            /// IMAGE
            Expanded(
              flex:
            mediaType==MediaType.photoGallery?3:     (type == HomeLayoutType.MerckMoreThanAmbasdarFormer &&
                      content_button)
                  ? 1
                  : 2, // 🔥 give more space to image
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 8,
                      right: 8,
                      top: 10,
                    ), // 🔥 equal padding
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child:
                      CachedNetworkImage(
                      
  imageUrl: image,
  width: double.infinity,
  height: double.infinity,
  fit:mediaType==MediaType.photoGallery?BoxFit.cover: BoxFit.contain,
  placeholder: (context, url) =>ImageShimmer(),
  errorWidget: (context, url, error) => SizedBox.expand(
    child: Image.asset(
      CommonImagePath.placeHolder,
      fit: BoxFit.contain,
    ),
  ),
),
                      //  Image.network(
                      //   image,
                      //   width: double.infinity,
                      //   height: double.infinity,
                      //   fit: BoxFit.contain,

                      //   loadingBuilder: (context, child, progress) {
                      //     if (progress == null) return child;

                      //     return Container(
                      //       color: Colors.grey.shade200,
                      //       alignment: Alignment.center,
                      //       child: const CommonLoader(),
                      //     );
                      //   },

                      //   errorBuilder: (context, error, stackTrace) {
                      //     return SizedBox.expand(
                      //       child: Image.asset(
                      //         CommonImagePath.placeHolder,
                      //         fit: BoxFit.contain,
                      //       ),
                      //     );
                      //   },
                      // ),
                    ),
                  ),
                  if (showmenu)
                    Positioned(
                      top: 16,
                      right: 12,
                      child: Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.45),
                          shape: BoxShape.circle,
                        ),
                        child: CommonPopupMenu(
                          iconcolor: Colors.white,
                          onSelected: (value) {
                            if (value == "More Info") {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => EpisodeInformation(
                                    episodeid: id,
                                    menuID: menuID,
                                    title: title,
                                    shareLink: shareLink,
                                  ),
                                ),
                              );
                            }
                          },
                        ),
                      ),
                    ),

                  if (showPlayIcon) const PauseImage(),
                ],
              ),
            ),

            /// TEXT
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 6,
                ),
                child: Column(
                  mainAxisAlignment:
                      MainAxisAlignment.center, // 🔥 vertical center
                  crossAxisAlignment: CrossAxisAlignment.center, // optional
                  children: [
                    FormLabel(
                      text:
                        
                       "${title}",
                      maxLines:mediaType==MediaType.photoGallery?2: 3,
                      textAlignment: TextAlign.center,
                      fontSize: screenWidth * 0.030,
                      labelColor: fontColor,
                      fontweight: FontWeight.w500,
                      textOverflow: TextOverflow.ellipsis,
                    ),
                     SizedBox(height: 10),
                    (type== HomeLayoutType.MerckMoreThanAmbasdar ||type==HomeLayoutType.MerckMoreThanAmbasdarFormer)?          FormLabel(
                                text: subTitle ?? "",
                                maxLines: 1,
                                textAlignment: TextAlign.center,
                                fontSize: screenWidth * 0.030,
                                labelColor: Customcolor.colorBlue,
                                fontweight: FontWeight.w800,
                                textOverflow: TextOverflow.ellipsis,
                              ):Container(),
                    // (type==HomeLayoutType.MerckMoreThanAmbasdar || type==HomeLayoutType.MerckMoreThanAmbasdarFormer)?
                    content_button
                        ? 
                        Column(
                            children: [
                             
                              SizedBox(height: 10),
                              Center(
                                child: CommonBorderButton(
                                  title: "View More",
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => MediaListingScreen(
                                          type: MediaType.ambassadorAlbum,
                                          categoryID: "",
                                          albumID: id,
                                          albumName: title,
                                          menuID: menuID,
                                          title: title,
                                          shareLink: shareLink,
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ):
                        Container(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
