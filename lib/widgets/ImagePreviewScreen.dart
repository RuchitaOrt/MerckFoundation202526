// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:merckfoundation_252026/CommonUtils/common_images.dart';
// import 'package:merckfoundation_252026/widgets/CommonWidget/CommonFunctions.dart';
// import 'package:merckfoundation_252026/widgets/CommonWidget/ImageShimmer.dart';

// class ImagePreviewDialog extends StatelessWidget {
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
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;

//     final dialogWidth = size.width * 0.88;
//     final dialogHeight = size.height * 0.72;

//     return Dialog(
//       backgroundColor: Colors.transparent,
//       elevation: 0,
//       insetPadding: const EdgeInsets.symmetric(
//         horizontal: 20,
//         vertical: 30,
//       ),
//       child: SizedBox(
//         width: dialogWidth,
//         height: dialogHeight,
//         child: Stack(
//           clipBehavior: Clip.none,
//           children: [

//             // ------------------------------------------------
//             // MAIN IMAGE + DESCRIPTION CARD
//             // ------------------------------------------------
//             Positioned.fill(
//               child: Container(
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(4),
//                 ),
//                 child: Column(
//                   children: [

//                     // IMAGE
//                     Expanded(
//                       child: ClipRRect(
//                         borderRadius: const BorderRadius.only(
//                           topLeft: Radius.circular(4),
//                           topRight: Radius.circular(4),
//                         ),
//                         child: Container(
//                           width: double.infinity,
//                           color: Colors.white,
//                           child: InteractiveViewer(
//                             minScale: 1,
//                             maxScale: 5,
//                             child: CachedNetworkImage(
//                               imageUrl: imageUrl,
//                               fit: BoxFit.contain,
//                               placeholder: (context, url) {
//                                 return const ImageShimmer();
//                               },
//                               errorWidget: (_, __, ___) {
//                                 return Image.asset(
//                                   CommonImagePath.placeHolder,
//                                   fit: BoxFit.contain,
//                                 );
//                               },
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),

//                     // DESCRIPTION
//                     Container(
//                       width: double.infinity,
//                       padding: const EdgeInsets.fromLTRB(
//                         12,
//                         12,
//                         12,
//                         14,
//                       ),
//                       color: Colors.white,
//                       child: Text(
//                         stripHtml(title),
//                         textAlign: TextAlign.left,
//                         maxLines: 6,
//                         overflow: TextOverflow.ellipsis,
//                         style: const TextStyle(
//                           fontSize: 15,
//                           fontWeight: FontWeight.w500,
//                           color: Colors.black87,
//                           height: 1.25,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),

//             // ------------------------------------------------
//             // CLOSE BUTTON
//             // ------------------------------------------------
//             Positioned(
//               top: -18,
//               right: -12,
//               child: Material(
//                 color: Colors.transparent,
//                 child: InkWell(
//                   onTap: () {
//                     Navigator.of(context).pop();
//                   },
//                   borderRadius: BorderRadius.circular(20),
//                   child: Container(
//                     width: 36,
//                     height: 36,
//                     decoration: BoxDecoration(
//                       color: Colors.black,
//                       shape: BoxShape.circle,
//                       border: Border.all(
//                         color: Colors.white,
//                         width: 2,
//                       ),
//                     ),
//                     child: const Icon(
//                       Icons.close,
//                       color: Colors.white,
//                       size: 20,
//                     ),
//                   ),
//                 ),
//               ),
//             ),

//             // ------------------------------------------------
//             // PREVIOUS
//             // ------------------------------------------------
//             if (onPrevious != null)
//               Positioned(
//                 left: -30,
//                 top: (dialogHeight / 2) - 22,
//                 child: Material(
//                   color: Colors.transparent,
//                   child: InkWell(
//                     onTap: onPrevious,
//                     borderRadius: BorderRadius.circular(25),
//                     child: Container(
//                       width: 44,
//                       height: 44,
//                       decoration: BoxDecoration(
//                         color: Colors.black.withOpacity(0.55),
//                         shape: BoxShape.circle,
//                       ),
//                       child: const Icon(
//                         Icons.chevron_left,
//                         color: Colors.white,
//                         size: 32,
//                       ),
//                     ),
//                   ),
//                 ),
//               ),

//             // ------------------------------------------------
//             // NEXT
//             // ------------------------------------------------
//             if (onNext != null)
//               Positioned(
//                 right: -30,
//                 top: (dialogHeight / 2) - 22,
//                 child: Material(
//                   color: Colors.transparent,
//                   child: InkWell(
//                     onTap: onNext,
//                     borderRadius: BorderRadius.circular(25),
//                     child: Container(
//                       width: 44,
//                       height: 44,
//                       decoration: BoxDecoration(
//                         color: Colors.black.withOpacity(0.55),
//                         shape: BoxShape.circle,
//                       ),
//                       child: const Icon(
//                         Icons.chevron_right,
//                         color: Colors.white,
//                         size: 32,
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//           ],
//         ),
//       ),
//     );
//   }
// }
// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:merckfoundation_252026/CommonUtils/common_images.dart';
// import 'package:merckfoundation_252026/widgets/CommonWidget/CommonFunctions.dart';
// import 'package:merckfoundation_252026/widgets/CommonWidget/ImageShimmer.dart';

