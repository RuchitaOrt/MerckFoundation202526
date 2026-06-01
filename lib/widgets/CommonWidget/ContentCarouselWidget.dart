import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'package:merckfoundation_252026/CommonUtils/common_images.dart';
import 'package:merckfoundation_252026/CommonUtils/customcolor.dart';
import 'package:merckfoundation_252026/widgets/SmartHtmlWidget.dart';

class ContentCarouselWidget extends StatefulWidget {
  final List<dynamic> contentList;

  const ContentCarouselWidget({super.key, required this.contentList});

  @override
  State<ContentCarouselWidget> createState() => _ContentCarouselWidgetState();
}

class _ContentCarouselWidgetState extends State<ContentCarouselWidget> {
  final CarouselSliderController _controller = CarouselSliderController();

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider.builder(
          itemCount: widget.contentList.length,
          carouselController: _controller,
          options: CarouselOptions(
            viewportFraction: 1,
            height: MediaQuery.of(context).size.height * 0.9,
            enableInfiniteScroll: widget.contentList.length > 1,
            onPageChanged: (index, reason) {
              setState(() {
                currentIndex = index;
              });
            },
          ),
          itemBuilder: (context, index, realIndex) {
            final item = widget.contentList[index];

            return _ContentPage(item: item);
          },
        ),

        /// ARROWS
        if (widget.contentList.length > 1)
          Positioned(
            top: MediaQuery.of(context).size.height * 0.20,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _arrowButton(
                    icon: Icons.arrow_back_ios_new,
                    onTap: currentIndex == 0
                        ? null
                        : () {
                            _controller.previousPage();
                          },
                  ),

                  _arrowButton(
                    icon: Icons.arrow_forward_ios,
                    onTap: () {
                      _controller.nextPage();
                    },
                  ),
                ],
              ),
            ),
          ),
      ],
    );
  }

  Widget _arrowButton({required IconData icon, required VoidCallback? onTap}) {
    return Container(
      height: 42,
      width: 42,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.9),
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: IconButton(
        icon: Icon(icon, size: 18, color: Customcolor.colorVoilet),
        onPressed: onTap,
      ),
    );
  }
}

class _ContentPage extends StatelessWidget {
  final dynamic item;

  const _ContentPage({required this.item});

  @override
  Widget build(BuildContext context) {
   

    final image = item['thumbnail'] ?? "";

    return ListView(
      physics: const BouncingScrollPhysics(),
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              
              if (image.toString().isNotEmpty)
                ClipRRect(
                  borderRadius: BorderRadius.circular(24),
                  child: AspectRatio(
                    aspectRatio: 4 / 4,
                    child: FadeInImage.assetNetwork(
                      placeholder: CommonImagePath.placeHolder,
                      image: image,

                      /// removes white background issue
                      fit: BoxFit.cover,

                      /// transparent placeholder area
                      placeholderFit: BoxFit.cover,

                      fadeInDuration: const Duration(milliseconds: 200),

                      imageErrorBuilder: (context, error, stackTrace) {
                        return Container(
                          color: Colors.grey.shade200,
                          child: const Icon(
                            Icons.broken_image,
                            size: 40,
                            color: Colors.grey,
                          ),
                        );
                      },
                    ),
                  ),
                ),
              if (image.toString().isNotEmpty) const SizedBox(height: 18),

              /// SUBTITLE
              if ((item['subtitle'] ?? "").toString().isNotEmpty)
                SmartHtmlWidget(html: item['subtitle']),

              const SizedBox(height: 14),

              /// SUBDESCRIPTION
              if ((item['subdescription'] ?? "").toString().isNotEmpty)
                SmartHtmlWidget(html: item['subdescription']),

              const SizedBox(height: 14),

              /// DESCRIPTION
              if ((item['description'] ?? "").toString().isNotEmpty)
                SmartHtmlWidget(html: item['description']),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ],
    );
  }
}
