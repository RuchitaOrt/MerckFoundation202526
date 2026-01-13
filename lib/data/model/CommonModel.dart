import 'dart:ui';

import 'package:flutter/material.dart';

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
enum HomeSectionType {
  videos,
  gallery,
  ceoMsg,
  episodes,
  awards,
  content,
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
}

class ProgramModel {
  final String id;
  final String title;
  final String image;
  final Color bgColor;

  ProgramModel({
    required this.id,
    required this.title,
    required this.image,
    required this.bgColor,
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
