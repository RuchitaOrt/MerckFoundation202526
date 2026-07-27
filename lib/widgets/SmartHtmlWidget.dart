import 'package:html_unescape/html_unescape.dart';
import 'package:merckfoundation_252026/widgets/AutoResizeWebView.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:flutter/material.dart';

import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:merckfoundation_252026/Utility/showdailog.dart';
import 'package:webview_flutter/webview_flutter.dart';

class SmartHtmlWidget extends StatefulWidget {
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

  const SmartHtmlWidget({
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

  @override
  State<SmartHtmlWidget> createState() => _SmartHtmlWidgetState();
}

class _SmartHtmlWidgetState extends State<SmartHtmlWidget> with AutomaticKeepAliveClientMixin{
    @override
  bool get wantKeepAlive => true;
  final HtmlUnescape _htmlUnescape = HtmlUnescape();

  String decodeHtmlEntities(String text) {
    return _htmlUnescape.convert(text);
  }
late String processedHtml;

@override
void initState() {
  super.initState();
   processedHtml = widget.ignoreHtmlStyles
      ? removeHtmlStyles(widget.html)
      : cleanHtml(widget.html);
 
}
@override
void didUpdateWidget(covariant SmartHtmlWidget oldWidget) {
  super.didUpdateWidget(oldWidget);

  if (oldWidget.html != widget.html ||
      oldWidget.ignoreHtmlStyles != widget.ignoreHtmlStyles) {

    processedHtml = widget.ignoreHtmlStyles
        ? removeHtmlStyles(widget.html)
        : cleanHtml(widget.html);
  }
}

  @override
  Widget build(BuildContext context) {
    super.build(context);
    /// ✅ FOR TITLES / SINGLE LINE TEXT
    if (widget.applyMaxLines) {
     
      return Text(
        // removeAllHtmlTags(
        //   widget.ignoreHtmlStyles ? removeHtmlStyles(widget.html) : cleanHtml(widget.html),
        // ).trim(),
removeAllHtmlTags(processedHtml).trim(),
        maxLines: widget.maxLines,
        softWrap: widget.softWrap,
        overflow: widget.textOverflow,

        style: TextStyle(
          color: widget.textColor,
          fontSize: widget.fontSize,
          fontWeight: widget.fontWeight,
          height: 1.4,
        ),
      );
    }

    /// ✅ FOR FULL HTML CONTENT
    return HtmlWidget(
      processedHtml,
      // ignoreHtmlStyles ? removeHtmlStyles(html) : cleanHtml(html),
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
        color: widget.textColor,
        fontSize: widget.fontSize,
        fontWeight: widget.fontWeight,
        height: 1.4,
      ),

      /// ✅ CUSTOM WIDGETS
      customWidgetBuilder: (element) {
        if (element.localName == 'iframe') {
          final src = element.attributes['src'] ?? "";
 return YoutubePlayerWidget(src: src);
        //   final videoId = YoutubePlayer.convertUrlToId(src);

        //   if (videoId != null) {
        //     return YouTubeInAppPlayer(
        //       videoUrl: "https://www.youtube.com/watch?v=$videoId",
        //     );
        //   }
         }

        /// 🔹 HANDLE VIDEO TAG (fallback to WebView)
        if (element.localName == 'video') {
          final sourceElement = element.children
              .where((e) => e.localName == 'source')
              .toList();

          if (sourceElement.isNotEmpty) {
            final src = sourceElement.first.attributes['src'];

            if (src != null && src.isNotEmpty) {
              // final controller = WebViewController()
              //   ..setJavaScriptMode(JavaScriptMode.unrestricted)
              //   ..loadRequest(Uri.parse(src));

              return  SizedBox(
                height: 300,
                width: double.infinity,
                child: VideoWebView(url: src),
                //  WebViewWidget(controller: controller),
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
        
          return AutoResizeWebView(
            key: PageStorageKey(element.outerHtml.hashCode),

            htmlContent: element.outerHtml,
          );
        }

        return null;
      },
      customStylesBuilder: (element) {
        /// ✅ REMOVE HTML STYLING
        if (widget.ignoreHtmlStyles) {
          return {
            'margin': '0',
            'padding': '0',
            'line-height': '1.4',

            'color': widget.textColor != null
                ? '#${widget.textColor!.value.toRadixString(16).substring(2)}'
                : '#000000',

            'font-size': '${widget.fontSize ?? 14}px',

            'font-weight': widget.fontWeight == FontWeight.w800
                ? '800'
                : widget.fontWeight == FontWeight.w700
                ? '700'
                : widget.fontWeight == FontWeight.w600
                ? '600'
                : widget.fontWeight == FontWeight.bold
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
class VideoWebView extends StatefulWidget {
  final String url;

  const VideoWebView({
    super.key,
    required this.url,
  });

  @override
  State<VideoWebView> createState() => _VideoWebViewState();
}

class _VideoWebViewState extends State<VideoWebView> {
  late final WebViewController controller;

  @override
  void initState() {
    super.initState();

    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse(widget.url));
  }

  @override
  Widget build(BuildContext context) {
    return WebViewWidget(controller: controller);
  }
}
class YoutubePlayerWidget extends StatefulWidget {
  final String src;

  const YoutubePlayerWidget({
    super.key,
    required this.src,
  });

  @override
  State<YoutubePlayerWidget> createState() =>
      _YoutubePlayerWidgetState();
}

class _YoutubePlayerWidgetState
    extends State<YoutubePlayerWidget> {

  late final YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();

    final id =
        YoutubePlayer.convertUrlToId(widget.src) ?? "";

    _controller = YoutubePlayerController(
      initialVideoId: id,
      flags: const YoutubePlayerFlags(
        autoPlay: false,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayer(
      controller: _controller,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}