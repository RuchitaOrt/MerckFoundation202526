import 'package:flutter/material.dart';
import 'package:merckfoundation_252026/Utility/ResponsiveFlutter.dart';
import 'package:merckfoundation_252026/CommonUtils/customcolor.dart';
import 'package:merckfoundation_252026/model/CommonModel.dart';
import 'package:merckfoundation_252026/widgets/CommonWidget/CommonRichText.dart';


class CovidDescriptionList extends StatelessWidget {
  final List<Description> list;
   CovidDescriptionList({super.key, required this.list});

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveFlutter.of(context);


    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: list.map((text) {
        return Padding(
          padding: const EdgeInsets.only(top: 12),
          child:   CommonRichText(
              title:text.title!,
              subtitle:text.detail!,
            titleColor: Customcolor.violetcolor,
            subTitleColor: Customcolor.textsubtitlecolor,
            titleSize:responsive.fontSize(2.2),
            SubtitleSize: responsive.fontSize(2),
            titlefontWeight: FontWeight.w700,
         subTitlefontWeight:FontWeight.w500,
            ),
        );
      }).toList(),
    );
  }
}
