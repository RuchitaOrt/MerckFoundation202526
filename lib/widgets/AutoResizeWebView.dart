import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

import 'package:merckfoundation_252026/Utility/showdailog.dart';

class AutoResizeWebView extends StatefulWidget {
  final String htmlContent;

  const AutoResizeWebView({
    super.key,
    required this.htmlContent,
  });

  @override
  State<AutoResizeWebView> createState() => _AutoResizeWebViewState();
}

class _AutoResizeWebViewState extends State<AutoResizeWebView>
    with AutomaticKeepAliveClientMixin {
  // Start with a very small height.
  // JavaScript will update this once the actual HTML height is known.
  double height = 1;

  InAppWebViewController? controller;

  @override
  bool get wantKeepAlive => true;

  @override
  void dispose() {
    controller = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return SizedBox(
      height: height,
      child: InAppWebView(
        initialSettings: InAppWebViewSettings(
          javaScriptEnabled: true,
          transparentBackground: true,

          horizontalScrollBarEnabled: false,
          verticalScrollBarEnabled: false,

          disableVerticalScroll: true,
          disableHorizontalScroll: false,

          supportZoom: false,

          allowsBackForwardNavigationGestures: false,

          allowsInlineMediaPlayback: true,

          disallowOverScroll: true,
          isPagingEnabled: false,
        ),

        gestureRecognizers:
            <Factory<OneSequenceGestureRecognizer>>{
          Factory<HorizontalDragGestureRecognizer>(
            () => HorizontalDragGestureRecognizer(),
          ),
        },

        initialData: InAppWebViewInitialData(
          data: _html(),
          mimeType: "text/html",
          encoding: "utf-8",
        ),

        onWebViewCreated: (c) {
          controller = c;

          controller!.addJavaScriptHandler(
            handlerName: "Height",
            callback: (args) {
              if (!mounted || args.isEmpty) {
                return;
              }

              final dynamic value = args.first;

              if (value is! num) {
                return;
              }

              final double newHeight = value.toDouble();

              if (newHeight <= 0) {
                return;
              }

              // Only update when height actually changes.
              if ((newHeight - height).abs() > 1) {
                setState(() {
                  height = newHeight;
                });
              }
            },
          );
        },

        shouldOverrideUrlLoading:
            (controller, navigationAction) async {
          final url =
              navigationAction.request.url?.toString() ?? "";

          if (url.startsWith("http")) {
            ShowDialogs.launchURL(url);

            return NavigationActionPolicy.CANCEL;
          }

          return NavigationActionPolicy.ALLOW;
        },
      ),
    );
  }

  String _html() {
    return '''
<!DOCTYPE html>

<html>

<head>

<meta charset="utf-8">

<meta name="viewport"
      content="width=device-width, initial-scale=1.0">

<style>

/* =====================================================
   HTML / BODY
   ===================================================== */

html,
body {
  margin: 0;
  padding: 0;

  overflow-x: hidden;
  overflow-y: hidden;

  overscroll-behavior: none;

  touch-action: pan-x;
}


/* =====================================================
   GLOBAL
   ===================================================== */

* {
  box-sizing: border-box;
}


/* =====================================================
   IMAGES
   ===================================================== */

img {
  max-width: 100% !important;
  height: auto !important;
}


/* =====================================================
   DEFAULT TABLE / FIGURE
   ===================================================== */

.table-responsive,
figure.table {
  display: block !important;

  width: 100% !important;
  max-width: 100% !important;

  overflow-x: auto !important;
  overflow-y: hidden !important;

  -webkit-overflow-scrolling: touch;

  touch-action: pan-x;

  overscroll-behavior-x: contain;
  overscroll-behavior-y: none;

  margin-top: 0 !important;
  margin-right: 0 !important;
  margin-left: 0 !important;

  margin-bottom: 20px !important;

  padding: 0 !important;
}


/* =====================================================
   RASHA KELEJ CONTENT
   ONLY TABLE HAVING contentInsights
   ===================================================== */

figure.table:has(td.contentInsights) {

  display: block !important;

  width: 100% !important;
  max-width: 100% !important;

  overflow: visible !important;

  margin: 0 !important;
  padding: 0 !important;
}


/* =====================================================
   RASHA TABLE
   ===================================================== */

figure.table:has(td.contentInsights) table {

  display: block !important;

  width: 100% !important;
  max-width: 100% !important;

  min-width: 0 !important;

  margin: 0 !important;
  padding: 0 !important;

  border: 0 !important;

  border-collapse: collapse !important;

  table-layout: auto !important;
}


/* =====================================================
   RASHA TBODY
   ===================================================== */

figure.table:has(td.contentInsights) tbody {

  display: block !important;

  width: 100% !important;

  margin: 0 !important;
  padding: 0 !important;
}


/* =====================================================
   RASHA ROW
   ===================================================== */

figure.table:has(td.contentInsights) tr {

  display: block !important;

  width: 100% !important;

  margin: 0 !important;
  padding: 0 !important;
}


/* =====================================================
   RASHA CELLS
   ===================================================== */

figure.table:has(td.contentInsights) td {

  display: block !important;

  width: 100% !important;

  min-width: 0 !important;

  margin: 0 !important;

  padding: 0 !important;

  white-space: normal !important;

  vertical-align: top !important;

  overflow-wrap: break-word !important;
}


/* =====================================================
   RASHA IMAGE CELL
   ===================================================== */

figure.table:has(td.contentInsights) td:first-child {

  display: block !important;

  width: 100% !important;

  min-width: 0 !important;

  padding: 0 0 15px 0 !important;

  text-align: center !important;
}


/* =====================================================
   RASHA IMAGE FIGURE
   ===================================================== */

figure.table:has(td.contentInsights)
td:first-child figure.image {

  display: block !important;

  width: 100% !important;
  max-width: 100% !important;

  margin: 0 auto !important;
  padding: 0 !important;
}


/* =====================================================
   RASHA IMAGE
   ===================================================== */

figure.table:has(td.contentInsights)
td:first-child img {

  display: block !important;

  width: 100% !important;
  max-width: 100% !important;

  height: auto !important;

  margin: 0 auto !important;
}


/* =====================================================
   RASHA CONTENT CELL
   ===================================================== */

figure.table:has(td.contentInsights)
td.contentInsights {

  display: block !important;

  width: 100% !important;

  min-width: 0 !important;

  padding: 0 !important;

  white-space: normal !important;
}


/* =====================================================
   RASHA TEXT
   ===================================================== */

figure.table:has(td.contentInsights)
td.contentInsights p {

  white-space: normal !important;

  overflow-wrap: break-word !important;

  word-break: normal !important;
}


/* =====================================================
   RASHA TITLE
   ===================================================== */

figure.table:has(td.contentInsights)
td.contentInsights .contentTitle {

  margin-top: 0 !important;
}


/* =====================================================
   DEFAULT TABLES
   ===================================================== */

table {

  border-collapse: collapse !important;

  margin: 0 !important;
  padding: 0 !important;

  width: max-content !important;
  min-width: max-content !important;
}


/* =====================================================
   DEFAULT TABLE CELLS
   ===================================================== */

th,
td {

  padding: 12px 16px;

  white-space: nowrap;

  min-width: 180px;
}


/* =====================================================
   IMPORTANT:
   OVERRIDE DEFAULT td RULE FOR RASHA TABLE
   ===================================================== */

figure.table:has(td.contentInsights) th,
figure.table:has(td.contentInsights) td {

  min-width: 0 !important;

  white-space: normal !important;

  padding: 0 !important;
}

</style>

</head>


<body>

${widget.htmlContent}


<script>

/* =====================================================
   SEND HEIGHT TO FLUTTER
   ===================================================== */

function sendHeight() {

  requestAnimationFrame(function() {

    var bodyHeight =
      document.body
        ? document.body.scrollHeight
        : 0;

    var documentHeight =
      document.documentElement
        ? document.documentElement.scrollHeight
        : 0;

    var h = Math.max(
      bodyHeight,
      documentHeight
    );

    if (h > 0) {

      window.flutter_inappwebview.callHandler(
        'Height',
        h
      );

    }

  });

}


/* =====================================================
   WAIT FOR IMAGES
   ===================================================== */

function waitForImages() {

  var images = document.images;

  if (!images || images.length === 0) {

    sendHeight();

    return;
  }


  var remaining = images.length;


  function imageDone() {

    remaining--;

    if (remaining <= 0) {

      sendHeight();

    }

  }


  for (var i = 0; i < images.length; i++) {

    var img = images[i];


    if (img.complete) {

      if (img.decode) {

        img.decode()
          .then(imageDone)
          .catch(imageDone);

      } else {

        imageDone();

      }

    } else {

      img.addEventListener(
        'load',
        imageDone,
        { once: true }
      );

      img.addEventListener(
        'error',
        imageDone,
        { once: true }
      );

    }

  }

}


/* =====================================================
   RESIZE OBSERVER
   ===================================================== */

if (window.ResizeObserver) {

  var resizeObserver =
      new ResizeObserver(function() {

    sendHeight();

  });


  resizeObserver.observe(document.body);

}


/* =====================================================
   WINDOW LOAD
   ===================================================== */

window.addEventListener(
  'load',
  function() {

    sendHeight();

    waitForImages();

  }
);


/* =====================================================
   EXTRA INITIAL MEASUREMENTS
   ===================================================== */

setTimeout(
  sendHeight,
  100
);

setTimeout(
  sendHeight,
  300
);

setTimeout(
  sendHeight,
  600
);

setTimeout(
  sendHeight,
  1000
);

</script>


</body>

</html>
''';
  }
}
// //code change for Rasha Insight
// import 'dart:convert';

