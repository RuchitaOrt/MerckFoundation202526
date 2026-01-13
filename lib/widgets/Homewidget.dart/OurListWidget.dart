import 'package:flutter/material.dart';
import 'package:merckfoundation_252026/providers/home_provider.dart';
import 'package:merckfoundation_252026/widgets/formLabel.dart';
import 'package:provider/provider.dart';

import '../../Utility/ResponsiveFlutter.dart';

class OurListWidget extends StatelessWidget {
  const OurListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveFlutter.of(context);
    final list = context.read<HomeSliderProvider>().buildList();

    return SizedBox(
      height: responsive.height(12),
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: responsive.width(3)),
        itemCount: list.length,
        separatorBuilder: (_, __) => SizedBox(width: responsive.width(3)),
        itemBuilder: (context, index) {
          final item = list[index];

          return GestureDetector(
            onTap: item.onTap,
            child: Container(
              width: responsive.width(28),
              decoration: BoxDecoration(
                color: item.color,
                borderRadius: BorderRadius.circular(12),
              ),
              padding: EdgeInsets.all(responsive.width(2)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FormLabel(
                    text: item.programname,
                    maxLines: 3,
                    textAlignment: TextAlign.center,
                    textOverflow: TextOverflow.ellipsis,
                    labelColor: Colors.white,
                    fontSize: responsive.fontSize(2),
                    fontweight: FontWeight.w600,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
