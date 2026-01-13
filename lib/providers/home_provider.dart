import 'package:flutter/material.dart';
import 'package:merckfoundation_252026/Utils/common_images.dart';
import 'package:merckfoundation_252026/Utils/common_strings.dart';
import 'package:merckfoundation_252026/Utils/customcolor.dart';
import 'package:merckfoundation_252026/data/model/CommonModel.dart';
import 'package:merckfoundation_252026/main.dart';
import 'package:merckfoundation_252026/screens/dashboard.dart';

class HomeSliderProvider extends ChangeNotifier {
  final List<Map<String, dynamic>> _productsAvailable = [];

  int _currentIndex = 0;

  List<Map<String, dynamic>> get products => _productsAvailable;
  int get currentIndex => _currentIndex;
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

  
  /// Load static data (API-ready)
  void loadSliderData() {
    _productsAvailable.clear();

    _productsAvailable.addAll([
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
 void _openDashboard() {
    Navigator.push(
      routeGlobalKey.currentContext!,
      MaterialPageRoute(builder: (_) => Dashboard()),
    );
  }
List<OurItemModel> buildList() {
    return [
      OurItemModel(
        color: Customcolor.pink_col,
        programname: CommonStrings.ourVision,
        onTap: _openDashboard,
      ),
      OurItemModel(
        color: Customcolor.green_col,
        programname: CommonStrings.ourPrograms,
        onTap: _openDashboard,
      ),
      OurItemModel(
        color: Customcolor.prog6,
        programname: CommonStrings.ourAfrica,
        onTap: _openDashboard,
      ),
      OurItemModel(
        color: Customcolor.lightgreen_col,
        programname: CommonStrings.newsArticles,
        onTap: _openDashboard,
      ),
      OurItemModel(
        color: Customcolor.violet_col,
        programname: CommonStrings.ourAwards,
        onTap: _openDashboard,
      ),
      OurItemModel(
        color: Customcolor.lightblue_col,
        programname: CommonStrings.ourMission,
        onTap: _openDashboard,
      ),
      OurItemModel(
        color: Customcolor.skyblue_col,
        programname: CommonStrings.mediaEvents,
        onTap: _openDashboard,
      ),
      OurItemModel(
        color: Customcolor.darkblue_col,
        programname: CommonStrings.covidResponse,
        onTap: _openDashboard,
      ),
      OurItemModel(
        color: Customcolor.orange_col,
        programname: CommonStrings.ourPolicies,
        onTap: _openDashboard,
      ),
    ];
  }
static final callForApp = [
    CarouselItem(
      image: "https://picsum.photos/800/400?1",
      title: "Call for Applications – 2026",
      onTap: () {
        // open url / pdf later
      },
    ),
    CarouselItem(
      image: "https://picsum.photos/800/400?2",
      title: "Research Grant Program",
    ),
  ];

  static final digitalLibrary = [
    CarouselItem(
      image: "https://picsum.photos/800/400?3",
      title: "Women Health Research",
    ),
    CarouselItem(
      image: "https://picsum.photos/800/400?4",
      title: "Medical Education Resources",
    ),
  ];

  static final mmtm = [
    CarouselItem(
      image: "https://picsum.photos/600/600?5",
      title: "More Than a Mother Ambassador",
    ),
    CarouselItem(
      image: "https://picsum.photos/600/600?6",
      title: "MMTM Initiative",
    ),
  ];
}