// import 'package:flutter/foundation.dart';
// import 'package:flutter/gestures.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_inappwebview/flutter_inappwebview.dart';
// // import 'package:webview_flutter/webview_flutter.dart';
// import 'package:merckfoundation_252026/Utility/showdailog.dart';



// class AutoResizeWebView extends StatefulWidget {
//   final String htmlContent;

//   const AutoResizeWebView({super.key, required this.htmlContent});

//   @override
//   State<AutoResizeWebView> createState() => _AutoResizeWebViewState();
// }

// class _AutoResizeWebViewState extends State<AutoResizeWebView>
//     with AutomaticKeepAliveClientMixin {
//   double height = 120;

//   InAppWebViewController? controller;
//   @override
//   bool get wantKeepAlive => true;

//   @override
//   void dispose() {
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     super.build(context);
//     return SizedBox(
//       height: height,
//       child: InAppWebView(
//         initialSettings: InAppWebViewSettings(
//           javaScriptEnabled: true,
//           transparentBackground: true,

//           horizontalScrollBarEnabled: false,
//           verticalScrollBarEnabled: false,

//           disableVerticalScroll: true,
//           disableHorizontalScroll: false,

//           supportZoom: false,

//           allowsBackForwardNavigationGestures: false,

//           allowsInlineMediaPlayback: true,
//             // Add these
//   // IMPORTANT
//     disallowOverScroll: true,
//     isPagingEnabled: false,
//         ),
//  gestureRecognizers: <Factory<OneSequenceGestureRecognizer>>{
//     Factory<HorizontalDragGestureRecognizer>(
//       () => HorizontalDragGestureRecognizer(),
//     ),
//   },
//         initialData: InAppWebViewInitialData(
//           data: _html(),
//           mimeType: "text/html",
//           encoding: "utf-8",
//         ),

