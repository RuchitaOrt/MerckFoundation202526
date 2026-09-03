// // import 'package:cached_network_image/cached_network_image.dart';
// // import 'package:flutter/material.dart';
// // import 'package:carousel_slider/carousel_slider.dart';
// // import 'package:merckfoundation_252026/Utility/ResponsiveFlutter.dart';
// // import 'package:merckfoundation_252026/CommonUtils/common_images.dart';
// // import 'package:merckfoundation_252026/enum/commonEnum.dart';
// // import 'package:merckfoundation_252026/model/CommonModel.dart';
// // import 'package:merckfoundation_252026/main.dart';
// // import 'package:merckfoundation_252026/widgets/CommonWidget/CommonBorderButton.dart';
// // import 'package:merckfoundation_252026/widgets/CommonWidget/ImageShimmer.dart';
// // import 'package:merckfoundation_252026/widgets/EmptyStateWidget.dart';
// // import 'package:merckfoundation_252026/widgets/formLabel.dart';
// // import 'dart:async';
// // class CommonCarouselSection extends StatefulWidget {
// //   final List<CarouselItem> items;
// //   final CarouselSliderController controller;
// //   final VoidCallback onViewAll;
// //   final String buttonText;
// //   final double imageWidth;
// //   final double imageHeight;
// //   final double carouselHeight;
// //   final String layoutType;
// //   const CommonCarouselSection({
// //     super.key,
// //     required this.items,
// //     required this.controller,
// //     required this.onViewAll,
// //     required this.imageWidth,
// //     required this.imageHeight,
// //     required this.carouselHeight,
// //     required this.buttonText, required this.layoutType,
// //   });

// //   @override
// //   State<CommonCarouselSection> createState() => _CommonCarouselSectionState();
// // }

// // class _CommonCarouselSectionState extends State<CommonCarouselSection> {
// //   final CarouselSliderController controller = CarouselSliderController();
// //   int currentIndex = 0;
// //    Timer? _autoScrollTimer;
// //    @override
// // void initState() {
// //   super.initState();

// //   _startAutoScroll();
// // }

// // void _startAutoScroll() {
// //   if (widget.items.length <= 1) return;

// //   _autoScrollTimer = Timer.periodic(
// //     const Duration(seconds: 2),
// //     (_) {
// //       if (!mounted || widget.items.isEmpty) return;

// //       controller.nextPage(
// //         duration: const Duration(milliseconds: 500),
// //         curve: Curves.easeInOut,
// //       );
// //     },
// //   );
// // }
// // @override
// // void dispose() {
// //   _autoScrollTimer?.cancel();
// //   super.dispose();
// // }
// // @override
// // Widget build(BuildContext context) {
// //   if (widget.items.isEmpty) {
// //     return const Center(
// //       child: EmptyStateWidget(),
// //     );
// //   }

// //   return LayoutBuilder(
// //     builder: (context, constraints) {
// //       final screenWidth = constraints.maxWidth;

// //       // Horizontal space for image
// //       final imageWidth = screenWidth - 16;

// //       // Responsive image height.
// //       //
// //       // Ambassador section is slightly shorter.
// //       // Other sections get a little more height.
// //       final double imageHeight =
// //           widget.layoutType ==
// //                   HomeLayoutType.MerckMoreThanAmbasdar.name
// //               ? imageWidth * 0.68
// //               : imageWidth * 0.82;

// //       // Enough room for 2 lines of title.
// //       const double titleHeight = 48;

// //       // Small gap between image and title.
// //       const double imageTitleGap = 2;

// //       final double carouselHeight =
// //           imageHeight +
// //           imageTitleGap +
// //           titleHeight;

// //       return Column(
// //         mainAxisSize: MainAxisSize.min,
// //         children: [
// //           CarouselSlider(
// //             carouselController: controller,
// //             options: CarouselOptions(
// //               height: carouselHeight,
// //               viewportFraction: 1.0,
// //               enlargeCenterPage: false,
// //               autoPlay: false,
// //               enableInfiniteScroll: widget.items.length > 1,
// //               padEnds: false,
// //               onPageChanged: (index, _) {
// //                 if (mounted) {
// //                   setState(() {
// //                     currentIndex = index;
// //                   });
// //                 }
// //               },
// //             ),
// //             items: widget.items.map((item) {
// //               return _buildItem(
// //                 item,
// //                 imageWidth,
// //                 imageHeight,
// //               );
// //             }).toList(),
// //           ),

// //           // Very small gap between title and button
// //           if (widget.buttonText.trim().isNotEmpty)
// //             const SizedBox(height: 4),

// //           if (widget.buttonText.trim().isNotEmpty)
// //             CommonBorderButton(
// //               title: widget.buttonText,
// //               onTap: widget.onViewAll,
// //             ),
// //         ],
// //       );
// //     },
// //   );
// // }
// // // @override

// // // Widget build(BuildContext context) {
// // //   if (widget.items.isEmpty) {
// // //     return Center(child: EmptyStateWidget());
// // //   }

// // //   final double carouselHeight =
// // //       widget.layoutType == HomeLayoutType.MerckMoreThanAmbasdar.name
// // //           ? 410.0
// // //           : 560.0;

