import 'package:flutter/material.dart';
import 'package:merckfoundation_252026/enum/commonEnum.dart';
import 'package:merckfoundation_252026/model/NavBarResponse.dart';
import 'package:merckfoundation_252026/screens/MainScreens/Articles.dart';
import 'package:merckfoundation_252026/screens/MainScreens/CallforApplication.dart';
import 'package:merckfoundation_252026/screens/MainScreens/HomeNewScreen.dart';
import 'package:merckfoundation_252026/screens/MainScreens/ourPrograms.dart';
import 'package:merckfoundation_252026/screens/MediaAndStoriesScreen/MediaListingScreen.dart';

class AppScreenFactory {
  static Widget getScreen(MobileBottomMenu menu) {
    switch (menu.id.toString()) {

      case '1':
        return MerckHomeScreen(
          menuID: menu.id.toString(),
          title: menu.menuTitle!,
          mennuLogo: menu.mobileMenuIcon!,
           shareLink:""
        );

      case '16':
        return OurProgramScreen(
          menuID: menu.id.toString(),
          title: menu.menuTitle!,
          shareLink:""
          
        );
case '27':
  if (menu.isVideo == true) {
    return MediaListingScreen(
      type: MediaType.all,
      categoryID: menu.videoCategoryArray.join(','),
      albumID: "",
      albumName: "",
      menuID: menu.id.toString(),
      title: menu.menuTitle!,
      shareLink: "",
    );
  } else {
    return MediaListingScreen(
      type: MediaType.stories,
      categoryID: "",
      albumID: "",
      albumName: "",
      menuID: menu.id.toString(),
      title: menu.menuTitle!,
      shareLink: menu.menuUrl,
    );
  }
      // case '27':
      
      //   return MediaListingScreen(
      //     type: MediaType.stories,
      //     categoryID: "",
      //     albumID: "",
      //     albumName: "",
      //     menuID: menu.id.toString(),
      //     title: menu.menuTitle!,
      //     shareLink: menu.menuUrl,
      //   );

      case '29':
        return ArticlesScreen(
          menuID: menu.id.toString(),
          title: menu.menuTitle!,
          shareLink: menu.menuUrl,
        );

      case '30':
        return CallforApplication(
          menuID: menu.id.toString(),
          title: menu.menuTitle!,
          shareLink: menu.menuUrl,
        );

      default:
        return const SizedBox();
    }
  }
}