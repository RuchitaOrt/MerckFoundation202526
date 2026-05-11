import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:merckfoundation_252026/model/CommonModel.dart';
import '../widgets/CommonCarouselSection.dart';
import '../widgets/DynamicTabView.dart';
import '../Utils/common_strings.dart';

class DynamicTabBuilder {
  static List<DynamicTabItem> build(
    BuildContext context,
    List<HomeTabModel> tabsFromApi,
  ) {
    return tabsFromApi
        .where((tab) => tab.items.isNotEmpty)
        .map(
          (tab) => DynamicTabItem(
            key: tab.key,
            // title: Container(),
          title: tab.key=="callForApp"?Callforapptext(): tab.key =="mmtm"?Merckmtmtext():Digitaltext(),
            content: CommonCarouselSection(
              controller: CarouselSliderController(),
              carouselHeight: CommonStrings.callcoursaheight,
              imageWidth: CommonStrings.callimagewidth,
              imageHeight: CommonStrings.callimageheight,
              onViewAll: () {
                debugPrint("View all → ${tab.key}");
              },
              items: tab.items,
            ),
          ),
        )
        .toList();
  }
}
