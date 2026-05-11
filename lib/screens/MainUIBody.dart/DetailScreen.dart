import 'package:flutter/material.dart';
import 'package:merckfoundation_252026/Utility/ResponsiveFlutter.dart';
import 'package:merckfoundation_252026/Utility/customappbar.dart';
import 'package:merckfoundation_252026/Utils/common_images.dart';
import 'package:merckfoundation_252026/Utils/customcolor.dart';
import 'package:merckfoundation_252026/enum/commonEnum.dart';
import 'package:merckfoundation_252026/widgets/FooterFlowerImage.dart';

import 'package:merckfoundation_252026/widgets/SmartHtmlWidget.dart';
import 'package:merckfoundation_252026/widgets/botttomlink.dart';

class DetailScreen extends StatefulWidget {
  final String? title;
  final String? titleContent;
  final String? descriptionContent;
  final String? image;

  const DetailScreen(
    this.titleContent,
    this.descriptionContent, {
    super.key,
    this.title,
    this.image="",
  });

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveFlutter.of(context);

    return Scaffold(
      backgroundColor: Customcolor.background,
      appBar: CommonAppBar(
        type: AppBarType.inner,
        title: widget.title,
        onSearch: () {},
        onShare: () {},
        shareLink: "",
      ),
      body: ListView(
        shrinkWrap: true,
        physics: ScrollPhysics(),
        children: [
          Padding(
           padding: const EdgeInsets.only(left: 12, right: 12, top: 8),
            child: Column(
              children: [
                widget.image == ""
                    ? Container()
                    : AspectRatio(
                        aspectRatio: 4 / 4,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.network(
                            widget.image!,
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
                       16.0.heightBox,
          SmartHtmlWidget(
            html: widget.titleContent!,
            textColor: Customcolor.colorVoilet,
            fontSize: responsive.fontSize(3),
            fontWeight: FontWeight.w600,
          ),
        16.0.heightBox,
          SmartHtmlWidget(html: widget.descriptionContent!),
              ],
            ),
          ),
         
          FooterFlowerImage(),
          Bottomcardlink()
        ],
      ),
    );
  }
}
