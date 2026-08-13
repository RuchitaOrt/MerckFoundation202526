import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:merckfoundation_252026/CommonUtils/common_images.dart';
import 'package:merckfoundation_252026/CommonUtils/customcolor.dart';
import 'package:merckfoundation_252026/enum/commonEnum.dart';
import 'package:merckfoundation_252026/screens/MediaAndStoriesScreen/MediaListingScreen.dart';
import 'package:merckfoundation_252026/widgets/CommonWidget/CommonBorderButton.dart';
import 'package:merckfoundation_252026/widgets/CommonWidget/CommonFunctions.dart';
import 'package:merckfoundation_252026/widgets/CommonWidget/CommonLoader.dart';
import 'package:merckfoundation_252026/widgets/CommonWidget/ImageShimmer.dart';
import 'package:merckfoundation_252026/widgets/ImagePreviewScreen.dart';

class HorizontalAlbumWidget<T> extends StatelessWidget {
  final String title;
  final List<T> images;
  final String categoryID;
  final String alubumID;
  final String alubumName;
  final String Function(T item) imageUrl;
   final String menuID;
  
  

  final String? shareLink;

  const HorizontalAlbumWidget({
    super.key,
    required this.title,
    required this.images,
    required this.imageUrl, required this.categoryID, required this.alubumID, required this.alubumName, required this.menuID, this.shareLink,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            stripHtml(title.trim()),
            // ,
            style: TextStyle(
              fontSize: screenWidth * 0.038,
              fontWeight: FontWeight.w800,
              color: Customcolor.textBlueColor,
            ),
          ),

          const SizedBox(height: 14),

          SizedBox(
            height: 190,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: images.length,
              separatorBuilder: (_, __) => const SizedBox(width: 12),
              itemBuilder: (context, index) {
                final item = images[index];

                return GestureDetector(
                  onTap: ()
                  {
                     showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        backgroundColor: Colors.black,
                        builder: (_) => ImagePreviewDialog(
                          imageUrl: imageUrl(item) ?? "",
                          title: title.trim(),
                        ),
                      );
                  },
                  child: Container(
                    width: 280,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 10,
                          color: Colors.black.withOpacity(.08),
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(18),
                      child: CachedNetworkImage(
                        // memCacheWidth: 1000,
                        imageUrl: imageUrl(item),
                        fit: BoxFit.cover,
                       placeholder: (context, url) => const ImageShimmer(),
                        errorWidget: (_, __, ___) => Container(
                          color: Colors.grey.shade200,
                          alignment: Alignment.center,
                          child: Image.asset(
                            CommonImagePath.placeHolder,
                            width: double.infinity,
                            height: double.infinity,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 14),
          Center(
            child: CommonBorderButton(
              title: "View More",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) =>
                        MediaListingScreen(type: MediaType.photoAlbum,categoryID:categoryID ,albumID:alubumID ,albumName:alubumName,
                        menuID: menuID,shareLink: shareLink,title: title,),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