// // //   return Stack(
// // //     children: [
// // //       Padding(
// // //         padding: const EdgeInsets.all(4),
// // //         child: CarouselSlider(
// // //           carouselController: controller,
// // //           options: CarouselOptions(
// // //             height: carouselHeight,
// // //              autoPlay: false,
// // //             viewportFraction: 1,
// // //             enlargeCenterPage: false,
// // //             onPageChanged: (index, _) {
// // //               setState(() => currentIndex = index);
// // //             },
// // //           ),
// // //           items: widget.items.map(_buildItem).toList(),
// // //         ),
// // //       ),

// // //       // BUTTON
// // //       if (widget.buttonText.isNotEmpty)
// // //         Positioned(
// // //           // Move button upward/downward from here
// // //           top: widget.layoutType ==
// // //                   HomeLayoutType.MerckMoreThanAmbasdar.name
// // //               ? 375
// // //               :520,
// // //           left: 0,
// // //           right: 0,
// // //           child: Center(
// // //             child: CommonBorderButton(
// // //               title: widget.buttonText,
// // //               onTap: widget.onViewAll,
// // //             ),
// // //           ),
// // //         ),

// // //       // _navigationArrows(context),
// // //     ],
// // //   );
// // // }
// //   // @override
// //   // Widget build(BuildContext context) {
// //   //   if (widget.items.isEmpty) {
// //   //     return Center(child: EmptyStateWidget());
// //   //   }

// //   //   return Stack(
// //   //     children: [
// //   //       Padding(
// //   //         padding: const EdgeInsets.all(4),
// //   //         child: Column(
// //   //           children: [
             
// //   //             CarouselSlider(
// //   //              carouselController: controller,
// //   //               options: CarouselOptions(
// //   //                 height:
// //   //                 widget.layoutType==HomeLayoutType.MerckMoreThanAmbasdar.name?478:
// //   //                 640,//widget.carouselHeight,
// //   //                 viewportFraction: 1,
// //   //                enlargeCenterPage: false,
// //   //                 onPageChanged: (index, _) {
// //   //                   setState(() => currentIndex = index);
// //   //                 },
// //   //               ),
// //   //               items: widget.items.map(_buildItem).toList(),
// //   //             ),

// //   //             8.0.heightBox,
// //   //             widget.buttonText == ""
// //   //                 ? SizedBox()
// //   //                 : Center(
// //   //                     child: CommonBorderButton(
// //   //                       title: widget.buttonText,
// //   //                       //  CommonStrings.viewAll,
// //   //                       onTap: widget.onViewAll,
// //   //                     ),
// //   //                   ),
// //   //           ],
// //   //         ),
// //   //       ),
// //   //       _navigationArrows(context),
// //   //     ],
// //   //   );
// //   // }
// // Widget _buildItem(
// //   CarouselItem item,
// //   double imageWidth,
// //   double imageHeight,
// // ) {
// //   final responsive =
// //       ResponsiveFlutter.of(routeGlobalKey.currentContext!);

// //   return GestureDetector(
// //     onTap: item.onTap,
// //     child: Column(
// //       mainAxisSize: MainAxisSize.min,
// //       children: [
// //         // =========================
// //         // IMAGE
// //         // =========================
// //         SizedBox(
// //           width: imageWidth,
// //           height: imageHeight,
// //           child: Stack(
// //             alignment: Alignment.center,
// //             children: [
// //               Padding(
// //                 padding: const EdgeInsets.symmetric(horizontal: 8),
// //                 child: SizedBox(
// //                   width: double.infinity,
// //                   height: double.infinity,
// //                   child: CachedNetworkImage(
// //                     imageUrl: item.image,

// //                     // IMPORTANT:
// //                     // Explicit height prevents image from
// //                     // becoming taller than CarouselSlider.
// //                     width: double.infinity,
// //                     height: double.infinity,

// //                     fit: BoxFit.contain,
// //                     alignment: Alignment.topCenter,

// //                     placeholder: (context, url) =>
// //                         const ImageShimmer(),

// //                     errorWidget: (_, __, ___) {
// //                       return Image.asset(
// //                         CommonImagePath.placeHolder,
// //                         width: double.infinity,
// //                         height: double.infinity,
// //                         fit: BoxFit.contain,
// //                       );
// //                     },
// //                   ),
// //                 ),
// //               ),

// //               // =========================
// //               // LEFT ARROW
// //               // =========================
// //               Positioned(
// //                 left: 8,
// //                 child: _arrowButton(
// //                   icon: Icons.arrow_back_ios,
// //                   onTap: () {
// //                     controller.previousPage();
// //                   },
// //                 ),
// //               ),

// //               // =========================
// //               // RIGHT ARROW
// //               // =========================
// //               Positioned(
// //                 right: 8,
// //                 child: _arrowButton(
// //                   icon: Icons.arrow_forward_ios,
// //                   onTap: () {
// //                     controller.nextPage();
// //                   },
// //                 ),
// //               ),
// //             ],
// //           ),
// //         ),

// //         // =========================
// //         // TITLE
// //         // =========================
// //         if (item.title != null &&
// //             item.title!.trim().isNotEmpty)
// //           SizedBox(
// //             height: 48,
// //             child: Padding(
// //               padding: const EdgeInsets.symmetric(
// //                 horizontal: 20,
// //               ),
// //               child: Center(
// //                 child: FormLabel(
// //                   text: item.title!,
// //                   maxLines: 2,
// //                   textOverflow: TextOverflow.ellipsis,
// //                   textAlignment: TextAlign.center,
// //                   labelColor: Colors.black,
// //                   fontweight: FontWeight.w500,
// //                   fontSize: responsive.fontSize(2.2),
// //                 ),
// //               ),
// //             ),
// //           ),
// //       ],
// //     ),
// //   );
// // }
// // // Widget _buildItem(CarouselItem item) {
// // //   final responsive =
// // //       ResponsiveFlutter.of(routeGlobalKey.currentContext!);

