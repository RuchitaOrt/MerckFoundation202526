import 'package:flutter/material.dart';
import 'package:merckfoundation_252026/Utility/ResponsiveFlutter.dart';
import 'package:merckfoundation_252026/Utils/common_images.dart';
import 'package:merckfoundation_252026/Utils/customcolor.dart';
import 'package:merckfoundation_252026/data/model/CommonModel.dart';
import 'package:merckfoundation_252026/widgets/formLabel.dart';

class FollowUsSection extends StatelessWidget {
  final String title;
  final bool showFlower;
  final double? iconSize;
  final List<SocialIconModel> icons;
  final double? fontSize;

  const FollowUsSection({
    super.key,
    required this.title,
    required this.icons,
    this.showFlower = true,
    this.iconSize,  this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveFlutter.of(context);
    final double finalIconSize = iconSize ?? responsive.width(6);

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: responsive.width(2),
        vertical: responsive.height(1),
      ),
      child: Row(
        children: [
          _leftSection(context, responsive, finalIconSize),
          if (showFlower) _rightImage(responsive),
        ],
      ),
    );
  }

  Widget _leftSection(
    BuildContext context,
    ResponsiveFlutter responsive,
    double iconSize,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
       title.isNotEmpty? SizedBox(
          width: ResponsiveFlutter.of(context).width(80),
          child: FormLabel(
            text: title,
            softWrap: true,
            maxLines: 2,
            labelColor: Customcolor.text_blue,
            fontSize:fontSize ?? responsive.fontSize(2.8),
            fontweight: FontWeight.w700,
          ),
        ):0.0.widthBox,
      16.0.heightBox,
        Row(
          children: icons.map((e) => _iconWidget(e, iconSize)).toList(),
        ),
      ],
    );
  }

  Widget _iconWidget(SocialIconModel item, double size) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: GestureDetector(
        onTap: item.onTap,
        child: Image.asset(
          item.icon,
          height: size,
          width: size,
        ),
      ),
    );
  }

  Widget _rightImage(ResponsiveFlutter responsive) {
    return Expanded(
      child: Image.asset(
        CommonImagePath.homeToolbar,
        height: responsive.height(12),
        fit: BoxFit.contain,
      ),
    );
  }
}
