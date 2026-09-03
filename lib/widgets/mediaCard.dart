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
import 'package:merckfoundation_252026/widgets/share_bottom_sheet.dart';

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
    this.content_button = false,
    this.mediaType,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    print("MediaCard");
print(mediaType);
    return Card(
      color: Colors.white,
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
          type == HomeLayoutType.MerckMoreThanAmbasdar
    ? Stack(
        alignment: Alignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 8,
              right: 8,
              top: 10,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: MediaCardImage(
                image: image,
                borderRadius: BorderRadius.circular(8),
              ),
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
                      print("ID is ${id}");
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
                    } else {
                      print(
                        "SHARE Mediea https://sanity.merck-foundation.com${shareLink!}",
                      );
                      ShareBottomSheet.show(
                        context,
                        shareLink: shareLink!,
                      );
                    }
                  },
                ),
              ),
            ),

          if (showPlayIcon) const PauseImage(),
        ],
      )
    :   Expanded(
              flex:
                  //  mediaType==MediaType.photoGallery?3:
                  (type == HomeLayoutType.MerckMoreThanAmbasdarFormer &&
                      content_button)
                  ? 1
                  : type == HomeLayoutType.MerckMoreThanAmbasdarFormer
                  ? 1
                  : title.length > 30
                  ? 2
                  : 3,
              // :title.length <10?4:title.length <20?3: 1, // 🔥 give more space to image
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
                      child: CachedNetworkImage(
                        imageUrl: image,
                        width: double.infinity,
                        height: double.infinity,
                        fit:
                          (type == HomeLayoutType.OurPartners ||
                                type == HomeLayoutType.MerckMoreThanAmbasdar ||
                                type ==
                                    HomeLayoutType
                                        .MerckMoreThanAmbasdarFormer || mediaType ==
                                    MediaType
                                        .ambassadorAlbum||
                                mediaType == MediaType.digitalLibrary)
                            ? BoxFit.contain
                            : BoxFit.cover,
                        //  mediaType==MediaType.photoGallery?BoxFit.cover: BoxFit.contain,
                        placeholder: (context, url) => ImageShimmer(),
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
                              print("ID is ${id}");
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
                            } else {
                              print(
                                "SHARE Mediea https://sanity.merck-foundation.com${shareLink!}",
                              );
                              ShareBottomSheet.show(
                                context,
                                shareLink: shareLink!,
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
       mediaType==MediaType.photoAlbum?Container(height: 6,):      title.length == 0
                ? Container(height: 8)
                :type == HomeLayoutType.MerckMoreThanAmbasdar
    ? Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 6,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            FormLabel(
              text: title,
              maxLines: 3,
              textAlignment: TextAlign.center,
              fontSize: screenWidth * 0.030,
              labelColor: fontColor,
              fontweight: FontWeight.w500,
              textOverflow: TextOverflow.ellipsis,
            ),

            const SizedBox(height: 10),

            if (subTitle.isNotEmpty)
              FormLabel(
                text: subTitle,
                maxLines: 3,
                textAlignment: TextAlign.center,
                fontSize: screenWidth * 0.030,
                labelColor: Customcolor.colorBlue,
                fontweight: FontWeight.w800,
                textOverflow: TextOverflow.ellipsis,
              ),

            if (content_button)
              Column(
                children: [
                  const SizedBox(height: 10),
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
              ),
          ],
        ),
      )
    : Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 6,
                      ),
                      child: Column(
                        mainAxisAlignment:
                            MainAxisAlignment.center, // 🔥 vertical center
                        crossAxisAlignment:
                            CrossAxisAlignment.center, // optional
                        children: [
                          FormLabel(
                            text:
                                // "22222222223333333 erererererererkj nkjkjkjk",
                                "${title}",
                            maxLines: 3,
                            // mediaType==MediaType.photoGallery?2: 3,
                            textAlignment: TextAlign.center,
                            fontSize: screenWidth * 0.030,
                            labelColor: fontColor,
                            fontweight: FontWeight.w500,
                            textOverflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(height: 10),
                         (type == HomeLayoutType.MerckMoreThanAmbasdar ||
                                  type ==
                                      HomeLayoutType
                                          .MerckMoreThanAmbasdarFormer)
                              ? FormLabel(
                                  text: subTitle ?? "",
                                  maxLines: 3,
                                  textAlignment: TextAlign.center,
                                  fontSize: screenWidth * 0.030,
                                  labelColor: Customcolor.colorBlue,
                                  fontweight: FontWeight.w800,
                                  textOverflow: TextOverflow.ellipsis,
                                )
                              : Container(),
                          // (type==HomeLayoutType.MerckMoreThanAmbasdar || type==HomeLayoutType.MerckMoreThanAmbasdarFormer)?
                          content_button
                              ? Column(
                                  children: [
                                    SizedBox(height: 10),
                                    Center(
                                      child: CommonBorderButton(
                                        title: "View More",
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (_) =>
                                                  MediaListingScreen(
                                                    type: MediaType
                                                        .ambassadorAlbum,
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
                                )
                              : Container(),
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

// class MediaCardImage extends StatefulWidget {
//   final String image;
//   final BorderRadius borderRadius;

//   const MediaCardImage({
//     super.key,
//     required this.image,
//     this.borderRadius = BorderRadius.zero,
//   });

//   @override
//   State<MediaCardImage> createState() => _MediaCardImageState();
// }

// class _MediaCardImageState extends State<MediaCardImage> {
//   double? aspectRatio;

//   @override
//   void initState() {
//     super.initState();
//     _loadImageSize();
//   }

//   void _loadImageSize() {
//     final provider = CachedNetworkImageProvider(widget.image);
//     final stream = provider.resolve(const ImageConfiguration());

//     late ImageStreamListener listener;

//     listener = ImageStreamListener(
//       (ImageInfo info, bool synchronousCall) {
//         if (!mounted) return;

//         final width = info.image.width.toDouble();
//         final height = info.image.height.toDouble();

//         if (width > 0 && height > 0) {
//           setState(() {
//             aspectRatio = width / height;
//           });
//         }

//         stream.removeListener(listener);
//       },
//       onError: (error, stackTrace) {
//         stream.removeListener(listener);
//       },
//     );

//     stream.addListener(listener);
//   }

//   @override
//   Widget build(BuildContext context) {
//     final screenWidth = MediaQuery.of(context).size.width;

//     // Width available inside card
//     final imageWidth = screenWidth - 40;

//     // Maximum image height
//     const maxImageHeight = 274;

//     // .0;

//     if (aspectRatio == null) {
//       return SizedBox(
//         width: imageWidth,
//         height: 160,
//         child: CachedNetworkImage(
//           imageUrl: widget.image,
//           width: imageWidth,
//           height: 160,
//           fit: BoxFit.contain,
//           placeholder: (context, url) => const ImageShimmer(),
//           errorWidget: (context, url, error) => Image.asset(
//             CommonImagePath.placeHolder,
//             fit: BoxFit.contain,
//           ),
//         ),
//       );
//     }

//     double imageHeight = imageWidth / aspectRatio!;

//     if (imageHeight > maxImageHeight) {
//       imageHeight = 271;
//       // maxImageHeight;
//     }

//     return SizedBox(
//       width: imageWidth,
//       height: imageHeight,
//       child: CachedNetworkImage(
//         imageUrl: widget.image,
//         width: imageWidth,
//         height: imageHeight,

//         // No cropping
//         fit: BoxFit.contain,

//         placeholder: (context, url) => const ImageShimmer(),

//         errorWidget: (context, url, error) => Image.asset(
//           CommonImagePath.placeHolder,
//           fit: BoxFit.contain,
//         ),
//       ),
//     );
//   }
// }
class MediaCardImage extends StatefulWidget {
  final String image;
  final BorderRadius borderRadius;

  const MediaCardImage({
    super.key,
    required this.image,
    this.borderRadius = BorderRadius.zero,
  });

  @override
  State<MediaCardImage> createState() => _MediaCardImageState();
}

class _MediaCardImageState extends State<MediaCardImage> {
  double? aspectRatio;

  @override
  void initState() {
    super.initState();
    _loadImageSize();
  }

  void _loadImageSize() {
    final provider = CachedNetworkImageProvider(widget.image);
    final stream = provider.resolve(const ImageConfiguration());

    late ImageStreamListener listener;

    listener = ImageStreamListener(
      (ImageInfo info, bool synchronousCall) {
        if (!mounted) return;

        final width = info.image.width.toDouble();
        final height = info.image.height.toDouble();

        if (width > 0 && height > 0) {
          setState(() {
            aspectRatio = width / height;
          });
        }

        stream.removeListener(listener);
      },
      onError: (error, stackTrace) {
        stream.removeListener(listener);
      },
    );

    stream.addListener(listener);
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    // Card width minus card margin + image padding
    final imageWidth = screenWidth - 40;

    // Keep some space for title/subtitle/button
    const maxImageHeight = 245.0;

    if (aspectRatio == null) {
      return SizedBox(
        width: imageWidth,
        height: 160,
        child: CachedNetworkImage(
          imageUrl: widget.image,
          width: imageWidth,
          height: 160,
          fit: BoxFit.contain,
          placeholder: (context, url) => const ImageShimmer(),
          errorWidget: (context, url, error) => Image.asset(
            CommonImagePath.placeHolder,
            fit: BoxFit.contain,
          ),
        ),
      );
    }

    final calculatedHeight = imageWidth / aspectRatio!;

    final imageHeight = calculatedHeight > maxImageHeight
        ? maxImageHeight
        : calculatedHeight;

    return SizedBox(
      width: imageWidth,
      height: imageHeight,
      child: CachedNetworkImage(
        imageUrl: widget.image,
        width: imageWidth,
        height: imageHeight,
        fit: BoxFit.contain,
        placeholder: (context, url) => const ImageShimmer(),
        errorWidget: (context, url, error) => Image.asset(
          CommonImagePath.placeHolder,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}