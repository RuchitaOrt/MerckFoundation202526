import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:merckfoundation_252026/CommonUtils/common_images.dart';
import 'package:merckfoundation_252026/widgets/CommonWidget/CommonFunctions.dart';
import 'package:merckfoundation_252026/widgets/CommonWidget/CommonLoader.dart';
import 'package:merckfoundation_252026/widgets/CommonWidget/ImageShimmer.dart';

class CommonListCard extends StatelessWidget {
  final String imageUrl;
  final String htmlTitle;
  final VoidCallback onTap;

  const CommonListCard({
    super.key,
    required this.imageUrl,
    required this.htmlTitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final bool isNetwork = imageUrl.startsWith("http");

    return InkWell(
      borderRadius: BorderRadius.circular(14),
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.04),
              blurRadius: 6,
              offset: const Offset(0, 2),
            ),
          ],
        ),

        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// IMAGE
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child:
                  isNetwork
                      ?
                  CachedNetworkImage(
                    imageUrl: imageUrl,
                    // memCacheHeight: 1000,
                    width: 80,
                    height: 80,
                    fit: BoxFit.cover,
                    placeholder: (context, url) => ImageShimmer(),
                    errorWidget: (context, url, error) => Container(
                      width: 80,
                      height: 80,
                      color: Colors.grey.shade200,
                      child: const Icon(Icons.image),
                    ),
                  )
              // Image.network(
              //     imageUrl,
              //     width: 80,
              //     height: 80,
              //     fit: BoxFit.cover,

              //     errorBuilder: (_, __, ___) {
              //       return Container(
              //         width: 80,
              //         height: 80,
              //         color: Colors.grey.shade200,
              //         child: const Icon(Icons.image),
              //       );
              //     },
              //   )
              :
               Image.asset(
                  imageUrl,
                  width: 80,
                  height: 80,
                  fit: BoxFit.cover,
                    errorBuilder: (_, __, ___) {
                    return Container(
                      width: 80,
                      height: 80,
                      color: Colors.grey.shade200,
                      child:  Image.asset(CommonImagePath.placeHolder),
                    );
                  },
                ),
            ),

            const SizedBox(width: 12),

            /// TITLE
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 2),
                child: Text(
                  stripHtml(htmlTitle),
                  // htmlTitle,
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    height: 1.35,
                    color: Color(0xff222222),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
