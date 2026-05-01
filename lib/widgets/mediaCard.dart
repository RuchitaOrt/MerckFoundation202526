import 'package:flutter/material.dart';
import 'package:merckfoundation_252026/Utility/ResponsiveFlutter.dart';
import 'package:merckfoundation_252026/data/model/CommonModel.dart';
import 'package:merckfoundation_252026/widgets/PauseImage.dart';
import 'package:merckfoundation_252026/widgets/formLabel.dart';
class MediaCard extends StatelessWidget {
  final String image;
  final String title;
  final VoidCallback? onTap;
  final bool showPlayIcon;
  final Color fontColor;

  const MediaCard({
    super.key,
    required this.image,
    required this.title,
    this.onTap,
    this.showPlayIcon = false,
    this.fontColor = Colors.black87,
  });

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveFlutter.of(context);

    return Card(
      elevation: 2,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
      child: InkWell(
        onTap: onTap,
        child: Column(
          children: [
            /// IMAGE
            Expanded(
              flex: 2,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 6,top: 6,right: 6),
                    child: Image.network(
                      image,
                      width: double.infinity,
                      height: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  if (showPlayIcon) const PauseImage(),
                ],
              ),
            ),

            /// TEXT
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.only(top: 4,bottom: 6,left: 8,right: 8),
                child: Center(
                  child: FormLabel(
                    text: title,
                    maxLines: 3,
                    textAlignment: TextAlign.center,
                    fontSize: responsive.fontSize(1.6),
                    labelColor: fontColor,
                    fontweight: FontWeight.w500,
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