//         onWebViewCreated: (c) {
//           controller = c;

//           controller!.addJavaScriptHandler(
//             handlerName: "Height",
//             callback: (args) {
//               if (!mounted) return;

//               final h = (args.first as num).toDouble();
//               if ((h - height).abs() > 20) {
//                 setState(() {
//                   height = h;
//                 });
//               }
//               // if ((h - height).abs() > 1) {
//               //   setState(() {
//               //     height = h;
//               //   });
//               // }
//             },
//           );
//         },

//         shouldOverrideUrlLoading: (controller, navigationAction) async {
//           final url = navigationAction.request.url.toString();

//           if (url.startsWith("http")) {
//             ShowDialogs.launchURL(url);

//             return NavigationActionPolicy.CANCEL;
//           }

//           return NavigationActionPolicy.ALLOW;
//         },
//       ),
//     );
//   }
// String _html() {
//   return '''
// <!DOCTYPE html>
// <html>

// <head>

// <meta charset="utf-8">

// <meta name="viewport"
//       content="width=device-width,initial-scale=1.0">

// <style>

// html,
// body {
//   margin: 0;
//   padding: 0;
//   overflow-x: hidden;
//   overflow-y: hidden;
//   overscroll-behavior: none;
//   touch-action: pan-x;
// }

// * {
//   box-sizing: border-box;
// }

// img {
//   max-width: 100% !important;
//   height: auto !important;
// }



// .table-responsive,
// figure.table {
//   display: block !important;

//   width: 100% !important;
//   max-width: 100% !important;

//   overflow-x: auto !important;
//   overflow-y: hidden !important;

