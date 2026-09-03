
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:merckfoundation_252026/Provider/PageProvider.dart';
import 'package:merckfoundation_252026/Utility/APIManager.dart';
import 'package:merckfoundation_252026/Utility/AppSizes.dart';
import 'package:merckfoundation_252026/Utility/ResponsiveFlutter.dart';
import 'package:merckfoundation_252026/Utility/showdailog.dart';
import 'package:merckfoundation_252026/model/TestimonialModel.dart';
import 'package:merckfoundation_252026/routes/AppNavigation.dart';
import 'package:merckfoundation_252026/CommonUtils/customcolor.dart';
import 'package:merckfoundation_252026/enum/commonEnum.dart';
import 'package:merckfoundation_252026/screens/DetailsScreen/DetailScreen.dart';
import 'package:merckfoundation_252026/screens/DetailsScreen/TestimonialArticlesScreen.dart';
import 'package:merckfoundation_252026/screens/MainScreens/EpisodeScreen/EpisodeInformation.dart';
import 'package:merckfoundation_252026/screens/MediaAndStoriesScreen/MediaListingScreen.dart';
import 'package:merckfoundation_252026/widgets/CommonWidget/CommonBorderButton.dart';
import 'package:merckfoundation_252026/widgets/CommonWidget/CommonFunctions.dart';
import 'package:merckfoundation_252026/widgets/CommonWidget/CommonPopupMenu.dart';
import 'package:merckfoundation_252026/widgets/CommonWidget/ImageShimmer.dart';
import 'package:merckfoundation_252026/widgets/ImagePreviewScreen.dart';
import 'package:merckfoundation_252026/widgets/SmartHtmlWidget.dart';
import 'package:merckfoundation_252026/screens/MediaAndStoriesScreen/PhotoAlumbScreen.dart';
import 'package:merckfoundation_252026/widgets/share_bottom_sheet.dart';
import 'package:provider/provider.dart';

class HorizontalMediaSection extends StatefulWidget {
  final List content;
  final String? seasonID;
  final String? title;
  final HomeLayoutType? type;
  final bool showDescription;
  final String menuID;
  final String? shareLink;

  final bool showMenu;
  final VoidCallback? onMenuTap;

  final String buttonText;
  final String buttonLink;
  final bool? contentbutton;

  const HorizontalMediaSection({
    super.key,
    required this.content,
    this.title,
    this.showDescription = false,
    this.showMenu = false,
    this.onMenuTap,
    this.type,
    this.seasonID,
    required this.buttonText,
    required this.buttonLink,
    required this.menuID,
    this.shareLink,
    this.contentbutton
  });

  @override
  State<HorizontalMediaSection> createState() =>
      _HorizontalMediaSectionState();
}

class _HorizontalMediaSectionState extends State<HorizontalMediaSection> {
  final CarouselSliderController _carouselController =
      CarouselSliderController();

  int currentIndex = 0;

  Future<void> _onViewAllPressed() async {
    print("WIDGET TYPE ${widget.type}");

    if (widget.type == HomeLayoutType.season) {
      AppNavigation.navigateByMenuId(
        context,
        menuId: widget.menuID,
        albumId: "",
        albumName: "",
        categoryId: widget.type == HomeLayoutType.episodesviewall
            ? widget.seasonID ?? ""
            : "",
        title: widget.title ?? "",
        shareLink: widget.shareLink,
        seasonId: widget.seasonID ?? "",
        type: widget.type,
      );
    } else {
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

      if (data == null) {
        debugPrint("WATCH MORE: DATA IS NULL");
        return;
      }

      final root = data['data'];

      if (root == null || root is! Map) {
        debugPrint("WATCH MORE: INVALID ROOT");
        return;
      }

      if (root['is_newsletter'] == true) {
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

      if (root['is_awards'] == true) {
        AppNavigation.navigateByMenuId(
          context,
          menuId: root['award_id']?.toString() ?? "",
          title: root['menu_name']?.toString() ?? "",
        );

        return;
      }

      if (root['is_video'] == true) {
        final videoCategories = root['video_category_array'];

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => MediaListingScreen(
              type: MediaType.all,
              categoryID: videoCategories.join(','),
              albumID: "",
              albumName: "",
              menuID: "",
              title: root['menu_title']?.toString() ?? "",
              shareLink: root['share_link']?.toString() ?? "",
            ),
          ),
        );

        return;
      }

      if (root['is_dglibrary'] == true) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => MediaListingScreen(
              type: MediaType.digitalLibraryall,
              categoryID:
                  root['digital_library_id']?.toString() ?? "",
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

      if (root['is_photo'] == true) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => MediaListingScreen(
              type: MediaType.photoAlbum,
              categoryID:
                  root['photo_category_id']?.toString() ?? "",
              albumID:
                  root['photo_album_id']?.toString() ?? "",
              albumName: "",
              menuID: "",
              shareLink: "",
              title: root['menu_name']?.toString() ?? "",
            ),
          ),
        );

