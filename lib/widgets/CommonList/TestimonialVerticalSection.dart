import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:merckfoundation_252026/CommonUtils/common_images.dart';
import 'package:merckfoundation_252026/CommonUtils/customcolor.dart';
import 'package:merckfoundation_252026/Utility/ResponsiveFlutter.dart';
import 'package:merckfoundation_252026/model/StoryModel.dart';
import 'package:merckfoundation_252026/model/TestimonialModel.dart';
import 'package:merckfoundation_252026/widgets/Bottomcardlink.dart';
import 'package:merckfoundation_252026/widgets/CommonWidget/ImageShimmer.dart';
import 'package:merckfoundation_252026/widgets/FooterFlowerImage.dart';
import 'package:merckfoundation_252026/widgets/SmartHtmlWidget.dart';

class TestimonialVerticalSection extends StatefulWidget {
  final List<StoryModel> content;
  final String title;
  final String shareLink;

  const TestimonialVerticalSection({
    super.key,
    required this.content,
    required this.title,
    required this.shareLink,
  });

  @override
  State<TestimonialVerticalSection> createState() =>
      _TestimonialVerticalSectionState();
}

class _TestimonialVerticalSectionState
    extends State<TestimonialVerticalSection> {
  int currentIndex = 0;
  final CarouselSliderController controller = CarouselSliderController();

  late final List<TestimonialModel> testimonials;

  @override
  void initState() {
    super.initState();

    testimonials = widget.content.map((e) {
      return TestimonialModel(
        title: e.title,
        image: e.thumbnail ?? "",
        departmentName: "",
        shortDescription: e.description ?? "",
        details: e.details ?? "",
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return SizedBox(
      height: screenHeight,
      child:
       Stack(
        children: [
          CarouselSlider.builder(
            carouselController: controller,
            itemCount: testimonials.length,
            options: CarouselOptions(
              height: screenHeight *0.8,
              //screenHeight,
              viewportFraction: 1,
              enableInfiniteScroll: testimonials.length > 1,
              onPageChanged: (index, reason) {
                setState(() {
                  currentIndex = index;
                });
              },
            ),
            itemBuilder: (context, index, realIndex) {
              return _TestimonialItem(
                item: testimonials[index],
              );
            },
          ),

          if (testimonials.length > 1)
            Positioned(
              top: screenHeight * 0.12,
              left: 12,
              right: 12,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _arrow(
                    Icons.arrow_back_ios_new,
                    currentIndex == 0
                        ? null
                        : () => controller.previousPage(),
                  ),
                  _arrow(
                    Icons.arrow_forward_ios,
                    () => controller.nextPage(),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }

  Widget _arrow(IconData icon, VoidCallback? onTap) {
    return Container(
      height: 42,
      width: 42,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
      ),
      child: IconButton(
        icon: Icon(
          icon,
          color: Customcolor.colorVoilet,
          size: 18,
        ),
        onPressed: onTap,
      ),
    );
  }
}

class _TestimonialItem extends StatelessWidget {
  final TestimonialModel item;

  const _TestimonialItem({
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveFlutter.of(context);

    return SingleChildScrollView(
      
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (item.image.isNotEmpty)
                  ClipRRect(
                    borderRadius: BorderRadius.circular(24),
                    // child: 
                    // AspectRatio(
                    //   aspectRatio: 4 / 4,

                     child:    CachedNetworkImage(
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
                    //     placeholder: CommonImagePath.placeHolder,
                    //     image: item.image,
                    //     fit: BoxFit.contain,
                    //   ),
                    // ),
                  ),
            
                const SizedBox(height: 18),
            
                SmartHtmlWidget(
                  html: item.title,
                  textColor: Customcolor.colorVoilet,
                  fontSize: responsive.fontSize(3),
                  fontWeight: FontWeight.bold,
                ),
            
                const SizedBox(height: 12),
            
                if (item.departmentName.isNotEmpty)
                  SmartHtmlWidget(html: item.departmentName),
            
                const SizedBox(height: 12),
            
                if (item.shortDescription.isNotEmpty)
                  SmartHtmlWidget(html: item.shortDescription),
            
                const SizedBox(height: 12),
            
                if (item.details.isNotEmpty)
                  SmartHtmlWidget(html: item.details),
            
               
              ],
            ),
          ),
           const SizedBox(height: 50),
                const FooterFlowerImage(),
                      
                        const SizedBox(height: 8),
                        const Bottomcardlink(),
        ],
      ),
    );
  }
}