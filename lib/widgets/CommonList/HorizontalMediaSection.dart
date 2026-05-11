import 'package:flutter/material.dart';
import 'package:merckfoundation_252026/Utility/showdailog.dart';
import 'package:merckfoundation_252026/Utils/common_strings.dart';
import 'package:merckfoundation_252026/Utils/customcolor.dart';
import 'package:merckfoundation_252026/enum/commonEnum.dart';
import 'package:merckfoundation_252026/screens/DetailsScreen/TestimonialArticlesScreen.dart';
import 'package:merckfoundation_252026/screens/EpisodeScreen/EpisodeInformation.dart';
import 'package:merckfoundation_252026/screens/EpisodeScreen/EpisodeListingScreen.dart';
import 'package:merckfoundation_252026/screens/MediaAndStoriesScreen/MediaListingScreen.dart';
import 'package:merckfoundation_252026/widgets/CommonBorderButton.dart';
import 'package:merckfoundation_252026/widgets/CommonFunctions.dart';
import 'package:merckfoundation_252026/widgets/CommonPopupMenu.dart';

class HorizontalMediaSection extends StatelessWidget {
  final List content;
  final String? seasonID;

  final String? title;
  final HomeLayoutType? type;
  final bool showDescription;

  /// ✅ SHOW 3 DOT MENU CONDITIONALLY
  final bool showMenu;

  /// ✅ MENU CLICK
  final VoidCallback? onMenuTap;
  final String buttonText;

  const HorizontalMediaSection({
    super.key,
    required this.content,
    this.title,
    this.showDescription = false,
    this.showMenu = false,
    this.onMenuTap,
    this.type,
    this.seasonID, required this.buttonText,
  });

  @override
  Widget build(BuildContext context) {
    if (content.isEmpty) return const SizedBox();

    final screenWidth = MediaQuery.of(context).size.width;

    /// ✅ FULL WIDTH IF ONLY 1 ITEM
    final itemWidth = content.length == 1
        ? screenWidth - 32
        : screenWidth * 0.85;

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
                  child: Text(
                    title!,
                    style: TextStyle(
                      fontSize: screenWidth * 0.055,
                      fontWeight: FontWeight.w800,
                      color: Customcolor.text_blue,
                    ),
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

onTap: ()
{
  if (isYoutube) {
  ShowDialogs.launchURL(item['thumbnail']);
  }
},                  child: Container(
                    width: itemWidth,
                    margin: EdgeInsets.only(right: content.length == 1 ? 0 : 12),
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
                  
                                    return Container(color: Colors.grey.shade200);
                                  },
                                  errorBuilder: (_, __, ___) {
                                    return Container(color: Colors.grey.shade200);
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
          Center(
            child: CommonBorderButton(
              title:buttonText,
              onTap: () {
                if (type == HomeLayoutType.testimonials) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const TestimonialArticlesScreen(),
                    ),
                  );
                } else if (type == HomeLayoutType.episodes) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const EpisodeListingScreen(),
                    ),
                  );
                } else if (type == HomeLayoutType.episodesviewall) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => MediaListingScreen(
                        type: MediaType.episodes,
                        categoryID: seasonID ?? "",
                        albumID: "",
                        albumName: title ?? "",
                      ),
                    ),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
