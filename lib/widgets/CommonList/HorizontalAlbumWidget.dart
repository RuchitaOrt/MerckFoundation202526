// // import 'package:cached_network_image/cached_network_image.dart';
// // import 'package:flutter/material.dart';
// // import 'package:merckfoundation_252026/CommonUtils/common_images.dart';
// // import 'package:merckfoundation_252026/CommonUtils/customcolor.dart';
// // import 'package:merckfoundation_252026/enum/commonEnum.dart';
// // import 'package:merckfoundation_252026/screens/MediaAndStoriesScreen/MediaListingScreen.dart';
// // import 'package:merckfoundation_252026/widgets/CommonWidget/CommonBorderButton.dart';
// // import 'package:merckfoundation_252026/widgets/CommonWidget/CommonFunctions.dart';
// // import 'package:merckfoundation_252026/widgets/CommonWidget/CommonLoader.dart';
// // import 'package:merckfoundation_252026/widgets/CommonWidget/ImageShimmer.dart';
// // import 'package:merckfoundation_252026/widgets/ImagePreviewScreen.dart';

// // class HorizontalAlbumWidget<T> extends StatelessWidget {
// //   final String title;
// //   final List<T> images;
// //   final String categoryID;
// //   final String alubumID;
// //   final String alubumName;
// //   final String Function(T item) imageUrl;
// //    final String menuID;
  
  

// //   final String? shareLink;

// //   const HorizontalAlbumWidget({
// //     super.key,
// //     required this.title,
// //     required this.images,
// //     required this.imageUrl, required this.categoryID, required this.alubumID, required this.alubumName, required this.menuID, this.shareLink,
// //   });

// //   @override
// //   Widget build(BuildContext context) {
// //     final screenWidth = MediaQuery.of(context).size.width;
// //     return Padding(
// //       padding: const EdgeInsets.only(left: 16, right: 16, top: 18),
// //       child: Column(
// //         crossAxisAlignment: CrossAxisAlignment.start,
// //         children: [
// //           Text(
// //             stripHtml(title.trim()),
// //             // ,
// //             style: TextStyle(
// //               fontSize: screenWidth * 0.038,
// //               fontWeight: FontWeight.w800,
// //               color: Customcolor.textBlueColor,
// //             ),
// //           ),

// //           const SizedBox(height: 14),

// //           SizedBox(
// //             height: 190,
// //             child: ListView.separated(
// //               scrollDirection: Axis.horizontal,
// //               itemCount: images.length,
// //               separatorBuilder: (_, __) => const SizedBox(width: 12),
// //               itemBuilder: (context, index) {
// //                 final item = images[index];

// //                 return GestureDetector(
// //                   onTap: ()
// //                   {
// // //                      showModalBottomSheet(
// // //                         context: context,
// // //                         isScrollControlled: true,
// // //                       backgroundColor: Colors.transparent,
// // // barrierColor: Colors.transparent,
// // //                         builder: (_) => ImagePreviewDialog(
// // //                           imageUrl: imageUrl(item) ?? "",
// // //                           title: title.trim(),
// // //                         ),
// // //                       );
// // showGeneralDialog(
// //   context: context,
// //   barrierDismissible: true,
// //   barrierLabel: 'Image Preview',
// //  barrierColor: Colors.black.withOpacity(0.75),
// //   transitionDuration: const Duration(milliseconds: 200),
// //   pageBuilder: (context, animation, secondaryAnimation) {
// //     return ImagePreviewDialog(
// //       imageUrl: imageUrl(item) ?? "",
// //       title: title.trim(),
// //     );
// //   },
// // );
// //                   },
// //                   child: Container(
// //                     width: 280,
// //                     decoration: BoxDecoration(
// //                       borderRadius: BorderRadius.circular(18),
// //                       color: Colors.white,
// //                       boxShadow: [
// //                         BoxShadow(
// //                           blurRadius: 10,
// //                           color: Colors.black.withOpacity(.08),
// //                           offset: const Offset(0, 4),
// //                         ),
// //                       ],
// //                     ),
// //                     child: ClipRRect(
// //                       borderRadius: BorderRadius.circular(18),
// //                       child: CachedNetworkImage(
// //                         // memCacheWidth: 1000,
// //                         imageUrl: imageUrl(item),
// //                         fit: BoxFit.cover,
// //                        placeholder: (context, url) => const ImageShimmer(),
// //                         errorWidget: (_, __, ___) => Container(
// //                           color: Colors.grey.shade200,
// //                           alignment: Alignment.center,
// //                           child: Image.asset(
// //                             CommonImagePath.placeHolder,
// //                             width: double.infinity,
// //                             height: double.infinity,
// //                             fit: BoxFit.contain,
// //                           ),
// //                         ),
// //                       ),
// //                     ),
// //                   ),
// //                 );
// //               },
// //             ),
// //           ),
// //           const SizedBox(height: 14),
// //           Center(
// //             child: CommonBorderButton(
// //               title: "View More",
// //               onTap: () {
// //                 Navigator.push(
// //                   context,
// //                   MaterialPageRoute(
// //                     builder: (_) =>
// //                         MediaListingScreen(type: MediaType.photoAlbum,categoryID:categoryID ,albumID:alubumID ,albumName:alubumName,
// //                         menuID: menuID,shareLink: shareLink,title: title,),
// //                   ),
// //                 );
// //               },
// //             ),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }
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