        return;
      }
// if(widget.type==HomeLayoutType.testimonials)
// {
//   print("RUCHITA");
//    Navigator.push(
//           context,
//           MaterialPageRoute(
//             builder: (_) => TestimonialArticlesScreen(
//               shareLink: widget.shareLink ?? "",
//               title: widget.title!,
//             ),
//           ),
//         );
// }
      AppNavigation.navigateByMenuId(
        context,
        menuId: widget.menuID,
        albumId: "",
        albumName: "",
        categoryId:
            widget.type == HomeLayoutType.episodesviewall
                ? widget.seasonID ?? ""
                : "",
        title: widget.title ?? "",
        shareLink: widget.shareLink,
        seasonId: widget.seasonID ?? "",
        type: widget.type,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.content.isEmpty) {
      return const SizedBox();
    }

    final screenHeight = MediaQuery.of(context).size.height;

    // Card dimensions
    final itemWidth = MediaQuery.of(context).size.width - 32;

    final itemHeight =
        widget.type == HomeLayoutType.testimonials
            ? screenHeight * 0.39
            :widget.contentbutton==true ?screenHeight * 0.43:screenHeight * 0.35;

    final imageHeight = screenHeight * 0.28;

    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          // =========================
          // TITLE
          // =========================
          if ((widget.title ?? "").isNotEmpty)
            Row(
              children: [
                Expanded(
                  child: SmartHtmlWidget(
                    html:"${widget.title!}",
                    textColor: Customcolor.violetcolor,
                    fontSize: AppSizes.heading(context),
                    ignorefontStyles: true,
                  ),
                ),
              ],
            ),

          const SizedBox(height: 12),

          // =========================
          // AUTO CAROUSEL
          // =========================
          SizedBox(
            width: itemWidth,
            height: itemHeight,
            child: CarouselSlider.builder(
              carouselController: _carouselController,

              itemCount: widget.content.length,

              itemBuilder: (
                BuildContext context,
                int index,
                int realIndex,
              ) {
                final item = widget.content[index];

                return _buildCard(
                  context,
                  item,
                  itemWidth,
                  itemHeight,
                  imageHeight,
                  index,
                );
              },

              options: CarouselOptions(

                // Fixed size
                height: itemHeight,

                // One card takes complete width
                viewportFraction: 1.0,

                // IMPORTANT
                // Automatically move
                autoPlay: true,

                // Move every 2 seconds
                autoPlayInterval:
                    const Duration(seconds: 8),

                // Animation duration
                autoPlayAnimationDuration:
                    const Duration(milliseconds: 700),

                // Smooth horizontal movement
                autoPlayCurve: Curves.easeInOut,

                // Infinite / circular
                enableInfiniteScroll:
                    widget.content.length > 1,

                // Do not enlarge
                enlargeCenterPage: false,

                // Start from first card
                initialPage: 0,

                onPageChanged: (index, reason) {
                  if (mounted) {
                    setState(() {
                      currentIndex = index;
                    });
                  }
                },
              ),
            ),
          ),

           const SizedBox(height: 10),

          // =========================
          // BUTTON
          // =========================
          if (widget.buttonText.isNotEmpty)
            Center(
              child: Padding(
                padding:
                    EdgeInsets.only(bottom: 5),
                child: CommonBorderButton(
                  title:
                      widget.buttonText.toUpperCase(),
                  onTap: _onViewAllPressed,
                ),
              ),
            ),
        ],
      ),
    );
  }

  // ============================================================
  // CARD
  // ============================================================

  Widget _buildCard(
    BuildContext context,
    dynamic item,
    double itemWidth,
    double itemHeight,
    double imageHeight,
    int index,
  ) {
     final List<String> substackIds =
      getSubstackIds(item['substack_url']);

  debugPrint("SUBSTACK IDS = $substackIds");
    final episodeId =
        item['id']?.toString() ??
        item['season_id']?.toString() ??
        widget.seasonID ?? "";
    
    final thumb = item['thumbnail'] ?? "";

    final isYoutube =
        thumb.contains("youtube.com") ||
        thumb.contains("youtu.be");

    String imageUrl = thumb;

    if (isYoutube) {
      final videoId = getYoutubeId(thumb);

      imageUrl =
          "https://img.youtube.com/vi/$videoId/hqdefault.jpg";
    }

    return GestureDetector(
      onTap: () {
        // =========================
        // YOUTUBE
        // =========================

        if (isYoutube) {
          ShowDialogs.launchURL(
            item['thumbnail'],
          );
        }

        // =========================
        // NEWSLETTER / ARTICLES
        // =========================

        else if (
            widget.type ==
                HomeLayoutType.newsLettersAndArticles || widget.type ==
                HomeLayoutType.ceoMessage) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => DetailScreen(
                "",
                "",
                title: widget.title,
                articleId:
                    item['id'].toString(),
                languageId:
                    item['subtitle'].toString(),
                isDetailApiCalled: true,
                shareLink: widget.shareLink,
                menuID: widget.menuID,
              ),
            ),
          );
        }

        // =========================
        // MEDIA
        // =========================

        else if (
            widget.type ==
                HomeLayoutType
                    .merckFoundationInMedia) {
          ShowDialogs.launchURL(
            item['page_url'],
          );
        }

        // =========================
        // TESTIMONIAL
        // =========================

        else if (
            widget.type ==
                HomeLayoutType.testimonials) {
          final clickedTestimonial =
              TestimonialModel(
                testimonial_name: item['testimonial_name']??"",
            image: item['thumbnail'] ?? "",
            title: item['title'] ?? "",
            departmentName: "",
            shortDescription:
                item['description'] ?? "",
            details:
                item['description'] ?? "",
          );

          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) =>
                  TestimonialArticlesScreen(
                title: widget.title ?? "",
                shareLink:
                    widget.shareLink ?? "",
                initialList: [
                  clickedTestimonial,
                ],
                useLocalPagination: true,
              ),
            ),
          );
        }

        // =========================
        // PHOTO CATEGORY
        // =========================

        else if (
            widget.type ==
                HomeLayoutType.PhotoCategory) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => PhotoAlumbScreen(
                homeLayoutType:
                    HomeLayoutType.PhotoCategory,
                pageTile:
                    widget.title ?? "",
                tile:
                    item['photo_category_name'] ??
                        "",
                categoryID:
                    item['id'].toString(),
                menuID: widget.menuID,
                shareLink:
                    widget.shareLink,
              ),
            ),
          );
        }

        // =========================
        // PHOTO GALLERY
        // =========================

        else if (
            widget.type ==
                HomeLayoutType.photoGallery) {
                   print("3Image");
                   showGeneralDialog(
  context: context,
  barrierDismissible: true,
  barrierLabel: 'Image Preview',

  // Transparent black overlay over the previous screen
  barrierColor: Colors.black.withOpacity(0.55),

  transitionDuration: const Duration(
    milliseconds: 200,
  ),

  pageBuilder: (
    context,
    animation,
    secondaryAnimation,
  ) {
    return ImagePreviewDialog(
      items: widget.content,
      initialIndex: index,
      imageUrl: (item) =>
          item['thumbnail']?.toString() ?? "",
      title: (item) =>
          item['title']?.toString() ?? "",
    );
  },
);
  //         showGeneralDialog(
  //           context: context,
  //           barrierDismissible: true,
  //           barrierLabel: 'Image Preview',
  //           barrierColor:
  //               Colors.transparent,
  //           transitionDuration:
  //               const Duration(
  //             milliseconds: 200,
  //           ),
  //           pageBuilder: (
  //             context,
  //             animation,
  //             secondaryAnimation,
  //           ) {
  //             return ImagePreviewDialog(
  //               items: widget.content,
  // initialIndex: index,
  // imageUrl: (item) => item['thumbnail']?.toString() ?? "",
  // title: (item) => item['title']?.toString() ?? "",
  //               // imageUrl:
  //               //     item['thumbnail'] ?? "",
  //               // title:
  //               //     item['title'] ?? "",
  //             );
  //           },
  //         );
        }
      },

      child: SizedBox(
        width: itemWidth,
        height: itemHeight,
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start,
          children: [

            // =========================
            // IMAGE
            // =========================

            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: SizedBox(
                width: itemWidth,
                height: imageHeight,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
              
                    AutoAspectCachedImage(
                      imageUrl: imageUrl,
                      height: imageHeight,
                      maxWidth: itemWidth,
                      placeholder:
                          const ImageShimmer(),
                      errorWidget:
                          const Icon(
                        Icons.error,
                      ),
                    ),
              
                    // =========================
                    // 3 DOT MENU
                    // =========================
              
                    if (widget.showMenu)
                      Positioned(
                        top: 16,
                        right: 12,
                        child: Container(
                          width: 30,
                          height: 30,
                          decoration:
                              BoxDecoration(
                            color: Colors.black
                                .withOpacity(0.45),
                            shape: BoxShape.circle,
                          ),
                          child: CommonPopupMenu(
                            iconcolor:
                                Colors.white,
                            onSelected:
                                (value) {
                              if (value ==
                                  "More Info") {
                                    print("ID is ${episodeId}");
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) =>
                                        EpisodeInformation(
                                      episodeid:
                                          episodeId,
                                      menuID:
                                          widget.menuID,
                                      title:
                                          widget.title ??
                                              "",
                                      shareLink:
                                          widget.shareLink,
                                    ),
                                  ),
                                );
                              }else{
                                print("SHARE ${item['thumbnail'] ?? ""}");
                                ShareBottomSheet.show(context, shareLink:
                                "${item['thumbnail']}"
                                //  "https://sanity.merck-foundation.com${widget.shareLink!}"
                                 );
                              }
                            },
                          ),
                        ),
                      ),
              
                    // =========================
                    // PLAY ICON
                    // =========================
              
                    if (isYoutube)
                      Container(
                        decoration:
                            const BoxDecoration(
                          color: Colors.black54,
                          shape: BoxShape.circle,
                        ),
                        padding:
                            const EdgeInsets.all(
                                10),
                        child: const Icon(
                          Icons.play_arrow,
                          color: Colors.white,
                        ),
                      ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 8),

            // =========================
            // TITLE
            // =========================

            widget.type ==
                    HomeLayoutType.PhotoCategory
                ? Center(
                    child: Text(
                      stripHtml(
                        item['title'] ?? "",
                      ),
                      style: TextStyle(
                        color: Customcolor
                            .textsubtitlecolor,
                        fontWeight:
                            FontWeight.w700,
                            fontSize: ResponsiveFlutter.of(context).fontSize(3),
                            //AppSizes.heading(context),
                        fontFamily:
                            "Verdana",
                      ),
                      maxLines: 2,
                      overflow:
                          TextOverflow.ellipsis,
                      textAlign:
                          TextAlign.center,
                    ),
                  )
                : Text(
                    stripHtml(
                      item['title'] ?? "",
                    ),
                    style: TextStyle(
                      color: Customcolor
                          .textsubtitlecolor,
                      fontWeight:
                          FontWeight.w700,
                      fontFamily: "Verdana",
                    ),
                    maxLines: 2,
                    overflow:
                        TextOverflow.ellipsis,
                  ),
