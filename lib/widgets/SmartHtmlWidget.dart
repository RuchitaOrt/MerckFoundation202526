import 'package:cached_network_image/cached_network_image.dart';
import 'package:html_unescape/html_unescape.dart';
import 'package:merckfoundation_252026/CommonUtils/customcolor.dart';
import 'package:merckfoundation_252026/widgets/AutoResizeWebView.dart';
import 'package:merckfoundation_252026/widgets/CommonWidget/ImageShimmer.dart';
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
  final bool ignorefontStyles;

  /// ✅ max line support
  final bool applyMaxLines;
  final int maxLines;
  final bool softWrap;
  final TextOverflow textOverflow;
  final TextAlign textalign;
  final String? fontFamily;

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
    this.textalign = TextAlign.start,
    this.ignorefontStyles = false,  this.fontFamily,
  });

  @override
  State<SmartHtmlWidget> createState() => _SmartHtmlWidgetState();
}

class _SmartHtmlWidgetState extends State<SmartHtmlWidget>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  final HtmlUnescape _htmlUnescape = HtmlUnescape();

  String decodeHtmlEntities(String text) {
    return _htmlUnescape.convert(text);
  }

  // late String processedHtml;
  static final Map<String, String> _processedHtmlCache = {};

  late String processedHtml;

  String _getProcessedHtml() {
    final key =
        "${widget.html}_${widget.ignoreHtmlStyles}_${widget.ignorefontStyles}";

    return _processedHtmlCache.putIfAbsent(key, () {
      if (widget.ignorefontStyles) {
        return removeFontSize(widget.html);
      }

      if (widget.ignoreHtmlStyles) {
        return removeHtmlStyles(widget.html);
      }

      return cleanHtml(widget.html);
    });
  }

  @override
  void initState() {
    super.initState();

    // processedHtml = widget.ignoreHtmlStyles
    //     ? removeHtmlStyles(widget.html)
    //     : cleanHtml(widget.html);
    // processedHtml = widget.ignorefontStyles
    //     ? removeFontSize(widget.html)
    //     : widget.ignoreHtmlStyles
    //     ? removeHtmlStyles(widget.html)
    //     : cleanHtml(widget.html);
    processedHtml = _getProcessedHtml();
  }

  @override
  void didUpdateWidget(covariant SmartHtmlWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.html != widget.html ||
        oldWidget.ignoreHtmlStyles != widget.ignoreHtmlStyles ||
        oldWidget.ignorefontStyles != widget.ignorefontStyles) {
      processedHtml = _getProcessedHtml();
      // processedHtml = widget.ignorefontStyles
      //     ? removeFontSize(widget.html)
      //     : widget.ignoreHtmlStyles
      //     ? removeHtmlStyles(widget.html)
      //     : cleanHtml(widget.html);
    }
    // if (oldWidget.html != widget.html ||
    //     oldWidget.ignoreHtmlStyles != widget.ignoreHtmlStyles) {
    //   processedHtml = widget.ignoreHtmlStyles
    //       ? removeHtmlStyles(widget.html)
    //       : cleanHtml(widget.html);
    // }
  }

  String normalizeApiFonts(String html) {
    return html.replaceAllMapped(
      RegExp(r'font-family\s*:\s*times-new-roman', caseSensitive: false),
      (match) => 'font-family:Times New Roman',
    );
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
        textAlign: widget.textalign,
        style: TextStyle(
          color: widget.textColor ?? Customcolor.colorVoilet,
          fontFamily: widget.fontFamily ?? "Times New Roman",
          fontSize: widget.fontSize,
          fontWeight: widget.fontWeight ?? FontWeight.w600,
          height: 1.4,
        
        ),
      );
    }

    String? htmlFontFamily;

    final fontMatch = RegExp(
      r'font-family\s*:\s*([^;]+)',
      caseSensitive: false,
    ).firstMatch(processedHtml);

    if (fontMatch != null) {
      final rawFont = fontMatch.group(1)?.trim();
      htmlFontFamily = mapHtmlFontFamily(rawFont);
    }

    /// ✅ FOR FULL HTML CONTENT
    return HtmlWidget(
      normalizeApiFonts(processedHtml),
      //       '''<div style="font-family: Times New Roman;">
      //     <h2>Impact of Merck Foundation Programs</h2>
      // </div>''',
      //  processedHtml,
      // '''<div style="font-family: times-new-roman;">
      //   <h2>Impact of Merck Foundation Programs</h2>
      // </div>''',
      // '''<h2 class=\"section-title tv-show-div\" style=\"-webkit-text-stroke-width:0px;border-left:2px solid rgb(75, 78, 83);box-sizing:border-box;color:rgb(75, 78, 83);font-family:times-new-roman;font-size:26px;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;font-weight:300;letter-spacing:normal;line-height:36px;margin:0px;orphans:2;padding:0px 20px;position:relative;text-align:start;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;white-space:normal;widows:2;word-spacing:0px;\">Impact of Merck Foundation Programs<span style=\"color:rgb(239,57,151);\"><span class=\"pink-text\" style=\"border-width:0px;box-sizing:border-box;font-weight:600 !important;margin:0px;outline:0px;padding:0px;\"> (as of April 2026)</span></span></h2>''',
      renderMode: RenderMode.column,

      textStyle: TextStyle(
        color: widget.textColor,
        fontSize: widget.fontSize,
        fontWeight: widget.fontWeight,
        height: 1.4,
         fontFamily: htmlFontFamily ?? widget.fontFamily,
      ),

      /// ✅ CUSTOM WIDGETS
      customWidgetBuilder: (element) {
        //         if (element.localName == 'img') {
        //   final src = element.attributes['src'];

        if (element.localName == 'img') {
          final src = element.attributes['src'] ?? "";

          // if (src.contains("facebook") ||
          //     src.contains("youtube") ||
          //     src.contains("instagram") ||
          //     src.contains("flicker") ||
          //     src.contains("twitter") ||
          //     src.contains("linkedin") ||
          //     src.contains("Threads") ||
          //     src.contains("icon")) {
          //   return null;
          // }
        //   final width = double.tryParse(element.attributes['width'] ?? '');

        //   final height = double.tryParse(element.attributes['height'] ?? '');

        //   //   print("width ${width}  height  ${height}");
        //   if (src != null && src.isNotEmpty && width != null) {
        //     return CachedNetworkImage(
        //       imageUrl: src,
        //       fit: BoxFit.contain,
        //        width: width,
        //       //  height: height,
        //       // memCacheHeight: 1000,
        //       // memCacheWidth: 700,
        //       // fadeInDuration: Duration.zero,
        //       // fadeOutDuration: Duration.zero,

        //       // filterQuality: FilterQuality.low,
        //       placeholder: (_, __) => SizedBox(
        //         height: 220,
        //         width: double.infinity,
        //         //   width: width,
        //         // height: height,
        //         child: const ImageShimmer(),
        //       ),

        //       // errorWidget: (_, __, ___) =>
        //       //     Icon(Icons.broken_image, color: Customcolor.babyBlue),
        //     );
        //   }
         }
        if (element.localName == 'iframe') {
          final src = element.attributes['src'] ?? "";
          return YoutubePlayerWidget(src: src);
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

              return SizedBox(
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

            htmlContent: element.outerHtml,
          );
        } else if (element.localName == 'table') {
          return AutoResizeWebView(
            key: PageStorageKey(element.outerHtml.hashCode),

            htmlContent: element.outerHtml,
          );
        }

        return null;
      },
      customStylesBuilder: (element) {
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
                : widget.fontWeight == FontWeight.w100
                ? '100'
                : widget.fontWeight == FontWeight.bold
                ? 'bold'
                : 'normal',
            'text-align': widget.textalign == TextAlign.center
                ? 'center'
                : widget.textalign == TextAlign.right
                ? 'right'
                : widget.textalign == TextAlign.justify
                ? 'justify'
                : 'left',
          };
        }

        // ============================================================
        // IGNORE FONT SIZE ONLY
        // PRESERVE API FONT FAMILY + FONT WEIGHT
        // ============================================================

        if (widget.ignorefontStyles) {
          final style = element.attributes['style'] ?? '';

          // ============================
          // ELEMENT FONT FAMILY
          // ============================
          final fontFamilyMatch = RegExp(
            r'font-family\s*:\s*([^;]+)',
            caseSensitive: false,
          ).firstMatch(style);

          final rawFontFamily = fontFamilyMatch?.group(1)?.trim();

          final elementFontFamily = mapHtmlFontFamily(rawFontFamily);

          // If this element does not have font-family,
          // use the font found from the complete HTML.
          final finalFontFamily = elementFontFamily ?? htmlFontFamily;

          // ============================
          // FONT WEIGHT
          // ============================
          final fontWeightMatch = RegExp(
            r'font-weight\s*:\s*([^;]+)',
            caseSensitive: false,
          ).firstMatch(style);

          final rawFontWeight = fontWeightMatch
              ?.group(1)
              ?.replaceAll(RegExp(r'\s*!important', caseSensitive: false), '')
              .trim();

          final mappedFontWeight = mapHtmlFontWeight(rawFontWeight);

          return {
            if (finalFontFamily != null) 'font-family': finalFontFamily,

            // Ignore API font-size
            'font-size': '${widget.fontSize ?? 14}px',

            // Preserve API font-weight
            if (mappedFontWeight != null) 'font-weight': mappedFontWeight,

          


            'background': 'transparent',
            'background-color': 'transparent',
              // ⭐ Preserve HTML <strong>/<b>
            if (element.localName == 'strong' ||
                element.localName == 'b')
              'font-weight': '600',
          };
        }

        // LINK STYLE
        if (element.localName == 'a') {
  final hasImage = element.querySelector('img') != null;

  print('A TAG: ${element.outerHtml}');
  print('hasImage: $hasImage');

  if (hasImage) {
    return {
      'text-decoration': 'none',
      'color': 'transparent',
    };
  }

  return {
    'color': '#1a0dab',
    'text-decoration': 'underline',
    'text-decoration-color': '#2980b9',
  };
}
        // if (element.localName == 'a') {
   
        //   return {
        //     'color': '#1a0dab',
        //     'text-decoration': 'underline',
        //     'text-decoration-color': '#2980b9',
        //   };
        // }

        // Override <strong> and <b> if API should not make them bold
        if ((element.localName == 'strong' || element.localName == 'b')) {
          return {'font-weight': '600'};
        }

        return null;
      },

      onTapUrl: (url) {
        ShowDialogs.launchURL(url);
        return true;
      },
    );
  }