// // //   return GestureDetector(
// // //     onTap: item.onTap,
// // //     child: Column(
// // //       mainAxisSize: MainAxisSize.min,
// // //       children: [

// // //         // IMAGE + ARROWS
// // //         Stack(
// // //           alignment: Alignment.center,
// // //           children: [
// // //             Padding(
// // //               padding: const EdgeInsets.only(
// // //                 top: 8,
// // //                 left: 8,
// // //                 right: 8,
// // //               ),
// // //               child: CachedNetworkImage(
// // //                 imageUrl: item.image,
// // //                 width: double.infinity,
// // //                 fit: BoxFit.fitWidth,
// // //                 alignment: Alignment.topCenter,
// // //                 placeholder: (context, url) =>
// // //                     const ImageShimmer(),
// // //                 errorWidget: (_, __, ___) => Image.asset(
// // //                   CommonImagePath.placeHolder,
// // //                   width: double.infinity,
// // //                   fit: BoxFit.fitWidth,
// // //                 ),
// // //               ),
// // //             ),

// // //             // LEFT ARROW
// // //             Align(
// // //               alignment: Alignment.centerLeft,
// // //               child: Padding(
// // //                 padding: const EdgeInsets.only(left: 15),
// // //                 child: _arrowButton(
// // //                   icon: Icons.arrow_back_ios,
// // //                   onTap: () => controller.previousPage(),
// // //                 ),
// // //               ),
// // //             ),

// // //             // RIGHT ARROW
// // //             Align(
// // //               alignment: Alignment.centerRight,
// // //               child: Padding(
// // //                 padding: const EdgeInsets.only(right: 15),
// // //                 child: _arrowButton(
// // //                   icon: Icons.arrow_forward_ios,
// // //                   onTap: () => controller.nextPage(),
// // //                 ),
// // //               ),
// // //             ),
// // //           ],
// // //         ),

// // //         // TITLE
// // //         if (item.title != null)
// // //           Padding(
// // //             padding: const EdgeInsets.only(
// // //               top: 2,
// // //               left: 20,
// // //               right: 20,
// // //             ),
// // //             child: FormLabel(
// // //               text: item.title!,
// // //               maxLines: 2,
// // //               textOverflow: TextOverflow.ellipsis,
// // //               textAlignment: TextAlign.center,
// // //               labelColor: Colors.black,
// // //               fontweight: FontWeight.w500,
// // //               fontSize: responsive.fontSize(2.2),
// // //             ),
// // //           ),
// // //       ],
// // //     ),
// // //   );
// // // }
// // // Widget _buildItem(CarouselItem item) {
// // //   final responsive =
// // //       ResponsiveFlutter.of(routeGlobalKey.currentContext!);

// // //   final carouselHeight =
// // //       widget.layoutType == HomeLayoutType.MerckMoreThanAmbasdar.name
// // //           ? 478.0
// // //           : 640.0;

// // //   return GestureDetector(
// // //     onTap: item.onTap,
// // //     child: SizedBox(
// // //       width: double.infinity,
// // //       height: carouselHeight,
// // //       child: Column(
// // //         children: [
// // //           // IMAGE
// // //           Expanded(
// // //             child: Padding(
// // //               padding: const EdgeInsets.only(
// // //                 top: 20,
// // //                 left: 8,
// // //                 right: 8,
// // //               ),
// // //               child: CachedNetworkImage(
// // //                 imageUrl: item.image,
// // //                 width: double.infinity,
// // //                 fit: BoxFit.contain,
// // //                 alignment: Alignment.topCenter,
// // //                 placeholder: (context, url) => const ImageShimmer(),
// // //                 errorWidget: (_, __, ___) => Image.asset(
// // //                   CommonImagePath.placeHolder,
// // //                   width: double.infinity,
// // //                   fit: BoxFit.contain,
// // //                 ),
// // //               ),
// // //             ),
// // //           ),

// // //           // TITLE - keep close to image
// // //           if (item.title != null) ...[
// // //             const SizedBox(height: 2),
// // //             Padding(
// // //               padding: const EdgeInsets.symmetric(horizontal: 20),
// // //               child: FormLabel(
// // //                 text: item.title!,
// // //                 maxLines: 2,
// // //                 textOverflow: TextOverflow.ellipsis,
// // //                 textAlignment: TextAlign.center,
// // //                 labelColor: Colors.black,
// // //                 fontweight: FontWeight.w500,
// // //                 fontSize: responsive.fontSize(2.2),
// // //               ),
// // //             ),
// // //           ],

