
// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:carousel_slider/carousel_slider.dart';

// import 'package:merckfoundation_252026/CommonUtils/common_images.dart';
// import 'package:merckfoundation_252026/CommonUtils/customcolor.dart';
// import 'package:merckfoundation_252026/enum/commonEnum.dart';
// import 'package:merckfoundation_252026/screens/MediaAndStoriesScreen/MediaListingScreen.dart';
// import 'package:merckfoundation_252026/widgets/CommonWidget/CommonBorderButton.dart';
// import 'package:merckfoundation_252026/widgets/CommonWidget/CommonFunctions.dart';
// import 'package:merckfoundation_252026/widgets/CommonWidget/ImageShimmer.dart';
// import 'package:merckfoundation_252026/widgets/ImagePreviewScreen.dart';

// class HorizontalAlbumWidget<T> extends StatefulWidget {
//   final String title;
//   final List<T> images;
//   final String categoryID;
//   final String alubumID;
//   final String alubumName;
//   final String Function(T item) imageUrl;
//   final String menuID;
//   final String? shareLink;

//   const HorizontalAlbumWidget({
//     super.key,
//     required this.title,
//     required this.images,
//     required this.imageUrl,
//     required this.categoryID,
//     required this.alubumID,
//     required this.alubumName,
//     required this.menuID,
//     this.shareLink,
//   });

//   @override
//   State<HorizontalAlbumWidget<T>> createState() =>
//       _HorizontalAlbumWidgetState<T>();
// }

// class _HorizontalAlbumWidgetState<T>
//     extends State<HorizontalAlbumWidget<T>> {
//   final CarouselSliderController _carouselController =
//       CarouselSliderController();

//   @override
//   Widget build(BuildContext context) {
//     final screenWidth = MediaQuery.of(context).size.width;

//     // =========================================================
//     // AVAILABLE WIDTH
//     // =========================================================

//     final availableWidth = screenWidth - 32;

//     // =========================================================
//     // CARD SIZE
//     // =========================================================

//     const double cardWidth = 310;
//     const double cardHeight = 190;

//     return Padding(
//       // KEEP YOUR ORIGINAL PADDING
//       padding: const EdgeInsets.only(
//         left: 16,
//         right: 16,
//         top: 18,
//       ),

//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [

//           // =====================================================
//           // TITLE
//           // =====================================================

//           Text(
//             stripHtml(widget.title.trim()),
//             style: TextStyle(
//               fontSize: screenWidth * 0.038,
//               fontWeight: FontWeight.w800,
//               color: Customcolor.textBlueColor,
//             ),
//           ),

//           const SizedBox(height: 14),

//           // =====================================================
//           // IMAGE CAROUSEL
//           // =====================================================

//           SizedBox(
//             width: availableWidth,
//             height: cardHeight,

//             child: CarouselSlider.builder(
//               carouselController: _carouselController,

//               itemCount: widget.images.length,

//               itemBuilder: (
//                 BuildContext context,
//                 int index,
//                 int realIndex,
//               ) {
//                 final item = widget.images[index];

//                 return _buildImageCard(
//                   context,
//                   item, index,
//                   cardWidth,
//                   cardHeight,
//                 );
//               },

//               options: CarouselOptions(
//                 // =================================================
//                 // HEIGHT
//                 // =================================================

//                 height: cardHeight,

//                 // =================================================
//                 // CARD WIDTH
//                 // =================================================

//                 viewportFraction:
//                     cardWidth / availableWidth,

//                 // =================================================
//                 // START FROM LEFT
//                 // =================================================

//                 padEnds: false,

//                 // =================================================
//                 // AUTOPLAY
//                 // =================================================

//                 autoPlay: widget.images.length > 1,

//                 autoPlayInterval:
//                     const Duration(seconds: 8),

//                 autoPlayAnimationDuration:
//                     const Duration(milliseconds: 700),

//                 autoPlayCurve:
//                     Curves.easeInOut,

//                 // =================================================
//                 // INFINITE SCROLL
//                 // =================================================

//                 enableInfiniteScroll:
//                     widget.images.length > 1,

//                 // =================================================
//                 // NO CENTER ENLARGE
//                 // =================================================

//                 enlargeCenterPage: false,

