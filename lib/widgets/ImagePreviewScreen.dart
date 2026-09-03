
// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';

// import 'package:merckfoundation_252026/CommonUtils/common_images.dart';
// import 'package:merckfoundation_252026/widgets/CommonWidget/CommonFunctions.dart';
// import 'package:merckfoundation_252026/widgets/CommonWidget/ImageShimmer.dart';

// class ImagePreviewDialog extends StatefulWidget {
//   final String imageUrl;
//   final String title;

//   final VoidCallback? onPrevious;
//   final VoidCallback? onNext;

//   const ImagePreviewDialog({
//     super.key,
//     required this.imageUrl,
//     required this.title,
//     this.onPrevious,
//     this.onNext,
//   });

//   @override
//   State<ImagePreviewDialog> createState() =>
//       _ImagePreviewDialogState();
// }

// class _ImagePreviewDialogState
//     extends State<ImagePreviewDialog> {

//   double? imageAspectRatio;

//   ImageStream? _imageStream;
//   ImageStreamListener? _imageStreamListener;

//   @override
//   void initState() {
//     super.initState();
//     _loadImageSize();
//   }

//   // ===============================================================
//   // GET ACTUAL IMAGE SIZE
//   // ===============================================================

//   void _loadImageSize() {
//     final provider =
//         CachedNetworkImageProvider(widget.imageUrl);

//     final stream = provider.resolve(
//       const ImageConfiguration(),
//     );

//     _imageStream = stream;

//     _imageStreamListener = ImageStreamListener(
//       (ImageInfo info, bool synchronousCall) {
//         final width = info.image.width.toDouble();
//         final height = info.image.height.toDouble();

//         if (width > 0 && height > 0) {
//           if (mounted) {
//             setState(() {
//               imageAspectRatio = width / height;
//             });
//           }
//         }
//       },
//     );

//     stream.addListener(_imageStreamListener!);
//   }

//   @override
//   void dispose() {
//     if (_imageStream != null &&
//         _imageStreamListener != null) {
//       _imageStream!.removeListener(
//         _imageStreamListener!,
//       );
//     }

//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;

//     // =========================================================
//     // CARD WIDTH
//     // =========================================================

//     final cardWidth = size.width * 0.82;

//     // =========================================================
//     // MAXIMUM IMAGE HEIGHT
//     //
//     // Vertical images will never become too tall.
//     // =========================================================

//     const double maxImageHeight = 500;

//     // =========================================================
//     // CALCULATE IMAGE HEIGHT
//     //
//     // Horizontal image:
//     // width / aspect ratio
//     //
//     // Vertical image:
//     // also keeps original ratio but limited by max height.
//     // =========================================================

//     double imageHeight = 300;

//     if (imageAspectRatio != null) {
//       imageHeight =
//           cardWidth / imageAspectRatio!;

//       if (imageHeight > maxImageHeight) {
//         imageHeight = maxImageHeight;
//       }
//     }

//     return Material(
//       color: Colors.transparent,

//       child: Center(
//         child: ConstrainedBox(
//           constraints: BoxConstraints(
//             maxWidth: cardWidth,
//             maxHeight: size.height * 0.82,
//           ),

//           child: Stack(
//             clipBehavior: Clip.none,

//             children: [

//               // =====================================================
//               // MAIN WHITE CARD
//               // =====================================================

//               Container(
//                 width: cardWidth,

//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius:
//                       BorderRadius.circular(16),
//                 ),

//                 clipBehavior: Clip.antiAlias,

//                 child: SingleChildScrollView(
//                   child: Column(
//                     mainAxisSize:
//                         MainAxisSize.min,

//                     children: [

//                       // =================================================
//                       // IMAGE
//                       // =================================================

//                       SizedBox(
//                         width: double.infinity,
//                         height: imageHeight,

//                         child: CachedNetworkImage(
//                           imageUrl:
//                               widget.imageUrl,