// // //           const SizedBox(height: 8),
// // //         ],
// // //       ),
// // //     ),
// // //   );
// // // }
// // //  Widget _buildItem(CarouselItem item) {
// // //   final responsive =
// // //       ResponsiveFlutter.of(routeGlobalKey.currentContext!);
// // //  final carouselHeight =
// // //       widget.layoutType == HomeLayoutType.MerckMoreThanAmbasdar.name
// // //           ? 478.0
// // //           : 640.0;
// // // return GestureDetector(
// // //   onTap: item.onTap,
// // //   child: SizedBox(
// // //     width: double.infinity,
// // //     height: carouselHeight,
// // //     child: Column(
// // //       children: [
// // //         Flexible(
// // //           child: Padding(
// // //             padding: const EdgeInsets.only(
// // //               top: 20,
// // //               left: 8,
// // //               right: 8,
// // //             ),
// // //             child: ClipRRect(
// // //               // borderRadius: BorderRadius.circular(20),
// // //               child: CachedNetworkImage(
// // //                 imageUrl: item.image,
// // //                 width: double.infinity,
// // //                 height: double.infinity,
// // //                 fit: BoxFit.contain,
// // //                 alignment: Alignment.topCenter,
// // //                 placeholder: (context, url) =>
// // //                     const ImageShimmer(),
// // //                 errorWidget: (_, __, ___) => Image.asset(
// // //                   CommonImagePath.placeHolder,
// // //                   width: double.infinity,
// // //                   height: double.infinity,
// // //                   fit: BoxFit.contain,
// // //                 ),
// // //               ),
// // //             ),
// // //           ),
// // //         ),

// // //         const SizedBox(height: 8),

// // //         if (item.title != null)
// // //           Padding(
// // //             padding: const EdgeInsets.symmetric(horizontal: 20),
// // //             child: FormLabel(
// // //               text: item.title!,
// // //               maxLines: 2,
// // //               textOverflow: TextOverflow.ellipsis,
// // //               textAlignment: TextAlign.center,
// // //               labelColor: Colors.black,
// // //               fontweight: FontWeight.w500,
// // //               fontSize: responsive.fontSize(2.2),
// // //             ),
// // //           ),

// // //         const SizedBox(height: 8),
// // //       ],
// // //     ),
// // //   ),
// // // );
// // // //   return GestureDetector(
// // // //     onTap: item.onTap,
// // // //     child: Container(
// // // //       width: double.infinity,
// // // //       height: carouselHeight,
// // // //       child: Column(
// // // //         children: [
// // // //           Padding(
// // // //   padding: const EdgeInsets.only(
// // // //     top: 20,
// // // //     left: 8,
// // // //     right: 8,
// // // //   ),
// // // //   child: ClipRRect(
// // // //     borderRadius: BorderRadius.circular(20),
// // // //     child: CachedNetworkImage(
// // // //       imageUrl: item.image,
// // // //       width: double.infinity,
// // // //       fit: BoxFit.fitWidth,
// // // //       placeholder: (context, url) => const ImageShimmer(),
// // // //       errorWidget: (_, __, ___) => Image.asset(
// // // //         CommonImagePath.placeHolder,
// // // //         width: double.infinity,
// // // //         fit: BoxFit.fitWidth,
// // // //       ),
// // // //     ),
// // // //   ),
// // // // ),
// // // //   // Expanded(
// // // //   //   child: Padding(
// // // //   // padding: const EdgeInsets.only(
// // // //   //   top: 20,
// // // //   //   left: 8,
// // // //   //   right: 8,
// // // //   // ),
// // // //   // child: ClipRRect(
// // // //   //   borderRadius: BorderRadius.circular(20),
// // // //   //   child: CachedNetworkImage(
// // // //   //     imageUrl: item.image,
// // // //   //     width: double.infinity,
// // // //   //     height: double.infinity,
// // // //   //     fit: BoxFit.contain,
// // // //   //     placeholder: (context, url) => const ImageShimmer(),
// // // //   //     errorWidget: (_, __, ___) => Image.asset(
// // // //   //       CommonImagePath.placeHolder,
// // // //   //       width: double.infinity,
// // // //   //       height: double.infinity,
// // // //   //       fit: BoxFit.contain,
// // // //   //     ),
// // // //   //   ),
// // // //   // ),
// // // //   //   ),
// // // //   // ),
// // // //           const SizedBox(height: 16),

// // // //           if (item.title != null)
// // // //             Padding(
// // // //               padding: const EdgeInsets.symmetric(horizontal: 20),
// // // //               child: FormLabel(
// // // //                 text: item.title!,
// // // //                 maxLines: 2,
// // // //                 textOverflow: TextOverflow.ellipsis,
// // // //                 textAlignment: TextAlign.center,
// // // //                 labelColor: Colors.black,
// // // //                 fontweight: FontWeight.w500,
// // // //                 fontSize: responsive.fontSize(2.2),
// // // //               ),
// // // //             ),

// // // //           const SizedBox(height: 8),
// // // //         ],
// // // //       ),
// // // //     ),
// // // //   );
// // // }
// // Widget _navigationArrows(BuildContext context) {
// //   final double carouselHeight =
// //       widget.layoutType == HomeLayoutType.MerckMoreThanAmbasdar.name
// //           ? 478.0
// //           : 640.0;

// //   // Approximate title + spacing area
// //   final double imageAreaHeight = carouselHeight - 70;

