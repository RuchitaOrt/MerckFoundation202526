import 'package:flutter/material.dart';
import 'package:merckfoundation_252026/CommonUtils/common_images.dart';
import 'package:merckfoundation_252026/Utility/showdailog.dart';
import 'package:merckfoundation_252026/model/TestimonialModel.dart';
import 'package:merckfoundation_252026/routes/AppNavigation.dart';
import 'package:merckfoundation_252026/CommonUtils/customcolor.dart';
import 'package:merckfoundation_252026/enum/commonEnum.dart';
import 'package:merckfoundation_252026/screens/DetailsScreen/DetailScreen.dart';
import 'package:merckfoundation_252026/screens/DetailsScreen/TestimonialArticlesScreen.dart';
import 'package:merckfoundation_252026/screens/MainScreens/EpisodeScreen/EpisodeInformation.dart';
import 'package:merckfoundation_252026/widgets/CommonWidget/CommonBorderButton.dart';
import 'package:merckfoundation_252026/widgets/CommonWidget/CommonFunctions.dart';
import 'package:merckfoundation_252026/widgets/CommonWidget/CommonPopupMenu.dart';
import 'package:merckfoundation_252026/widgets/ImagePreviewScreen.dart';
import 'package:merckfoundation_252026/widgets/SmartHtmlWidget.dart';
import 'package:merckfoundation_252026/screens/MediaAndStoriesScreen/PhotoAlumbScreen.dart';

class HorizontalMediaSection extends StatelessWidget {
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
  Widget build(BuildContext context) {
    if (content.isEmpty) return const SizedBox();

    final screenWidth = MediaQuery.of(context).size.width;

    /// ✅ FULL WIDTH IF ONLY 1 ITEM
    final itemWidth = content.length == 1
        ? screenWidth - 32
        : screenWidth * 0.85;
    print(title);
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// 🔹 TITLE ROW
          if ((title ?? "").isNotEmpty)
            Row(
              children: [
                Expanded(
                  child: SmartHtmlWidget(
                    html: title!,
                    textColor: Customcolor.textBlueColor,
                    fontSize: screenWidth * 0.055,
                    fontWeight: FontWeight.w800,
                    ignoreHtmlStyles: true,
                  ),
                ),

                /// ✅ CONDITIONAL 3 DOT
              ],
            ),

          const SizedBox(height: 12),

          /// 🔹 HORIZONTAL LIST
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(content.length, (index) {
                final item = content[index];
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
                    
                    if (isYoutube) {
                      ShowDialogs.launchURL(item['thumbnail']);
                    } else if (type == HomeLayoutType.newsLettersAndArticles) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => DetailScreen(
                            "",
                            "",
                            title: title,
                            articleId: item['id'].toString(),
                            languageId: item['subtitle'].toString(),
                            isDetailApiCalled: true,
                            shareLink: shareLink,
                            menuID: menuID,
                          ),
                        ),
                      );
                    } else if (type == HomeLayoutType.merckFoundationInMedia) {
                      ShowDialogs.launchURL(item['page_url']);
                    } else if (type == HomeLayoutType.testimonials) {
                      final item = content[index];

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
                            title: title ?? "",
                            shareLink: shareLink ?? "",
                            initialList: [
                              clickedTestimonial,
                            ], // 👈 only one item
                            useLocalPagination: true,
                          ),
                        ),
                      );
                    } else if (type == HomeLayoutType.PhotoCategory) {
                      final item = content[index];
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => PhotoAlumbScreen(
                            pageTile: title ?? "",
                            tile: item['photo_category_name'] ?? "",
                            categoryID: item['id'].toString(),
                            menuID: menuID,
                            shareLink: shareLink,
                          ),
                        ),
                      );
                    } else if (type == HomeLayoutType.photoGallery) {
                      final item = content[index];
                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        backgroundColor: Colors.black,
                        builder: (_) => ImagePreviewDialog(
                          imageUrl: item['thumbnail'] ?? "",
                          title: item['title'] ?? "",
                        ),
                      );
                    }
                  },
                  child: Container(
                    width: itemWidth,
                    margin: EdgeInsets.only(
                      right: content.length == 1 ? 0 : 12,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        /// 🔹 IMAGE
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            AspectRatio(
                              aspectRatio: 16 / 9,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image.network(
                                  imageUrl,
                                  fit: BoxFit.cover,
                                  width: double.infinity,
                                  loadingBuilder: (context, child, progress) {
                                    if (progress == null) return child;

                                    return Container(
                                      color: Colors.grey.shade200,
                                    );
                                  },
                                  errorBuilder: (_, __, ___) {
                                    return Container(
                                      color: Colors.grey.shade200,
                                      child: Image.asset(
                                        CommonImagePath.placeHolder,
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                            if (showMenu)
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
                                              menuID: menuID,
                                              title: title ?? "",
                                              shareLink: shareLink,
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

                        Text(
                          stripHtml(item['title'] ?? ""),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),

                        /// 🔹 DESCRIPTION
                        if (showDescription)
                          Padding(
                            padding: const EdgeInsets.only(top: 4),
                            child: Text(
                              stripHtml(item['description'] ?? ""),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(fontSize: 12),
                            ),
                          ),
                      ],
                    ),
                  ),
                );
              }),
            ),
          ),

          const SizedBox(height: 10),

          /// 🔹 BUTTON
          buttonText == ""
              ? SizedBox()
              : Center(
                  child: CommonBorderButton(
                    title: buttonText,
                    onTap: () {
                      AppNavigation.navigateByMenuId(
                        context,
                        menuId: menuID,
                        albumId: "",

                        albumName: "",
                        categoryId: type == HomeLayoutType.episodesviewall
                            ? seasonID ?? ""
                            : "",
                        title: title ?? "",
                        shareLink: shareLink,
                        seasonId: seasonID ?? "",
                        type: type,
                      );
                    },
                  ),
                ),
        ],
      ),
    );
  }
}
