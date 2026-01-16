import 'package:flutter/material.dart';

import 'package:merckfoundation_252026/Utils/common_images.dart';
import 'package:merckfoundation_252026/Utils/common_strings.dart';
import 'package:merckfoundation_252026/Utils/customcolor.dart';
import 'package:merckfoundation_252026/data/model/CommonModel.dart';
import 'package:merckfoundation_252026/data/model/MockHomeData.dart';
import 'package:merckfoundation_252026/main.dart';
import 'package:merckfoundation_252026/screens/MediaAndStoriesScreen/MediaScreen.dart';
import 'package:merckfoundation_252026/screens/SubScreens/CovidResponseScreen.dart';
import 'package:merckfoundation_252026/screens/WhatWeDoScreen.dart/ourmission.dart';
import 'package:merckfoundation_252026/screens/WhatWeDoScreen.dart/ourpolicy.dart';
import 'package:merckfoundation_252026/screens/WhoWeAreScreen.dart/vision.dart';
import 'package:merckfoundation_252026/screens/dashboard.dart';
import 'package:merckfoundation_252026/screens/SubScreens/OurAfricaSeasonScreen.dart';
import 'package:merckfoundation_252026/screens/SubScreens/OurAwardScreen.dart';

import '../widgets/Homewidget.dart/DynamicContent.dart';

class HomeSliderProvider extends ChangeNotifier {
  /* ---------------- SLIDER ---------------- */

  final List<Map<String, dynamic>> _productsAvailable = [];
  int _currentIndex = 0;

  List<Map<String, dynamic>> get products => _productsAvailable;
  int get currentIndex => _currentIndex;

  void loadSliderData() {
    _productsAvailable
      ..clear()
      ..addAll([
        {
          "id": 1,
          "image_title": "Empowering Women",
          "image_desc": "Transforming lives through education",
          "image": "assets/images/slider1.jpg",
        },
        {
          "id": 2,
          "image_title": "Healthcare Access",
          "image_desc": "Building a healthier tomorrow",
          "image": "assets/images/slider2.jpg",
        },
      ]);

    notifyListeners();
  }

