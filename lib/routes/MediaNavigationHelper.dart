import 'package:flutter/material.dart';
import 'package:merckfoundation_252026/enum/commonEnum.dart';
import 'package:merckfoundation_252026/screens/DetailsScreen/TestimonialArticlesScreen.dart';
import 'package:merckfoundation_252026/screens/MainScreens/Articles.dart';
import 'package:merckfoundation_252026/screens/MediaAndStoriesScreen/MediaListingScreen.dart';

class MediaNavigationHelper {
  static void navigate(
    BuildContext context, {
    required HomeLayoutType type,
    required String title,
    required String shareLink,
    required String menuId,
    List<dynamic>? myStoryList,
    List<dynamic>? testimonialList,
    List<dynamic>? articleList,
    String? seasonId,
  }) {
    switch (type) {

      case HomeLayoutType.video:
      case HomeLayoutType.photoGallery:

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => MediaListingScreen(
              type: MediaType.videoLibrary,
              title: title,
              shareLink: shareLink,
              
              useLocalPagination: true,
              categoryID: "",
              albumID: "",
              albumName: "",
              menuID: "",
              isFilterApply: false,
            ),
          ),
        );
        break;

      case HomeLayoutType.testimonials:

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => TestimonialArticlesScreen(
              title: title,
              shareLink: shareLink,
              
              useLocalPagination: true,
            ),
          ),
        );
        break;

      case HomeLayoutType.newsLettersAndArticles:

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => ArticlesScreen(
              menuID: menuId,
              title: title,
              shareLink: shareLink,
              
              useLocalPagination: true,
            ),
          ),
        );
        break;

      case HomeLayoutType.season:

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => MediaListingScreen(
              type: MediaType.episodes,
              categoryID: seasonId ?? "",
              albumID: "",
              albumName: title,
              menuID: menuId,
              title: title,
              shareLink: shareLink,
            ),
          ),
        );
        break;

      default:
        break;
    }
  }
}