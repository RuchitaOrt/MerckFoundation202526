import 'package:flutter/material.dart';
import 'package:merckfoundation_252026/Provider/MediaProvider.dart';
import 'package:merckfoundation_252026/Provider/NewsReleaseProvider.dart';

import 'package:merckfoundation_252026/enum/commonEnum.dart';
import 'package:merckfoundation_252026/model/ArticleModel.dart';
import 'package:merckfoundation_252026/model/StoryModel.dart';
import 'package:merckfoundation_252026/model/TestimonialModel.dart';

import 'package:merckfoundation_252026/screens/DetailsScreen/CeoMessageScreen.dart';
import 'package:merckfoundation_252026/screens/ContactUs/ContactUs.dart';
import 'package:merckfoundation_252026/screens/DetailsScreen/TestimonialArticlesScreen.dart';
import 'package:merckfoundation_252026/screens/MainScreens/Articles.dart';
import 'package:merckfoundation_252026/screens/MainScreens/EpisodeScreen/EpisodeListingScreen.dart';
import 'package:merckfoundation_252026/screens/MediaAndStoriesScreen/MediaListingScreen.dart';
import 'package:merckfoundation_252026/screens/MediaAndStoriesScreen/MediaScreen.dart';
import 'package:merckfoundation_252026/screens/MediaAndStoriesScreen/NewsRelease.dart';
import 'package:merckfoundation_252026/screens/MainScreens/OurPartnersScreen/OurPartnersScreen.dart';
import 'package:merckfoundation_252026/screens/DetailsScreen/OurAwardScreen.dart';
import 'package:merckfoundation_252026/screens/MainUIBody.dart/CommonContentPage.dart';
import 'package:merckfoundation_252026/screens/MainScreens/dashboard.dart';
import 'package:provider/provider.dart';

class AppNavigation {
  static void navigateByMenuId(
    BuildContext context, {
    required String menuId,
    required String title,
    String? shareLink,
    String categoryId = "",
    String albumId = "",
    String albumName = "",
    String seasonId = "",
    String menuLogo = "",
    List<StoryModel>? myStoryList,
    HomeLayoutType? type,
    List<TestimonialModel>? testimonialList,
    List<ArticleModel>? articleList,
    
  }) {
    switch (menuId) {
      case '1':
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (_) => Dashboard(
              index: 0,
              menuID: menuId,
              shareLink: shareLink,
              menuLogo: menuLogo,
            ),
          ),
        );
        break;

      /// VISION
      case '3':

      /// LEADERSHIP
      case '4':

      /// MESSAGE
      case '5':

      /// OVERVIEW
      case '6':
      case '12':

      /// MISSION
      case '9':

      /// POLICIES
      case '10':

      /// PRIVACY
      case '13':