//   -webkit-overflow-scrolling: touch;

//   touch-action: pan-x;
//   overscroll-behavior-x: contain;
//   overscroll-behavior-y: none;

//   margin-top: 0 !important;
//   margin-right: 0 !important;
//   margin-left: 0 !important;

//   /* THIS creates the gap */
//   margin-bottom: 20px !important;

//   padding: 0 !important;
// }
// /* =====================================================
//    ONLY CONTENT INSIGHTS TABLE
//    ===================================================== */

// figure.table:has(td.contentInsights) {
//   width: 100% !important;
//   max-width: 100% !important;

//   overflow: visible !important;

//   margin: 0 !important;
//   padding: 0 !important;
// }


// /* Only the table containing contentInsights */

// figure.table:has(td.contentInsights) table {
//   width: 100% !important;
//   max-width: 100% !important;

//   min-width: 0 !important;

//   table-layout: auto !important;

//   border-collapse: collapse !important;
// }


// /* Only this row */

// figure.table:has(td.contentInsights) tr {
//   width: 100% !important;
// }


// /* Only these cells */

// figure.table:has(td.contentInsights) td {
//   white-space: normal !important;

//   min-width: 0 !important;

//   vertical-align: top !important;
// }


// /* Image cell */

// figure.table:has(td.contentInsights) td:first-child {
//   width: 100% !important;

//   display: block !important;

//   padding: 0 0 15px 0 !important;

//   text-align: center !important;
// }


// /* Content cell */

// figure.table:has(td.contentInsights) td.contentInsights {
//   width: 100% !important;

//   display: block !important;

//   padding: 0 !important;
// }


// /* Image */

// figure.table:has(td.contentInsights)
// td:first-child figure.image {
//   width: 100% !important;

//   max-width: 100% !important;

//   margin: 0 auto !important;
// }


// figure.table:has(td.contentInsights)
// td:first-child img {
//   width: 100% !important;

//   max-width: 100% !important;

//   height: auto !important;
// }


// /* Text */

// figure.table:has(td.contentInsights)
// td.contentInsights p {
//   white-space: normal !important;

//   overflow-wrap: break-word !important;

//   word-break: normal !important;
// }
// /* =========================
//    DEFAULT TABLES
//    ========================= */

// table {
//   border-collapse: collapse !important;

//   margin: 0 !important;
//   padding: 0 !important;

//   width: max-content !important;
//   min-width: max-content !important;
// }

// th,
// td {
//   padding: 12px 16px;

//   white-space: nowrap;

//   min-width: 180px;
// }
// // /* =========================
// //    TABLE
// //    ========================= */

// // table {
// //   border-collapse: collapse !important;

// //   margin: 0 !important;
// //   padding: 0 !important;

// //   width: max-content !important;
// //   min-width: max-content !important;
// // }


// // /* =========================
// //    TABLE CELLS
// //    ========================= */

// // th,
// // td {
// //   padding: 12px 16px;
// //   white-space: nowrap;
// //   min-width: 180px;
// // }
// </style>

// </head>

// <body>

// ${widget.htmlContent}

// <script>

// function sendHeight() {

//   var h = Math.max(
//     document.body.scrollHeight,
//     document.documentElement.scrollHeight
//   );

//   window.flutter_inappwebview.callHandler(
//     'Height',
//     h
//   );
// }

// window.onload = function() {
//   sendHeight();
// };

// setTimeout(sendHeight, 300);
// setTimeout(sendHeight, 700);

// </script>

// </body>

// </html>
// ''';
// }

// }
// //correct Code
// // import 'dart:convert';

// // import 'package:flutter/foundation.dart';
// // import 'package:flutter/gestures.dart';
// // import 'package:flutter/material.dart';
// // import 'package:flutter_inappwebview/flutter_inappwebview.dart';
// // // import 'package:webview_flutter/webview_flutter.dart';
// // import 'package:merckfoundation_252026/Utility/showdailog.dart';



// // class AutoResizeWebView extends StatefulWidget {
// //   final String htmlContent;

// //   const AutoResizeWebView({super.key, required this.htmlContent});

// //   @override
// //   State<AutoResizeWebView> createState() => _AutoResizeWebViewState();
// // }

// // class _AutoResizeWebViewState extends State<AutoResizeWebView>
// //     with AutomaticKeepAliveClientMixin {
// //   double height = 120;

// //   InAppWebViewController? controller;
// //   @override
// //   bool get wantKeepAlive => true;

