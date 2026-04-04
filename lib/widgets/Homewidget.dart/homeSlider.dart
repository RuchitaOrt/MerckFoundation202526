import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'package:provider/provider.dart';

import '../../Utility/ResponsiveFlutter.dart';
import '../../providers/home_provider.dart';
import '../slidercontainer.dart';

// class HomeSlider extends StatelessWidget {
//   const HomeSlider({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final responsive = ResponsiveFlutter.of(context);
//     final provider = context.watch<HomeSliderProvider>();

//     if (provider.products.isEmpty) {
//       return const SizedBox.shrink();
//     }

//     return Padding(
//       padding: EdgeInsets.symmetric(
//          vertical: responsive.height(1),
//         horizontal: responsive.width(3),
//       ),
//       child: Column(
//         children: [
//           CarouselSlider(
//             options: CarouselOptions(
//               viewportFraction: 1,
//               height: responsive.height(22),
//               autoPlay: true,
//               autoPlayInterval: const Duration(seconds: 4),
//               onPageChanged: (index, _) {
//                 provider.updateIndex(index);
//               },
//             ),
//             items: provider.products.map((product) {
//               return SliderCard(
//                 cardImage: product['image'] ?? '',
//                 cardTitle: product['image_title'] ?? '',
//                 subTitle: product['image_desc'] ?? '',
//               );
//             }).toList(),
//           ),

         

        
//         ],
//       ),
//     );
//   }
// }
class HomeSlider extends StatelessWidget {
  const HomeSlider({super.key});

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveFlutter.of(context);
    final provider = context.watch<HomeSliderProvider>();
print("LENT ${provider.products.length}");
    if (provider.products.isEmpty) {
      return const SizedBox.shrink();
    }

    return Padding(
      padding: const EdgeInsets.only(top: 5, left: 0, right: 0, bottom: 8),
      child: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              Container(
                child: CarouselSlider(
                  options: CarouselOptions(
                    viewportFraction: 1.0,
                    height: 170,
                    autoPlay: true,
                    onPageChanged: (index, reason) {
                     
                    },
                  ),
                  items: provider.products.map((product) {
                    return  Builder(
                      builder: (BuildContext context) {
                        return Slidercard(
                          cardImage:product['image'],
                          cardTitle: product['image_title'],
                          subTitle: product['image_desc'],
                        );

                      },
                    );
                  }).toList(),
                ),
              ),
             
            ],
          ),
        ],
      ),
    );
    // Column(
    //   children: [
    //     CarouselSlider.builder(
    //       itemCount: provider.products.length,
    //       options: CarouselOptions(
    //         height: responsive.height(25),
    //         viewportFraction: 0.9, // 👈 show side preview
    //         enlargeCenterPage: true,
    //         autoPlay: true,
    //         autoPlayInterval: const Duration(seconds: 4),
    //         onPageChanged: (index, _) {
    //           provider.updateIndex(index);
    //         },
    //       ),
    //       itemBuilder: (context, index, realIndex) {
    //         final product = provider.products[index];
    //         return SliderCard(
    //           cardImage: product['image'] ?? '',
    //           cardTitle: product['image_title'] ?? '',
    //           subTitle: product['image_desc'] ?? '',
    //         );
    //       },
    //     ),

    //     SizedBox(height: responsive.height(1)),

    //   ],
    // );
    
  }
  
}