// //   return Positioned(
// //     top: 20 + (imageAreaHeight / 2) - 20,
// //     left: 35,
// //     right: 35,
// //     child: Row(
// //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //       children: [
// //         _arrowButton(
// //           icon: Icons.arrow_back_ios,
// //           onTap: () => controller.previousPage(),
// //         ),
// //         _arrowButton(
// //           icon: Icons.arrow_forward_ios,
// //           onTap: () => controller.nextPage(),
// //         ),
// //       ],
// //     ),
// //   );
// // }
// //   Widget _arrowButton({required IconData icon, required VoidCallback onTap}) {
// //     return GestureDetector(
// //       onTap: onTap,
// //       child: Container(
// //         padding: const EdgeInsets.all(8),
// //         decoration: BoxDecoration(
// //           color: Colors.black.withOpacity(0.4),
// //           shape: BoxShape.circle,
// //         ),
// //         child: Icon(icon, color: Colors.white, size: 18),
// //       ),
// //     );
// //   }
// // }
// import 'dart:async';

// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:carousel_slider/carousel_slider.dart';

// import 'package:merckfoundation_252026/Utility/ResponsiveFlutter.dart';
// import 'package:merckfoundation_252026/CommonUtils/common_images.dart';
// import 'package:merckfoundation_252026/enum/commonEnum.dart';
// import 'package:merckfoundation_252026/model/CommonModel.dart';
// import 'package:merckfoundation_252026/main.dart';
// import 'package:merckfoundation_252026/widgets/CommonWidget/CommonBorderButton.dart';
// import 'package:merckfoundation_252026/widgets/CommonWidget/ImageShimmer.dart';
// import 'package:merckfoundation_252026/widgets/EmptyStateWidget.dart';
// import 'package:merckfoundation_252026/widgets/formLabel.dart';

// class CommonCarouselSection extends StatefulWidget {
//   final List<CarouselItem> items;
//   final CarouselSliderController controller;
//   final VoidCallback onViewAll;
//   final String buttonText;

//   // These are kept because they are already part of your widget.
//   final double imageWidth;
//   final double imageHeight;
//   final double carouselHeight;

//   final String layoutType;

//   const CommonCarouselSection({
//     super.key,
//     required this.items,
//     required this.controller,
//     required this.onViewAll,
//     required this.imageWidth,
//     required this.imageHeight,
//     required this.carouselHeight,
//     required this.buttonText,
//     required this.layoutType,
//   });

//   @override
//   State<CommonCarouselSection> createState() =>
//       _CommonCarouselSectionState();
// }

// class _CommonCarouselSectionState
//     extends State<CommonCarouselSection> {
//   final CarouselSliderController controller =
//       CarouselSliderController();

//   int currentIndex = 0;

//   Timer? _autoScrollTimer;

//   // ============================================================
//   // FIXED IMAGE HEIGHT
//   // ============================================================
//   //
//   // Change these values according to your requirement.
//   //
//   // Image is ALWAYS:
//   // width  = full available width
//   // height = fixed
//   //
//   double get fixedImageHeight {
//     if (widget.layoutType ==
//         HomeLayoutType.MerckMoreThanAmbasdar.name) {
//       return 410.0;
//     }

//     return 520.0;
//   }

//   // Fixed title area.
//   // Two lines can fit without making the carousel grow.
//   double get fixedTitleHeight => 48.0;

//   // Small gap between image and title.
//   double get imageTitleGap => 2.0;

//   // Small gap between carousel/title and button.
//   double get titleButtonGap => 4.0;

//   // ============================================================
//   // INIT
//   // ============================================================

//   @override
//   void initState() {
//     super.initState();

//     _startAutoScroll();
//   }

//   // ============================================================
//   // AUTO SCROLL
//   // ============================================================

//   void _startAutoScroll() {
//     if (widget.items.length <= 1) {
//       return;
//     }

//     _autoScrollTimer = Timer.periodic(
//       const Duration(seconds: 2),
//       (_) {
//         if (!mounted || widget.items.isEmpty) {
//           return;
//         }

//         controller.nextPage(
//           duration: const Duration(milliseconds: 500),
//           curve: Curves.easeInOut,
//         );
//       },
//     );
//   }

//   // ============================================================
//   // DISPOSE
//   // ============================================================

//   @override
//   void dispose() {
//     _autoScrollTimer?.cancel();
//     super.dispose();
//   }

//   // ============================================================
//   // BUILD
//   // ============================================================

//   @override
//   Widget build(BuildContext context) {
//     if (widget.items.isEmpty) {
//       return const Center(
//         child: EmptyStateWidget(),
//       );
//     }

//     // ----------------------------------------------------------
//     // IMPORTANT
//     //
//     // Carousel height is FIXED.
//     //
//     // It does NOT depend on device width.
//     // ----------------------------------------------------------

//     final double carouselHeight =
//         fixedImageHeight +
//         imageTitleGap +
//         fixedTitleHeight;

//     return Column(
//       mainAxisSize: MainAxisSize.min,
//       children: [

//         // ======================================================
//         // CAROUSEL
//         // ======================================================

//         SizedBox(
//           width: double.infinity,
//           child: CarouselSlider(
//             carouselController: controller,

//             options: CarouselOptions(
//               // FIXED HEIGHT
//               height: carouselHeight,

//               // FULL WIDTH
//               viewportFraction: 1.0,

//               enlargeCenterPage: false,

//               autoPlay: false,

//               enableInfiniteScroll:
//                   widget.items.length > 1,

//               padEnds: false,

//               // Prevent unnecessary height changes.
//               aspectRatio: 1.0,