//                           // =================================================
//                           // CONTAIN
//                           //
//                           // Image keeps its original aspect ratio.
//                           // Because imageHeight is now calculated from
//                           // the actual image ratio, horizontal images
//                           // will no longer have large white gaps.
//                           // =================================================

//                           fit: BoxFit.contain,

//                           placeholder:
//                               (context, url) {
//                             return const ImageShimmer();
//                           },

//                           errorWidget:
//                               (context, url, error) {
//                             return Image.asset(
//                               CommonImagePath
//                                   .placeHolder,

//                               width:
//                                   double.infinity,

//                               height:
//                                   double.infinity,

//                               fit:
//                                   BoxFit.contain,
//                             );
//                           },
//                         ),
//                       ),

//                       // =================================================
//                       // TITLE
//                       // =================================================

//                       Padding(
//                         padding:
//                             const EdgeInsets.fromLTRB(
//                           8,
//                           8,
//                           8,
//                           8,
//                         ),

//                         child: Align(
//                           alignment:
//                               Alignment.centerLeft,

//                           child: Text(
//                             stripHtml(
//                               widget.title,
//                             ),

//                             textAlign:
//                                 TextAlign.left,

//                             style:
//                                 const TextStyle(
//                               fontSize: 14,
//                               fontWeight:
//                                   FontWeight.w500,
//                               color:
//                                   Colors.black87,
//                               height: 1.25,
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),

//               // =====================================================
//               // CLOSE BUTTON
//               // =====================================================

//               Positioned(
//                 top: -18,
//                 right: -18,

//                 child: Material(
//                   color:
//                       Colors.transparent,

//                   child: InkWell(
//                     onTap: () {
//                       Navigator.of(
//                         context,
//                       ).pop();
//                     },

//                     borderRadius:
//                         BorderRadius.circular(22),

//                     child: Container(
//                       width: 42,
//                       height: 42,

//                       decoration:
//                           BoxDecoration(
//                         color: Colors.black,

//                         shape:
//                             BoxShape.circle,

//                         border:
//                             Border.all(
//                           color: Colors.white,
//                           width: 2,
//                         ),

//                         boxShadow: [
//                           BoxShadow(
//                             color: Colors.black
//                                 .withOpacity(
//                               0.25,
//                             ),
//                             blurRadius: 6,
//                             offset:
//                                 const Offset(
//                               0,
//                               2,
//                             ),
//                           ),
//                         ],
//                       ),

//                       child:
//                           const Icon(
//                         Icons.close,
//                         color: Colors.white,
//                         size: 24,
//                       ),
//                     ),
//                   ),
//                 ),
//               ),

//               // =====================================================
//               // PREVIOUS BUTTON
//               // =====================================================

//               if (widget.onPrevious != null)
//                 Positioned(
//                   left: -22,

//                   top:
//                       imageHeight / 2 - 22,

//                   child:
//                       _navigationButton(
//                     icon:
//                         Icons.chevron_left,
//                     onTap:
//                         widget.onPrevious!,
//                   ),
//                 ),

//               // =====================================================
//               // NEXT BUTTON
//               // =====================================================

//               if (widget.onNext != null)
//                 Positioned(
//                   right: -22,

//                   top:
//                       imageHeight / 2 - 22,

//                   child:
//                       _navigationButton(
//                     icon:
//                         Icons.chevron_right,
//                     onTap:
//                         widget.onNext!,
//                   ),
//                 ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   // ===============================================================
//   // NAVIGATION BUTTON
//   // ===============================================================

//   Widget _navigationButton({
//     required IconData icon,
//     required VoidCallback onTap,
//   }) {
//     return Material(
//       color: Colors.transparent,

//       child: InkWell(
//         onTap: onTap,

//         borderRadius:
//             BorderRadius.circular(22),

//         child: Container(
//           width: 44,
//           height: 44,