// class ImagePreviewDialog extends StatelessWidget {
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
// @override
// Widget build(BuildContext context) {
//   final size = MediaQuery.of(context).size;

//   final cardWidth = size.width * 0.82;
//   final imageHeight = cardWidth * 0.62;

//   return Material(
//     color: Colors.transparent,
//     child: Center(
//       child: ConstrainedBox(
//         constraints: BoxConstraints(
//           maxWidth: cardWidth,
//           maxHeight: size.height * 0.82,
//         ),
//         child: Stack(
//           clipBehavior: Clip.none,
//           children: [

//             // =========================================================
//             // MAIN CARD
//             // =========================================================
//             Container(
//               width: cardWidth,
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(16),
//               ),
//               clipBehavior: Clip.antiAlias,
//               child: SingleChildScrollView(
//                 child: Column(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [

//                     // =================================================
//                     // IMAGE
//                     // =================================================
//                     SizedBox(
//                       width: double.infinity,
//                       height: imageHeight,
//                       child: CachedNetworkImage(
//                         imageUrl: imageUrl,
//                         fit: BoxFit.contain,

//                         placeholder: (context, url) {
//                           return const ImageShimmer();
//                         },

//                         errorWidget: (_, __, ___) {
//                           return Image.asset(
//                             CommonImagePath.placeHolder,
//                             fit: BoxFit.cover,
//                           );
//                         },
//                       ),
//                     ),

//                     // =================================================
//                     // TITLE / DESCRIPTION
//                     // =================================================
//                     Padding(
//                       padding: const EdgeInsets.fromLTRB(
//                         16,
//                         14,
//                         16,
//                         16,
//                       ),
//                       child: Align(
//                         alignment: Alignment.centerLeft,
//                         child: Text(
//                           stripHtml(title),
//                           textAlign: TextAlign.left,
//                           style: const TextStyle(
//                             fontSize: 17,
//                             fontWeight: FontWeight.w500,
//                             color: Colors.black87,
//                             height: 1.25,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),

//             // =========================================================
//             // CLOSE BUTTON
//             // =========================================================
//             Positioned(
//               top: -18,
//               right: -18,
//               child: Material(
//                 color: Colors.transparent,
//                 child: InkWell(
//                   onTap: () {
//                     Navigator.of(context).pop();
//                   },
//                   borderRadius: BorderRadius.circular(22),
//                   child: Container(
//                     width: 42,
//                     height: 42,
//                     decoration: BoxDecoration(
//                       color: Colors.black,
//                       shape: BoxShape.circle,
//                       border: Border.all(
//                         color: Colors.white,
//                         width: 2,
//                       ),
//                       boxShadow: [
//                         BoxShadow(
//                           color: Colors.black.withOpacity(0.25),
//                           blurRadius: 6,
//                           offset: const Offset(0, 2),
//                         ),
//                       ],
//                     ),
//                     child: const Icon(
//                       Icons.close,
//                       color: Colors.white,
//                       size: 24,
//                     ),
//                   ),
//                 ),
//               ),
//             ),

//             // =========================================================
//             // PREVIOUS BUTTON
//             // =========================================================
//             if (onPrevious != null)
//               Positioned(
//                 left: -22,
//                 top: imageHeight / 2 - 22,
//                 child: _navigationButton(
//                   icon: Icons.chevron_left,
//                   onTap: onPrevious!,
//                 ),
//               ),

//             // =========================================================
//             // NEXT BUTTON
//             // =========================================================
//             if (onNext != null)
//               Positioned(
//                 right: -22,
//                 top: imageHeight / 2 - 22,
//                 child: _navigationButton(
//                   icon: Icons.chevron_right,
//                   onTap: onNext!,
//                 ),
//               ),
//           ],
//         ),
//       ),
//     ),
//   );
// }
// }Widget _navigationButton({
//   required IconData icon,
//   required VoidCallback onTap,
// }) {
//   return Material(
//     color: Colors.transparent,
//     child: InkWell(
//       onTap: onTap,
//       borderRadius: BorderRadius.circular(22),
//       child: Container(
//         width: 44,
//         height: 44,
//         decoration: BoxDecoration(
//           color: Colors.black.withOpacity(0.60),
//           shape: BoxShape.circle,
//         ),
//         child: Icon(
//           icon,
//           color: Colors.white,
//           size: 32,
//         ),
//       ),
//     ),
//   );
// }
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:merckfoundation_252026/CommonUtils/common_images.dart';
import 'package:merckfoundation_252026/widgets/CommonWidget/CommonFunctions.dart';
import 'package:merckfoundation_252026/widgets/CommonWidget/ImageShimmer.dart';