//     // Available width after your original left/right padding
//     final availableWidth = screenWidth - 32;

//     // Card width MUST remain 280
//     const double cardWidth = 300;

//     return Padding(
//       // DO NOT CHANGE
//       padding: const EdgeInsets.only(
//         left: 16,
//         right: 16,
//         top: 18,
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           // =========================================================
//           // TITLE
//           // =========================================================

//           Text(
//             stripHtml(widget.title.trim()),
//             style: TextStyle(
//               fontSize: screenWidth * 0.038,
//               fontWeight: FontWeight.w800,
//               color: Customcolor.textBlueColor,
//             ),
//           ),

//           const SizedBox(height: 14),

//           // =========================================================
//           // CAROUSEL
//           // =========================================================

//           SizedBox(
//             height: 190,
//             width: availableWidth,

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
//                   item,
//                 );
//               },

//               options: CarouselOptions(
//                 // ===================================================
//                 // KEEP HEIGHT 190
//                 // ===================================================

//                 height: 190,

//                 // ===================================================
//                 // EXACT 280px CARD WIDTH
//                 // ===================================================

//                 viewportFraction:
//                     cardWidth / availableWidth,

//                 // ===================================================
//                 // IMPORTANT
//                 // LEFT ALIGN
//                 // ===================================================

//                 padEnds: false,

//                 // ===================================================
//                 // AUTO PLAY
//                 // ===================================================

//                 autoPlay: widget.images.length > 1,

//                 // Wait 3 seconds
//                 autoPlayInterval:
//                     const Duration(seconds: 3),

//                 // Animation speed
//                 autoPlayAnimationDuration:
//                     const Duration(milliseconds: 700),

//                 autoPlayCurve: Curves.easeInOut,

//                 // ===================================================
//                 // CIRCULAR
//                 // ===================================================

//                 enableInfiniteScroll:
//                     widget.images.length > 1,

//                 // ===================================================
//                 // NO ENLARGE
//                 // ===================================================

//                 enlargeCenterPage: false,

//                 // ===================================================
//                 // HORIZONTAL
//                 // ===================================================

//                 scrollDirection: Axis.horizontal,

//                 initialPage: 0,

//                 // Pause when user touches
//                 pauseAutoPlayOnTouch: true,

//                 pauseAutoPlayOnManualNavigate: true,
//               ),
//             ),
//           ),

//           const SizedBox(height: 14),

//           // =========================================================
//           // VIEW MORE
//           // =========================================================

//           Center(
//             child: CommonBorderButton(
//               title: "View More",
//               onTap: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (_) => MediaListingScreen(
//                       type: MediaType.photoAlbum,
//                       categoryID: widget.categoryID,
//                       albumID: widget.alubumID,
//                       albumName: widget.alubumName,
//                       menuID: widget.menuID,
//                       shareLink: widget.shareLink,
//                       title: widget.title,
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