//               onPageChanged: (index, reason) {
//                 if (!mounted) {
//                   return;
//                 }

//                 setState(() {
//                   currentIndex = index;
//                 });
//               },
//             ),

//             items: widget.items.map(_buildItem).toList(),
//           ),
//         ),

//         // ======================================================
//         // BUTTON
//         // ======================================================

//         if (widget.buttonText.trim().isNotEmpty) ...[
//           SizedBox(
//             height: titleButtonGap,
//           ),

//           CommonBorderButton(
//             title: widget.buttonText,
//             onTap: widget.onViewAll,
//           ),
//         ],
//       ],
//     );
//   }

//   // ============================================================
//   // CAROUSEL ITEM
//   // ============================================================

//   Widget _buildItem(CarouselItem item) {
//     final responsive =
//         ResponsiveFlutter.of(
//           routeGlobalKey.currentContext!,
//         );

//     return GestureDetector(
//       onTap: item.onTap,

//       child: SizedBox(
//         width: double.infinity,

//         // IMPORTANT:
//         // Item height exactly matches CarouselSlider height.
//         height:
//             fixedImageHeight +
//             imageTitleGap +
//             fixedTitleHeight,

//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [

//             // ==================================================
//             // IMAGE
//             // ==================================================

//             Padding(
//               padding: const EdgeInsets.only(left: 20,right: 20),
//               child: SizedBox(
//                 width: double.infinity,
              
//                 // FIXED HEIGHT
//                 height: fixedImageHeight,
              
//                 child: Stack(
//                   children: [
              
//                     // --------------------------------------------
//                     // IMAGE
//                     // --------------------------------------------
              
//                     Positioned.fill(
//                       child: CachedNetworkImage(
//                         imageUrl: item.image,
              
//                         // FULL WIDTH
//                         width: double.infinity,
              
//                         // FIXED HEIGHT
//                         height: fixedImageHeight,
              
//                         // IMPORTANT:
//                         //
//                         // BoxFit.cover:
//                         // - fills full width
//                         // - fills fixed height
//                         // - no empty space
//                         //
//                         // If you don't want cropping, change
//                         // this to BoxFit.contain.
//                         fit: BoxFit.cover,
              
//                         alignment: Alignment.center,
              
//                         placeholder: (context, url) {
//                           return const SizedBox(
//                             width: double.infinity,
//                             height: double.infinity,
//                             child: ImageShimmer(),
//                           );
//                         },
              
//                         errorWidget: (_, __, ___) {
//                           return Image.asset(
//                             CommonImagePath.placeHolder,
              
//                             width: double.infinity,
              
//                             height: fixedImageHeight,
              
//                             fit: BoxFit.cover,
//                           );
//                         },
//                       ),
//                     ),
              
//                     // --------------------------------------------
//                     // LEFT ARROW
//                     // --------------------------------------------
              
//                     Positioned(
//                       left: 10,
//                       top: 0,
//                       bottom: 0,
              
//                       child: Center(
//                         child: _arrowButton(
//                           icon: Icons.arrow_back_ios,
//                           onTap: () {
//                             controller.previousPage();
//                           },
//                         ),
//                       ),
//                     ),
              
//                     // --------------------------------------------
//                     // RIGHT ARROW
//                     // --------------------------------------------
              
//                     Positioned(
//                       right: 10,
//                       top: 0,
//                       bottom: 0,
              
//                       child: Center(
//                         child: _arrowButton(
//                           icon: Icons.arrow_forward_ios,
//                           onTap: () {
//                             controller.nextPage();
//                           },
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),

//             // ==================================================
//             // IMAGE -> TITLE GAP
//             // ==================================================

//             SizedBox(
//               height: imageTitleGap,
//             ),

//             // ==================================================
//             // TITLE
//             // ==================================================

//             if (item.title != null &&
//                 item.title!.trim().isNotEmpty)
//               SizedBox(
//                 width: double.infinity,

//                 // FIXED TITLE HEIGHT
//                 height: fixedTitleHeight,

//                 child: Padding(
//                   padding: const EdgeInsets.symmetric(
//                     horizontal: 20,
//                   ),

//                   child: Center(
//                     child: FormLabel(
//                       text: item.title!,

//                       maxLines: 2,

//                       textOverflow:
//                           TextOverflow.ellipsis,

//                       textAlignment:
//                           TextAlign.center,

//                       labelColor:
//                           Colors.black,

//                       fontweight:
//                           FontWeight.w500,

//                       fontSize:
//                           responsive.fontSize(2.2),
//                     ),
//                   ),
//                 ),
//               ),

//             // ==================================================
//             // If there is NO title, fill the title area.
//             // This keeps every carousel item the same height.
//             // ==================================================

//             if (item.title == null ||
//                 item.title!.trim().isEmpty)
//                SizedBox(
//                 height: fixedTitleHeight,
//               ),
//           ],
//         ),
//       ),
//     );
//   }

//   // ============================================================
//   // ARROW BUTTON
//   // ============================================================

//   Widget _arrowButton({
//     required IconData icon,
//     required VoidCallback onTap,
//   }) {
//     return GestureDetector(
//       behavior: HitTestBehavior.opaque,
//       onTap: onTap,

//       child: Container(
//         padding: const EdgeInsets.all(8),

//         decoration: BoxDecoration(
//           color: Colors.black.withOpacity(0.4),
//           shape: BoxShape.circle,
//         ),

