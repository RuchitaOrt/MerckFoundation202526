import 'package:flutter/material.dart';
import 'package:merckfoundation_252026/CommonUtils/customcolor.dart';
import 'package:merckfoundation_252026/Provider/PageProvider.dart';
import 'package:merckfoundation_252026/Utility/showdailog.dart';
import 'package:merckfoundation_252026/enum/commonEnum.dart';
import 'package:merckfoundation_252026/model/StoryModel.dart';
import 'package:merckfoundation_252026/model/TestimonialModel.dart';
import 'package:merckfoundation_252026/routes/AppNavigation.dart';
import 'package:merckfoundation_252026/screens/DetailsScreen/DetailScreen.dart';
import 'package:merckfoundation_252026/screens/DetailsScreen/TestimonialArticlesScreen.dart' hide TestimonialCarouselWidget;
import 'package:merckfoundation_252026/screens/MediaAndStoriesScreen/MediaListingScreen.dart';
import 'package:merckfoundation_252026/screens/MediaAndStoriesScreen/PhotoAlumbScreen.dart';
import 'package:merckfoundation_252026/widgets/CommonList/CommonListCard.dart';
import 'package:merckfoundation_252026/widgets/CommonWidget/CommonBorderButton.dart';
import 'package:merckfoundation_252026/widgets/CommonWidget/CommonFunctions.dart';
import 'package:merckfoundation_252026/widgets/CommonWidget/CommonLoader.dart';

import 'package:merckfoundation_252026/widgets/ImagePreviewScreen.dart';
import 'package:merckfoundation_252026/widgets/SmartHtmlWidget.dart';
import 'package:merckfoundation_252026/widgets/YouTubePreview.dart';
import 'package:merckfoundation_252026/widgets/mediaCard.dart';
import 'package:provider/provider.dart';

class VerticalMediaSection extends StatefulWidget {
  final List<StoryModel> content;
  final HomeLayoutType type;
  final String menuID;
  final String? shareLink;
  final String title;
  final bool content_button;
  final String buttonText;

  const VerticalMediaSection({
    super.key,
    required this.content,
    required this.type,
    required this.menuID,
    required this.shareLink,
    required this.title, required this.content_button,this.buttonText=""
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
Future<void> _onViewAllPressed() async {
  debugPrint("=================================");
  debugPrint("WATCH MORE CLICKED");
  debugPrint("MENU ID = ${widget.menuID}");
  debugPrint("TYPE = ${widget.type}");
  debugPrint("TITLE = ${widget.title}");
  debugPrint("=================================");

  if (widget.menuID.isEmpty) {
    debugPrint("ERROR: menuID is EMPTY");
    return;
  }

  final provider = Provider.of<PageProvider>(
    context,
    listen: false,
  );

  final data = await provider.fetchWatchMorePage(
    context,
    widget.menuID,
  );

  if (!mounted) return;

  debugPrint("WATCH MORE DATA = $data");

  if (data == null) {
    debugPrint("WATCH MORE: DATA IS NULL");
    return;
  }

  final root = data['data'];

  if (root == null || root is! Map) {
    debugPrint("WATCH MORE: INVALID ROOT");
    debugPrint("ROOT = $root");
    return;
  }

  debugPrint("========== ROOT ==========");
  debugPrint("ROOT = $root");
  debugPrint("is_newsletter = ${root['is_newsletter']}");
  debugPrint("is_awards = ${root['is_awards']}");
  debugPrint("is_video = ${root['is_video']}");
  debugPrint("is_dglibrary = ${root['is_dglibrary']}");
  debugPrint("is_photo = ${root['is_photo']}");
  debugPrint("==========================");

  if (root['is_newsletter'] == true) {
    debugPrint("NAVIGATING -> NEWSLETTER");

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => DetailScreen(
          "",
          "",
          title: root['menu_name']?.toString() ?? "",
          articleId: root['newsletter_id']?.toString() ?? "",
          languageId: "",
          isDetailApiCalled: true,
          shareLink: "",
          menuID: widget.menuID,
        ),
      ),
    );

    return;
  }
else
  if (root['is_awards'] == true) {
    debugPrint("NAVIGATING -> AWARDS");

    AppNavigation.navigateByMenuId(
      context,
      menuId: root['award_id']?.toString() ?? "",
      title: root['menu_name']?.toString() ?? "",
    );

    return;
  }
else
  if (root['is_video'] == true) {
    debugPrint("NAVIGATING -> VIDEO");

    final videoCategories = root['video_category_array'];

    

    debugPrint("VIDEO CATEGORY = $videoCategories");

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => MediaListingScreen(
          type: MediaType.all,
          categoryID: videoCategories.join(','),
          albumID: "",
          albumName: "",
          menuID: "",
          title: root['menu_name']?.toString() ?? "",
          shareLink: root['share_link']?.toString() ?? "",
        ),
      ),
    );