//                 // =================================================
//                 // HORIZONTAL
//                 // =================================================

//                 scrollDirection:
//                     Axis.horizontal,

//                 // =================================================
//                 // START FROM FIRST IMAGE
//                 // =================================================

//                 initialPage: 0,

//                 // =================================================
//                 // PAUSE AUTOPLAY
//                 // =================================================

//                 pauseAutoPlayOnTouch: true,

//                 pauseAutoPlayOnManualNavigate: true,
//               ),
//             ),
//           ),

//           const SizedBox(height: 14),

//           // =====================================================
//           // VIEW MORE BUTTON
//           // =====================================================

//           Center(
//             child: CommonBorderButton(
//               title: "View More",

//               onTap: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (_) =>
//                         MediaListingScreen(
//                       type: MediaType.photoAlbum,

//                       categoryID:
//                           widget.categoryID,

//                       albumID:
//                           widget.alubumID,

//                       albumName:
//                           widget.alubumName,

//                       menuID:
//                           widget.menuID,

//                       shareLink:
//                           widget.shareLink,

//                       title:
//                           widget.title,
//                     ),
//                   ),
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   // =============================================================
//   // IMAGE CARD
//   // =============================================================

//   Widget _buildImageCard(
//     BuildContext context,
//     T item,
//     int index,
//     double cardWidth,
//     double cardHeight,
//   ) {
//     return GestureDetector(

//       // ===========================================================
//       // OPEN IMAGE PREVIEW
//       // ===========================================================

//       onTap: () {
//          print("2Image");
//         showGeneralDialog(
//           context: context,

//           barrierDismissible: true,

//           barrierLabel:
//               'Image Preview',

//           barrierColor:
//               Colors.black.withOpacity(0.75),

//           transitionDuration:
//               const Duration(
//             milliseconds: 200,
//           ),

//           pageBuilder: (
//             context,
//             animation,
//             secondaryAnimation,
//           ) {
//             return ImagePreviewDialog(
//                items: widget.images,
//   initialIndex: index,
//   imageUrl: widget.imageUrl,
//   title: (item) => widget.title.trim(),
//               // imageUrl:
//               //     widget.imageUrl(item),

//               // title:
//               //     widget.title.trim(),
//             );
//           },
//         );
//       },

//       // ===========================================================
//       // CARD
//       // ===========================================================

//       child: Padding(
//         padding: const EdgeInsets.only(right: 20),
//         child: Container(
//           width: cardWidth,
//           height: cardHeight,
        
//           decoration: BoxDecoration(
//             color: Colors.white,
        
//             borderRadius:
//                 BorderRadius.circular(18),
        
//             boxShadow: [
//               BoxShadow(
//                 blurRadius: 10,
        
//                 color:
//                     Colors.black.withOpacity(.08),
        
//                 offset:
//                     const Offset(0, 4),
//               ),
//             ],
//           ),
        
//           // =========================================================
//           // CLIP CORNERS
//           // =========================================================
        
//           child: ClipRRect(
//             borderRadius:
//                 BorderRadius.circular(18),
        
//             child: CachedNetworkImage(
//               imageUrl:
//                   widget.imageUrl(item),
        
//               // =====================================================
//               // IMPORTANT
//               //
//               // COMPLETE IMAGE
//               // NO CROP
//               // NO STRETCH
//               // ORIGINAL ASPECT RATIO
//               // =====================================================
        
//               fit: BoxFit.cover,
        
//               // =====================================================
//               // LOADING
//               // =====================================================
        
//               placeholder: (
//                 context,
//                 url,
//               ) {
//                 return const ImageShimmer();
//               },
        
//               // =====================================================
//               // ERROR
//               // =====================================================
        
//               errorWidget: (
//                 context,
//                 url,
//                 error,
//               ) {
//                 return Container(
//                   color:
//                       Colors.grey.shade200,
        
//                   alignment:
//                       Alignment.center,
        
//                   child: Image.asset(
//                     CommonImagePath.placeHolder,
        
//                     width:
//                         double.infinity,
        
//                     height:
//                         double.infinity,
        
