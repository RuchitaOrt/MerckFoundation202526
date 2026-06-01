import 'package:flutter/material.dart';
import 'package:merckfoundation_252026/Utility/ResponsiveFlutter.dart';

import 'package:merckfoundation_252026/widgets/CommonWidget/CommonActionButton.dart';
import 'package:merckfoundation_252026/widgets/CommonWidget/CommonRichText.dart';

class CommonListSection<T> extends StatelessWidget {
  final String title;
  final String subtitle;
  final List<T> items;
  final Widget Function(BuildContext context, T item) itemBuilder;
  final VoidCallback? onWatchMore;
  final String buttonText;
  final bool htmlContent;

  const CommonListSection({
    super.key,
    required this.title,
    required this.subtitle,
    required this.items,
    required this.itemBuilder,
    this.htmlContent=false,
    this.onWatchMore,required this.buttonText,
  });

  @override
  Widget build(BuildContext context) {
    final r = ResponsiveFlutter.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        8.0.heightBox,
        CommonRichText(title: title, subtitle: subtitle),
       
        SizedBox(
          height:htmlContent? r.isTablet ? 310 : 340: r.isTablet ? 260 : 280,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: items.length,
            separatorBuilder: (_, __) => 3.0.widthBox,
            itemBuilder: (context, index) {
              final item = items[index];
              return SizedBox(
                
                child: itemBuilder(context, item));
            },
          ),
        ),

        if (onWatchMore != null)
          CommonActionButton(text: buttonText, onTap: onWatchMore!),
      ],
    );
  }
}