      /// POLITICAL
      case '14':
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => CommonContentPage(
              title: title,
              menuID: menuId,
              shareLink: shareLink,
            ),
          ),
        );
        break;

      /// OUR PARTNERS
      case '15':
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => OurPartnersScreen(
              menuID: menuId,
              title: title,
              shareLink: shareLink,
            ),
          ),
        );
        break;

      /// VIDEO LIBRARY
      case '26':
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => MediaListingScreen(
              type: MediaType.videoLibrary,
              categoryID: "",
              albumID: "",
              albumName: "",
              menuID: menuId,
              title: title,
              shareLink: shareLink,
            ),
          ),
        );
        break;

      /// STORIES
      case '27':
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => Dashboard(
              index: 2,
              menuID: menuId,
              shareLink: shareLink,
              menuLogo: menuLogo,
            ),
          ),
        );
        break;

      //OUrProgam

      case '16':
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => Dashboard(
              index: 1,
              menuID: menuId,
              shareLink: shareLink,
              menuLogo: menuLogo,
            ),
          ),
        );
        break;

      /// TESTIMONIALS
      case '28':
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => MediaListingScreen(
              type: MediaType.testimonial,
              categoryID: "",
              albumID: "",
              albumName: "",
              menuID: menuId,
              title: title,
              shareLink: shareLink,
            ),
          ),
        );
        break;

      /// Activity
      case '11':
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => MediaListingScreen(
              type: MediaType.activity,
              categoryID: "",
              albumID: "",
              albumName: "",
              menuID: menuId,
              title: title,
              shareLink: shareLink,
            ),
          ),
        );
        break;

      /// NEWS ARTICLES
      case '29':
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => Dashboard(
              index: 3,
              menuID: menuId,
              shareLink: shareLink,
              menuLogo: menuLogo,
            ),
          ),
        );
        break;

      /// UPCOMING PROGRAMS
      case '30':
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => Dashboard(
              index: 4,
              menuID: menuId,
              shareLink: shareLink,
              menuLogo: menuLogo,
            ),
          ),
        );
        break;

      /// NEWS RELEASE
      case '31':
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => ChangeNotifierProvider(
              create: (_) => NewsReleaseProvider(),
              child: NewsRelease(
                menuID: menuId,
                shareLink: shareLink,
                title: title,
              ),
            ),
          ),
        );
        break;

      /// MEDIA
      case '32':
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => ChangeNotifierProvider(
              create: (_) => MediaProvider(),
              child: MediaScreen(
                menuID: menuId,
                title: title,
                shareLink: shareLink,
              ),
            ),
          ),
        );
        break;

      /// DIGITAL LIBRARY
      case '33':
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => MediaListingScreen(
              type: MediaType.digitalLibrary,
              categoryID: "",
              albumID: "",
              albumName: "",
              menuID: menuId,
              shareLink: shareLink,
              title: title,
            ),
          ),
        );
        break;

      /// PHOTO GALLERY
      case '34':
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => MediaListingScreen(
              type: MediaType.photoGallery,
              categoryID: "",
              albumID: "",
              albumName: "",
              menuID: menuId,
              shareLink: shareLink,
              title: title,
            ),
          ),
        );
        break;

      case '101':
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => TestimonialArticlesScreen(
              shareLink: shareLink ?? "",
              title: title,
            ),
          ),
        );
        break;
      case '99':
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => EpisodeListingScreen(
              menuID: menuId,
              title: title ?? "",
              shareLink: shareLink,
            ),
          ),
        );
        break;
      // case '100':
      //   Navigator.push(
      //     context,
      //     MaterialPageRoute(
      //       builder: (_) => MediaListingScreen(
      //         type: MediaType.episodes,
      //         categoryID: seasonId ?? "",
      //         albumID: "",
      //         albumName: title ?? "",
      //         menuID: menuId,
      //         title: title ?? "",
      //         shareLink: shareLink,
      //       ),
      //     ),
      //   );
      //   break;
      case '103':
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => CeoMessageScreen(
              menuID: menuId.toString(),
              title: title ?? "",
              shareLink: shareLink,
            ),
          ),
        );
        break;

      case '35':
        Navigator.push(context, MaterialPageRoute(builder: (_) => ContactUs()));
        break;
      case '7':
        Navigator.push(context, MaterialPageRoute(builder: (_) => ContactUs()));
        break;
      case '97':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => OurAwardScreen(title: title)),
        );
        break;
      // case '98':
      //   Navigator.push(
      //     context,
      //     MaterialPageRoute(builder: (_) => const CovidResponseScreen()),
      //   );
      //   break;
      // case '43': //prog1
      // case '167': //program 2
      // case '188':
      // case '193': // "Merck-Foundation-Educating-Linda-Program/Video",

      // case '184'://photogallery 1
      // case '175'://phtogallery 3
      // case '189':
      // case '194':// "Merck-Foundation-Educating-Linda-Program/Photo-Gallery",
      // case '198':// "Merck-Foundation-Africa-Asia-Luminary/Photo-Gallery",

      //   Navigator.push(
      //     context,
      //     MaterialPageRoute(
      //       builder: (_) => MediaListingScreen(
      //         type: MediaType.videoLibrary,
      //         categoryID: "",
      //         albumID: "",
      //         albumName: "",
      //         menuID: "",
      //         title: title,
      //         shareLink: shareLink,
      //         useLocalPagination: true,
      //         initialList: myStoryList,
      //         isFilterApply: false,
      //       ),
      //     ),
      //   );

      //   break;

      // case HomeLayoutType.newsLettersAndArticles:
      // case HomeLayoutType.merckFoundationInMedia:

      default:
     
        if(type==HomeLayoutType.season)
        {
              Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => MediaListingScreen(
              type: MediaType.episodes,
              categoryID: seasonId ?? "",
              albumID: "",
              albumName: title ?? "",
              menuID: menuId,
              title: title ?? "",
              shareLink: shareLink,
            ),
          ),
        );
         break;
        }else{
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => CommonContentPage(
                title: title,
                menuID: menuId,
                shareLink: shareLink,
              ),
            ),
          );
        }
          break;
        
    }
  }
}