  void updateIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }

  /* ---------------- STATIC GRID ---------------- */

  List<StaticListItem> _ourStaticList = [];
  List<StaticListItem> get ourStaticList => _ourStaticList;

  void loadStaticData() {
    _ourStaticList = [
      StaticListItem(image: CommonImagePath.ambassador),
      StaticListItem(image: CommonImagePath.scholarships),
      StaticListItem(image: CommonImagePath.ministera),
      StaticListItem(image: CommonImagePath.media),
      StaticListItem(image: CommonImagePath.songs),
      StaticListItem(image: CommonImagePath.storyBooks),
      StaticListItem(image: CommonImagePath.animation),
      StaticListItem(image: CommonImagePath.schoolGirl),
      StaticListItem(image: CommonImagePath.socialMedia),
    ];

    notifyListeners();
  }

  /* ---------------- NAVIGATION ---------------- */

  void _push(Widget page) {
    Navigator.push(
      routeGlobalKey.currentContext!,
      MaterialPageRoute(builder: (_) => page),
    );
  }

  void _openCovid() => _push(CovidResponseScreen());
  void _openProgram() => _push(Dashboard(index: 1));
  void _openArticle() => _push(Dashboard(index: 3));
  void _openAward() => _push(OurAwardScreen());
  void _openVision() => _push(OurVision());
  void _openMediaEvent() => _push(MediaScreen());
  void _openAfricaSeason() => _push(OurAfricaSeasonScreen());
  void _openMission() => _push(OurMission());
  void _openPolicy() => _push(OurPolicy());

  /* ---------------- OUR LIST ---------------- */

  List<OurItemModel> buildList() {
    return [
      OurItemModel(
        color: Customcolor.pink_col,
        programname: CommonStrings.ourVision,
        onTap: _openVision,
      ),
      OurItemModel(
        color: Customcolor.green_col,
        programname: CommonStrings.ourPrograms,
        onTap: _openProgram,
      ),
      OurItemModel(
        color: Customcolor.prog6,
        programname: CommonStrings.ourAfrica,
        onTap: _openAfricaSeason,
      ),
      OurItemModel(
        color: Customcolor.lightgreen_col,
        programname: CommonStrings.newsArticles,
        onTap: _openArticle,
      ),
      OurItemModel(
        color: Customcolor.violet_col,
        programname: CommonStrings.ourAwards,
        onTap: _openAward,
      ),
      OurItemModel(
        color: Customcolor.lightblue_col,
        programname: CommonStrings.ourMission,
        onTap: _openMission,
      ),
      OurItemModel(
        color: Customcolor.skyblue_col,
        programname: CommonStrings.mediaEvents,
        onTap: _openMediaEvent,
      ),
      OurItemModel(
        color: Customcolor.darkblue_col,
        programname: CommonStrings.covidResponse,
        onTap: _openCovid,
      ),
      OurItemModel(
        color: Customcolor.orange_col,
        programname: CommonStrings.ourPolicies,
        onTap: _openPolicy,
      ),
    ];
  }

  /* ---------------- DYNAMIC HOME SECTIONS ---------------- */

  List<HomeSectionConfig> getHomeSections() {
  return [
    /// VIDEOS (single card)
    HomeSectionConfig(
      type: HomeSectionType.videos,
      
      singleItem: SectionItem(
        title: "Hear Our ",
        subtitle: "Stories",
        description: "Dr. Rasha Kelej’s Speech at Merck Foundation Africa Asia Luminary 2025",
        videoUrl: "https://merck-foundation.com/merckfoundation/public/uploads/testimonials/1693978262_463d0ee859a8dbd5e7c8.jpg",
        showYoutubeIcon: true,
        buttonText: CommonStrings.watchMore
        
      ),
    ),

    /// CEO MESSAGE (single card)
    HomeSectionConfig(
      type: HomeSectionType.ceoMessage,
      singleItem: SectionItem(
        title: "Message Form ",
        subtitle: "Sentor Dr. Rasha Kelej,CEO of Merck Foundation",
        buttonText: CommonStrings.viewMore,
         description: "Dr. Rasha Kelej’s Speech at Merck Foundation Africa Asia Luminary 2025",
        imageUrl: "https://merck-foundation.com/merckfoundation/public/uploads/newsletter/1764844054_cafe376d20d758ca18dd.jpg",
      ),
    ),

    /// EPISODES (single card)
    HomeSectionConfig(
      type: HomeSectionType.episodes,
      singleItem: SectionItem(
        title: "Merck Foundation Presents",
          subtitle: '"Our Africa By Merck Foundation" (TV Program)',
         description: "Dr. Rasha Kelej’s Speech at Merck Foundation Africa Asia Luminary 2025",
      
        imageUrl: "https://merck-foundation.com/merckfoundation/public/uploads/testimonials/1693978262_463d0ee859a8dbd5e7c8.jpg",
        showShareIcon: true,
        showInfoIcon: true,
        buttonText: CommonStrings.watchMore
      ),
    ),

    /// GALLERY (single card)
    HomeSectionConfig(
      type: HomeSectionType.gallery,
      singleItem: SectionItem(
        title: "Photo ",
        subtitle: "Gallery",
        buttonText: CommonStrings.viewMore,
         description: "Dr. Rasha Kelej’s Speech at Merck Foundation Africa Asia Luminary 2025",
        imageUrl: "https://merck-foundation.com/merckfoundation/public/uploads/gallery/1698904631_8be7e035d15fd6d4b188.jpeg",
      ),
    ),

    /// TESTIMONIAL (single card)
    HomeSectionConfig(
      type: HomeSectionType.testimonial,
      singleItem: SectionItem(
        title: "Alumni Testimonials",
        subtitle: "Testimonials",
        buttonText: CommonStrings.viewMore,
        description: "Merck Foundation Medical Oncology Fellowship | 2018",
         htmlSubtitle: "Merck Foundation Medical Oncology Fellowship | 2018",
        imageUrl: "https://merck-foundation.com/merckfoundation/public/uploads/testimonials/1693978262_463d0ee859a8dbd5e7c8.jpg",
      ),
    ),
  ];
}

  /* ---------------- CAROUSEL DATA ---------------- */


 List<HomeTabModel> _tabs = [];

  List<HomeTabModel> get tabs => _tabs;

 Future<void> loadHomeTabs() async {
  final response = MockHomeData.homeTabsApiResponse();

  _tabs = response
      .map((e) => HomeTabModel.fromJson(e))
      .toList();

  notifyListeners();
}

}