//         child: Icon(
//           icon,
//           color: Colors.white,
//           size: 18,
//         ),
//       ),
//     );
//   }
// }
import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'package:merckfoundation_252026/Utility/ResponsiveFlutter.dart';
import 'package:merckfoundation_252026/CommonUtils/common_images.dart';
import 'package:merckfoundation_252026/enum/commonEnum.dart';
import 'package:merckfoundation_252026/model/CommonModel.dart';
import 'package:merckfoundation_252026/main.dart';
import 'package:merckfoundation_252026/widgets/CommonWidget/CommonBorderButton.dart';
import 'package:merckfoundation_252026/widgets/CommonWidget/ImageShimmer.dart';
import 'package:merckfoundation_252026/widgets/EmptyStateWidget.dart';
import 'package:merckfoundation_252026/widgets/formLabel.dart';

class CommonCarouselSection extends StatefulWidget {
  final List<CarouselItem> items;
  final CarouselSliderController controller;
  final VoidCallback onViewAll;
  final String buttonText;

  final double imageWidth;
  final double imageHeight;
  final double carouselHeight;

  final String layoutType;

  const CommonCarouselSection({
    super.key,
    required this.items,
    required this.controller,
    required this.onViewAll,
    required this.imageWidth,
    required this.imageHeight,
    required this.carouselHeight,
    required this.buttonText,
    required this.layoutType,
  });

  @override
  State<CommonCarouselSection> createState() =>
      _CommonCarouselSectionState();
}

