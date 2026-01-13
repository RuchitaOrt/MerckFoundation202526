import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:merckfoundation_252026/widgets/YouTubePreview.dart';
import 'package:url_launcher/url_launcher.dart';

class SmartHtmlWidget extends StatelessWidget {
  final String html;
  final Color? textColor;
  final double? fontSize;
  final FontWeight? fontWeight;

  const SmartHtmlWidget({
    super.key,
    required this.html,
    this.textColor,
    this.fontSize,
    this.fontWeight,
  });

  @override
  Widget build(BuildContext context) {
    return HtmlWidget(
      html,
      textStyle: TextStyle(
        color: textColor ?? Colors.black87,
        fontSize: fontSize ?? 14,
        fontWeight: fontWeight ?? FontWeight.normal,
        height: 1.5,
      ),

      /// 👇 THIS IS THE KEY PART
      customWidgetBuilder: (element) {
        /// Handle YouTube iframe ONLY
        if (element.localName == 'iframe') {
          final src = element.attributes['src'] ?? '';

          if (src.contains('youtube.com') || src.contains('youtu.be')) {
            final videoId = _extractYoutubeId(src);
            if (videoId != null) {
              return YouTubePreview(videoId: videoId);
            }
          }
        }

        return null; // let normal HTML render
      },

      /// Open all links externally
      onTapUrl: (url) async {
        final uri = Uri.parse(url);
        if (await canLaunchUrl(uri)) {
          await launchUrl(uri, mode: LaunchMode.externalApplication);
        }
        return true;
      },
    );
  }

  String? _extractYoutubeId(String url) {
    final regExp = RegExp(
      r'(?:embed\/|watch\?v=|youtu\.be\/)([a-zA-Z0-9_-]{11})',
    );
    final match = regExp.firstMatch(url);
    return match?.group(1);
  }
}
