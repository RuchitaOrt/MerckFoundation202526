import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
// import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:merckfoundation_252026/Utility/showdailog.dart';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

import 'package:merckfoundation_252026/Utility/showdailog.dart';

class AutoResizeWebView extends StatefulWidget {
  final String htmlContent;

  const AutoResizeWebView({super.key, required this.htmlContent});

  @override
  State<AutoResizeWebView> createState() => _AutoResizeWebViewState();
}

class _AutoResizeWebViewState extends State<AutoResizeWebView>
    with AutomaticKeepAliveClientMixin {
  double height = 120;

  InAppWebViewController? controller;
  @override
  bool get wantKeepAlive => true;

  @override
  void dispose() {
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
            // Add these
  // IMPORTANT
    disallowOverScroll: true,
    isPagingEnabled: false,
        ),
 gestureRecognizers: <Factory<OneSequenceGestureRecognizer>>{
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
              if (!mounted) return;

              final h = (args.first as num).toDouble();
              if ((h - height).abs() > 20) {
                setState(() {
                  height = h;
                });
              }
              // if ((h - height).abs() > 1) {
              //   setState(() {
              //     height = h;
              //   });
              // }
            },
          );
        },

        shouldOverrideUrlLoading: (controller, navigationAction) async {
          final url = navigationAction.request.url.toString();

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
      content="width=device-width,initial-scale=1.0">

<style>

html,
body {
  margin: 0;
  padding: 0;
  overflow-x: hidden;
  overflow-y: hidden;
  overscroll-behavior: none;
  touch-action: pan-x;
}

* {
  box-sizing: border-box;
}

img {
  max-width: 100% !important;
  height: auto !important;
}

/* TABLE SCROLL */
// .table-responsive,
// figure.table {
//   width: 100% !important;
//   max-width: 100% !important;

//   overflow-x: auto !important;
//   overflow-y: hidden !important;

//   -webkit-overflow-scrolling: touch;
//   touch-action: pan-x;

//   margin: 0 !important;
//   padding: 0 !important;
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

//   margin: 0 !important;
//   padding: 0 !important;
// }
// table {
//   border-collapse: collapse;
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
/* =========================
   TABLE CONTAINER
   ========================= */

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

  /* THIS creates the gap */
  margin-bottom: 20px !important;

  padding: 0 !important;
}


/* =========================
   TABLE
   ========================= */

table {
  border-collapse: collapse !important;

  margin: 0 !important;
  padding: 0 !important;

  width: max-content !important;
  min-width: max-content !important;
}


/* =========================
   TABLE CELLS
   ========================= */

th,
td {
  padding: 12px 16px;
  white-space: nowrap;
  min-width: 180px;
}
</style>

</head>

<body>

${widget.htmlContent}

<script>

function sendHeight() {

  var h = Math.max(
    document.body.scrollHeight,
    document.documentElement.scrollHeight
  );

  window.flutter_inappwebview.callHandler(
    'Height',
    h
  );
}

window.onload = function() {
  sendHeight();
};

setTimeout(sendHeight, 300);
setTimeout(sendHeight, 700);

</script>

</body>

</html>
''';
}
//   String _html() {
//     return '''
// <!DOCTYPE html>

// <html>

// <head>

// <meta charset="utf-8">

// <meta
// name="viewport"
// content="width=device-width,initial-scale=1.0">

// <style>

// html,body{

// margin:0;
// padding:0;

// overflow:hidden;

// font-family:sans-serif;

// background:transparent;

// }

// *{

// box-sizing:border-box;

// }

// img{

// max-width:100% !important;
// height:auto !important;

// }

// .table-wrapper{
//     width:100%;
//     overflow-x:auto;
//     overflow-y:hidden;
//     white-space:nowrap;
//     -webkit-overflow-scrolling:touch;
//      margin:0;
//     padding:0;
//      /* Better touch scrolling */
//     -webkit-overflow-scrolling: touch;
//     touch-action: pan-x;
// }

// table{
//     border-collapse:collapse;
//     margin:0 !important;
//     padding:0 !important;
//     width:max-content !important;
//     min-width:max-content !important;
// }
// .table-responsive{
//     width:100%;
//     overflow-x:auto;
//     overflow-y:hidden;
//     -webkit-overflow-scrolling:touch;

//       touch-action: pan-x;
// }
// figure.table{
//     display:block !important;
//     width:100% !important;
//     max-width:100% !important;
//     margin:0 !important;
//     overflow-x:auto;
//     overflow-y:hidden;
//     -webkit-overflow-scrolling:touch;
// }
 
// figure.table table{
//     width:max-content !important;
//     min-width:100% !important;
//     margin:0 !important;
//     border-collapse:collapse;
// }
// th,td{

// padding:12px 16px;

// white-space:nowrap;

