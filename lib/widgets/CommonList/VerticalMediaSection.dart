import 'package:flutter/material.dart';
import 'package:merckfoundation_252026/CommonUtils/customcolor.dart';
import 'package:merckfoundation_252026/Utility/showdailog.dart';
import 'package:merckfoundation_252026/enum/commonEnum.dart';
import 'package:merckfoundation_252026/model/StoryModel.dart';
import 'package:merckfoundation_252026/model/TestimonialModel.dart';
import 'package:merckfoundation_252026/screens/DetailsScreen/DetailScreen.dart';
import 'package:merckfoundation_252026/screens/DetailsScreen/TestimonialArticlesScreen.dart' hide TestimonialCarouselWidget;
import 'package:merckfoundation_252026/screens/MediaAndStoriesScreen/PhotoAlumbScreen.dart';
import 'package:merckfoundation_252026/widgets/CommonList/CommonListCard.dart';
import 'package:merckfoundation_252026/widgets/CommonWidget/CommonFunctions.dart';
import 'package:merckfoundation_252026/widgets/CommonWidget/CommonLoader.dart';

import 'package:merckfoundation_252026/widgets/ImagePreviewScreen.dart';
import 'package:merckfoundation_252026/widgets/SmartHtmlWidget.dart';
import 'package:merckfoundation_252026/widgets/YouTubePreview.dart';
import 'package:merckfoundation_252026/widgets/mediaCard.dart';

class VerticalMediaSection extends StatefulWidget {
  final List<StoryModel> content;
  final HomeLayoutType type;
  final String menuID;
  final String? shareLink;
  final String title;
  final bool content_button;

  const VerticalMediaSection({
    super.key,
    required this.content,
    required this.type,
    required this.menuID,
    required this.shareLink,
    required this.title, required this.content_button,
  });

  @override
  State<VerticalMediaSection> createState() => _VerticalMediaSectionState();
}

class _VerticalMediaSectionState extends State<VerticalMediaSection> {
  static const int pageSize = 10;

  int visibleCount = 10;
  bool isLoadingMore = false;

  @override
  void initState() {
    super.initState();

    visibleCount = widget.content.length > pageSize
        ? pageSize
        : widget.content.length;
  }

