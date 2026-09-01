import 'package:merckfoundation_252026/enum/commonEnum.dart';
import 'package:merckfoundation_252026/model/AwardResponse.dart';
import 'package:merckfoundation_252026/model/CommonModel.dart';
import 'package:merckfoundation_252026/model/StoryModel.dart';

class LayoutModel {
  final String? id;
  final HomeLayoutType type;

  final String title;
  final String mobileView;
  final bool viewButton;

  final String buttonText;
  final String buttonLink;
  final String buttonMenuId;

  final dynamic contentButton;

  /// Already parsed
  final List<StoryModel> stories;
  final List<AwardModel> awards;
  final List<CarouselItem> carouselItems;

  /// Raw content only for layouts that still need it
  final List<dynamic> content;

  LayoutModel({
    required this.type,
    required this.title,
    required this.mobileView,
    required this.viewButton,
    required this.buttonText,
    required this.buttonLink,
    required this.buttonMenuId,
    required this.contentButton,
    required this.content,
    this.stories = const [],
    this.awards = const [],
    this.carouselItems = const [],
    this.id
  });
}