// min-width:180px;

// }

// </style>

// </head>

// <body>

// <div class="table-wrapper">

// ${widget.htmlContent}

// </div>

// <script>

// function sendHeight(){

// var h=Math.max(

// document.body.scrollHeight,

// document.documentElement.scrollHeight

// );

// window.flutter_inappwebview.callHandler(

// 'Height',

// h

// );

// }

// window.onload=function(){

// sendHeight();

// };

// setTimeout(sendHeight,300);

// setTimeout(sendHeight,700);

// </script>

// </body>

// </html>
// ''';
//   }
}
// class AutoResizeWebView extends StatefulWidget {
//   final String htmlContent;

//   const AutoResizeWebView({super.key, required this.htmlContent});

//   @override
//   State<AutoResizeWebView> createState() => _AutoResizeWebViewState();
// }

// class _AutoResizeWebViewState extends State<AutoResizeWebView> {
//   double height = 100;

//   late final WebViewController controller;

//   @override
//   void initState() {
//     super.initState();

//     controller = WebViewController()
//       ..setJavaScriptMode(JavaScriptMode.unrestricted)
//       ..setBackgroundColor(Colors.transparent)
//       ..addJavaScriptChannel(
//         'Height',
//         onMessageReceived: (JavaScriptMessage message) {
//           final newHeight = double.tryParse(message.message);

//           if (newHeight != null && mounted) {
//             final safeHeight = newHeight.clamp(100.0, 5000.0);

//             setState(() {
//               height = safeHeight;
//             });
//           }
//         },
//       )
//       ..setNavigationDelegate(
//         NavigationDelegate(
//           onNavigationRequest: (NavigationRequest request) {
//             final url = request.url;

//             if (url.startsWith('http://') || url.startsWith('https://')) {
//               ShowDialogs.launchURL(url);
//               return NavigationDecision.prevent;
//             }

//             return NavigationDecision.navigate;
//           },
//         ),
//       );

//     _loadHtml();
//   }

//   Future<void> _loadHtml() async {
//     final htmlData =
//         '''
// <!DOCTYPE html>
// <html>
// <head>

// <meta charset="utf-8">

// <meta
//   name="viewport"
//   content="width=device-width, initial-scale=1.0"
// />

// <style>

// *{
//   box-sizing:border-box;
// }

// html,
// body{
//   margin:0;
//   padding:0;
//   background:transparent;
//   overflow-x:auto;
//   overflow-y:hidden;
//   font-family:sans-serif;
// }
// /* Images */

// img{
//   max-width:100% !important;
//   height:auto !important;
// }

// /* Table Scroll Container */

// .table-wrapper{
//   width:100%;
//   overflow-x:scroll;
//   overflow-y:hidden;
//   -webkit-overflow-scrolling:touch;
//   touch-action:pan-x;
// }

// /* Table */

// table{
//   border-collapse:collapse !important;
//   width:auto !important;
//   min-width:max-content !important;
//   table-layout:auto !important;
// }
// /* Header */

// th{
//   min-height:70px;
//   height:70px;
//   padding:12px 16px;
//   vertical-align:middle;
//   text-align:left;
//   white-space:nowrap;
// }

// /* Rows */

// td{
//   min-height:70px;
//   height:70px;
//   padding:12px 16px;
//   vertical-align:middle;
//   white-space:nowrap;
// }

// /* Prevent Android shrinking columns */

// th,
// td{
//   min-width:180px;
// }

// /* Links */

// a{
//   word-break:break-word;
// }

// /* iframe */

// iframe{
//   max-width:100%;
// }

// </style>

// </head>

// <body>

// <div class="table-wrapper">
// ${widget.htmlContent}
// </div>

// <script>

// function getHeight() {
//   return Math.max(
//     document.body.scrollHeight,
//     document.documentElement.scrollHeight
//   );
// }

// function updateHeight() {
//   Height.postMessage(getHeight().toString());
// }

// window.onload = function() {
//   updateHeight();
// };

// setTimeout(updateHeight, 300);
// setTimeout(updateHeight, 800);
// setTimeout(updateHeight, 1500);

// document.querySelectorAll('img').forEach(function(img){
//   img.onload = updateHeight;
// });

// </script>

// </body>
// </html>
// ''';
//     await controller.loadRequest(
//       Uri.dataFromString(htmlData, mimeType: 'text/html', encoding: utf8),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return 
//     AnimatedContainer(
//       duration: const Duration(milliseconds: 150),
//       height: height,
//       width: double.infinity,
//       child: WebViewWidget(
//         controller: controller,
//         gestureRecognizers: {
//           Factory<HorizontalDragGestureRecognizer>(
//             () => HorizontalDragGestureRecognizer(),
//           ),
//         },
//       ),
//     );
//   }


  
// }