//           decoration: BoxDecoration(
//             color: Colors.black.withOpacity(
//               0.60,
//             ),
//             shape: BoxShape.circle,
//           ),

//           child: Icon(
//             icon,
//             color: Colors.white,
//             size: 32,
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:merckfoundation_252026/CommonUtils/common_images.dart';
import 'package:merckfoundation_252026/widgets/CommonWidget/CommonFunctions.dart';
import 'package:merckfoundation_252026/widgets/CommonWidget/ImageShimmer.dart';

class ImagePreviewDialog<T> extends StatefulWidget {
  // ===============================================================
  // COMPLETE LIST
  // ===============================================================

  final List<T> items;

  // ===============================================================
  // CURRENT / TAPPED INDEX
  // ===============================================================

  final int initialIndex;

  // ===============================================================
  // HOW TO GET IMAGE URL FROM MODEL
  // ===============================================================

  final String Function(T item) imageUrl;

  // ===============================================================
  // HOW TO GET TITLE FROM MODEL
  // ===============================================================

  final String Function(T item) title;

  const ImagePreviewDialog({
    super.key,
    required this.items,
    required this.initialIndex,
    required this.imageUrl,
    required this.title,
  });

  @override
  State<ImagePreviewDialog<T>> createState() =>
      _ImagePreviewDialogState<T>();
}

