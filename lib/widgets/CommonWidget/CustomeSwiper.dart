// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:merckfoundation_252026/Utility/showdailog.dart';
// import 'package:merckfoundation_252026/CommonUtils/common_images.dart';
// import 'package:merckfoundation_252026/CommonUtils/customcolor.dart';
// import 'package:merckfoundation_252026/widgets/CommonWidget/CommonFunctions.dart';
// import 'package:merckfoundation_252026/widgets/CommonWidget/CommonLoader.dart';
// import 'package:merckfoundation_252026/widgets/CommonWidget/ImageShimmer.dart';

// class CustomSwiper extends StatefulWidget {
//   final List items;
//   final Function(int index)? onIndexChanged;

//   const CustomSwiper({
//     super.key,
//     required this.items,
//     this.onIndexChanged,
//   });

//   @override
//   State<CustomSwiper> createState() => _CustomSwiperState();
// }

// class _CustomSwiperState extends State<CustomSwiper> {
//   final PageController _controller = PageController();
//   int currentIndex = 0;
// @override
// void didChangeDependencies() {
//   super.didChangeDependencies();

//   for (final item in widget.items.take(4)) {
//     if (item.image != null && item.image.toString().isNotEmpty) {
//       precacheImage(
//         CachedNetworkImageProvider(item.image),
//         context,
//       );
//     }
//   }
// }
//   @override
//   Widget build(BuildContext context) {
//     return AspectRatio(
//       aspectRatio: 1, // 🔥 responsive for all devices
//       child: Stack(
//         children: [
//           /// 🔥 PAGE VIEW
//           PageView.builder(
//             controller: _controller,
//              allowImplicitScrolling: true,
//             itemCount: widget.items.length,
//             onPageChanged: (index) {
//               currentIndex = index;
//  // Pre-cache next image
//   if (index + 1 < widget.items.length) {
//     final nextItem = widget.items[index + 1];

//     if (nextItem.image != null &&
//         nextItem.image.toString().isNotEmpty) {
//       precacheImage(
//         CachedNetworkImageProvider(nextItem.image),
//         context,
//       );
//     }
//   }
//               /// 🔥 trigger pagination
//               widget.onIndexChanged?.call(index);

//               setState(() {});
//             },
//             itemBuilder: (context, index) {
//               final item = widget.items[index];

//               return Padding(
//                 padding:
//                     const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
//                 child: _SwiperCard(item: item),
//               );
//             },
//           ),

//           /// ⬅️ LEFT ARROW
//           Positioned(
//             left: 5,
//             top: 0,
//             bottom: 0,
//             child: AnimatedOpacity(
//               opacity: currentIndex > 0 ? 1 : 0,
//               duration: const Duration(milliseconds: 200),
//               child: _arrowButton(
//                 icon: Icons.arrow_back_ios_new,
//                 onTap: () {
//                   if (currentIndex > 0) {
//                     _controller.previousPage(
//                       duration: const Duration(milliseconds: 300),
//                       curve: Curves.easeInOut,
//                     );
//                   }
//                 },
//               ),
//             ),
//           ),

//           /// ➡️ RIGHT ARROW
//           Positioned(
//             right: 5,
//             top: 0,
//             bottom: 0,
//             child: AnimatedOpacity(
//               opacity:
//                   currentIndex < widget.items.length - 1 ? 1 : 0,
//               duration: const Duration(milliseconds: 200),
//               child: _arrowButton(
//                 icon: Icons.arrow_forward_ios,
//                 onTap: () {
//                   if (currentIndex < widget.items.length - 1) {
//                     _controller.nextPage(
//                       duration: const Duration(milliseconds: 300),
//                       curve: Curves.easeInOut,
//                     );
//                   }
//                 },
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   /// 🔥 Arrow Button UI
//   Widget _arrowButton({
//     required IconData icon,
//     required VoidCallback onTap,
//   }) {
//     return Center(
//       child: GestureDetector(
//         onTap: onTap,
//         child: Container(
//           margin: const EdgeInsets.symmetric(horizontal: 6),
//           padding: const EdgeInsets.all(10),
//           decoration: BoxDecoration(
//             color: Colors.black45,
//             shape: BoxShape.circle,
//           ),
//           child: Icon(
//             icon,
//             color: Colors.white,
//             size: 18,
//           ),
//         ),
//       ),
//     );
//   }
// }

