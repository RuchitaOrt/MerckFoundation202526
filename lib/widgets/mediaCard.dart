import 'package:flutter/material.dart';
import 'package:merckfoundation_252026/Utility/ResponsiveFlutter.dart';
import 'package:merckfoundation_252026/data/model/CommonModel.dart';
import 'package:merckfoundation_252026/widgets/PauseImage.dart';

class MediaCard extends StatelessWidget {
  final MediaCardData data;
  final Color? fontColor;
  

  const MediaCard({super.key, required this.data, this.fontColor=Colors.black87,});

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveFlutter.of(context);

    return Card(
      elevation: 2,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
      child: InkWell(
        onTap: data.onTap,
        child: Column(
          children: [
            /// IMAGE (75%)
            Expanded(
              flex: 2,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Image.network(
                    data.image,
                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  if (data.showPlayIcon) const PauseImage(),
                ],
              ),
            ),

            /// TEXT (25%)
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(6),
                child: Center(
                  child: Text(
                    data.title,
                    maxLines: 3,
                  
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: responsive.fontSize(1.6),
                      color: fontColor,
                      fontWeight: FontWeight.w500,
                    ),
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