// //   @override
// //   void dispose() {
// //     super.dispose();
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     super.build(context);
// //     return SizedBox(
// //       height: height,
// //       child: InAppWebView(
// //         initialSettings: InAppWebViewSettings(
// //           javaScriptEnabled: true,
// //           transparentBackground: true,

// //           horizontalScrollBarEnabled: false,
// //           verticalScrollBarEnabled: false,

// //           disableVerticalScroll: true,
// //           disableHorizontalScroll: false,

// //           supportZoom: false,

// //           allowsBackForwardNavigationGestures: false,

// //           allowsInlineMediaPlayback: true,
// //             // Add these
// //   // IMPORTANT
// //     disallowOverScroll: true,
// //     isPagingEnabled: false,
// //         ),
// //  gestureRecognizers: <Factory<OneSequenceGestureRecognizer>>{
// //     Factory<HorizontalDragGestureRecognizer>(
// //       () => HorizontalDragGestureRecognizer(),
// //     ),
// //   },
// //         initialData: InAppWebViewInitialData(
// //           data: _html(),
// //           mimeType: "text/html",
// //           encoding: "utf-8",
// //         ),

// //         onWebViewCreated: (c) {
// //           controller = c;

// //           controller!.addJavaScriptHandler(
// //             handlerName: "Height",
// //             callback: (args) {
// //               if (!mounted) return;

// //               final h = (args.first as num).toDouble();
// //               if ((h - height).abs() > 20) {
// //                 setState(() {
// //                   height = h;
// //                 });
// //               }
// //               // if ((h - height).abs() > 1) {
// //               //   setState(() {
// //               //     height = h;
// //               //   });
// //               // }
// //             },
// //           );
// //         },

// //         shouldOverrideUrlLoading: (controller, navigationAction) async {
// //           final url = navigationAction.request.url.toString();

// //           if (url.startsWith("http")) {
// //             ShowDialogs.launchURL(url);

// //             return NavigationActionPolicy.CANCEL;
// //           }

// //           return NavigationActionPolicy.ALLOW;
// //         },
// //       ),
// //     );
// //   }
// // String _html() {
// //   return '''
// // <!DOCTYPE html>
// // <html>

// // <head>

// // <meta charset="utf-8">

// // <meta name="viewport"
// //       content="width=device-width,initial-scale=1.0">

// // <style>

// // html,
// // body {
// //   margin: 0;
// //   padding: 0;
// //   overflow-x: hidden;
// //   overflow-y: hidden;
// //   overscroll-behavior: none;
// //   touch-action: pan-x;
// // }

// // * {
// //   box-sizing: border-box;
// // }

// // img {
// //   max-width: 100% !important;
// //   height: auto !important;
// // }



// // .table-responsive,
// // figure.table {
// //   display: block !important;

// //   width: 100% !important;
// //   max-width: 100% !important;

// //   overflow-x: auto !important;
// //   overflow-y: hidden !important;

// //   -webkit-overflow-scrolling: touch;

// //   touch-action: pan-x;
// //   overscroll-behavior-x: contain;
// //   overscroll-behavior-y: none;

// //   margin-top: 0 !important;
// //   margin-right: 0 !important;
// //   margin-left: 0 !important;

// //   /* THIS creates the gap */
// //   margin-bottom: 20px !important;

// //   padding: 0 !important;
// // }


// // /* =========================
// //    TABLE
// //    ========================= */

// // table {
// //   border-collapse: collapse !important;

// //   margin: 0 !important;
// //   padding: 0 !important;

// //   width: max-content !important;
// //   min-width: max-content !important;
// // }


// // /* =========================
// //    TABLE CELLS
// //    ========================= */

// // th,
// // td {
// //   padding: 12px 16px;
// //   white-space: nowrap;
// //   min-width: 180px;
// // }
// // </style>

// // </head>

// // <body>

// // ${widget.htmlContent}

// // <script>

// // function sendHeight() {

// //   var h = Math.max(
// //     document.body.scrollHeight,
// //     document.documentElement.scrollHeight
// //   );

// //   window.flutter_inappwebview.callHandler(
// //     'Height',
// //     h
// //   );
// // }

// // window.onload = function() {
// //   sendHeight();
// // };

// // setTimeout(sendHeight, 300);
// // setTimeout(sendHeight, 700);

// // </script>

// // </body>

// // </html>
// // ''';
// // }

// // }