SizedBox(
  height: widget.contentbutton == true ? 10 : 0,
),

widget.contentbutton == true
    ? Center(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 5),
          child: CommonBorderButton(
            title: "WATCH MORE VIDEOS",
            onTap: () {
              Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (_) =>
                                                    MediaListingScreen(
                                                      type: MediaType.all,
                                                      categoryID: substackIds
                                                          
                                                          .join(','),
                                                      albumID: "",
                                                      albumName: "",
                                                      menuID:widget.menuID,
                                                      title: item['title'],
                                                      shareLink: "",
                                                    ),
                                              ),
                                            );
            },
          ),
        ),
      )
    : Container(),
            // =========================
            // DESCRIPTION
            // =========================

            if (widget.showDescription)
              Padding(
                padding:
                    const EdgeInsets.only(
                  top: 4,
                ),
                child: Text(
                  stripHtml(
                    item['subtitle'] ?? "",
                  ),
                  maxLines: 2,
                  overflow:
                      TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 14,
                    color:
                        Customcolor.colorPink,
                    fontWeight:
                        FontWeight.w600,
                    fontFamily: "Verdana",
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

// ============================================================
// IMAGE WIDGET
// ============================================================

class AutoAspectCachedImage
    extends StatelessWidget {
  final String imageUrl;
  final double height;
  final double maxWidth;
  final BorderRadius borderRadius;
  final Widget? placeholder;
  final Widget? errorWidget;

  const AutoAspectCachedImage({
    super.key,
    required this.imageUrl,
    required this.height,
    required this.maxWidth,
    this.borderRadius =
        const BorderRadius.all(
      Radius.circular(9),
    ),
    this.placeholder,
    this.errorWidget,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: maxWidth,
      height: height,
      child: ClipRRect(
        borderRadius: borderRadius,
        clipBehavior: Clip.hardEdge,
        child: CachedNetworkImage(
          imageUrl: imageUrl,
          width: maxWidth,
          height: height,

          // Full card width
          // Image can crop
          fit: BoxFit.cover,

          // Keep top portion visible
          alignment: Alignment.topCenter,

          placeholder: (
            context,
            url,
          ) =>
              placeholder ??
              const ImageShimmer(),

          errorWidget: (
            context,
            url,
            error,
          ) =>
              errorWidget ??
              const Center(
                child: Icon(
                  Icons.error,
                ),
              ),
        ),
      ),
    );
  }
}List<String> getSubstackIds(dynamic value) {
  if (value == null) {
    return [];
  }

  if (value is List) {
    return value
        .map((e) => e.toString().trim())
        .where((e) => e.isNotEmpty)
        .toList();
  }

  if (value is String) {
    return value
        .split(',')
        .map((e) => e.trim())
        .where((e) => e.isNotEmpty)
        .toList();
  }

  return [value.toString().trim()];
}