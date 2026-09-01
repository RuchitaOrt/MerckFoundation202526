import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
// import 'package:webview_flutter/webview_flutter.dart';
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

}
