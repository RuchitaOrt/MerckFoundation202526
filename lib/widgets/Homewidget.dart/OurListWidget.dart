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
  height: responsive.height(16),
  child: ListView.separated(
    scrollDirection: Axis.horizontal,
    padding: EdgeInsets.symmetric(horizontal: responsive.width(4)),
    itemCount: list.length,
    separatorBuilder: (_, __) => SizedBox(width: responsive.width(4)),
    itemBuilder: (context, index) {
      final item = list[index];

      return InkWell(
        onTap: item.onTap,
        borderRadius: BorderRadius.circular(18),
        child: Container(
          width: responsive.width(26),
          decoration: BoxDecoration(
           color: item.color,
            borderRadius: BorderRadius.circular(6),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 12,
                offset: Offset(0, 6),
              ),
            ],
          ),
          child: Column(
            children: [
              // Top accent line
              // Container(
              //   height: 4,
              //   decoration: BoxDecoration(
              //     color: item.color,
              //     borderRadius: BorderRadius.vertical(
              //       top: Radius.circular(18),
              //     ),
              //   ),
              // ),
              Spacer(),
              Icon(
                item.icon,
                color: Colors.white,
                size: responsive.width(7),
              ),
              SizedBox(height: responsive.height(1)),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: Text(
                  item.programname,
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  style: TextStyle(
                    fontSize: responsive.fontSize(1.8),
                    fontWeight: FontWeight.w600,
                      color: Colors.white,
                  ),
                ),
              ),
              Spacer(),
            ],
          ),
        ),
      );
    },
  ),
);

// return SizedBox(
//   height: responsive.height(8),
//   child: ListView.separated(
//     scrollDirection: Axis.horizontal,
//     padding: EdgeInsets.symmetric(horizontal: responsive.width(4)),
//     physics: const BouncingScrollPhysics(),
//     itemCount: list.length,
//     separatorBuilder: (_, __) => SizedBox(width: responsive.width(3)),
//     itemBuilder: (context, index) {
//       final item = list[index];

//       return Material(
//         color: Colors.transparent,
//         child: InkWell(
//           onTap: item.onTap,
//           borderRadius: BorderRadius.circular(30),
//           child: Container(
//             padding: EdgeInsets.symmetric(
//               horizontal: responsive.width(4),
//               vertical: responsive.height(1.2),
//             ),
//             decoration: BoxDecoration(
//               color: item.color.withOpacity(0.1),
//               borderRadius: BorderRadius.circular(12),
//               border: Border.all(color: item.color, width: 1.5),
//             ),
//             child: Row(
//               children: [
//                 Icon(item.icon, color: item.color, size: responsive.width(5)),
//                 SizedBox(width: responsive.width(2)),
//                 Text(
//                   item.programname,
//                   style: TextStyle(
//                     fontSize: responsive.fontSize(1.8),
//                     fontWeight: FontWeight.w600,
//                     color: item.color,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       );
//     },
//   ),
// );


    // return SizedBox(
    //   height: responsive.height(12),
    //   child: ListView.separated(
    //     scrollDirection: Axis.horizontal,
    //     padding: EdgeInsets.symmetric(horizontal: responsive.width(3)),
    //     itemCount: list.length,
    //     separatorBuilder: (_, __) => SizedBox(width: responsive.width(3)),
    //     itemBuilder: (context, index) {
    //       final item = list[index];

    //       return GestureDetector(
    //         onTap: item.onTap,
    //         child: 
    //         Container(
    //           width: responsive.width(28),
    //           decoration: BoxDecoration(
    //             color: item.color,
    //             borderRadius: BorderRadius.circular(12),
    //           ),
    //           padding: EdgeInsets.all(responsive.width(2)),
    //           child: Column(
    //             mainAxisAlignment: MainAxisAlignment.center,
    //             children: [
    //               FormLabel(
    //                 text: item.programname,
    //                 maxLines: 3,
    //                 textAlignment: TextAlign.center,
    //                 textOverflow: TextOverflow.ellipsis,
    //                 labelColor: Colors.white,
    //                 fontSize: responsive.fontSize(2),
    //                 fontweight: FontWeight.w600,
    //               ),
    //             ],
    //           ),
    //         ),
    //       );
    //     },
    //   ),
    // );
  }
}