//   // ===============================================================
//   // IMAGE CARD
//   // ===============================================================

//   Widget _buildImageCard(
//     BuildContext context,
//     T item,
//   ) {
//     return GestureDetector(
//       onTap: () {
//         showGeneralDialog(
//           context: context,
//           barrierDismissible: true,
//           barrierLabel: 'Image Preview',
//           barrierColor: Colors.black.withOpacity(0.75),
//           transitionDuration:
//               const Duration(milliseconds: 200),
//           pageBuilder: (
//             context,
//             animation,
//             secondaryAnimation,
//           ) {
//             return ImagePreviewDialog(
//               imageUrl: widget.imageUrl(item),
//               title: widget.title.trim(),
//             );
//           },
//         );
//       },

//       child: Container(
//         // =========================================================
//         // EXACT ORIGINAL WIDTH
//         // =========================================================

//         width: 280,

//         // =========================================================
//         // EXACT ORIGINAL HEIGHT
//         // =========================================================

//         height: 390,

//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(18),
//           color: Colors.white,
//           boxShadow: [
//             BoxShadow(
//               blurRadius: 10,
//               color: Colors.black.withOpacity(.08),
//               offset: const Offset(0, 4),
//             ),
//           ],
//         ),

//         child: ClipRRect(
//           borderRadius: BorderRadius.circular(18),

//           child: CachedNetworkImage(
//             imageUrl: widget.imageUrl(item),

//             // KEEP ORIGINAL IMAGE BEHAVIOR
//             fit: BoxFit.cover,

//             placeholder: (
//               context,
//               url,
//             ) =>
//                 const ImageShimmer(),

//             errorWidget: (
//               context,
//               url,
//               error,
//             ) =>
//                 Container(
//               color: Colors.grey.shade200,
//               alignment: Alignment.center,
//               child: Image.asset(
//                 CommonImagePath.placeHolder,
//                 width: double.infinity,
//                 height: double.infinity,
//                 fit: BoxFit.contain,
//               ),
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
    // CARD SIZE
    // =========================================================

    const double cardWidth = 210;
    const double cardHeight = 190;

    return Padding(
      // KEEP YOUR ORIGINAL PADDING
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
                  item, index,
                  cardWidth,
                  cardHeight,
                );
              },

              options: CarouselOptions(
                // =================================================
                // HEIGHT
                // =================================================

                height: cardHeight,

                // =================================================
                // CARD WIDTH
                // =================================================

                viewportFraction:
                    cardWidth / availableWidth,

                // =================================================
                // START FROM LEFT
                // =================================================

                padEnds: false,

                // =================================================
                // AUTOPLAY
                // =================================================

                autoPlay: widget.images.length > 1,

                autoPlayInterval:
                    const Duration(seconds: 3),

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
                    builder: (_) =>
                        MediaListingScreen(
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
  // IMAGE CARD
  // =============================================================

  Widget _buildImageCard(
    BuildContext context,
    T item,
    int index,
    double cardWidth,
    double cardHeight,
  ) {
    return GestureDetector(

      // ===========================================================
      // OPEN IMAGE PREVIEW
      // ===========================================================

      onTap: () {
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
  imageUrl: widget.imageUrl,
  title: (item) => widget.title.trim(),
              // imageUrl:
              //     widget.imageUrl(item),

              // title:
              //     widget.title.trim(),
            );
          },
        );
      },

      // ===========================================================
      // CARD
      // ===========================================================

      child: Padding(
        padding: const EdgeInsets.only(right: 20),
        child: Container(
          width: cardWidth,
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
        
              // =====================================================
              // IMPORTANT
              //
              // COMPLETE IMAGE
              // NO CROP
              // NO STRETCH
              // ORIGINAL ASPECT RATIO
              // =====================================================
        
              fit: BoxFit.cover,
        
              // =====================================================
              // LOADING
              // =====================================================
        
              placeholder: (
                context,
                url,
              ) {
                return const ImageShimmer();
              },
        
              // =====================================================
              // ERROR
              // =====================================================
        
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