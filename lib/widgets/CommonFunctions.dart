import 'package:html/parser.dart' as html_parser;

String getYoutubeId(String url) {
  try {
    if (url.contains("embed/")) {
      return url.split("embed/").last;
    } else if (url.contains("v=")) {
      return url.split("v=").last;
    }
  } catch (e) {}
  return "";
}
String stripHtml(String htmlString) {
  final exp = RegExp(r"<[^>]*>", multiLine: true, caseSensitive: true);
  String text = htmlString.replaceAll(exp, '');

  // 🔥 IMPORTANT FIX
  text = text.replaceAll('\n', ' ');
  text = text.replaceAll('\r', ' ');
  text = text.replaceAll(RegExp(r'\s+'), ' '); // remove extra spaces

  return text.trim();
}

String getPreviewText(String html) {
  final text = stripHtml(html);
  return text.split('.').first; // first sentence
}