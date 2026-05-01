import 'package:flutter/material.dart';
import 'package:merckfoundation_252026/Utility/ResponsiveFlutter.dart';
import 'package:merckfoundation_252026/data/model/CommonModel.dart';
class CommonStaticGrid extends StatelessWidget {
  final List<StaticListItem> items;
  final EdgeInsetsGeometry padding;
  final double spacing;

  const CommonStaticGrid({
    super.key,
    required this.items,
    this.padding = const EdgeInsets.all(8),
    this.spacing = 8,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: padding,
      itemCount: items.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // ✅ ALWAYS 2
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        childAspectRatio: 1, // stable
      ),
      itemBuilder: (context, index) {
        return _GridItem(item: items[index]);
      },
    );
  }
}
class _GridItem extends StatelessWidget {
  final StaticListItem item;

  const _GridItem({required this.item});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: item.onTap,
      child: Container(
        padding: const EdgeInsets.all(2),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
          Expanded(
  child: item.isNetwork
      ? Image.network(
          item.image,
          fit: BoxFit.contain,
        )
      : Image.asset(
          item.image,
          fit: BoxFit.contain,
        ),
),
          ],
        ),
      ),
    );
  }
}
