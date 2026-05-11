import 'package:flutter/material.dart';
import 'package:merckfoundation_252026/Utility/ResponsiveFlutter.dart';
import 'package:merckfoundation_252026/Utils/common_images.dart';
import 'package:merckfoundation_252026/Utils/customcolor.dart';
import 'package:merckfoundation_252026/screens/MainUIBody.dart/DetailScreen.dart';

import 'package:merckfoundation_252026/widgets/SmartHtmlWidget.dart';

class LeaderCard extends StatelessWidget {
  final List content;

  const LeaderCard({super.key, required this.content});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: content.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (_, index) {
        return leaderContent(content[index], context);
      },
    );
  }

  Widget leaderContent(dynamic content, BuildContext context) {
    final responsive = ResponsiveFlutter.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            content['subtitle'],
            style: TextStyle(
              color: Customcolor.pink_col,
              fontSize: responsive.fontSize(3),
              fontWeight: FontWeight.w800,
            ),
          ),
          16.0.heightBox,
          AspectRatio(
            aspectRatio: 4 / 4,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                content['thumbnail'],
                fit: BoxFit.contain,
                loadingBuilder: (c, w, l) => l == null
                    ? w
                    : const Center(child: CircularProgressIndicator()),
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: Colors.grey.shade300,
                    alignment: Alignment.center,
                    child: Image.asset(
                      CommonImagePath.placeHolder,
                      width: double.infinity,
                      height: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  );
                },
              ),
            ),
          ),
          8.0.heightBox,

          SmartHtmlWidget(
            html: content['title'] ?? "",
            textColor: Customcolor.colorVoilet,
            fontSize: responsive.fontSize(3),
            fontWeight: FontWeight.w800,
          ),

          8.0.heightBox,

          SmartHtmlWidget(html: content['subdescription'] ?? ""),
          8.0.heightBox,
          content['description'] == ""
              ? Container()
              : GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => DetailScreen(
                          content['subdescription'],
                          content['description'],
                          title: content['title'],
                          image: content['thumbnail'],
                        ),
                      ),
                    );
                  },
                  child: Text(
                    "((View Bio))",
                    style: TextStyle(
                      color: Customcolor.pink_col,
                      fontSize: responsive.fontSize(3),
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
          8.0.heightBox,
        ],
      ),
    );
  }
}