//                     fit:
//                         BoxFit.contain,
//                   ),
//                 );
//               },
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'package:merckfoundation_252026/CommonUtils/common_images.dart';
import 'package:merckfoundation_252026/CommonUtils/customcolor.dart';
import 'package:merckfoundation_252026/enum/commonEnum.dart';
import 'package:merckfoundation_252026/screens/MediaAndStoriesScreen/MediaListingScreen.dart';
import 'package:merckfoundation_252026/widgets/CommonWidget/CommonBorderButton.dart';
import 'package:merckfoundation_252026/widgets/CommonWidget/CommonFunctions.dart';
import 'package:merckfoundation_252026/widgets/CommonWidget/ImageShimmer.dart';
import 'package:merckfoundation_252026/widgets/ImagePreviewScreen.dart';

class HorizontalAlbumWidget<T> extends StatefulWidget {
  final String title;
  final List<T> images;
  final String categoryID;
  final String alubumID;
  final String alubumName;
  final String Function(T item) imageUrl;
  final String menuID;
  final String? shareLink;

  const HorizontalAlbumWidget({
    super.key,
    required this.title,
    required this.images,
    required this.imageUrl,
    required this.categoryID,
    required this.alubumID,
    required this.alubumName,
    required this.menuID,
    this.shareLink,
  });

  @override
  State<HorizontalAlbumWidget<T>> createState() =>
      _HorizontalAlbumWidgetState<T>();
}

