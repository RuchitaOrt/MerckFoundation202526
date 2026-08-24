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
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:merckfoundation_252026/CommonUtils/common_images.dart';
import 'package:merckfoundation_252026/widgets/CommonWidget/CommonFunctions.dart';
import 'package:merckfoundation_252026/widgets/CommonWidget/ImageShimmer.dart';

class ImagePreviewDialog extends StatelessWidget {
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
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final cardWidth = size.width * 0.82;
    final cardHeight = size.height * 0.45;

    return Material(
      color: Colors.transparent,
      child: Center(
        child: SizedBox(
          width: cardWidth,
          height: cardHeight,
          child: Stack(
            clipBehavior: Clip.none,
            children: [

              // =========================================================
              // IMAGE + DESCRIPTION CARD
              // =========================================================
            // =========================================================
// IMAGE + DESCRIPTION CARD
// =========================================================
Positioned.fill(
  child: ClipRRect(
    borderRadius: BorderRadius.circular(16),
    child: Container(
      color: Colors.white,
      child: Column(
        children: [

          // =================================================
          // FIXED IMAGE AREA
          // =================================================
          SizedBox(
            width: double.infinity,
            height: 250,
            child: Container(
              color: Colors.white,
              child: InteractiveViewer(
                minScale: 1,
                maxScale: 5,
                child: CachedNetworkImage(
                  imageUrl: imageUrl,
                  fit: BoxFit.contain,

                  placeholder: (context, url) {
                    return const ImageShimmer();
                  },

                  errorWidget: (_, __, ___) {
                    return Image.asset(
                      CommonImagePath.placeHolder,
                      fit: BoxFit.contain,
                    );
                  },
                ),
              ),
            ),
          ),

          // =================================================
          // DESCRIPTION
          // =================================================
          Expanded(
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB(
                12,
                12,
                12,
                14,
              ),
              color: Colors.white,
              child: Text(
                stripHtml(title),
                textAlign: TextAlign.left,
                maxLines: 4,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Colors.black87,
                  height: 1.15,
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  ),
),
              // =========================================================
              // CLOSE BUTTON
              // =========================================================
              Positioned(
                top: -18,
                right: -18,
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    borderRadius: BorderRadius.circular(16),
                    child: Container(
                      width: 38,
                      height: 38,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.white,
                          width: 2,
                        ),
                      ),
                      child: const Icon(
                        Icons.close,
                        color: Colors.white,
                        size: 21,
                      ),
                    ),
                  ),
                ),
              ),

              // =========================================================
              // PREVIOUS BUTTON
              // =========================================================
              if (onPrevious != null)
                Positioned(
                  left: -28,
                  top: cardHeight / 2 - 22,
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: onPrevious,
                      borderRadius: BorderRadius.circular(16),
                      child: Container(
                        width: 44,
                        height: 44,
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.55),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.chevron_left,
                          color: Colors.white,
                          size: 32,
                        ),
                      ),
                    ),
                  ),
                ),

              // =========================================================
              // NEXT BUTTON
              // =========================================================
              if (onNext != null)
                Positioned(
                  right: -28,
                  top: cardHeight / 2 - 22,
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: onNext,
                      borderRadius: BorderRadius.circular(16),
                      child: Container(
                        width: 44,
                        height: 44,
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.55),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.chevron_right,
                          color: Colors.white,
                          size: 32,
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}