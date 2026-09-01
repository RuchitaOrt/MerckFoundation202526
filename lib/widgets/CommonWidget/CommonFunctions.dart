
import 'package:html_unescape/html_unescape.dart';

// String getYoutubeId(String url) {
//   try {
//     if (url.contains("embed/")) {
//       return url.split("embed/").last;
//     } else if (url.contains("v=")) {
//       return url.split("v=").last;
//     }
//   } catch (e) {}
//   return "";
// }
String getYoutubeId(String url) {
  try {
    final uri = Uri.parse(url);

    // https://www.youtube.com/embed/uCm4eS_KssM?si=xxxx
    if (uri.host.contains('youtube.com') &&
        uri.pathSegments.isNotEmpty &&
        uri.pathSegments.first == 'embed' &&
        uri.pathSegments.length > 1) {
      return uri.pathSegments[1];
    }

    // https://www.youtube.com/watch?v=uCm4eS_KssM
    if (uri.host.contains('youtube.com') &&
        uri.queryParameters.containsKey('v')) {
      return uri.queryParameters['v'] ?? '';
    }

    // https://www.youtube.com/shorts/uCm4eS_KssM
    if (uri.host.contains('youtube.com') &&
        uri.pathSegments.isNotEmpty &&
        uri.pathSegments.first == 'shorts' &&
        uri.pathSegments.length > 1) {
      return uri.pathSegments[1];
    }

    // https://youtu.be/uCm4eS_KssM
    if (uri.host.contains('youtu.be') &&
        uri.pathSegments.isNotEmpty) {
      return uri.pathSegments.first;
    }

    return '';
  } catch (e) {
    return '';
  }
}
String? getYoutubeVideoId(String url) {
  try {
    final uri = Uri.parse(url);
    print("Common URI");
print(uri);
    // https://www.youtube.com/watch?v=VIDEO_ID
    if (uri.host.contains('youtube.com') &&
        uri.queryParameters['v'] != null) {
      return uri.queryParameters['v'];
    }

    // https://www.youtube.com/embed/VIDEO_ID
    if (uri.pathSegments.isNotEmpty &&
        uri.pathSegments.contains('embed')) {
      final index = uri.pathSegments.indexOf('embed');

      if (index + 1 < uri.pathSegments.length) {
        return uri.pathSegments[index + 1];
      }
    }

    // https://youtu.be/VIDEO_ID
    if (uri.host.contains('youtu.be') &&
        uri.pathSegments.isNotEmpty) {
      return uri.pathSegments.first;
    }

    return null;
  } catch (e) {
    return null;
  }
}
String stripHtml(String htmlString) {
  final exp = RegExp(r"<[^>]*>", multiLine: true, caseSensitive: true);

  String text = htmlString.replaceAll(exp, '');

  text = text.replaceAll('\n', ' ');
  text = text.replaceAll('\r', ' ');
  text = text.replaceAll(RegExp(r'\s+'), ' ');

  // Decode HTML entities like &amp;, &lt;, &gt;, etc.
  text = HtmlUnescape().convert(text);

  return text.trim();
}
// String stripHtml(String htmlString) {
//   final exp = RegExp(r"<[^>]*>", multiLine: true, caseSensitive: true);
//   String text = htmlString.replaceAll(exp, '');

//   // 🔥 IMPORTANT FIX
//   text = text.replaceAll('\n', ' ');
//   text = text.replaceAll('\r', ' ');
//   text = text.replaceAll(RegExp(r'\s+'), ' '); // remove extra spaces

//   return text.trim();
// }

