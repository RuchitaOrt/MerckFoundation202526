import 'package:merckfoundation_252026/enum/commonEnum.dart';
import 'package:merckfoundation_252026/model/CommonModel.dart';
import 'package:merckfoundation_252026/model/StoryModel.dart';


class ProcessedLayout {
  final HomeLayoutType type;

  final String title;
  final String mobileView;

  final bool viewButton;

  final String buttonText;
  final String buttonLink;
  final String buttonMenuId;

  final List<StoryModel> stories;

  final List<CarouselItem> carouselItems;

  final Map<String, dynamic> raw;

  ProcessedLayout({
    required this.type,
    required this.title,
    required this.mobileView,
    required this.viewButton,
    required this.buttonText,
    required this.buttonLink,
    required this.buttonMenuId,
    required this.stories,
    required this.carouselItems,
    required this.raw,
  });
}