// /// 🔥 CARD UI
// class _SwiperCard extends StatelessWidget {
//   final dynamic item;

//   const _SwiperCard({required this.item});

//   @override
//   Widget build(BuildContext context) {
//     final width = MediaQuery.of(context).size.width;

//     return Column(
//       children: [
//         /// 🔹 IMAGE
//         Expanded(
//           child: GestureDetector(
//             onTap: ()
//             {
//               ShowDialogs.launchURL(item.pdfFile);
//             },
//             child: AnimatedContainer(
//               duration: const Duration(milliseconds: 300),
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(14),
//                 // boxShadow: const [
//                 //   BoxShadow(color: Colors.black26, blurRadius: 6),
//                 // ],
//               ),
//               child: ClipRRect(
//                 borderRadius: BorderRadius.circular(14),
//                 child:
//                 //  (item.image != null &&
//                 //         item.image.toString().isNotEmpty)
//                 //     ? 
                  
//                     CachedNetworkImage(
//                       // memCacheWidth: 500,
//   imageUrl: item.image,
//   fit: BoxFit.contain,
//    placeholder: (context, url) => const ImageShimmer(),
  
//   errorWidget: (_, __, ___) => Image.asset(
//     CommonImagePath.placeHolder,
//     fit: BoxFit.contain,
//   ),
// )
//                     // : Image.asset(
//                     //     CommonImagePath.placeHolder,
//                     //     fit: BoxFit.contain,
//                     //   ),
//               ),
//             ),
//           ),
//         ),

//         const SizedBox(height: 8),

//         /// 🔹 TITLE
//         Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 8),
//           child: Text(
//              stripHtml(item.title ?? ""),
//             // item.title ?? "",
//             textAlign: TextAlign.center,
//             maxLines: 2,
//             overflow: TextOverflow.ellipsis,
//             style: TextStyle(
//               fontSize: width * 0.040, // 🔥 responsive text
//               fontWeight: FontWeight.w700,
//               color: Customcolor.blackSubTitle,
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:merckfoundation_252026/Utility/showdailog.dart';
import 'package:merckfoundation_252026/CommonUtils/common_images.dart';
import 'package:merckfoundation_252026/CommonUtils/customcolor.dart';
import 'package:merckfoundation_252026/widgets/CommonWidget/CommonFunctions.dart';
import 'package:merckfoundation_252026/widgets/CommonWidget/ImageShimmer.dart';

class CustomSwiper extends StatefulWidget {
  final List items;
  final Function(int index)? onIndexChanged;

  const CustomSwiper({
    super.key,
    required this.items,
    this.onIndexChanged,
  });

  @override
  State<CustomSwiper> createState() => _CustomSwiperState();
}

class _CustomSwiperState extends State<CustomSwiper> {
  late PageController _controller;

  Timer? _autoPlayTimer;

  int currentIndex = 0;

  /// Large number for infinite scrolling
  static const int _virtualItemCount = 1000000;