class _ImagePreviewDialogState<T>
    extends State<ImagePreviewDialog<T>> {
bool isTitleExpanded = false;
  // ===============================================================
  // CURRENT INDEX
  // ===============================================================

  late int currentIndex;

  // ===============================================================
  // IMAGE RATIO
  // ===============================================================

  double? imageAspectRatio;

  ImageStream? _imageStream;
  ImageStreamListener? _imageStreamListener;

  // ===============================================================
  // CURRENT ITEM
  // ===============================================================

  T get currentItem =>
      widget.items[currentIndex];

  // ===============================================================
  // CURRENT IMAGE
  // ===============================================================

  String get currentImage =>
      widget.imageUrl(currentItem);

  // ===============================================================
  // CURRENT TITLE
  // ===============================================================

  String get currentTitle =>
      widget.title(currentItem);

  // ===============================================================
  // CAN GO PREVIOUS
  // ===============================================================

  bool get canGoPrevious =>
      currentIndex > 0;

  // ===============================================================
  // CAN GO NEXT
  // ===============================================================

  bool get canGoNext =>
      currentIndex < widget.items.length - 1;

  @override
  void initState() {
    super.initState();

    // Safety check
    currentIndex = widget.initialIndex.clamp(
      0,
      widget.items.length - 1,
    );

    _loadImageSize();
  }

  // ===============================================================
  // LOAD ACTUAL IMAGE SIZE
  // ===============================================================

  void _loadImageSize() {

    // Remove previous listener
    if (_imageStream != null &&
        _imageStreamListener != null) {
      _imageStream!.removeListener(
        _imageStreamListener!,
      );
    }

    // Reset ratio
    imageAspectRatio = null;

    final imageProvider =
        CachedNetworkImageProvider(
      currentImage,
    );

    final stream = imageProvider.resolve(
      const ImageConfiguration(),
    );

    _imageStream = stream;

    _imageStreamListener =
        ImageStreamListener(
      (ImageInfo info, bool synchronousCall) {

        final width =
            info.image.width.toDouble();

        final height =
            info.image.height.toDouble();

        if (width > 0 && height > 0) {

          if (mounted) {
            setState(() {
              imageAspectRatio =
                  width / height;
            });
          }
        }
      },
    );

    stream.addListener(
      _imageStreamListener!,
    );
  }

  // ===============================================================
  // PREVIOUS
  // ===============================================================

void _previousImage() {

  if (!canGoPrevious) {
    return;
  }

  setState(() {
    currentIndex--;
    isTitleExpanded = false;
  });

  _loadImageSize();
}

  // ===============================================================
  // NEXT
  // ===============================================================

void _nextImage() {

  if (!canGoNext) {
    return;
  }

  setState(() {
    currentIndex++;
    isTitleExpanded = false;
  });

  _loadImageSize();
}

  // ===============================================================
  // DISPOSE
  // ===============================================================

  @override
  void dispose() {

    if (_imageStream != null &&
        _imageStreamListener != null) {
      _imageStream!.removeListener(
        _imageStreamListener!,
      );
    }

    super.dispose();
  }

  // ===============================================================
  // BUILD
  // ===============================================================

  @override
  Widget build(BuildContext context) {

    final size =
        MediaQuery.of(context).size;

    // =============================================================
    // CARD WIDTH
    // =============================================================

    final cardWidth =
        size.width * 0.82;

    // =============================================================
    // MAX IMAGE HEIGHT
    // =============================================================

    const double maxImageHeight = 500;

    // =============================================================
    // IMAGE HEIGHT
    // =============================================================

    double imageHeight = 300;

    if (imageAspectRatio != null) {

      imageHeight =
          cardWidth / imageAspectRatio!;

      if (imageHeight >
          maxImageHeight) {
        imageHeight =
            maxImageHeight;
      }
    }

    return Material(
      color: Colors.transparent,

      child: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: cardWidth,
            maxHeight:
                size.height * 0.82,
          ),

          child: Stack(
            clipBehavior: Clip.none,

            children: [

              // ===================================================
              // MAIN WHITE CARD
              // ===================================================

              Container(
                width: cardWidth,

                decoration:
                    BoxDecoration(
                  color: Colors.white,

                  borderRadius:
                      BorderRadius.circular(
                    16,
                  ),
                ),

                clipBehavior:
                    Clip.antiAlias,

                child:
                    SingleChildScrollView(

                  child: Column(
                    mainAxisSize:
                        MainAxisSize.min,

                    children: [

                      // =========================================
                      // IMAGE
                      // =========================================

                      SizedBox(
                        width:
                            double.infinity,

                        height:
                            imageHeight,

                        child:
                            CachedNetworkImage(
                          key: ValueKey(
                            currentImage,
                          ),

                          imageUrl:
                              currentImage,

                          fit:
                              BoxFit.contain,

                          placeholder:
                              (context, url) {
                            return const
                                ImageShimmer();
                          },

                          errorWidget:
                              (
                            context,
                            url,
                            error,
                          ) {
                            return Image.asset(
                              CommonImagePath
                                  .placeHolder,

                              width:
                                  double.infinity,

                              height:
                                  double.infinity,

                              fit:
                                  BoxFit.contain,
                            );
                          },
                        ),
                      ),


// =========================================
// TITLE
// =========================================

Padding(
  padding: const EdgeInsets.fromLTRB(
    8,
    8,
    8,
    8,
  ),

  child: Align(
    alignment: Alignment.centerLeft,

    child: LayoutBuilder(
      builder: (context, constraints) {

        final titleText = stripHtml(
          currentTitle,
        );

        // Check whether text actually needs more than 2 lines
        final textPainter = TextPainter(
          text: TextSpan(
            text: titleText,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Colors.black87,
              height: 1.25,
            ),
          ),
          maxLines: 2,
          textDirection: TextDirection.ltr,
        )..layout(
            maxWidth: constraints.maxWidth,
          );

        final isTextOverflowing =
            textPainter.didExceedMaxLines;

        return Column(
          crossAxisAlignment:
              CrossAxisAlignment.start,

          children: [

            Text(
              titleText,

              maxLines:
                  isTitleExpanded
                      ? null
                      : 2,

              overflow:
                  isTitleExpanded
                      ? TextOverflow.visible
                      : TextOverflow.ellipsis,

              textAlign:
                  TextAlign.left,

              style:
                  const TextStyle(
                fontSize: 14,
                fontWeight:
                    FontWeight.w500,
                color:
                    Colors.black87,
                height: 1.25,
              ),
            ),

            // Show Read More only when
            // title has more than 2 lines
            if (isTextOverflowing)
              GestureDetector(
                onTap: () {
                  setState(() {
                    isTitleExpanded =
                        !isTitleExpanded;
                  });
                },

                child: Padding(
                  padding:
                      const EdgeInsets.only(
                    top: 4,
                  ),

                  child: Text(
                    isTitleExpanded
                        ? 'Read Less'
                        : 'Read More',

                    style:
                        const TextStyle(
                      fontSize: 13,
                      fontWeight:
                          FontWeight.w600,
                      color:
                          Colors.blue,
                    ),
                  ),
                ),
              ),
          ],
        );
      },
    ),
  ),
),

                      // Padding(
                      //   padding:
                      //       const EdgeInsets
                      //           .fromLTRB(
                      //     8,
                      //     8,
                      //     8,
                      //     8,
                      //   ),

                      //   child: Align(
                      //     alignment:
                      //         Alignment.centerLeft,

                      //     child: Text(
                      //       stripHtml(
                      //         currentTitle,
                      //       ),

                      //       textAlign:
                      //           TextAlign.left,

                      //       style:
                      //           const TextStyle(
                      //         fontSize: 14,
                      //         fontWeight:
                      //             FontWeight.w500,
                      //         color:
                      //             Colors.black87,
                      //         height: 1.25,
                      //       ),
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ),

              // ===================================================
              // CLOSE BUTTON
              // ===================================================

              Positioned(
                top: -18,
                right: -18,

                child: Material(
                  color:
                      Colors.transparent,

                  child: InkWell(
                    onTap: () {
                      Navigator.of(
                        context,
                      ).pop();
                    },

                    borderRadius:
                        BorderRadius.circular(
                      22,
                    ),

                    child: Container(
                      width: 42,
                      height: 42,

                      decoration:
                          BoxDecoration(
                        color: Colors.black,

                        shape:
                            BoxShape.circle,

                        border:
                            Border.all(
                          color: Colors.white,
                          width: 2,
                        ),

                        boxShadow: [
                          BoxShadow(
                            color: Colors.black
                                .withOpacity(
                              0.25,
                            ),
                            blurRadius: 6,
                            offset:
                                const Offset(
                              0,
                              2,
                            ),
                          ),
                        ],
                      ),

                      child:
                          const Icon(
                        Icons.close,
                        color: Colors.white,
                        size: 24,
                      ),
                    ),
                  ),
                ),
              ),

              // ===================================================
              // PREVIOUS BUTTON
              // ===================================================

              if (canGoPrevious)
                Positioned(
                  left: -18,

                  top:
                      imageHeight / 2 - 22,

                  child:
                      _navigationButton(
                    icon:
                        Icons.chevron_left,

                    onTap:
                        _previousImage,
                  ),
                ),

              // ===================================================
              // NEXT BUTTON
              // ===================================================

              if (canGoNext)
                Positioned(
                  right: -18,

                  top:
                      imageHeight / 2 - 22,

                  child:
                      _navigationButton(
                    icon:
                        Icons.chevron_right,

                    onTap:
                        _nextImage,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  // ===============================================================
  // NAVIGATION BUTTON
  // ===============================================================

  Widget _navigationButton({
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return Material(
      color: Colors.transparent,

      child: InkWell(
        onTap: onTap,

        borderRadius:
            BorderRadius.circular(22),

        child: Container(
          width: 44,
          height: 44,

          decoration:
              BoxDecoration(
            color:
                Colors.black.withOpacity(
              0.60,
            ),

            shape:
                BoxShape.circle,
          ),

          child: Icon(
            icon,
            color: Colors.white,
            size: 32,
          ),
        ),
      ),
    );
  }
}