String? mapHtmlFontWeight(String? weight) {
  if (weight == null || weight.isEmpty) {
    return null;
  }

  final value = weight
      .toLowerCase()
      .replaceAll(RegExp(r'\s*!important'), '')
      .trim();

  switch (value) {
    case '100':
      return '100';

    case '200':
      return '200';

    case '300':
      return '300';

    case '400':
    case 'normal':
      return '400';

    case '500':
      return '500';

    case '600':
      return '600';

    case '700':
    case 'bold':
      return '700';

    case '800':
      return '800';

    case '900':
      return '900';

    default:
      return null;
  }
}
  String? mapHtmlFontFamily(String? fontFamily) {
    if (fontFamily == null || fontFamily.trim().isEmpty) {
      return null;
    }

    final normalized = fontFamily
        .replaceAll('"', '')
        .replaceAll("'", '')
        .trim()
        .toLowerCase();

    if (normalized == 'times-new-roman' ||
        normalized == 'times new roman' ||
        normalized == 'times') {
      return 'Times New Roman';
    }

    if (normalized == 'verdana') {
      return 'Verdana';
    }

    return null;
  }

  String removeFontSize(String html) {
    html = decodeHtmlEntities(html);

    final result = html
        .replaceAll(
          RegExp(r'font-size\s*:\s*[^;"]+;?', caseSensitive: false),
          '',
        )
        .replaceAll(
          RegExp(r'line-height\s*:\s*[^;"]+;?', caseSensitive: false),
          'line-height:24px;',
        )
        .replaceAll(
          RegExp(r'border-left\s*:\s*[^;"]+;?', caseSensitive: false),
          '',
        )
        .replaceAll(
          RegExp(r'padding-left\s*:\s*[^;"]+;?', caseSensitive: false),
          '',
        )
        .replaceAll(RegExp(r'padding\s*:\s*[^;"]+;?', caseSensitive: false), '')
        .replaceAll(
          RegExp(
            r'background(?:-color)?\s*:\s*(?:white|#fff(?:fff)?|rgb\s*\(\s*255\s*,\s*255\s*,\s*255\s*\))\s*;?',
            caseSensitive: false,
          ),
          '',
        )
        .replaceAll(RegExp(r'(&nbsp;\s*)+', caseSensitive: false), '');

    return result;
  }

  String cleanHtml(String html) {
    html = decodeHtmlEntities(html);

    return html
        .replaceAll(RegExp(r'margin:[^;"]*;?'), '')
        .replaceAll(RegExp(r'line-height:[^;"]*;?'), '')
        .replaceAll(
          RegExp(
            r'background(?:-color)?\s*:\s*(?:white|#fff(?:fff)?|rgb\s*\(\s*255\s*,\s*255\s*,\s*255\s*\))\s*;?',
            caseSensitive: false,
          ),
          '',
        )
        //    .replaceAll(
        //   RegExp(r'background(?:-color)?\s*:\s*[^;"]+;?', caseSensitive: false),
        //   '',
        // )
        .replaceAll('text-align:justify;', 'text-align:left;')
        .replaceAll(
          RegExp(
            r'<p(?:\s[^>]*)?>\s*(?:&nbsp;|\u00A0|\s)*</p>',
            caseSensitive: false,
          ),
          '',
        )
        ;
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

  const VideoWebView({super.key, required this.url});

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

  const YoutubePlayerWidget({super.key, required this.src});

  @override
  State<YoutubePlayerWidget> createState() => _YoutubePlayerWidgetState();
}

class _YoutubePlayerWidgetState extends State<YoutubePlayerWidget> {
  late final YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();

    final id = YoutubePlayer.convertUrlToId(widget.src) ?? "";

    _controller = YoutubePlayerController(
      initialVideoId: id,
      flags: const YoutubePlayerFlags(autoPlay: false),
    );
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayer(controller: _controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
