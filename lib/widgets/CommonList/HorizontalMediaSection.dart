import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:merckfoundation_252026/CommonUtils/common_images.dart';
import 'package:merckfoundation_252026/Provider/PageProvider.dart';
import 'package:merckfoundation_252026/Utility/AppSizes.dart';
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
import 'package:merckfoundation_252026/widgets/PauseImage.dart';
import 'package:merckfoundation_252026/widgets/SmartHtmlWidget.dart';
import 'package:merckfoundation_252026/screens/MediaAndStoriesScreen/PhotoAlumbScreen.dart';
import 'package:provider/provider.dart';

class HorizontalMediaSection extends StatefulWidget {
  final List content;
  final String? seasonID;

  final String? title;
  final HomeLayoutType? type;
  final bool showDescription;
  final String menuID;

  final String? shareLink;

  /// ✅ SHOW 3 DOT MENU CONDITIONALLY
  final bool showMenu;

  /// ✅ MENU CLICK
  final VoidCallback? onMenuTap;
  final String buttonText;
  final String buttonLink;
 

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
   
  });

  @override
  State<HorizontalMediaSection> createState() => _HorizontalMediaSectionState();
}

class _HorizontalMediaSectionState extends State<HorizontalMediaSection> {
Future<void> _onViewAllPressed() async {
  print("WIDGET TYPW ${widget.type}");
 if(widget.type == HomeLayoutType.season){

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
 }else{
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
          title: root['menu_title']?.toString() ?? "",
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
else
{

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
}
 }
}
  @override
  Widget build(BuildContext context) {
    if (widget.content.isEmpty) return const SizedBox();

    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    /// ✅ FULL WIDTH IF ONLY 1 ITEM
    final itemWidth = widget.content.length == 1
        ? screenWidth - 32
        : screenWidth * 0.85;
    final itemHeight = widget.type == HomeLayoutType.testimonials
        ? screenHeight * 0.39
        : screenHeight * 0.35;
    final imageHeight = screenHeight * 0.28;
    // : screenWidth * 0.85;
   
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          /// 🔹 TITLE ROW
          if ((widget.title ?? "").isNotEmpty)
            Row(
              children: [
                Expanded(
                  child: SmartHtmlWidget(
                    html: widget.title!,
                     textColor: Customcolor.violetcolor,
                    // textColor: Customcolor.textBlueColor,
                    fontSize: AppSizes.heading(context),
                    ignorefontStyles: true,
                    // fontWeight: FontWeight.w800,
                    // ignoreHtmlStyles: true,
                  ),
                ),

                /// ✅ CONDITIONAL 3 DOT
              ],
            ),

          const SizedBox(height: 12),
          SizedBox(
            height: itemHeight,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: widget.content.length,
              cacheExtent: 1000,

              itemBuilder: (context, index) {
                final item = widget.content[index];

                final episodeId =
                    item['id']?.toString() ??
                    item['season_id']?.toString() ??
                    "";
                final thumb = item['thumbnail'] ?? "";

                final isYoutube =
                    thumb.contains("youtube.com") || thumb.contains("youtu.be");

                String imageUrl = thumb;

                if (isYoutube) {
                  final videoId = getYoutubeId(thumb);

                  imageUrl =
                      "https://img.youtube.com/vi/$videoId/hqdefault.jpg";
                }

                return GestureDetector(
                  onTap: () {
                    // your existing tap logic
                    if (isYoutube) {
                      ShowDialogs.launchURL(item['thumbnail']);
                    } else if (widget.type == HomeLayoutType.newsLettersAndArticles) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => DetailScreen(
                            "",
                            "",
                            title: widget.title,
                            articleId: item['id'].toString(),
                            languageId: item['subtitle'].toString(),
                            isDetailApiCalled: true,
                            shareLink: widget.shareLink,
                            menuID: widget.menuID,
                          ),
                        ),
                      );
                    } else if (widget.type == HomeLayoutType.merckFoundationInMedia) {
                      ShowDialogs.launchURL(item['page_url']);
                    } else if (widget.type == HomeLayoutType.testimonials) {
                      final item = widget.content[index];

                      final clickedTestimonial = TestimonialModel(
                        image: item['thumbnail'] ?? "",
                        title: item['title'] ?? "",
                        departmentName: "",
                        shortDescription: item['description'] ?? "",
                        details: item['description'] ?? "",
                      );

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => TestimonialArticlesScreen(
                            title: widget.title ?? "",
                            shareLink: widget.shareLink ?? "",
                            initialList: [
                              clickedTestimonial,
                            ], // 👈 only one item
                            useLocalPagination: true,
                          ),
                        ),
                      );
                    } else if (widget.type == HomeLayoutType.PhotoCategory) {
                      final item = widget.content[index];
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => PhotoAlumbScreen(
                            homeLayoutType: HomeLayoutType.PhotoCategory,
                            pageTile: widget.title ?? "",
                            tile: item['photo_category_name'] ?? "",
                            categoryID: item['id'].toString(),
                            menuID: widget.menuID,
                            shareLink: widget.shareLink,
                          ),
                        ),
                      );
                    } else if (widget.type == HomeLayoutType.photoGallery) {
                      final item = widget.content[index];
//                       showModalBottomSheet(
//                         context: context,
//                         isScrollControlled: true,
//                        backgroundColor: Colors.transparent,
// barrierColor: Colors.transparent,
//                         builder: (_) => ImagePreviewDialog(
//                           imageUrl: item['thumbnail'] ?? "",
//                           title: item['title'] ?? "",
//                         ),
//                       );
showGeneralDialog(
  context: context,
  barrierDismissible: true,
  barrierLabel: 'Image Preview',
  barrierColor: Colors.transparent,
  transitionDuration: const Duration(milliseconds: 200),
  pageBuilder: (context, animation, secondaryAnimation) {
    return ImagePreviewDialog(
      imageUrl:  item['thumbnail'] ?? "",
      title:  item['title'] ?? "",
    );
  },
);
                    }
                  },
                  child: Container(
                    width: itemWidth,
                    height: itemHeight,
                    margin: EdgeInsets.only(
                      right: widget.content.length == 1 ? 0 : 12,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Stack(
                          alignment: Alignment.center,
                          children: [
                           Container(
  width: double.infinity,
  height: imageHeight,
  color: Colors.white,
  child: Center(
    child: AutoAspectCachedImage(
      imageUrl: imageUrl,
      height: imageHeight,
      maxWidth: itemWidth,
      // zoomForNarrowImage: 1.0,
      placeholder: const ImageShimmer(),
      errorWidget: const Icon(Icons.error),
    ),
  ),
),
//                             SizedBox(
//   width: double.infinity,
//   height: imageHeight,
//   child: ClipRRect(
//     borderRadius: BorderRadius.circular(8),
//     child: Stack(
//       alignment: Alignment.center,
//       children: [

//         // Background fills entire area
//         CachedNetworkImage(
//           imageUrl: imageUrl,
//           width: double.infinity,
//           height: double.infinity,
//           fit: BoxFit.contain,
//           color: Colors.black.withOpacity(0.15),
//           colorBlendMode: BlendMode.darken,
//         ),

//         // Actual image - NEVER cropped or stretched
//         // CachedNetworkImage(
//         //   imageUrl: imageUrl,
//         //   width: double.infinity,
//         //   height: double.infinity,
//         //   fit: BoxFit.contain,
//         //   alignment: Alignment.center,
//         //   placeholder: (context, url) =>
//         //       const ImageShimmer(),
//         //   errorWidget: (context, url, error) =>
//         //       const Center(
//         //         child: Icon(Icons.error),
//         //       ),
//         // ),
//       ],
//     ),
//   ),
// ),
//                            SizedBox(
//   width: double.infinity,
//   height: imageHeight,
//   child: ClipRRect(
//     borderRadius: BorderRadius.circular(8),
//     child: CachedNetworkImage(
//       imageUrl: imageUrl,
//       width: double.infinity,
//       height: imageHeight,

//       // Complete image visible, no stretching
//       fit: BoxFit.contain,

//       alignment: Alignment.center,

//       placeholder: (context, url) =>
//           const ImageShimmer(),

//       errorWidget: (context, url, error) =>
//           const Center(
//             child: Icon(Icons.error),
//           ),
//     ),
//   ),
// ),
  //                           ClipRRect(
  // borderRadius: BorderRadius.circular(8),
  // clipBehavior: Clip.antiAlias,
  //     child: CachedNetworkImage(
  //       imageUrl: imageUrl,
  //        height: imageHeight,
  //       //  width: double.infinity,
  //       fit: BoxFit.contain,
  //       alignment: Alignment.center,
  //       placeholder: (context, url) => const ImageShimmer(),
  //       errorWidget: (context, url, error) =>
  //           const Icon(Icons.error),
  //     ),
  //   ),
//                             ClipRRect(
//   borderRadius: BorderRadius.circular(8),
//   clipBehavior: Clip.antiAlias,
//   child: Container(
//     width: double.infinity,
//     height: imageHeight,
//      color: Colors.black,
//     child:  ClipRRect(
//   borderRadius: BorderRadius.circular(8),
//   clipBehavior: Clip.antiAlias,
//       child: CachedNetworkImage(
//         imageUrl: imageUrl,
//         fit: BoxFit.contain,
//         alignment: Alignment.center,
//         placeholder: (context, url) => const ImageShimmer(),
//         errorWidget: (context, url, error) =>
//             const Icon(Icons.error),
//       ),
//     ),
//   ),
// ),
                            // Container(
                            //   height: imageHeight,
                            //   width: double.infinity,
                            //   child: ClipRRect(
                            //     borderRadius: BorderRadius.circular(20),
                            //     child: CachedNetworkImage(
                                 
                            //       placeholder: (context, url) =>
                            //           const ImageShimmer(),
                            //       imageUrl: imageUrl,
                            //         height: imageHeight,
                            //       width: double.infinity,
                            //       fit: BoxFit.cover,
                                   
                            //     ),
                            //  ),
                            // ),
                            if (widget.showMenu)
                              Positioned(
                                top: 16,
                                right: 12,
                                child: Container(
                                  width: 30,
                                  height: 30,
                                  decoration: BoxDecoration(
                                    color: Colors.black.withOpacity(0.45),
                                    shape: BoxShape.circle,
                                  ),
                                  child: CommonPopupMenu(
                                    iconcolor: Colors.white,
                                    onSelected: (value) {
                                      if (value == "More Info") {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (_) => EpisodeInformation(
                                              episodeid: episodeId,
                                              menuID: widget.menuID,
                                              title: widget.title ?? "",
                                              shareLink: widget.shareLink,
                                            ),
                                          ),
                                        );
                                      }
                                    },
                                  ),
                                ),
                              ),

                            /// ▶ PLAY ICON
                            if (isYoutube)
                              Container(
                                decoration: const BoxDecoration(
                                  color: Colors.black54,
                                  shape: BoxShape.circle,
                                ),
                                padding: const EdgeInsets.all(10),
                                child: const Icon(
                                  Icons.play_arrow,
                                  color: Colors.white,
                                ),
                              ),
                          ],
                        ),

                        const SizedBox(height: 8),

                    widget.type == HomeLayoutType.PhotoCategory? Center(
                      child: Text(
                            stripHtml(item['title'] ?? ""),
                          style: TextStyle(
                            
                            color: Customcolor.textsubtitlecolor,fontWeight: FontWeight.w700,fontFamily: "Verdana",
                            ),
                      
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                    ):  Text(
                          stripHtml(item['title'] ?? ""),
                        style: TextStyle(color: Customcolor.textsubtitlecolor,fontWeight: FontWeight.w700,fontFamily: "Verdana"),

                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),

                        /// 🔹 DESCRIPTION
                        if (widget.showDescription)
                          Padding(
                            padding: const EdgeInsets.only(top: 4),
                            child:
                                // SmartHtmlWidget(html: item['description'],maxLines: 1,textOverflow: TextOverflow.ellipsis,)
                                Text(
                                  stripHtml(item['subtitle'] ?? ""),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,

                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Customcolor.colorPink,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: "Verdana"
                                    
                                  ),
                                ),
                          ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),

          const SizedBox(height: 10),

          /// 🔹 BUTTON
          widget.buttonText == ""
              ? SizedBox()
              : Center(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 5),
                    child: CommonBorderButton(
                      title: widget.buttonText.toUpperCase(),
                      onTap:  _onViewAllPressed,
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
class AutoAspectCachedImage extends StatelessWidget {
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
        const BorderRadius.all(Radius.circular(9)),
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

          // Fill the complete width.
          // Cropping is allowed.
          fit: BoxFit.cover,

          // ⭐ IMPORTANT
          // Keep the TOP visible.
          // Crop happens mainly from the BOTTOM.
          alignment: Alignment.topCenter,

          placeholder: (context, url) =>
              placeholder ?? const ImageShimmer(),

          errorWidget: (context, url, error) =>
              errorWidget ??
              const Center(
                child: Icon(Icons.error),
              ),
        ),
      ),
    );
  }
}