  @override
  void initState() {
    super.initState();

    if (widget.items.isNotEmpty) {
      final initialPage =
          (_virtualItemCount ~/ 2) -
          ((_virtualItemCount ~/ 2) % widget.items.length);

      _controller = PageController(
        initialPage: initialPage,
        viewportFraction: 0.65,
      );

      WidgetsBinding.instance.addPostFrameCallback((_) {
        _precacheImages();
        _startAutoPlay();
      });
    } else {
      _controller = PageController();
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (widget.items.isNotEmpty) {
      _precacheImages();
    }
  }

  void _precacheImages() {
    for (final item in widget.items.take(4)) {
      if (item.image != null &&
          item.image.toString().isNotEmpty) {
        precacheImage(
          CachedNetworkImageProvider(
            item.image.toString(),
          ),
          context,
        );
      }
    }
  }

  void _startAutoPlay() {
    _autoPlayTimer?.cancel();

    if (widget.items.length <= 1) {
      return;
    }

    _autoPlayTimer = Timer.periodic(
      const Duration(seconds: 4),
      (_) {
        if (!mounted || !_controller.hasClients) {
          return;
        }

        _controller.nextPage(
          duration: const Duration(milliseconds: 700),
          curve: Curves.easeInOut,
        );
      },
    );
  }

  void _stopAutoPlay() {
    _autoPlayTimer?.cancel();
    _autoPlayTimer = null;
  }

  @override
  void dispose() {
    _stopAutoPlay();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.items.isEmpty) {
      return const SizedBox();
    }

    return Column(
      children: [
        /// =========================
        /// COVER FLOW CAROUSEL
        /// =========================
        AspectRatio(
          aspectRatio: 1,
          child: Stack(
            alignment: Alignment.center,
            children: [
              PageView.builder(
                controller: _controller,
                clipBehavior: Clip.none,
                allowImplicitScrolling: true,

                itemCount: widget.items.length > 1
                    ? _virtualItemCount
                    : 1,

                onPageChanged: (virtualIndex) {
                  final realIndex =
                      virtualIndex % widget.items.length;

                  currentIndex = realIndex;

                  /// Pre-cache next image
                  if (widget.items.length > 1) {
                    final nextIndex =
                        (realIndex + 1) %
                            widget.items.length;

                    final nextItem =
                        widget.items[nextIndex];

                    if (nextItem.image != null &&
                        nextItem.image
                            .toString()
                            .isNotEmpty) {
                      precacheImage(
                        CachedNetworkImageProvider(
                          nextItem.image.toString(),
                        ),
                        context,
                      );
                    }

                    /// Pre-cache previous image
                    final previousIndex =
                        (realIndex -
                                1 +
                                widget.items.length) %
                            widget.items.length;

                    final previousItem =
                        widget.items[previousIndex];

                    if (previousItem.image != null &&
                        previousItem.image
                            .toString()
                            .isNotEmpty) {
                      precacheImage(
                        CachedNetworkImageProvider(
                          previousItem.image.toString(),
                        ),
                        context,
                      );
                    }
                  }

                  widget.onIndexChanged
                      ?.call(realIndex);

                  if (mounted) {
                    setState(() {});
                  }
                },

                itemBuilder: (
                  context,
                  virtualIndex,
                ) {
                  final realIndex =
                      virtualIndex % widget.items.length;

                  final item =
                      widget.items[realIndex];

                  return AnimatedBuilder(
                    animation: _controller,
                    child: _SwiperCard(
                      item: item,
                    ),
                    builder: (
                      context,
                      child,
                    ) {
                      double value = 0;

                      if (_controller
                          .position
                          .haveDimensions) {
                        value =
                            (_controller.page ??
                                    _controller
                                        .initialPage
                                        .toDouble()) -
                                virtualIndex;
                      }

                      /// Limit effect
                      value = value.clamp(
                        -1.0,
                        1.0,
                      );

                      /// Center = 1.0
                      /// Side = 0.78
                      final double scale =
                          1 -
                          (value.abs() * 0.22);

                      /// Side cards move slightly down
                      final double verticalOffset =
                          value.abs() * 22;

                      /// Side cards become slightly transparent
                      final double opacity =
                          1 -
                          (value.abs() * 0.25);

                      return Transform.translate(
                        offset: Offset(
                          0,
                          verticalOffset,
                        ),
                        child: Transform.scale(
                          scale: scale,
                          child: Opacity(
                            opacity: opacity,
                            child: child,
                          ),
                        ),
                      );
                    },
                  );
                },
              ),

              /// =========================
              /// LEFT ARROW
              /// =========================
              Positioned(
                left: 4,
                child: _arrowButton(
                  icon: Icons.arrow_back_ios_new,
                  onTap: () {
                    if (widget.items.length > 1) {
                      _stopAutoPlay();

                      _controller.previousPage(
                        duration: const Duration(
                          milliseconds: 500,
                        ),
                        curve: Curves.easeInOut,
                      );

                      _startAutoPlay();
                    }
                  },
                ),
              ),

              /// =========================
              /// RIGHT ARROW
              /// =========================
              Positioned(
                right: 4,
                child: _arrowButton(
                  icon: Icons.arrow_forward_ios,
                  onTap: () {
                    if (widget.items.length > 1) {
                      _stopAutoPlay();

                      _controller.nextPage(
                        duration: const Duration(
                          milliseconds: 500,
                        ),
                        curve: Curves.easeInOut,
                      );

                      _startAutoPlay();
                    }
                  },
                ),
              ),
            ],
          ),
        ),

        /// =========================
        /// DOT INDICATOR
        /// =========================
        if (widget.items.length > 1)
          Padding(
            padding: const EdgeInsets.only(
              top: 4,
              bottom: 8,
            ),
            child: Row(
              mainAxisAlignment:
                  MainAxisAlignment.center,
              children: List.generate(
                widget.items.length,
                (index) {
                  final bool isActive =
                      index == currentIndex;

                  return AnimatedContainer(
                    duration: const Duration(
                      milliseconds: 250,
                    ),
                    margin:
                        const EdgeInsets.symmetric(
                      horizontal: 4,
                    ),
                    width: isActive ? 20 : 7,
                    height: 7,
                    decoration: BoxDecoration(
                      color: isActive
                          ? Customcolor.pinkColor
                          : Customcolor.pinkColor,
                      borderRadius:
                          BorderRadius.circular(10),
                    ),
                  );
                },
              ),
            ),
          ),
      ],
    );
  }

