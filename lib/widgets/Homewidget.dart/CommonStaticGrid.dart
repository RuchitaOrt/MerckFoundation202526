import 'package:flutter/material.dart';
import 'package:merckfoundation_252026/Utility/ResponsiveFlutter.dart';
import 'package:merckfoundation_252026/data/model/CommonModel.dart';


class CommonStaticGrid extends StatelessWidget {
  final List<StaticListItem> items;
  final int crossAxisCount;
  final double aspectRatio;
  final EdgeInsetsGeometry padding;
  final double spacing;

  const CommonStaticGrid({
    super.key,
    required this.items,
    this.crossAxisCount = 2,
    this.aspectRatio = 0.97,
    this.padding = const EdgeInsets.all(8),
    this.spacing = 8,
  });

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveFlutter.of(context);

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: padding,
      itemCount: items.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        childAspectRatio: aspectRatio,
        crossAxisSpacing: spacing,
        mainAxisSpacing: spacing,
      ),
      itemBuilder: (context, index) {
        final item = items[index];
        return _GridItem(
          item: item,
          imageHeight: responsive.height(22),
        );
      },
    );
  }
}
class _GridItem extends StatelessWidget {
  final StaticListItem item;
  final double imageHeight;

  const _GridItem({
    required this.item,
    required this.imageHeight,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: item.onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              item.image,
              height: imageHeight,
              fit: BoxFit.contain,
            ),
            
          ],
        ),
      ),
    );
  }
}
