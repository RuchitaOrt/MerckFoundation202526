import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:merckfoundation_252026/widgets/Homewidget.dart/DynamicContent.dart';

class OurItemModel {
  final String programname;
 
  final Color color;
  final VoidCallback onTap;

  OurItemModel({
    required this.programname,
   
    required this.color,
    required this.onTap,
  });
}
class SocialIconModel {
  final String icon;
  final VoidCallback onTap;

  const SocialIconModel({
    required this.icon,
    required this.onTap,
  });
}
class Staticlistclass {
  final String? imagename;

  Staticlistclass({this.imagename});
}
class StaticListItem {
  final String image;
  final String? title;
  final VoidCallback? onTap;

  const StaticListItem({
    required this.image,
    this.title,
    this.onTap,
  });
}

class HomeSectionModel {
  final HomeSectionType type;
  final Map<String, dynamic> payload; // API / static flexible data

  const HomeSectionModel({
    required this.type,
    required this.payload,
  });
}
class DynamicTabItem {
  final String key;
  final Widget title; // 👈 Rich widget
  final Widget content;

  DynamicTabItem({
    required this.key,
    required this.title,
    required this.content,
  });
}


class CarouselItem {
  final String image;
  final String? title;
  final VoidCallback? onTap;

  CarouselItem({
    required this.image,
    this.title,
    this.onTap,
  });

  /// ✅ API → Model
  factory CarouselItem.fromJson(Map<String, dynamic> json) {
    return CarouselItem(
      image: json['image'] ?? '',
      title: json['title'],
      onTap: null, // API cannot send callbacks
    );
  }
}
class ProgramModel {
  final String? id;
  final String title;
 
  final Color? bgColor;
final VoidCallback onTap;

  ProgramModel({
     this.id,
    required this.title,
  
     this.bgColor, required this.onTap,
  });
}

class StoryModel {
  final String videoLink;
  final String description;

  StoryModel({
    required this.videoLink,
    required this.description,
  });

  String get youtubeThumb =>
      'https://img.youtube.com/vi/${videoLink.substring(videoLink.length - 11)}/mqdefault.jpg';
}


class MediaCardData {
  
  final String image;
  final String title;
  final VoidCallback? onTap;
  final bool showPlayIcon;

  MediaCardData({
    required this.image,
    required this.title,
    this.onTap,
    this.showPlayIcon = true,
  });
}
class ArticleModel {
  final String id;
  final String titleHtml;
  final String imageUrl;

  ArticleModel({
    required this.id,
    required this.titleHtml,
    required this.imageUrl,
  });
}
class CallApplicationModel {
  final String title;
  final String image;
  final String link;

  CallApplicationModel({
    required this.title,
    required this.image,
    required this.link,
  });
}
class LeaderModel {
  final String imageUrl;
  final String name;
  final String designationHtml;
  final String bioHtml;

  LeaderModel({
    required this.imageUrl,
    required this.name,
    required this.designationHtml,
    required this.bioHtml,
  });
}
class LeaderMessage {
  final String name;
  final String designationHtml;
  final String imageUrl;
  final String messageHtml;

  const LeaderMessage({
    required this.name,
    required this.designationHtml,
    required this.imageUrl,
    required this.messageHtml,
  });
}
class MediaContactModel {
  final String name;
  final String? phone;
  final String? email;
  final String? image;

  MediaContactModel({
    required this.name,
    this.phone,
    this.email,
    this.image,
  });
}
class ContactPerson {
  final String name;
  final String phone;
  final String email;
  final String? image;

  ContactPerson({
    required this.name,
    required this.phone,
    required this.email,
    this.image,
  });
}
class AwardModel {
  final String id;
  final String title;
  final String description;
  final String imageUrl;
  final String pageUrl;

  AwardModel({
    required this.id,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.pageUrl,
  });
}
class EpisodeModel {
  final String id;
  final String episodeName;
  final String videoLink;
  final String showBrief;
  final String episodeBrief;
  final String guestInfo;
  final String credits;
  final String relatedNews;

  EpisodeModel({
    required this.id,
    required this.episodeName,
    required this.videoLink,
    required this.showBrief,
    required this.episodeBrief,
    required this.guestInfo,
    required this.credits,
    required this.relatedNews,
  });

  /// Extract YouTube ID from embed URL
  String get youtubeId {
    final uri = Uri.parse(videoLink);
    return uri.pathSegments.isNotEmpty ? uri.pathSegments.last : '';
  }

  String get thumbnail =>
      'https://img.youtube.com/vi/$youtubeId/mqdefault.jpg';
}

class SeasonModel {
  final String seasonName;
  final String seasonDescription;
  final String url;
  final List<EpisodeModel> episodes;

  SeasonModel({
    required this.seasonName,
    required this.seasonDescription,
    required this.url,
    required this.episodes,
  });
}

