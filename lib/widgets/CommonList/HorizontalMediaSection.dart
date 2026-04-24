import 'package:flutter/material.dart';
import 'package:merckfoundation_252026/Utils/customcolor.dart';
import 'package:merckfoundation_252026/widgets/CommonFunctions.dart';

class HorizontalMediaSection extends StatelessWidget {
  final List content;
  final String? title;
  final bool showDescription;

  const HorizontalMediaSection({
    super.key,
    required this.content,
    this.title,
    this.showDescription = false,
  });

  @override
  Widget build(BuildContext context) {
    if (content.isEmpty) return const SizedBox();

    final screenWidth = MediaQuery.of(context).size.width;
    final itemWidth = screenWidth * 0.85;

    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// 🔹 TITLE
          if ((title ?? "").isNotEmpty)
            Text(
              title!,
              style: TextStyle(
                fontSize: screenWidth * 0.055,
                fontWeight: FontWeight.w800,
                color: Customcolor.text_blue,
              ),
            ),

          const SizedBox(height: 12),

          /// 🔹 LIST (NO FIXED HEIGHT)
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(content.length, (index) {
                final item = content[index];

                final thumb = item['thumbnail'] ?? "";

                final isYoutube =
                    thumb.contains("youtube.com") ||
                    thumb.contains("youtu.be");

                String imageUrl = thumb;

                if (isYoutube) {
                  final videoId = getYoutubeId(thumb);
                  imageUrl =
                      "https://img.youtube.com/vi/$videoId/hqdefault.jpg";
                }

                return Container(
                  width: itemWidth,
                  margin: const EdgeInsets.only(right: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min, // ✅ FIX
                    children: [
                      /// 🔹 IMAGE
                      AspectRatio(
                        aspectRatio: 16 / 9,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.network(
                            imageUrl,
                            fit: BoxFit.cover,
                            width: double.infinity,
                            loadingBuilder:
                                (context, child, progress) {
                              if (progress == null) return child;
                              return Container(
                                color: Colors.grey.shade200,
                              );
                            },
                            errorBuilder: (_, __, ___) =>
                                Container(color: Colors.grey.shade200),
                          ),
                        ),
                      ),

                      const SizedBox(height: 8),

                      /// 🔹 TITLE
                      Text(
                        stripHtml(item['title'] ?? ""),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),

                      /// 🔹 DESCRIPTION (ONLY IF NEEDED)
                      if (showDescription)
                        Padding(
                          padding: const EdgeInsets.only(top: 4),
                          child: Text(
                            stripHtml(
                              item['subtitle'] ??
                                  item['description'] ??
                                  "",
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(fontSize: 12),
                          ),
                        ),
                    ],
                  ),
                );
              }),
            ),
          ),

          const SizedBox(height: 10),

          /// 🔹 BUTTON
          Center(
            child: Container(
              padding: const EdgeInsets.symmetric(
                  vertical: 10, horizontal: 20),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.orange, width: 2),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Text(
                "View All",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
// // import 'package:flutter/material.dart';
// // import 'package:merckfoundation_252026/Utils/customcolor.dart';
// // import 'package:merckfoundation_252026/widgets/CommonFunctions.dart';

// // class HorizontalMediaSection extends StatelessWidget {
// //   final List content;
// //   final String? title;
// //   final bool showDescription;

// //   const HorizontalMediaSection({
// //     super.key,
// //     required this.content,
// //     this.title,
// //     this.showDescription = false,
// //   });

// //   @override
// //   Widget build(BuildContext context) {
// //     if (content.isEmpty) return SizedBox();

// //     final screenWidth = MediaQuery.of(context).size.width;
// //     final itemWidth = screenWidth * 0.85;

// //     return
// //      Padding(
// //       padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
// //       child: Column(
// //         crossAxisAlignment: CrossAxisAlignment.start,
// //         children: [
// //           /// 🔹 TITLE
// //           Text(
// //             title ?? "",
// //             style: TextStyle(
// //               fontSize: screenWidth * 0.055,
// //               fontWeight: FontWeight.w800,
// //               color: Customcolor.text_blue,
// //             ),
// //           ),

// //           const SizedBox(height: 12),

// //           /// 🔹 LIST
// //           SizedBox(
// //             height: showDescription ? 260 : 220, // ✅ stable for iOS
// //             child: ListView.separated(
// //               scrollDirection: Axis.horizontal,
// //               itemCount: content.length,
// //               separatorBuilder: (_, __) => const SizedBox(width: 12),
// //               itemBuilder: (_, index) {
// //                 final item = content[index];

// //                 final thumb = item['thumbnail'] ?? "";

// //                 /// 🔥 Detect YouTube
// //                 final isYoutube =
// //                     thumb.contains("youtube.com") || thumb.contains("youtu.be");

// //                 String imageUrl = thumb;

// //                 if (isYoutube) {
// //                   final videoId = getYoutubeId(thumb);
// //                   imageUrl =
// //                       "https://img.youtube.com/vi/$videoId/hqdefault.jpg";
// //                 }

// //                 return SizedBox(
// //                   width: itemWidth,
// //                   child: Column(
// //                     crossAxisAlignment: CrossAxisAlignment.start,
// //                     children: [
// //                       /// 🔹 IMAGE / VIDEO
// //                       Stack(
// //                         alignment: Alignment.center,
// //                         children: [
// //                           AspectRatio(
// //                             aspectRatio: 16 / 9, // ✅ iOS FIX
// //                             child: ClipRRect(
// //                               borderRadius: BorderRadius.circular(20),
// //                               child: Image.network(
// //                                 imageUrl,
// //                                 fit: BoxFit.cover,
// //                                 width: double.infinity,
// //                                 loadingBuilder:
// //                                     (context, child, progress) {
// //                                   if (progress == null) return child;
// //                                   return Container(
// //                                     color: Colors.grey.shade200,
// //                                   );
// //                                 },
// //                                 errorBuilder: (_, __, ___) =>
// //                                     Container(color: Colors.grey.shade200),
// //                               ),
// //                             ),
// //                           ),

// //                           /// ▶ Play icon for YouTube
// //                           if (isYoutube)
// //                             Container(
// //                               decoration: BoxDecoration(
// //                                 color: Colors.black54,
// //                                 shape: BoxShape.circle,
// //                               ),
// //                               padding: EdgeInsets.all(10),
// //                               child: Icon(Icons.play_arrow,
// //                                   color: Colors.white),
// //                             ),
// //                         ],
// //                       ),

// //                       const SizedBox(height: 8),

// //                       /// 🔹 TITLE
// //                       Text(
// //                         item['title'] ?? "",
// //                         maxLines: 2,
// //                         overflow: TextOverflow.ellipsis,
// //                         style: const TextStyle(
// //                           fontSize: 14,
// //                           fontWeight: FontWeight.w600,
// //                         ),
// //                       ),

// //                       /// 🔹 DESCRIPTION (HTML safe)
// //                       if (showDescription)
// //                         Text(
// //                           stripHtml(
// //                             item['subtitle'] ??
// //                                 item['description'] ??
// //                                 "",
// //                           ),
// //                           maxLines: 2,
// //                           overflow: TextOverflow.ellipsis,
// //                           style: const TextStyle(fontSize: 12),
// //                         ),
// //                     ],
// //                   ),
// //                 );
// //               },
// //             ),
// //           ),

// //           const SizedBox(height: 10),

// //           /// 🔹 BUTTON
// //           Center(
// //             child: Container(
// //               padding:
// //                   const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
// //               decoration: BoxDecoration(
// //                 border: Border.all(color: Colors.orange, width: 2),
// //                 borderRadius: BorderRadius.circular(8),
// //               ),
// //               child: const Text(
// //                 "View All",
// //                 style: TextStyle(fontWeight: FontWeight.bold),
// //               ),
// //             ),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }
// import 'package:flutter/material.dart';
// import 'package:merckfoundation_252026/Utils/customcolor.dart';
// import 'package:merckfoundation_252026/widgets/CommonFunctions.dart';

// class HorizontalMediaSection extends StatelessWidget {
//   final List content;
//   final String? title;
//   final bool showDescription;

//   const HorizontalMediaSection({
//     super.key,
//     required this.content,
//     this.title,
//     this.showDescription = false,
//   });

//   @override
//   Widget build(BuildContext context) {
//     if (content.isEmpty) return const SizedBox();

//     final screenWidth = MediaQuery.of(context).size.width;
//     final itemWidth = screenWidth * 0.85;

//     return Padding(
//       padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           /// 🔹 TITLE
//           if ((title ?? "").isNotEmpty)
//             Text(
//               title!,
//               style: TextStyle(
//                 fontSize: screenWidth * 0.055,
//                 fontWeight: FontWeight.w800,
//                 color: Customcolor.text_blue,
//               ),
//             ),

//           const SizedBox(height: 12),

//           /// 🔹 LIST (dynamic safe height)
//           SizedBox(
//             height: showDescription ? 300 : 250, // buffer for all devices
//             child: ListView.separated(
//               scrollDirection: Axis.horizontal,
//               itemCount: content.length,
//               separatorBuilder: (_, __) => const SizedBox(width: 12),
//               itemBuilder: (_, index) {
//                 final item = content[index];

//                 final thumb = item['thumbnail'] ?? "";

//                 /// 🔥 Detect YouTube
//                 final isYoutube = thumb.contains("youtube.com") ||
//                     thumb.contains("youtu.be");

//                 String imageUrl = thumb;

//                 if (isYoutube) {
//                   final videoId = getYoutubeId(thumb);
//                   imageUrl =
//                       "https://img.youtube.com/vi/$videoId/hqdefault.jpg";
//                 }

//                 return SizedBox(
//                   width: itemWidth,
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       /// 🔹 IMAGE / VIDEO
//                       Stack(
//                         alignment: Alignment.center,
//                         children: [
//                           AspectRatio(
//                             aspectRatio: 16 / 9, // ✅ iOS safe
//                             child: ClipRRect(
//                               borderRadius: BorderRadius.circular(20),
//                               child: Image.network(
//                                 imageUrl,
//                                 fit: BoxFit.cover,
//                                 width: double.infinity,
//                                 loadingBuilder:
//                                     (context, child, progress) {
//                                   if (progress == null) return child;
//                                   return Container(
//                                     color: Colors.grey.shade200,
//                                   );
//                                 },
//                                 errorBuilder: (_, __, ___) =>
//                                     Container(color: Colors.grey.shade200),
//                               ),
//                             ),
//                           ),

//                           /// ▶ Play icon
//                           if (isYoutube)
//                             Container(
//                               decoration: const BoxDecoration(
//                                 color: Colors.black54,
//                                 shape: BoxShape.circle,
//                               ),
//                               padding: const EdgeInsets.all(10),
//                               child: const Icon(Icons.play_arrow,
//                                   color: Colors.white),
//                             ),
//                         ],
//                       ),

//                       const SizedBox(height: 8),

//                       /// 🔹 TITLE
//                       Text(
//                         item['title'] ?? "",
//                         maxLines: 2,
//                         overflow: TextOverflow.ellipsis,
//                         style: const TextStyle(
//                           fontSize: 14,
//                           fontWeight: FontWeight.w600,
//                         ),
//                       ),

//                       const SizedBox(height: 4),

//                       /// 🔹 DESCRIPTION (for testimonials / episodes)
//                       if (showDescription)
//                         Expanded(
//                           child: Text(
//                             stripHtml(
//                               item['subtitle'] ??
//                                   item['description'] ??
//                                   "",
//                             ),
//                             maxLines: 3, // more space for testimonial
//                             overflow: TextOverflow.ellipsis,
//                             style: const TextStyle(fontSize: 12),
//                           ),
//                         ),
//                     ],
//                   ),
//                 );
//               },
//             ),
//           ),

//           // const SizedBox(height: 10),

//           /// 🔹 BUTTON
//           Center(
//             child: Container(
//               padding:
//                   const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
//               decoration: BoxDecoration(
//                 border: Border.all(color: Colors.orange, width: 2),
//                 borderRadius: BorderRadius.circular(8),
//               ),
//               child: const Text(
//                 "View All",
//                 style: TextStyle(fontWeight: FontWeight.bold),
//               ),
//             ),
//           ),

//           const SizedBox(height: 10),
//         ],
//       ),
//     );
//   }
// }