class _CommonCarouselSectionState
    extends State<CommonCarouselSection> {
  final CarouselSliderController controller =
      CarouselSliderController();

  int currentIndex = 0;

  Timer? _autoScrollTimer;

  // ============================================================
  // FIXED IMAGE HEIGHT
  // ============================================================

  double get fixedImageHeight {
    if (widget.layoutType ==
        HomeLayoutType.MerckMoreThanAmbasdar.name) {
      return 410.0;
    }

    return 520.0;
  }

  // ============================================================
  // FIXED TITLE HEIGHT
  // ============================================================

  // double get fixedTitleHeight => 48.0;
double get fixedTitleHeight {
  if (widget.layoutType ==
      HomeLayoutType.MerckMoreThanAmbasdar.name) {
    return 60.0;
  }

  return 48.0;
}
  // ============================================================
  // IMAGE -> TITLE GAP
  // ============================================================

  double get imageTitleGap => 2.0;

  // ============================================================
  // TITLE -> BUTTON GAP
  // ============================================================

  double get titleButtonGap => 4.0;

  // ============================================================
  // INIT
  // ============================================================

  @override
  void initState() {
    super.initState();

    _startAutoScroll();
  }

  // ============================================================
  // AUTO SCROLL
  // ============================================================

  void _startAutoScroll() {
    if (widget.items.length <= 1) {
      return;
    }

    _autoScrollTimer = Timer.periodic(
      const Duration(seconds: 8),
      (_) {
        if (!mounted || widget.items.isEmpty) {
          return;
        }

        controller.nextPage(
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      },
    );
  }

  // ============================================================
  // DISPOSE
  // ============================================================

  @override
  void dispose() {
    _autoScrollTimer?.cancel();
    super.dispose();
  }

  // ============================================================
  // BUILD
  // ============================================================

  @override
  Widget build(BuildContext context) {
    if (widget.items.isEmpty) {
      return const Center(
        child: EmptyStateWidget(),
      );
    }

    // ==========================================================
    // FIXED CAROUSEL HEIGHT
    // ==========================================================

    final double carouselHeight =
        fixedImageHeight +
        imageTitleGap +
        fixedTitleHeight;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [

        // ======================================================
        // CAROUSEL + FIXED ARROWS
        // ======================================================

        Stack(
          children: [

            // --------------------------------------------------
            // CAROUSEL
            // --------------------------------------------------

            SizedBox(
              width: double.infinity,

              child: CarouselSlider(
                carouselController: controller,

                options: CarouselOptions(
                  height: carouselHeight,

                  viewportFraction: 1.0,

                  enlargeCenterPage: false,

                  autoPlay: false,

                  enableInfiniteScroll:
                      widget.items.length > 1,

                  padEnds: false,

                  aspectRatio: 1.0,

                  onPageChanged: (
                    index,
                    reason,
                  ) {
                    if (!mounted) {
                      return;
                    }

                    setState(() {
                      currentIndex = index;
                    });
                  },
                ),

                items: widget.items
                    .map(_buildItem)
                    .toList(),
              ),
            ),

            // ==================================================
            // FIXED LEFT ARROW
            // ==================================================

            if (widget.items.length > 1)
              Positioned(
                left: 20,

                // Center arrow vertically
                // inside IMAGE only.
                top: (fixedImageHeight / 2) - 20,

                child: _arrowButton(
                  icon: Icons.arrow_back_ios,

                  onTap: () {
                    controller.previousPage(
                      duration:
                          const Duration(
                        milliseconds: 500,
                      ),
                      curve: Curves.easeInOut,
                    );
                  },
                ),
              ),

            // ==================================================
            // FIXED RIGHT ARROW
            // ==================================================

            if (widget.items.length > 1)
              Positioned(
                right: 20,

                // Center arrow vertically
                // inside IMAGE only.
                top: (fixedImageHeight / 2) - 20,

                child: _arrowButton(
                  icon: Icons.arrow_forward_ios,

                  onTap: () {
                    controller.nextPage(
                      duration:
                          const Duration(
                        milliseconds: 500,
                      ),
                      curve: Curves.easeInOut,
                    );
                  },
                ),
              ),
          ],
        ),

        // ======================================================
        // BUTTON
        // ======================================================

        if (widget.buttonText.trim().isNotEmpty) ...[
          SizedBox(
            height: titleButtonGap,
          ),

          CommonBorderButton(
            title: widget.buttonText,
            onTap: widget.onViewAll,
          ),
        ],
      ],
    );
  }

  // ============================================================
  // CAROUSEL ITEM
  // ============================================================

  Widget _buildItem(CarouselItem item) {
    final responsive =
        ResponsiveFlutter.of(
          routeGlobalKey.currentContext!,
        );

    return GestureDetector(
       onTap: item.onTap,
      child: SizedBox(
        width: double.infinity,
      
        height:
            fixedImageHeight +
            imageTitleGap +
            fixedTitleHeight,
      
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
      
            // ==================================================
            // IMAGE
            // ==================================================
      
            Padding(
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
              ),
      
              child: SizedBox(
                width: double.infinity,
      
                height: fixedImageHeight,
      
                child: CachedNetworkImage(
                  imageUrl: item.image,
      
                  width: double.infinity,
      
                  height: fixedImageHeight,
      
                  fit: BoxFit.cover,
      
                  alignment: Alignment.center,
      
                  placeholder: (
                    context,
                    url,
                  ) {
                    return const SizedBox(
                      width: double.infinity,
                      height: double.infinity,
                      child: ImageShimmer(),
                    );
                  },
      
                  errorWidget: (
                    _,
                    __,
                    ___,
                  ) {
                    return Image.asset(
                      CommonImagePath.placeHolder,
      
                      width: double.infinity,
      
                      height: fixedImageHeight,
      
                      fit: BoxFit.cover,
                    );
                  },
                ),
              ),
            ),
      
            // ==================================================
            // IMAGE -> TITLE GAP
            // ==================================================
      
            SizedBox(
              height: imageTitleGap,
            ),
      
            // ==================================================
            // TITLE
            // ==================================================
      SizedBox(
  width: double.infinity,
  height: fixedTitleHeight,
  child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
  
      if (item.title != null &&
          item.title!.trim().isNotEmpty)
        FormLabel(
          text: item.title!,
          maxLines: 2,
          textOverflow: TextOverflow.ellipsis,
          textAlignment: TextAlign.center,
          labelColor: Colors.black,
          fontweight: FontWeight.w500,
          fontSize: responsive.fontSize(2.2),
        ),
  
      if (item.subTitle!.trim().isNotEmpty)
        Padding(
          padding: const EdgeInsets.only(top: 2,left: 2,right: 2),
          child: FormLabel(
            text: item.subTitle,
            maxLines: 1,
            textOverflow: TextOverflow.ellipsis,
            textAlignment: TextAlign.center,
            labelColor: Colors.black,
            fontweight: FontWeight.w500,
            fontSize: responsive.fontSize(2.2),
          ),
        ),
    ],
  ),
),
      //       SizedBox(
      //         width: double.infinity,
      
      //         height: fixedTitleHeight,
      
      //         child: Padding(
      //           padding: const EdgeInsets.symmetric(
      //             horizontal: 20,
      //           ),
      
      //           child: Center(
      //             child:
      //                 item.title != null &&
      //                         item.title!
      //                             .trim()
      //                             .isNotEmpty
      //                     ? FormLabel(
      //                         text: item.title!,
      
      //                         maxLines: 2,
      
      //                         textOverflow:
      //                             TextOverflow.ellipsis,
      
      //                         textAlignment:
      //                             TextAlign.center,
      
      //                         labelColor:
      //                             Colors.black,
      
      //                         fontweight:
      //                             FontWeight.w500,
      
      //                         fontSize:
      //                             responsive.fontSize(
      //                           2.2,
      //                         ),
      //                       )
      //                     : const SizedBox(),
      //           ),
      //         ),
      //       ),
      // item.subTitle==""?SizedBox():      Center(child: FormLabel(
      //                         text: item.subTitle,
      
      //                         maxLines: 2,
      
      //                         textOverflow:
      //                             TextOverflow.ellipsis,
      
      //                         textAlignment:
      //                             TextAlign.center,
      
      //                         labelColor:
      //                             Colors.black,
      
      //                         fontweight:
      //                             FontWeight.w500,
      
      //                         fontSize:
      //                             responsive.fontSize(
      //                           2.2,
      //                         ),
      //                       ),)
          ],
        ),
      ),
    );
  }

  // ============================================================
  // ARROW BUTTON
  // ============================================================

  Widget _arrowButton({
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return Material(
      color: Colors.transparent,

      child: InkWell(
        onTap: onTap,

        borderRadius:
            BorderRadius.circular(30),

        child: Container(
          width: 40,
          height: 40,

          decoration: BoxDecoration(
            color: Colors.black.withOpacity(
              0.4,
            ),

            shape: BoxShape.circle,
          ),

          alignment: Alignment.center,

          child: Icon(
            icon,
            color: Colors.white,
            size: 18,
          ),
        ),
      ),
    );
  }
}