// import 'package:flutter/material.dart';
// class CommonListCard extends StatelessWidget {
//   final String imageUrl;
//   final String htmlTitle;
//   final VoidCallback onTap;

//   const CommonListCard({
//     super.key,
//     required this.imageUrl,
//     required this.htmlTitle,
//     required this.onTap,
//   });

//   @override
//   Widget build(BuildContext context) {
//     final bool isNetwork =
//         imageUrl.startsWith("http");

//     return GestureDetector(
//       onTap: onTap,
//       child: Container(
//         margin: const EdgeInsets.symmetric(
//           horizontal: 16,
//           vertical: 8,
//         ),
//         padding: const EdgeInsets.all(12),
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(12),
//         ),
//         child: Row(
//           children: [
//             ClipRRect(
//               borderRadius: BorderRadius.circular(10),
//               child: isNetwork
//                   ? Image.network(
//                       imageUrl,
//                       width: 80,
//                       height: 80,
//                       fit: BoxFit.cover,
//                       errorBuilder: (_, __, ___) {
//                         return Image.asset(
//                           "assets/images/placeholder.png",
//                           width: 90,
//                           height: 90,
//                           fit: BoxFit.cover,
//                         );
//                       },
//                     )
//                   : Image.asset(
//                       imageUrl,
//                       width: 50,
//                       height: 50,
//                       fit: BoxFit.cover,
//                     ),
//             ),

//             const SizedBox(width: 12),

//             Expanded(
//               child: Text(
//                 htmlTitle,
//                 maxLines: 3,
//                 overflow: TextOverflow.ellipsis,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';

class CommonListCard extends StatelessWidget {
  final String imageUrl;
  final String htmlTitle;
  final VoidCallback onTap;

  const CommonListCard({
    super.key,
    required this.imageUrl,
    required this.htmlTitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final bool isNetwork = imageUrl.startsWith("http");

    return InkWell(
      borderRadius: BorderRadius.circular(14),
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 14,
          vertical: 6,
        ),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.04),
              blurRadius: 6,
              offset: const Offset(0, 2),
            ),
          ],
        ),

        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// IMAGE
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: isNetwork
                  ? Image.network(
                      imageUrl,
                      width: 80,
                      height: 80,
                      fit: BoxFit.cover,

                      errorBuilder: (_, __, ___) {
                        return Container(
                          width: 80,
                          height: 80,
                          color: Colors.grey.shade200,
                          child: const Icon(Icons.image),
                        );
                      },
                    )
                  : Image.asset(
                      imageUrl,
                      width: 80,
                      height: 80,
                      fit: BoxFit.cover,
                    ),
            ),

            const SizedBox(width: 12),

            /// TITLE
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 2),
                child: Text(
                  htmlTitle,
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    height: 1.35,
                    color: Color(0xff222222),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}