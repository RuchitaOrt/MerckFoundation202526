import 'package:flutter/material.dart';
import 'package:merckfoundation_252026/Utility/ResponsiveFlutter.dart';
import 'package:merckfoundation_252026/Utils/common_images.dart';
import 'package:merckfoundation_252026/widgets/SmartHtmlWidget.dart';

class CommonListCard extends StatelessWidget {
  final String imageUrl;
  final String htmlTitle;
  final VoidCallback? onTap;
  final double imageSize;
  final double cardHeight;
  final bool isAssetImage;

  const CommonListCard({
    super.key,
    required this.imageUrl,
    required this.htmlTitle,
    this.onTap,
    this.imageSize = 80,
    this.cardHeight = 80,
    this.isAssetImage = false, // ✅ default network
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: onTap,
        child: Card(
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              children: [
                _CommonImage(
                  imagePath: imageUrl,
                  size: imageSize,
                  isAssetImage: isAssetImage,
                ),
                8.0.widthBox,
                Expanded(
                  child: SizedBox(
                    height: cardHeight,
                    child: SmartHtmlWidget(html: htmlTitle),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
class _CommonImage extends StatelessWidget {
  final String imagePath;
  final double size;
  final bool isAssetImage;

  const _CommonImage({
    required this.imagePath,
    required this.size,
    required this.isAssetImage,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: SizedBox(
        height: size,
        width: size,
        child: isAssetImage
            ? Image.asset(
                imagePath,
                fit: BoxFit.cover,
              )
            : Image.network(
                imagePath,
                fit: BoxFit.cover,
                loadingBuilder: (_, child, progress) =>
                    progress == null
                        ? child
                        : Image.asset(CommonImagePath.placeHolder),
                errorBuilder: (_, __, ___) =>
                    Image.asset(CommonImagePath.placeHolder),
              ),
      ),
    );
  }
}
