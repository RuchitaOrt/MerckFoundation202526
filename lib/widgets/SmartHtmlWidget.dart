import 'package:html_unescape/html_unescape.dart';
import 'package:merckfoundation_252026/widgets/AutoResizeWebView.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:merckfoundation_252026/Utility/showdailog.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class SmartHtmlWidget extends StatelessWidget {
  final String html;
  final Color? textColor;
  final double? fontSize;
  final FontWeight? fontWeight;

  /// ✅ ignore html inline styles
  final bool ignoreHtmlStyles;

  /// ✅ max line support
  final bool applyMaxLines;
  final int maxLines;
  final bool softWrap;
  final TextOverflow textOverflow;

  SmartHtmlWidget({
    super.key,
    required this.html,
    this.textColor,
    this.fontSize,
    this.fontWeight,
    this.ignoreHtmlStyles = false,
    this.applyMaxLines = false,
    this.maxLines = 1,
    this.softWrap = true,
    this.textOverflow = TextOverflow.ellipsis,
  });
  final HtmlUnescape _htmlUnescape = HtmlUnescape();

  String decodeHtmlEntities(String text) {
    return _htmlUnescape.convert(text);
  }

  @override
  Widget build(BuildContext context) {
    /// ✅ FOR TITLES / SINGLE LINE TEXT
    if (applyMaxLines) {
      print("TAABLE");
      print(html);
      return Text(
        removeAllHtmlTags(
          ignoreHtmlStyles ? removeHtmlStyles(html) : cleanHtml(html),
        ).trim(),

        maxLines: maxLines,
        softWrap: softWrap,
        overflow: textOverflow,

        style: TextStyle(
          color: textColor,
          fontSize: fontSize,
          fontWeight: fontWeight,
          height: 1.4,
        ),
      );
    }

    /// ✅ FOR FULL HTML CONTENT
    return HtmlWidget(
      ignoreHtmlStyles ? removeHtmlStyles(html) : cleanHtml(html),
      // ignoreHtmlStyles
      //     ? removeHtmlStyles(html)
      //     : cleanHtml(html),
      //  decodeHtmlEntities(
      //     ignoreHtmlStyles
      //         ? removeHtmlStyles(html)
      //         : cleanHtml(html),
      //   ),
      renderMode: RenderMode.column,

      textStyle: TextStyle(
        color: textColor,
        fontSize: fontSize,
        fontWeight: fontWeight,
        height: 1.4,
      ),

      /// ✅ CUSTOM WIDGETS
      customWidgetBuilder: (element) {
        if (element.localName == 'iframe') {
          final src = element.attributes['src'] ?? "";

          final videoId = YoutubePlayer.convertUrlToId(src);

          if (videoId != null) {
            return YouTubeInAppPlayer(
              videoUrl: "https://www.youtube.com/watch?v=$videoId",
            );
          }
        }

        /// 🔹 HANDLE VIDEO TAG (fallback to WebView)
        if (element.localName == 'video') {
          final sourceElement = element.children
              .where((e) => e.localName == 'source')
              .toList();

          if (sourceElement.isNotEmpty) {
            final src = sourceElement.first.attributes['src'];

            if (src != null && src.isNotEmpty) {
              final controller = WebViewController()
                ..setJavaScriptMode(JavaScriptMode.unrestricted)
                ..loadRequest(Uri.parse(src));

              return SizedBox(
                height: 300,
                width: double.infinity,
                child: WebViewWidget(controller: controller),
              );
            }
          }
        }
        if (element.localName == 'figure' &&
            (element.attributes['class'] ?? '').contains('table')) {
          return AutoResizeWebView(
            key: PageStorageKey(element.outerHtml.hashCode),

            htmlContent: element.outerHtml);
        } else 
        if (element.localName == 'table') {
          print("TAABLE");
          print(element.outerHtml);
          return AutoResizeWebView(
            key: PageStorageKey(element.outerHtml.hashCode),

            htmlContent: element.outerHtml,
          );
        }

        return null;
      },
      customStylesBuilder: (element) {
        /// ✅ REMOVE HTML STYLING
        if (ignoreHtmlStyles) {
          return {
            'margin': '0',
            'padding': '0',
            'line-height': '1.4',

            'color': textColor != null
                ? '#${textColor!.value.toRadixString(16).substring(2)}'
                : '#000000',

            'font-size': '${fontSize ?? 14}px',

            'font-weight': fontWeight == FontWeight.w800
                ? '800'
                : fontWeight == FontWeight.w700
                ? '700'
                : fontWeight == FontWeight.w600
                ? '600'
                : fontWeight == FontWeight.bold
                ? 'bold'
                : 'normal',
          };
        }

        /// ✅ LINK STYLE
        if (element.localName == 'a') {
          return {'color': '#1a0dab', 'text-decoration': 'underline'};
        }

        return null;
      },

      onTapUrl: (url) {
        ShowDialogs.launchURL(url);
        return true;
      },
    );
  }

  String sanitizeTable(String html) {
    return html
        .replaceAll(RegExp(r'margin-left\s*:\s*[^;"]+;?'), '')
        .replaceAll(RegExp(r'margin-right\s*:\s*[^;"]+;?'), '')
        .replaceAll(RegExp(r'margin\s*:\s*[^;"]+;?'), '')
        .replaceAll(RegExp(r'padding-left\s*:\s*[^;"]+;?'), '')
        .replaceAll(RegExp(r'text-indent\s*:\s*[^;"]+;?'), '');
  }

  String cleanHtml(String html) {
    html = decodeHtmlEntities(html);

    return html
        .replaceAll(RegExp(r'margin:[^;"]*;?'), '')
        .replaceAll(RegExp(r'line-height:[^;"]*;?'), '')
        .replaceAll('text-align:justify;', 'text-align:left;');
  }

  String removeHtmlStyles(String html) {
    html = decodeHtmlEntities(html);

    return html
        .replaceAll(RegExp(r'style\s*=\s*"[^"]*"'), '')
        .replaceAll(RegExp(r'class\s*=\s*"[^"]*"'), '');
  }

  String removeFigureWrapper(String html) {
    return html
        .replaceAll(RegExp(r'<figure[^>]*class="[^"]*table[^"]*"[^>]*>'), '')
        .replaceAll('</figure>', '');
  }

  String removeAllHtmlTags(String htmlText) {
    htmlText = decodeHtmlEntities(htmlText);

    return htmlText.replaceAll(RegExp(r'<[^>]*>'), '');
  }

  String extractYoutubeId(String url) {
    final uri = Uri.parse(url);

    if (url.contains("youtu.be")) {
      return uri.pathSegments.last;
    }

    if (url.contains("embed/")) {
      return uri.pathSegments.last;
    }

    return uri.queryParameters['v'] ?? "";
  }
}

class YouTubeInAppPlayer extends StatefulWidget {
  final String videoUrl;

  const YouTubeInAppPlayer({super.key, required this.videoUrl});

  @override
  State<YouTubeInAppPlayer> createState() => _YouTubeInAppPlayerState();
}

class _YouTubeInAppPlayerState extends State<YouTubeInAppPlayer> {
  late YoutubePlayerController controller;

  @override
  void initState() {
    super.initState();

    final videoId = YoutubePlayer.convertUrlToId(widget.videoUrl) ?? "";

    controller = YoutubePlayerController(
      initialVideoId: videoId,
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
        enableCaption: true,
        forceHD: true,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayer(
      controller: controller,
      showVideoProgressIndicator: true,
      progressIndicatorColor: Colors.red,
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