  Future<void> _loadMore() async {
    if (isLoadingMore) return;

    setState(() {
      isLoadingMore = true;
    });

    await Future.delayed(const Duration(seconds: 2));

    if (!mounted) return;

    setState(() {
      visibleCount = (visibleCount + pageSize).clamp(0, widget.content.length);

      isLoadingMore = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final hasMore = visibleCount < widget.content.length;
    // final testimonialItems = widget.content.map((story) {
    //   return TestimonialModel(
    //     title: story.title,

    //     image: story.thumbnail ?? "",
    //     departmentName: '',
    //     shortDescription: story.description ?? "",
    //     details: story.details ?? "",
    //   );
    // }).toList();
//     if (widget.type == HomeLayoutType.testimonials) {
//   return TestimonialCarouselWidget(
//     items: testimonialItems,
//   );
// }


    return Column(
      children: [
        (widget.type == HomeLayoutType.MerckMoreThanAmbasdar ||
                widget.type == HomeLayoutType.MerckMoreThanAmbasdarFormer ||
                widget.type == HomeLayoutType.CallForApplication)
            ? Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
                child: SmartHtmlWidget(
                  html: widget.title ?? "",
                  textColor: Customcolor.textBlueColor,
                  fontSize: screenWidth * 0.055,
                  fontWeight: FontWeight.w800,
                  ignoreHtmlStyles: true,
                ),
              )
            : Container(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          child:
              (widget.type == HomeLayoutType.merckFoundationInMedia ||
                  widget.type == HomeLayoutType.newsLettersAndArticles)
              ? ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: visibleCount + (hasMore ? 1 : 0),
                  itemBuilder: (context, index) {
                    /// Loader Item
                    if (index >= visibleCount) {
                      if (!isLoadingMore) {
                        WidgetsBinding.instance.addPostFrameCallback((_) {
                          _loadMore();
                        });
                      }

                      return const Padding(
                        padding: EdgeInsets.symmetric(vertical: 16),
                        child: Center(child: CommonLoader()),
                      );
                    }

                    final item = widget.content[index];

                    return CommonListCard(
                      imageUrl: item.thumbnail ?? "",
                      htmlTitle: item.title ?? "",
                      onTap: () {
                        if (widget.type ==
                            HomeLayoutType.merckFoundationInMedia) {
                          ShowDialogs.launchURL(item.pdfFile ?? "");
                        }else if (widget.type ==
                            HomeLayoutType.newsLettersAndArticles) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => DetailScreen(
                                "",
                                "",
                                title: item.title,
                                articleId: item.id.toString(),
                                languageId: item.subtitle,
                                isDetailApiCalled: true,
                                shareLink: "",
                                menuID: widget.menuID,
                              ),
                            ),
                          );
                        }
                      },
                    );
                  },
                )
              : GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: visibleCount + (hasMore ? 1 : 0),
                  gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount:widget.type ==
                            HomeLayoutType.MerckMoreThanAmbasdar?1: 2,
                    childAspectRatio:( widget.type == HomeLayoutType.MerckMoreThanAmbasdar && widget.content_button)?0.80:
                    ( widget.type == HomeLayoutType.MerckMoreThanAmbasdar && widget.content_button==false)?1:
                    (widget.type ==
                            HomeLayoutType.MerckMoreThanAmbasdarFormer && widget.content_button)?0.63
                    : 0.80,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                  ),
                  itemBuilder: (context, index) {
                    /// Loader Cell
                    if (index >= visibleCount) {
                      if (!isLoadingMore) {
                        WidgetsBinding.instance.addPostFrameCallback((_) {
                          _loadMore();
                        });
                      }

                      return const Center(child: CommonLoader());
                    }

                    final item = widget.content[index];

                    /// PHOTO TYPES
                    if (widget.type == HomeLayoutType.photoGallery ||
                        widget.type == HomeLayoutType.DigitalLibrary ||
                        widget.type == HomeLayoutType.MerckMoreThanAmbasdar ||
                        widget.type ==
                            HomeLayoutType.MerckMoreThanAmbasdarFormer ||
                        widget.type == HomeLayoutType.CallForApplication) {
                      return 
                      MediaCard(
                        content_button: widget.content_button,
                        type: widget.type,
                        menuID: widget.menuID,
                        shareLink: widget.shareLink,
                        id: item.id.toString(),
                        image:
                            (widget.type ==
                                    HomeLayoutType.MerckMoreThanAmbasdar ||
                                widget.type ==
                                    HomeLayoutType
                                        .MerckMoreThanAmbasdarFormer ||
                                widget.type == HomeLayoutType.DigitalLibrary ||
                                widget.type ==
                                    HomeLayoutType.CallForApplication || widget.type==HomeLayoutType.photoGallery)
                            ? item.thumbnail ?? ""
                            : item.image ?? "",
                        title: 
                        widget.type == HomeLayoutType.photoGallery
                            ? item.description ?? ""
                            :
                             item.title ?? "",
                            subTitle: item.subtitle ?? "",
                        showPlayIcon: false,
                        onTap: () {
                          if (widget.type == HomeLayoutType.photoGallery 
                          
                          ||widget.type == HomeLayoutType.PhotoCategory) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => PhotoAlumbScreen(
                                  pageTile: widget.title,
                                  tile: item.photo_category_name,
                                  categoryID: item.id.toString(),
                                  menuID: widget.menuID,
                                  shareLink: widget.shareLink,
                                ),
                              ),
                            );
                          }else if(widget.type==HomeLayoutType.MerckMoreThanAmbasdar ||widget.type==HomeLayoutType.MerckMoreThanAmbasdarFormer){
                           showModalBottomSheet(
                                      context: context,
                                      isScrollControlled: true,
                                      backgroundColor: Colors.black,
                                      builder: (_) => ImagePreviewDialog(
                                        imageUrl:item.thumbnail  ?? "",
                                        title:  item.title ?? "",
                                      ),
                                    );
                        } else if (widget.type ==
                                  HomeLayoutType.DigitalLibrary ||
                              widget.type ==
                                  HomeLayoutType.CallForApplication) {
                            ShowDialogs.launchURL(item.pdfFile ?? "");
                          } else if (widget.type ==
                            HomeLayoutType.newsLettersAndArticles){
                            
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => DetailScreen(
                                  item.title,
                                  item.details,
                                  title: widget.title,
                                  shareLink: widget.shareLink,
                                  isDetailApiCalled: true,
                                  articleId: item.id.toString(),
                                  languageId: item.languageid,
                                  menuID: widget.menuID,
                                ),
                              ),
                            );
                          }
                        },
                      );
                    }
 final thumb = item.thumbnail ?? "";

                final isYoutube =
                    thumb.contains("youtube.com") || thumb.contains("youtu.be");

                String imageUrl = thumb;

                if (isYoutube) {
                  final videoId = getYoutubeId(thumb);

                  imageUrl =
                      "https://img.youtube.com/vi/$videoId/hqdefault.jpg";
                }

                    /// VIDEO TYPES
                    return MediaCard(
                        content_button: widget.content_button,
                      menuID: widget.menuID,
                      shareLink: widget.shareLink,
                      id: item.id.toString(),
                      image: imageUrl,
                      title: widget.type == HomeLayoutType.episodes
                          ? item.episode_name ?? ""
                          : item.description ?? "",
                      showmenu: widget.type == HomeLayoutType.episodes,
                      showPlayIcon: true,
                      onTap: () {
                        final key = item.videoLink.substring(
                          item.videoLink.length - 11,
                        );

                        ShowDialogs.youtubevideolink(
                          "https://www.youtube.com/watch?v=$key?autoplay=1",
                        );
                      },
                    );
                  },
                ),
        ),
      ],
    );
  }
}
