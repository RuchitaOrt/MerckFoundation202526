import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:provider/provider.dart';

import '../../Utility/ResponsiveFlutter.dart';
import '../../providers/home_provider.dart';
import '../slidercontainer.dart';

class HomeSlider extends StatelessWidget {
  const HomeSlider({super.key});

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveFlutter.of(context);
    final provider = context.watch<HomeSliderProvider>();

    if (provider.products.isEmpty) {
      return const SizedBox.shrink();
    }

    return Padding(
      padding: EdgeInsets.symmetric(
         vertical: responsive.height(1),
        horizontal: responsive.width(3),
      ),
      child: Column(
        children: [
          CarouselSlider(
            options: CarouselOptions(
              viewportFraction: 1,
              height: responsive.height(22),
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 4),
              onPageChanged: (index, _) {
                provider.updateIndex(index);
              },
            ),
            items: provider.products.map((product) {
              return SliderCard(
                cardImage: product['image'] ?? '',
                cardTitle: product['image_title'] ?? '',
                subTitle: product['image_desc'] ?? '',
              );
            }).toList(),
          ),

         

        
        ],
      ),
    );
  }
}
