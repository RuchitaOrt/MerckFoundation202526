// import 'package:flutter/material.dart';
// import 'package:flutter_html/flutter_html.dart';
// import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

// import 'package:merckfoundation_252026/Utility/showdailog.dart';
// import 'package:youtube_player_flutter/youtube_player_flutter.dart';
// import 'package:webview_flutter/webview_flutter.dart';
// class SmartHtmlWidget extends StatelessWidget {
//   final String html;
//   final Color? textColor;
//   final double? fontSize;
//   final FontWeight? fontWeight;

//   const SmartHtmlWidget({
//     super.key,
//     required this.html,
//     this.textColor,
//     this.fontSize,
//     this.fontWeight,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return HtmlWidget(
//       cleanHtml(html),
//       key: ValueKey(html),

//       renderMode: RenderMode.column,
//       enableCaching: false,
//       textStyle: TextStyle(
//         fontSize: fontSize,
//          height: 1.4,
//         color: textColor,fontWeight: fontWeight
//       ),
      
//       // factoryBuilder: () => _CustomWidgetFactory(),

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
//   customWidgetBuilder: (element) {
//               if (element.localName == 'video') {
//                 final src = element.children.firstWhere((e) => e.localName == 'source').attributes['src'];
//                 if (src != null && src.contains('youtube.com')) {
//                   return SizedBox(
//                     height: 300,
//                     width: double.infinity,
//                     child: WebView(
//   initialUrl: src,
//   javascriptMode: JavascriptMode.unrestricted,
// )
//                   );
//                 }
//               }else 
             
//                 if (element.localName == 'iframe') {
//       final iframeSrc = element.attributes['src'];

//       if (iframeSrc != null && iframeSrc.contains("youtube.com")) {
//         final videoId = YoutubePlayer.convertUrlToId(iframeSrc);

//         if (videoId != null) {
//           return YoutubePlayer(
//             controller: YoutubePlayerController(
//               initialVideoId: videoId,
//               flags: YoutubePlayerFlags(
//                 autoPlay: false,
//                 disableDragSeek: false,
//                 loop: false,
//                 enableCaption: true,
//               ),
//             ),
//             showVideoProgressIndicator: true,
//           );
//         }
//       }
//     }
//               return null;
//             },
//       /// ✅ LINK CLICK
//       onTapUrl: (url) {
//         ShowDialogs.launchURL(url);
//         return true;
//       },
//     );
//   }
// }

// String cleanHtml(String html) {
//   return html
//       .replaceAll(RegExp(r'margin:[^;"]*;?'), '') // remove margins
//       .replaceAll(RegExp(r'line-height:[^;"]*;?'), '') // remove line-height
//       .replaceAll(RegExp(r'font-size:[^;"]*;?'), '') // optional
//       .replaceAll('text-align:justify;', 'text-align:left;'); // better for mobile
// }
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'package:merckfoundation_252026/Utility/showdailog.dart';

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
      cleanHtml(html),
      key: ValueKey(html),
      renderMode: RenderMode.column,
      enableCaching: false,
      textStyle: TextStyle(
        fontSize: fontSize,
        height: 1.4,
        color: textColor,
        fontWeight: fontWeight,
      ),

      /// ✅ LINK STYLE
      customStylesBuilder: (element) {
        if (element.localName == 'a') {
          return {
            'color': '#1a0dab',
            'text-decoration': 'underline',
          };
        }
        return null;
      },

      /// ✅ CUSTOM WIDGETS
      customWidgetBuilder: (element) {
        /// 🔹 HANDLE IFRAME (YouTube best way)
        if (element.localName == 'iframe') {
          final iframeSrc = element.attributes['src'];

          if (iframeSrc != null && iframeSrc.contains("youtube.com")) {
            final videoId = YoutubePlayer.convertUrlToId(iframeSrc);

            if (videoId != null) {
              return YoutubePlayer(
                controller: YoutubePlayerController(
                  initialVideoId: videoId,
                  flags: const YoutubePlayerFlags(
                    autoPlay: false,
                    disableDragSeek: false,
                    loop: false,
                    enableCaption: true,
                  ),
                ),
                showVideoProgressIndicator: true,
              );
            }
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

        return null;
      },

      /// ✅ LINK CLICK
      onTapUrl: (url) {
        ShowDialogs.launchURL(url);
        return true;
      },
    );
  }
}

/// ✅ CLEAN HTML (better mobile rendering)
String cleanHtml(String html) {
  return html
      .replaceAll(RegExp(r'margin:[^;"]*;?'), '')
      .replaceAll(RegExp(r'line-height:[^;"]*;?'), '')
      .replaceAll(RegExp(r'font-size:[^;"]*;?'), '')
      .replaceAll('text-align:justify;', 'text-align:left;');
}