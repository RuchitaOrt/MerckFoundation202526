import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:merckfoundation_252026/Utility/ResponsiveFlutter.dart';
import 'package:merckfoundation_252026/Utils/common_images.dart';
import 'package:merckfoundation_252026/Utils/common_strings.dart';
import 'package:merckfoundation_252026/Utils/customcolor.dart';
import 'package:merckfoundation_252026/data/model/CommonModel.dart';
import 'package:merckfoundation_252026/main.dart';
import 'package:merckfoundation_252026/widgets/CommonActionButton.dart';
import 'package:merckfoundation_252026/widgets/formLabel.dart';

class CommonCarouselSection extends StatefulWidget {
  final List<CarouselItem> items;
  final CarouselSliderController controller;
  final VoidCallback onViewAll;
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
  });

  @override
  State<CommonCarouselSection> createState() => _CommonCarouselSectionState();
}

class _CommonCarouselSectionState extends State<CommonCarouselSection> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    if (widget.items.isEmpty) {
      return Center(child: FormLabel(text: CommonStrings.emptyData));
    }

    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              CarouselSlider(
                carouselController: widget.controller,
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
            
              16.0.heightBox,
              CommonActionButton(
                text: CommonStrings.viewAll,
                onTap: widget.onViewAll,
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
        child: ListView(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: FadeInImage.assetNetwork(
                placeholder: CommonImagePath.placeHolder,
                image: item.image,
                width: widget.imageWidth,
                height: widget.imageHeight,
                fit: BoxFit.contain,
              ),
            ),
            16.0.heightBox,
             item.title != null
                ? FormLabel(
                    text: item.title!,
                    maxLines: 2,
                    textAlignment: TextAlign.center,
                    labelColor: Customcolor.colorBlue,
                    fontSize: responsive.fontSize(2.2),
                  )
                : SizedBox(),
                
           
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
            onTap: () => widget.controller.previousPage(),
          ),
          _arrowButton(
            icon: Icons.arrow_forward_ios,
            onTap: () => widget.controller.nextPage(),
          ),
        ],
      ),
    ),
  );
}

Widget _arrowButton({
  required IconData icon,
  required VoidCallback onTap,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.4),
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
