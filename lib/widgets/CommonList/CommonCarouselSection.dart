import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:merckfoundation_252026/Utility/ResponsiveFlutter.dart';
import 'package:merckfoundation_252026/CommonUtils/common_images.dart';
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

  const CommonCarouselSection({
    super.key,
    required this.items,
    required this.controller,
    required this.onViewAll,
    required this.imageWidth,
    required this.imageHeight,
    required this.carouselHeight,
    required this.buttonText,
  });

  @override
  State<CommonCarouselSection> createState() => _CommonCarouselSectionState();
}

class _CommonCarouselSectionState extends State<CommonCarouselSection> {
  final CarouselSliderController controller = CarouselSliderController();
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    if (widget.items.isEmpty) {
      return Center(child: EmptyStateWidget());
    }

    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(4),
          child: Column(
            children: [
              CarouselSlider(
               carouselController: controller,
                options: CarouselOptions(
                  height: widget.carouselHeight,
                  viewportFraction: 1,
                  enlargeCenterPage: true,
                  onPageChanged: (index, _) {
                    setState(() => currentIndex = index);
                  },
                ),
                items: widget.items.map(_buildItem).toList(),
              ),

              8.0.heightBox,
              widget.buttonText == ""
                  ? SizedBox()
                  : Center(
                      child: CommonBorderButton(
                        title: widget.buttonText,
                        //  CommonStrings.viewAll,
                        onTap: widget.onViewAll,
                      ),
                    ),
            ],
          ),
        ),
        _navigationArrows(context),
      ],
    );
  }

  Widget _buildItem(CarouselItem item) {
    final responsive = ResponsiveFlutter.of(routeGlobalKey.currentContext!);

    return GestureDetector(
      onTap: item.onTap,
      child: Container(
        color: Colors.white,
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: 
                CachedNetworkImage(
                   memCacheHeight: 1000,
                    imageUrl: item.image,
                    fit: BoxFit.contain,
                    placeholder: (context, url) => const ImageShimmer(),

                    errorWidget: (_, __, ___) => Image.asset(
                      CommonImagePath.placeHolder,
                      fit: BoxFit.contain,
                    ),
                  ),
                
                // FadeInImage.assetNetwork(
                //   placeholder: CommonImagePath.placeHolder,
                //   image: item.image,
                //   fit: BoxFit.contain,
                //   imageErrorBuilder: (_, __, ___) => Image.asset(
                //     CommonImagePath.placeHolder,
                //     fit: BoxFit.contain,
                //   ),
                // ),
              ),
            ),

            const SizedBox(height: 16),

            if (item.title != null)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: FormLabel(
                  text: item.title!,
                  maxLines: 2,
                  textOverflow: TextOverflow.ellipsis,
                  textAlignment: TextAlign.center,
                  labelColor: Colors.black,
                  fontweight: FontWeight.w500,
                  fontSize: responsive.fontSize(2.2),
                ),
              ),

            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }

  Widget _navigationArrows(BuildContext context) {
    return Positioned(
      top: widget.carouselHeight / 2 - 20, // 🔥 center of image
      left: 0,
      right: 0,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _arrowButton(
              icon: Icons.arrow_back_ios,
              onTap: () => controller.previousPage(),
            ),
            _arrowButton(
              icon: Icons.arrow_forward_ios,
              onTap: () => controller.nextPage(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _arrowButton({required IconData icon, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.4),
          shape: BoxShape.circle,
        ),
        child: Icon(icon, color: Colors.white, size: 18),
      ),
    );
  }
}