class ImagePreviewDialog extends StatefulWidget {
  final String imageUrl;
  final String title;

  final VoidCallback? onPrevious;
  final VoidCallback? onNext;

  const ImagePreviewDialog({
    super.key,
    required this.imageUrl,
    required this.title,
    this.onPrevious,
    this.onNext,
  });

  @override
  State<ImagePreviewDialog> createState() =>
      _ImagePreviewDialogState();
}

class _ImagePreviewDialogState
    extends State<ImagePreviewDialog> {

  double? imageAspectRatio;

  ImageStream? _imageStream;
  ImageStreamListener? _imageStreamListener;

  @override
  void initState() {
    super.initState();
    _loadImageSize();
  }

  // ===============================================================
  // GET ACTUAL IMAGE SIZE
  // ===============================================================

  void _loadImageSize() {
    final provider =
        CachedNetworkImageProvider(widget.imageUrl);

    final stream = provider.resolve(
      const ImageConfiguration(),
    );

    _imageStream = stream;

    _imageStreamListener = ImageStreamListener(
      (ImageInfo info, bool synchronousCall) {
        final width = info.image.width.toDouble();
        final height = info.image.height.toDouble();

        if (width > 0 && height > 0) {
          if (mounted) {
            setState(() {
              imageAspectRatio = width / height;
            });
          }
        }
      },
    );

    stream.addListener(_imageStreamListener!);
  }

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

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    // =========================================================
    // CARD WIDTH
    // =========================================================

    final cardWidth = size.width * 0.82;

    // =========================================================
    // MAXIMUM IMAGE HEIGHT
    //
    // Vertical images will never become too tall.
    // =========================================================

    const double maxImageHeight = 500;

    // =========================================================
    // CALCULATE IMAGE HEIGHT
    //
    // Horizontal image:
    // width / aspect ratio
    //
    // Vertical image:
    // also keeps original ratio but limited by max height.
    // =========================================================

    double imageHeight = 300;

    if (imageAspectRatio != null) {
      imageHeight =
          cardWidth / imageAspectRatio!;

      if (imageHeight > maxImageHeight) {
        imageHeight = maxImageHeight;
      }
    }

    return Material(
      color: Colors.transparent,

      child: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: cardWidth,
            maxHeight: size.height * 0.82,
          ),

          child: Stack(
            clipBehavior: Clip.none,

            children: [

              // =====================================================
              // MAIN WHITE CARD
              // =====================================================

              Container(
                width: cardWidth,

                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.circular(16),
                ),

                clipBehavior: Clip.antiAlias,

                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize:
                        MainAxisSize.min,

                    children: [

                      // =================================================
                      // IMAGE
                      // =================================================

                      SizedBox(
                        width: double.infinity,
                        height: imageHeight,

                        child: CachedNetworkImage(
                          imageUrl:
                              widget.imageUrl,

                          // =================================================
                          // CONTAIN
                          //
                          // Image keeps its original aspect ratio.
                          // Because imageHeight is now calculated from
                          // the actual image ratio, horizontal images
                          // will no longer have large white gaps.
                          // =================================================

                          fit: BoxFit.contain,

                          placeholder:
                              (context, url) {
                            return const ImageShimmer();
                          },

                          errorWidget:
                              (context, url, error) {
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

                      // =================================================
                      // TITLE
                      // =================================================

                      Padding(
                        padding:
                            const EdgeInsets.fromLTRB(
                          8,
                          8,
                          8,
                          8,
                        ),

                        child: Align(
                          alignment:
                              Alignment.centerLeft,

                          child: Text(
                            stripHtml(
                              widget.title,
                            ),

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
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // =====================================================
              // CLOSE BUTTON
              // =====================================================

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
                        BorderRadius.circular(22),

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

              // =====================================================
              // PREVIOUS BUTTON
              // =====================================================

              if (widget.onPrevious != null)
                Positioned(
                  left: -22,

                  top:
                      imageHeight / 2 - 22,

                  child:
                      _navigationButton(
                    icon:
                        Icons.chevron_left,
                    onTap:
                        widget.onPrevious!,
                  ),
                ),

              // =====================================================
              // NEXT BUTTON
              // =====================================================

              if (widget.onNext != null)
                Positioned(
                  right: -22,

                  top:
                      imageHeight / 2 - 22,

                  child:
                      _navigationButton(
                    icon:
                        Icons.chevron_right,
                    onTap:
                        widget.onNext!,
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

          decoration: BoxDecoration(
            color: Colors.black.withOpacity(
              0.60,
            ),
            shape: BoxShape.circle,
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