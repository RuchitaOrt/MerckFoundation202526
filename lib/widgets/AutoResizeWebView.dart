import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'package:merckfoundation_252026/Utility/showdailog.dart';

class AutoResizeWebView extends StatefulWidget {
  final String htmlContent;

  const AutoResizeWebView({super.key, required this.htmlContent});

  @override
  State<AutoResizeWebView> createState() => _AutoResizeWebViewState();
}

class _AutoResizeWebViewState extends State<AutoResizeWebView> {
  double height = 100;

  late final WebViewController controller;

  @override
  void initState() {
    super.initState();

    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(Colors.transparent)
      ..addJavaScriptChannel(
        'Height',
        onMessageReceived: (JavaScriptMessage message) {
          final newHeight = double.tryParse(message.message);

          if (newHeight != null && mounted) {
            final safeHeight = newHeight.clamp(100.0, 5000.0);

            setState(() {
              height = safeHeight;
            });
          }
        },
      )
      ..setNavigationDelegate(
        NavigationDelegate(
          onNavigationRequest: (NavigationRequest request) {
            final url = request.url;

            if (url.startsWith('http://') || url.startsWith('https://')) {
              ShowDialogs.launchURL(url);
              return NavigationDecision.prevent;
            }

            return NavigationDecision.navigate;
          },
        ),
      );

    _loadHtml();
  }

  Future<void> _loadHtml() async {
    final htmlData =
        '''
<!DOCTYPE html>
<html>
<head>

<meta charset="utf-8">

<meta
  name="viewport"
  content="width=device-width, initial-scale=1.0"
/>

<style>

*{
  box-sizing:border-box;
}

html,
body{
  margin:0;
  padding:0;
  background:transparent;
  overflow-x:auto;
  overflow-y:hidden;
  font-family:sans-serif;
}
/* Images */

img{
  max-width:100% !important;
  height:auto !important;
}

/* Table Scroll Container */

.table-wrapper{
  width:100%;
  overflow-x:scroll;
  overflow-y:hidden;
  -webkit-overflow-scrolling:touch;
  touch-action:pan-x;
}

/* Table */

table{
  border-collapse:collapse !important;
  width:auto !important;
  min-width:max-content !important;
  table-layout:auto !important;
}
/* Header */

th{
  min-height:70px;
  height:70px;
  padding:12px 16px;
  vertical-align:middle;
  text-align:left;
  white-space:nowrap;
}

/* Rows */

td{
  min-height:70px;
  height:70px;
  padding:12px 16px;
  vertical-align:middle;
  white-space:nowrap;
}

/* Prevent Android shrinking columns */

th,
td{
  min-width:180px;
}

/* Links */

a{
  word-break:break-word;
}

/* iframe */

iframe{
  max-width:100%;
}

</style>

</head>

<body>

<div class="table-wrapper">
${widget.htmlContent}
</div>

<script>

function getHeight() {
  return Math.max(
    document.body.scrollHeight,
    document.documentElement.scrollHeight
  );
}

function updateHeight() {
  Height.postMessage(getHeight().toString());
}

window.onload = function() {
  updateHeight();
};

setTimeout(updateHeight, 300);
setTimeout(updateHeight, 800);
setTimeout(updateHeight, 1500);

document.querySelectorAll('img').forEach(function(img){
  img.onload = updateHeight;
});

</script>

</body>
</html>
''';
    await controller.loadRequest(
      Uri.dataFromString(htmlData, mimeType: 'text/html', encoding: utf8),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      height: height,
      width: double.infinity,
      child: WebViewWidget(
        controller: controller,
        gestureRecognizers: {
          Factory<HorizontalDragGestureRecognizer>(
            () => HorizontalDragGestureRecognizer(),
          ),
        },
      ),
    );
  }


  
}
