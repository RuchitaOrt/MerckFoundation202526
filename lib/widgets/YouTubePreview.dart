import 'package:flutter/material.dart';
import 'package:merckfoundation_252026/widgets/CommonWidget/CommonFunctions.dart';
import 'package:url_launcher/url_launcher.dart';
// String getYoutubeThumbnail(String thumb) {
//   final isYoutube =
//       thumb.contains("youtube.com") ||
//       thumb.contains("youtu.be");

//   if (!isYoutube) {
//     return thumb;
//   }

//   final videoId = getYoutubeId(thumb);

//   if (videoId.isEmpty) {
//     return thumb;
//   }

//   return "https://img.youtube.com/vi/$videoId/hqdefault.jpg";
// }
String getYoutubeThumbnail(String url) {
  final videoId = getYoutubeId(url);

  if (videoId.isEmpty) {
    return url;
  }

  return "https://img.youtube.com/vi/$videoId/hqdefault.jpg";
}

// String getYoutubeId(String url) {
//   try {
//     final uri = Uri.parse(url);

//     // https://www.youtube.com/embed/uCm4eS_KssM?si=xxxx
//     if (uri.host.contains('youtube.com') &&
//         uri.pathSegments.isNotEmpty &&
//         uri.pathSegments.first == 'embed' &&
//         uri.pathSegments.length > 1) {
//       return uri.pathSegments[1];
//     }

//     // https://www.youtube.com/watch?v=uCm4eS_KssM
//     if (uri.host.contains('youtube.com') &&
//         uri.queryParameters.containsKey('v')) {
//       return uri.queryParameters['v'] ?? '';
//     }

//     // https://www.youtube.com/shorts/uCm4eS_KssM
//     if (uri.host.contains('youtube.com') &&
//         uri.pathSegments.isNotEmpty &&
//         uri.pathSegments.first == 'shorts' &&
//         uri.pathSegments.length > 1) {
//       return uri.pathSegments[1];
//     }

//     // https://youtu.be/uCm4eS_KssM
//     if (uri.host.contains('youtu.be') &&
//         uri.pathSegments.isNotEmpty) {
//       return uri.pathSegments.first;
//     }

//     return '';
//   } catch (e) {
//     return '';
//   }
// }
// String getYoutubeThumbnail(String url) {

//   final id = url.split('/').last;
//   return "https://img.youtube.com/vi/$id/0.jpg";
// }
class YouTubePreview extends StatelessWidget {
  final String videoId;

  const YouTubePreview({super.key, required this.videoId});

  Future<void> _openYoutube() async {
    final url = Uri.parse("https://www.youtube.com/watch?v=$videoId");
    await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: GestureDetector(
        onTap: _openYoutube,
        child: AspectRatio(
          aspectRatio: 16 / 9,
          child: Stack(
            alignment: Alignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  "https://img.youtube.com/vi/$videoId/0.jpg",
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                decoration: const BoxDecoration(
                  color: Colors.black45,
                  shape: BoxShape.circle,
                ),
                padding: const EdgeInsets.all(14),
                child: const Icon(
                  Icons.play_arrow,
                  color: Colors.white,
                  size: 48,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
