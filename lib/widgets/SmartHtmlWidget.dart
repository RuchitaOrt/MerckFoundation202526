
// // import 'package:flutter/material.dart';
// // import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
// // import 'package:merckfoundation_252026/widgets/NoStyleFactory.dart';
// // import 'package:youtube_player_flutter/youtube_player_flutter.dart';
// // import 'package:webview_flutter/webview_flutter.dart';

// // // import 'package:merckfoundation_252026/Utility/showdailog.dart';

// // // class SmartHtmlWidget extends StatelessWidget {
// // //   final String html;
// // //   final Color? textColor;
// // //   final double? fontSize;
// // //   final FontWeight? fontWeight;

// // //   const SmartHtmlWidget({
// // //     super.key,
// // //     required this.html,
// // //     this.textColor,
// // //     this.fontSize,
// // //     this.fontWeight,
// // //   });

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return HtmlWidget(
// // //       cleanHtml(html),
// // //       key: ValueKey(html),
// // //       renderMode: RenderMode.column,
// // //       enableCaching: false,
// // //       textStyle: TextStyle(
// // //         fontSize: fontSize,
// // //         height: 1.4,
// // //         color: textColor,
// // //         fontWeight: fontWeight,
// // //       ),

// // //       /// ✅ LINK STYLE
// // //       customStylesBuilder: (element) {
// // //         if (element.localName == 'a') {
// // //           return {
// // //             'color': '#1a0dab',
// // //             'text-decoration': 'underline',
// // //           };
// // //         }
// // //         return null;
// // //       },

// // //       /// ✅ CUSTOM WIDGETS
// // //       customWidgetBuilder: (element) {
// // //         /// 🔹 HANDLE IFRAME (YouTube best way)
// // //         if (element.localName == 'iframe') {
// // //           final iframeSrc = element.attributes['src'];

// // //           if (iframeSrc != null && iframeSrc.contains("youtube.com")) {
// // //             final videoId = YoutubePlayer.convertUrlToId(iframeSrc);

// // //             if (videoId != null) {
// // //               return YoutubePlayer(
// // //                 controller: YoutubePlayerController(
// // //                   initialVideoId: videoId,
// // //                   flags: const YoutubePlayerFlags(
// // //                     autoPlay: false,
// // //                     disableDragSeek: false,
// // //                     loop: false,
// // //                     enableCaption: true,
// // //                   ),
// // //                 ),
// // //                 showVideoProgressIndicator: true,
// // //               );
// // //             }
// // //           }
// // //         }

// // //         /// 🔹 HANDLE VIDEO TAG (fallback to WebView)
// // //         if (element.localName == 'video') {
// // //           final sourceElement = element.children
// // //               .where((e) => e.localName == 'source')
// // //               .toList();

// // //           if (sourceElement.isNotEmpty) {
// // //             final src = sourceElement.first.attributes['src'];

// // //             if (src != null && src.isNotEmpty) {
// // //               final controller = WebViewController()
// // //                 ..setJavaScriptMode(JavaScriptMode.unrestricted)
// // //                 ..loadRequest(Uri.parse(src));

// // //               return SizedBox(
// // //                 height: 300,
// // //                 width: double.infinity,
// // //                 child: WebViewWidget(controller: controller),
// // //               );
// // //             }
// // //           }
// // //         }

// // //         return null;
// // //       },

// // //       /// ✅ LINK CLICK
// // //       onTapUrl: (url) {
// // //         ShowDialogs.launchURL(url);
// // //         return true;
// // //       },
// // //     );
// // //   }
// // // }

// // // /// ✅ CLEAN HTML (better mobile rendering)

// // import 'package:merckfoundation_252026/Utility/showdailog.dart';

// // class SmartHtmlWidget extends StatelessWidget {
// //   final String html;
// //   final Color? textColor;
// //   final double? fontSize;
// //   final FontWeight? fontWeight;

// //   /// ✅ NEW
// //   final bool ignoreHtmlStyles;

// //   const SmartHtmlWidget({
// //     super.key,
// //     required this.html,
// //     this.textColor,
// //     this.fontSize,
// //     this.fontWeight,
// //     this.ignoreHtmlStyles = false,
// //   });

// //   @override
// //   Widget build(BuildContext context) {
// //     return HtmlWidget(
// //       cleanHtml(html),

// //       key: ValueKey(html),
// //       renderMode: RenderMode.column,
// //       enableCaching: false,

// //       textStyle: TextStyle(
// //         fontSize: fontSize,
// //         height: 1.4,
// //         color: textColor,
// //         fontWeight: fontWeight,
// //       ),

// //       /// ✅ APPLY ONLY WHEN NEEDED
// //   factoryBuilder: ignoreHtmlStyles
// //       ? (() => NoStyleFactory())
// //       : null,

// //       customStylesBuilder: (element) {
// //         if (element.localName == 'a') {
// //           return {
// //             'color': '#1a0dab',
// //             'text-decoration': 'underline',
// //           };
// //         }

// //         /// ✅ REMOVE ALL INLINE STYLE
// //         if (ignoreHtmlStyles) {
// //           return {};
// //         }

// //         return null;
// //       },

// //       onTapUrl: (url) {
// //         ShowDialogs.launchURL(url);
// //         return true;
// //       },
// //     );
// //   }
// //   String cleanHtml(String html) {
// //   return html
// //       .replaceAll(RegExp(r'margin:[^;"]*;?'), '')
// //       .replaceAll(RegExp(r'line-height:[^;"]*;?'), '')
// //       .replaceAll(RegExp(r'font-size:[^;"]*;?'), '')
// //       .replaceAll('text-align:justify;', 'text-align:left;');
// // }
// // }
// import 'package:flutter/material.dart';
// import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
// import 'package:youtube_player_flutter/youtube_player_flutter.dart';
// import 'package:webview_flutter/webview_flutter.dart';

// import 'package:merckfoundation_252026/Utility/showdailog.dart';

// class SmartHtmlWidget extends StatelessWidget {
//   final String html;
//   final Color? textColor;
//   final double? fontSize;
//   final FontWeight? fontWeight;

//   /// ✅ if true -> ignore all html styles
//   final bool ignoreHtmlStyles;

//   const SmartHtmlWidget({
//     super.key,
//     required this.html,
//     this.textColor,
//     this.fontSize,
//     this.fontWeight,
//     this.ignoreHtmlStyles = false,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return HtmlWidget(
//       cleanHtml(
//         html,
//         removeStyles: ignoreHtmlStyles,
//       ),

//       key: ValueKey(html),

//       renderMode: RenderMode.column,

//       enableCaching: false,

//       textStyle: TextStyle(
//         fontSize: fontSize,
//         height: 1.4,
//         color: textColor,
//         fontWeight: fontWeight,
//       ),

//       /// ✅ LINK STYLE
//       customStylesBuilder: (element) {
//         if (element.localName == 'a') {
//           return {
//             'color': '#1a0dab',
//             'text-decoration': 'underline',
//           };
//         }

//         return null;
//       },

//       /// ✅ CUSTOM WIDGETS
//       customWidgetBuilder: (element) {
//         /// 🔹 HANDLE IFRAME (YouTube)
//         if (element.localName == 'iframe') {
//           final iframeSrc = element.attributes['src'];

//           if (iframeSrc != null &&
//               iframeSrc.contains("youtube.com")) {
//             final videoId =
//                 YoutubePlayer.convertUrlToId(iframeSrc);

//             if (videoId != null) {
//               return YoutubePlayer(
//                 controller: YoutubePlayerController(
//                   initialVideoId: videoId,
//                   flags: const YoutubePlayerFlags(
//                     autoPlay: false,
//                     disableDragSeek: false,
//                     loop: false,
//                     enableCaption: true,
//                   ),
//                 ),
//                 showVideoProgressIndicator: true,
//               );
//             }
//           }
//         }

//         /// 🔹 HANDLE VIDEO TAG
//         if (element.localName == 'video') {
//           final sourceElement = element.children
//               .where((e) => e.localName == 'source')
//               .toList();

//           if (sourceElement.isNotEmpty) {
//             final src =
//                 sourceElement.first.attributes['src'];

//             if (src != null && src.isNotEmpty) {
//               final controller = WebViewController()
//                 ..setJavaScriptMode(
//                   JavaScriptMode.unrestricted,
//                 )
//                 ..loadRequest(Uri.parse(src));

//               return SizedBox(
//                 height: 300,
//                 width: double.infinity,
//                 child: WebViewWidget(
//                   controller: controller,
//                 ),
//               );
//             }
//           }
//         }

//         return null;
//       },

//       /// ✅ LINK CLICK
//       onTapUrl: (url) {
//         ShowDialogs.launchURL(url);
//         return true;
//       },
//     );
//   }
// }

// /// ✅ CLEAN HTML
// String cleanHtml(
//   String html, {
//   bool removeStyles = false,
// }) {
//   String cleaned = html;

//   /// ✅ REMOVE ALL INLINE HTML STYLES
//   if (removeStyles) {
//     cleaned = cleaned.replaceAll(
//       RegExp(r'style="[^"]*"'),
//       '',
//     );

//     cleaned = cleaned.replaceAll(
//       RegExp(r'<font[^>]*>'),
//       '',
//     );

//     cleaned = cleaned.replaceAll(
//       '</font>',
//       '',
//     );
//   }

//   return cleaned
//       .replaceAll(
//         RegExp(r'margin:[^;"]*;?'),
//         '',
//       )
//       .replaceAll(
//         RegExp(r'line-height:[^;"]*;?'),
//         '',
//       )
//       .replaceAll(
//         RegExp(r'font-size:[^;"]*;?'),
//         '',
//       )
//       .replaceAll(
//         'text-align:justify;',
//         'text-align:left;',
//       );
// }
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:merckfoundation_252026/Utility/showdailog.dart';

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
  Widget build(BuildContext context) {

    /// ✅ FOR TITLES / SINGLE LINE TEXT
    if (applyMaxLines) {
      return Text(
        removeAllHtmlTags(
          ignoreHtmlStyles
              ? removeHtmlStyles(html)
              : cleanHtml(html),
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
      ignoreHtmlStyles
          ? removeHtmlStyles(html)
          : cleanHtml(html),

      renderMode: RenderMode.column,

      textStyle: TextStyle(
        color: textColor,
        fontSize: fontSize,
        fontWeight: fontWeight,
        height: 1.4,
      ),

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

            'font-weight':
                fontWeight == FontWeight.w800
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
          return {
            'color': '#1a0dab',
            'text-decoration': 'underline',
          };
        }

        return null;
      },

      onTapUrl: (url) {
        ShowDialogs.launchURL(url);
        return true;
      },
    );
  }

  /// ✅ CLEAN HTML
  String cleanHtml(String html) {
    return html
        .replaceAll(
          RegExp(r'margin:[^;"]*;?'),
          '',
        )
        .replaceAll(
          RegExp(r'line-height:[^;"]*;?'),
          '',
        )
        .replaceAll(
          'text-align:justify;',
          'text-align:left;',
        );
  }

  /// ✅ REMOVE INLINE STYLES
  String removeHtmlStyles(String html) {
    return html

        /// remove style=""
        .replaceAll(
          RegExp(r'style\s*=\s*"[^"]*"'),
          '',
        )

        /// remove class=""
        .replaceAll(
          RegExp(r'class\s*=\s*"[^"]*"'),
          '',
        );
  }

  /// ✅ REMOVE ALL HTML TAGS
  String removeAllHtmlTags(String htmlText) {
    return htmlText.replaceAll(
      RegExp(r'<[^>]*>'),
      '',
    );
  }
}