  /// =========================
  /// ARROW BUTTON
  /// =========================
  Widget _arrowButton({
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 38,
        height: 38,
        decoration: const BoxDecoration(
          color: Colors.black54,
          shape: BoxShape.circle,
        ),
        child: Icon(
          icon,
          color: Colors.white,
          size: 18,
        ),
      ),
    );
  }
}

/// =================================================
/// CARD
/// =================================================

class _SwiperCard extends StatelessWidget {
  final dynamic item;

  const _SwiperCard({
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    final width =
        MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 4,
        vertical: 10,
      ),
      child: Column(
        children: [
          /// IMAGE
          Expanded(
            child: GestureDetector(
              onTap: () {
                ShowDialogs.launchURL(
                  item.pdfFile,
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.circular(14),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 8,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius:
                      BorderRadius.circular(14),
                  child: CachedNetworkImage(
                    imageUrl: item.image,
                    fit: BoxFit.contain,
                    placeholder: (
                      context,
                      url,
                    ) =>
                        const ImageShimmer(),
                    errorWidget: (
                      _,
                      __,
                      ___,
                    ) =>
                        Image.asset(
                      CommonImagePath.placeHolder,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
            ),
          ),

          const SizedBox(height: 8),

          /// TITLE
          Padding(
            padding:
                const EdgeInsets.symmetric(
              horizontal: 8,
            ),
            child: Text(
              stripHtml(
                item.title ?? "",
              ),
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow:
                  TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: width * 0.040,
                fontWeight:
                    FontWeight.w700,
                color:
                    Customcolor.blackSubTitle,
              ),
            ),
          ),
        ],
      ),
    );
  }
}