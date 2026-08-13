// import 'package:flutter/material.dart';
// import 'package:marquee/marquee.dart';
// import 'package:merckfoundation_252026/CommonUtils/customcolor.dart';

// class CommonMarqueeWidget extends StatelessWidget {
//   final String title;
//   final VoidCallback? onTap;

//   const CommonMarqueeWidget({
//     super.key,
//     required this.title,
//     this.onTap,
//   });

//   @override
//   Widget build(BuildContext context) {

//     /// ✅ hide if empty
//     if (title.trim().isEmpty) {
//       return const SizedBox();
//     }

//     return GestureDetector(
//       onTap: onTap,
//       child: Padding(
//         padding: const EdgeInsets.only(bottom: 8),
//         child: SizedBox(
//           height: 20,
//           child: Marquee(
//             text: title,
//             style: const TextStyle(
//               color: Customcolor.textBlueColor,
//               fontStyle: FontStyle.normal,
//               fontWeight: FontWeight.w700,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';
import 'package:merckfoundation_252026/CommonUtils/customcolor.dart';
import 'package:merckfoundation_252026/widgets/CommonWidget/CommonFunctions.dart';

class CommonMarqueeWidget extends StatelessWidget {
  final List<dynamic> contents;
  final VoidCallback? onTap;

  const CommonMarqueeWidget({
    super.key,
    required this.contents,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    /// Remove empty titles
  final marqueeText = contents
    .where((e) => (e['title'] ?? '').toString().trim().isNotEmpty)
    .map((e) => e['title'].toString().trim())
    .join('   |   ');
    if (marqueeText.isEmpty) {
      return const SizedBox();
    }

    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 8),
        child: SizedBox(
          height: 20,
          child: Marquee(
            text: stripHtml(marqueeText),
            style: const TextStyle(
              color: Customcolor.textBlueColor,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}