class StaticSeasonData {
  static final List<SeasonModel> seasons = [
    /// 🔹 SEASON 1 | PROMO
    SeasonModel(
      seasonName: 'Season 1 | Promo of All Episodes',
      seasonDescription:
          'Our Africa by Merck Foundation promo season',
      url: 'promo-season-one-episodes',
      episodes: [
        EpisodeModel(
          id: '30',
          episodeName:
              "Promo 'Our Africa by Merck Foundation' TV Program | S1 EP5: Breaking Infertility Stigma",
          videoLink:
              'https://www.youtube.com/embed/IxVh-ztP0R4',
          showBrief: '',
          episodeBrief:
              'The Fifth Episode focuses on Breaking The Fifth Episode focuses on Breaking Infertility Stigma The Fifth Episode focuses on Breaking Infertility Stigma',
          guestInfo: '',
          credits: '',
          relatedNews: '',
        ),
      ],
    ),

    /// 🔹 SEASON 1 | BEHIND THE SCENES
    SeasonModel(
      seasonName: 'Season 1 | Behind the Scenes',
      seasonDescription: '',
      url: 'behind-the-scenes',
      episodes: [
        EpisodeModel(
          id: '41',
          episodeName:
              'Behind the Scenes - S1 EP1: Diabetes Awareness',
          videoLink:
              'https://www.youtube.com/embed/3L8K9bpCfwc',
          showBrief: '',
          episodeBrief:
              'The First Episode focuses on Diabetes Awareness',
          guestInfo:
              'Guest: Teenusha Soobrah, Mauritius',
          credits: '',
          relatedNews: '',
        ),
      ],
    ),

    /// 🔹 SEASON 1 | WORKSHOP VIDEOS
    SeasonModel(
      seasonName: 'Season 1 | Workshop Videos',
      seasonDescription: '',
      url: 'season-1-workshop-videos',
      episodes: [
        EpisodeModel(
          id: '55',
          episodeName:
              'Dr. Rasha Kelej Workshop - S1 EP1: Diabetes Awareness',
          videoLink:
              'https://www.youtube.com/embed/JNpm6SisO7c',
          showBrief: '',
          episodeBrief:
              'The First Episode focuses on Diabetes Awareness',
          guestInfo:
              'Guest: Teenusha Soobrah, Mauritius',
          credits: '',
          relatedNews: '',
        ),
        EpisodeModel(
          id: '56',
          episodeName:
              'Dr. Rasha Kelej Workshop - S1 EP4: Promoting Healthy Lifestyle',
          videoLink:
              'https://www.youtube.com/embed/q1zls9Y1qho',
          showBrief: '',
          episodeBrief:
              'Promoting a Healthy Lifestyle',
          guestInfo: '',
          credits: '',
          relatedNews: '',
        ),
      ],
    ),
  ];
}

class Description {
  final String? title;
  final String? detail;

  Description({this.title, this.detail});
}

class Video {
  final String? videoLink;
  final String? videoDesc;

  Video({this.videoLink, this.videoDesc});
}

class Newsletter {
  final String? imge;
  final String? title;

  Newsletter({this.imge, this.title});
}
class SectionItem {
  final String? id;
  final String? title;
  final String? subtitle;
   final String? description;
  final String? htmlSubtitle;
  final String? imageUrl;
  final String? videoUrl;
  final bool showYoutubeIcon;
  final bool showShareIcon;
  final bool showInfoIcon;
  final String? buttonText;

  SectionItem({
    this.id,
    this.title,
    this.subtitle,
    this.htmlSubtitle,
    this.description,
    this.imageUrl,
    this.videoUrl,
    this.showYoutubeIcon = false,
    this.showShareIcon = false,
    this.showInfoIcon = false,
    this.buttonText
  });
}
class HomeTabModel {
  final String key;       // "call_for_app"
  final String title;     // "Call for Applications"
  final List<CarouselItem> items;

  HomeTabModel({
    required this.key,
    required this.title,
    required this.items,
  });

  factory HomeTabModel.fromJson(Map<String, dynamic> json) {
    return HomeTabModel(
      key: json['key'],
      title: json['title'],
      items: (json['items'] as List)
          .map((e) => CarouselItem.fromJson(e))
          .toList(),
    );
  }
}
class FabMenuItem {
  final String menuId;
  final String title;
  final String? url;
  final List<FabMenuItem> children;

  FabMenuItem({
    required this.menuId,
    required this.title,
    this.url,
    this.children = const [],
  });

  factory FabMenuItem.fromJson(Map<String, dynamic> json) {
    return FabMenuItem(
      menuId: json['menu_id'] ?? '',
      title: json['menu_name'] ?? '',
      url: json['menu_url'],
      children: json['children'] != null
          ? (json['children'] as List)
              .map((c) => FabMenuItem.fromJson(c))
              .toList()
          : [],
    );
  }
}