class _HorizontalAlbumWidgetState<T>
    extends State<HorizontalAlbumWidget<T>> {
  final CarouselSliderController _carouselController =
      CarouselSliderController();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    // =========================================================
    // AVAILABLE WIDTH
    // =========================================================

    final availableWidth = screenWidth - 32;

    // =========================================================
    // RESPONSIVE CARD HEIGHT
    // =========================================================

    // Maintains approximately 310 x 190 ratio
    // without using a fixed card width.
    final cardHeight = availableWidth * (190 / 310);

    return Padding(
      padding: const EdgeInsets.only(
        left: 16,
        right: 16,
        top: 18,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // =====================================================
          // TITLE
          // =====================================================

          Text(
            stripHtml(widget.title.trim()),
            style: TextStyle(
              fontSize: screenWidth * 0.038,
              fontWeight: FontWeight.w800,
              color: Customcolor.textBlueColor,
            ),
          ),

          const SizedBox(height: 14),

          // =====================================================
          // IMAGE CAROUSEL
          // =====================================================

          SizedBox(
            width: availableWidth,
            height: cardHeight,
            child: CarouselSlider.builder(
              carouselController: _carouselController,

              itemCount: widget.images.length,

              itemBuilder: (
                BuildContext context,
                int index,
                int realIndex,
              ) {
                final item = widget.images[index];

                return _buildImageCard(
                  context,
                  item,
                  index,
                   cardHeight
                  // cardHeight,
                );
              },

              options: CarouselOptions(
                // =================================================
                // HEIGHT
                // =================================================

                height: cardHeight,

                // =================================================
                // FULL AVAILABLE WIDTH
                // =================================================

                viewportFraction: 1.0,

                // =================================================
                // START FROM LEFT
                // =================================================

                padEnds: false,

                // =================================================
                // AUTOPLAY
                // =================================================

                autoPlay: widget.images.length > 1,

                autoPlayInterval:
                    const Duration(seconds: 8),

                autoPlayAnimationDuration:
                    const Duration(milliseconds: 700),

                autoPlayCurve:
                    Curves.easeInOut,

                // =================================================
                // INFINITE SCROLL
                // =================================================

                enableInfiniteScroll:
                    widget.images.length > 1,

                // =================================================
                // NO CENTER ENLARGE
                // =================================================

                enlargeCenterPage: false,

                // =================================================
                // HORIZONTAL
                // =================================================

                scrollDirection:
                    Axis.horizontal,

                // =================================================
                // START FROM FIRST IMAGE
                // =================================================

                initialPage: 0,

                // =================================================
                // PAUSE AUTOPLAY
                // =================================================

                pauseAutoPlayOnTouch: true,

                pauseAutoPlayOnManualNavigate: true,
              ),
            ),
          ),

          const SizedBox(height: 14),

          // =====================================================
          // VIEW MORE BUTTON
          // =====================================================

          Center(
            child: CommonBorderButton(
              title: "View More",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => MediaListingScreen(
                      type: MediaType.photoAlbum,

                      categoryID:
                          widget.categoryID,

                      albumID:
                          widget.alubumID,

                      albumName:
                          widget.alubumName,

                      menuID:
                          widget.menuID,

                      shareLink:
                          widget.shareLink,

                      title:
                          widget.title,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  // =============================================================
  // IMAGE CARD Option 1
  // =============================================================
// Widget _buildImageCard(
//   BuildContext context,
//   T item,
//   int index,
// ) {
//   return GestureDetector(
//     onTap: () {
//       showGeneralDialog(
//         context: context,
//         barrierDismissible: true,
//         barrierLabel: 'Image Preview',
//         barrierColor: Colors.black.withOpacity(0.75),
//         transitionDuration: const Duration(milliseconds: 200),
//         pageBuilder: (
//           context,
//           animation,
//           secondaryAnimation,
//         ) {
//           return ImagePreviewDialog(
//             items: widget.images,
//             initialIndex: index,
//             imageUrl: widget.imageUrl,
//             title: (item) => widget.title.trim(),
//           );
//         },
//       );
//     },
//     child: Container(
//       decoration: BoxDecoration(
//         color: Colors.transparent,
//         borderRadius: BorderRadius.circular(18),
//       ),
//       child: ClipRRect(
//         borderRadius: BorderRadius.circular(18),
//         child: CachedNetworkImage(
//           imageUrl: widget.imageUrl(item),

//           // Don't force width/height
//           fit: BoxFit.contain,

//           placeholder: (context, url) {
//             return const ImageShimmer();
//           },

//           errorWidget: (context, url, error) {
//             return Image.asset(
//               CommonImagePath.placeHolder,
//               fit: BoxFit.contain,
//             );
//           },
//         ),
//       ),
//     ),
//   );
// }

//option2
  Widget _buildImageCard(
    BuildContext context,
    T item,
    int index,
    double cardHeight,
  ) {
    return GestureDetector(
      // ===========================================================
      // OPEN IMAGE PREVIEW
      // ===========================================================

      onTap: () {
        print("2Image");

        showGeneralDialog(
          context: context,

          barrierDismissible: true,

          barrierLabel:
              'Image Preview',

          barrierColor:
              Colors.black.withOpacity(0.75),

          transitionDuration:
              const Duration(
            milliseconds: 200,
          ),

          pageBuilder: (
            context,
            animation,
            secondaryAnimation,
          ) {
            return ImagePreviewDialog(
              items: widget.images,

              initialIndex: index,

              imageUrl:
                  widget.imageUrl,

              title: (item) =>
                  widget.title.trim(),
            );
          },
        );
      },

      // ===========================================================
      // CARD
      // ===========================================================

      child: Padding(
        padding: const EdgeInsets.only(
          right: 20,
        ),

        child: Container(
          // =======================================================
          // NO FIXED WIDTH
          // =======================================================

          width: double.infinity,

          height: cardHeight,

          decoration: BoxDecoration(
            color: Colors.white,

            borderRadius:
                BorderRadius.circular(18),

            boxShadow: [
              BoxShadow(
                blurRadius: 10,

                color:
                    Colors.black.withOpacity(.08),

                offset:
                    const Offset(0, 4),
              ),
            ],
          ),

          // =========================================================
          // CLIP CORNERS
          // =========================================================

          child: ClipRRect(
            borderRadius:
                BorderRadius.circular(18),

            child: CachedNetworkImage(
              imageUrl:
                  widget.imageUrl(item),

              // ===================================================
              // IMAGE
              //
              // BoxFit.cover keeps the existing visual behavior.
              // ===================================================

              fit: BoxFit.cover,

              // ===================================================
              // LOADING
              // ===================================================

              placeholder: (
                context,
                url,
              ) {
                return const ImageShimmer();
              },

              // ===================================================
              // ERROR
              // ===================================================

              errorWidget: (
                context,
                url,
                error,
              ) {
                return Container(
                  color:
                      Colors.grey.shade200,

                  alignment:
                      Alignment.center,

                  child: Image.asset(
                    CommonImagePath.placeHolder,

                    width:
                        double.infinity,

                    height:
                        double.infinity,

                    fit:
                        BoxFit.contain,
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}