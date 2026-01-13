import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:merckfoundation_252026/Utility/ResponsiveFlutter.dart';
import 'package:merckfoundation_252026/Utils/common_images.dart';
import 'package:merckfoundation_252026/Utils/common_strings.dart';
import 'package:merckfoundation_252026/Utils/customcolor.dart';
import 'package:merckfoundation_252026/data/model/CommonModel.dart';

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
      return Center(child: Text(CommonStrings.emptyData));
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
              _viewAllButton(),
            ],
          ),
        ),
        _navigationArrows(context),
      ],
    );
  }

  Widget _buildItem(CarouselItem item) {
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
           8.0.heightBox,
            item.title != null
                ? Text(
                    item.title!,
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    style: const TextStyle(
                      fontSize: 17,
                    ),
                  )
                : SizedBox(),
          ],
        ),
      ),
    );
  }

  Widget _viewAllButton() {
    return Align(
      alignment: Alignment.center,
      child: GestureDetector(
        onTap: widget.onViewAll,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          height: 40,
          width: 120,
          decoration: BoxDecoration(
            color: Colors.amber,
            borderRadius: BorderRadius.circular(5),
          ),
          child: const Center(
            child: Text(
              "View All",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: Customcolor.colorBlue,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _navigationArrows(BuildContext context) {
    return Positioned(
      top: 140,
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () => widget.controller.previousPage(),
          ),
          IconButton(
            icon: const Icon(Icons.arrow_forward_ios),
            onPressed: () => widget.controller.nextPage(),
          ),
        ],
      ),
    );
  }
}