    return;
  }
else
  if (root['is_dglibrary'] == true) {
    debugPrint("NAVIGATING -> DIGITAL LIBRARY");

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => MediaListingScreen(
          type: MediaType.digitalLibraryall,
          categoryID: root['digital_library_id']?.toString() ?? "",
          albumID: "",
          albumName: "",
          menuID: "",
          shareLink: "",
          title: "Digital Library",
          digitalLibraryCategoryName: "",
        ),
      ),
    );

    return;
  }
else
  if (root['is_photo'] == true) {
    debugPrint("NAVIGATING -> PHOTO");

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => MediaListingScreen(
          type: MediaType.photoAlbum,
          categoryID: root['photo_category_id']?.toString() ?? "",
          albumID: root['photo_album_id']?.toString() ?? "",
          albumName: "",
          menuID: "",
          shareLink: "",
          title: root['menu_name']?.toString() ?? "",
        ),
      ),
    );

    return;
  }
else{
  debugPrint("NO SPECIAL TYPE FOUND");
  debugPrint("NAVIGATING -> DEFAULT");

   AppNavigation.navigateByMenuId(
                          context,
                          menuId: widget.menuID,
                          albumId: "",
                    
                          albumName: "",
                          categoryId: "",
                          title: widget.title ?? "",
                          shareLink: widget.shareLink,
                          seasonId:  "",
                          type: widget.type,
                        );
}
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
                child: 
                SmartHtmlWidget(
                  html: widget.title ?? "",
                   textColor: Customcolor.textwebBlueColor,
                  fontSize: screenWidth * 0.055,
                  fontWeight: FontWeight.w600,
                  // ignoreHtmlStyles: true,
                   ignorefontStyles: true,
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
                              print("RUCHIobject");
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
              :
              Column(
  children: [
             
               GridView.builder(
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
                          print("MEDIA WATCH MORE");
                          if (widget.type == HomeLayoutType.photoGallery ){
                            showModalBottomSheet(
                                      context: context,
                                      isScrollControlled: true,
                                      backgroundColor: Colors.black,
                                      builder: (_) => ImagePreviewDialog(
                                        imageUrl: item.thumbnail ?? "",
                                        title: item.description  ?? "",
                                      ),
                                    );
                          }
                          
                          else 
                          if
                          (widget.type == HomeLayoutType.PhotoCategory) {
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
                             print("RUCHIobject 2");
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
                        final key = imageUrl.substring(
                          imageUrl.length - 11,
                        );

                        ShowDialogs.youtubevideolink(
                          "https://www.youtube.com/watch?v=$key?autoplay=1",
                        );
                      },
                    );
                  },
                ),
    const SizedBox(height: 16),

    if (widget.buttonText!="")
    Center(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 5),
                    child: CommonBorderButton(
                      title: widget.buttonText,
                      onTap: _onViewAllPressed
                      // () {
                    
                      //   AppNavigation.navigateByMenuId(
                      //     context,
                      //     menuId: widget.menuID,
                      //     albumId: "",
                    
                      //     albumName: "",
                      //     categoryId: "",
                      //     title: widget.title ?? "",
                      //     shareLink: widget.shareLink,
                      //     seasonId:  "",
                      //     type: widget.type,
                      //   );
                      // },
                    ),
                  ),
                ),
  ],
)
    
        ),
      ],
    );
  }
}
