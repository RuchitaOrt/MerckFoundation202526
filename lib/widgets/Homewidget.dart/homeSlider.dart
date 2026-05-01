import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';


import '../slidercontainer.dart';

class HomeSlider extends StatelessWidget {
  final List content;

  const HomeSlider({super.key, required this.content});

  @override
  Widget build(BuildContext context) {
    print(content.length);
    if (content.isEmpty) return const SizedBox();

    return Padding(
      padding: const EdgeInsets.all(8),
      child: CarouselSlider(
        options: CarouselOptions(
          viewportFraction: 1.0,
        height: MediaQuery.of(context).size.height * 0.2,
          autoPlay: true,
        ),
        items: content.map((item) {
          return Slidercard(
            cardImage: item['thumbnail'] ?? "",
            cardTitle: item['title'] ?? "",
            subTitle: item['description'] ?? "",
          );
        }).toList(),
      ),
    );
  }
}