import 'package:flutter/material.dart';
import 'package:merckfoundation_252026/Utility/ResponsiveFlutter.dart';
import 'package:merckfoundation_252026/Utils/customcolor.dart';
import 'package:merckfoundation_252026/data/model/CommonModel.dart';
import 'package:merckfoundation_252026/widgets/CommonRichText.dart';

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
            titleColor: Customcolor.violet_col,
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
