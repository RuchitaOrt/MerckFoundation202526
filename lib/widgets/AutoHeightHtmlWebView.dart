import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class AutoHeightHtmlWebView extends StatefulWidget {
  final String html;
  const AutoHeightHtmlWebView({super.key, required this.html});

  @override
  State<AutoHeightHtmlWebView> createState() => _AutoHeightHtmlWebViewState();
}

class _AutoHeightHtmlWebViewState extends State<AutoHeightHtmlWebView> {
  double _height = 100; // initial safe height

  String _wrapHtml(String body) => '''
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<style>
body { margin: 0; padding: 12px; font-family: system-ui; }
img { width: 100% !important; height: auto !important; }
iframe, video { width: 100% !important; }
* { box-sizing: border-box; }
</style>
</head>
<body>
$body
<script>
  function sendHeight() {
    const height = document.documentElement.scrollHeight;
    window.flutter_inappwebview.callHandler('heightHandler', height);
  }
  window.onload = sendHeight;
</script>
</body>
</html>
''';

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: _height,
      child: InAppWebView(
        initialData: InAppWebViewInitialData(
          data: _wrapHtml(widget.html),
          mimeType: "text/html",
          encoding: "utf-8",
        ),
        initialOptions: InAppWebViewGroupOptions(
  crossPlatform: InAppWebViewOptions(
    javaScriptEnabled: true,
    mediaPlaybackRequiresUserGesture: false,
    disableVerticalScroll: true,
    transparentBackground: true,
   
  ),
  android: AndroidInAppWebViewOptions(
    useHybridComposition: true,
  ),
  ios: IOSInAppWebViewOptions(
    allowsInlineMediaPlayback: true,
  ),
),

        onWebViewCreated: (controller) {
          controller.addJavaScriptHandler(
            handlerName: 'heightHandler',
            callback: (args) {
              final newHeight = (args.first as num).toDouble();
              if (newHeight != _height) {
                setState(() => _height = newHeight);
              }
            },
          );
        },
      ),
    );
  }
}
