// // import 'package:flutter/material.dart';
// // import 'package:flutter_pdf_flipbook/flutter_pdf_flipbook.dart';
// // import 'package:merckfoundation_252026/CommonUtils/customcolor.dart';


// // class DigitalLibraryViewer extends StatelessWidget {

// //   final String pdfUrl;

// //   const DigitalLibraryViewer({
// //     super.key,
// //     required this.pdfUrl,
// //   });


// //   @override
// //   Widget build(BuildContext context) {

// //     return Scaffold(
// //       backgroundColor: Customcolor.white,
// //       appBar: AppBar(
// //         backgroundColor: Customcolor.white,
// //         leading: GestureDetector(
// //         onTap: ()
// //         {
// //           Navigator.pop(context);
// //         },
// //         child: Icon(Icons.arrow_back,color: Colors.black,)),),
// //       body: 
      
// //       PdfBookViewer(
       
// //         showNavigationControls: false,
// //         backgroundColor: Customcolor.white,
// //         pdfUrl: pdfUrl,
        
// //       ),

// //     );
// //   }
// // }

// import 'package:dio/dio.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:merckfoundation_252026/Utility/APIManager.dart';
// import 'package:open_filex/open_filex.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:webview_flutter/webview_flutter.dart';
// import 'package:merckfoundation_252026/CommonUtils/customcolor.dart';

// class DigitalLibraryViewer extends StatefulWidget {

//   final String pdfUrl;

//   const DigitalLibraryViewer({
//     super.key,
//     required this.pdfUrl,
//   });


//   @override
//   State<DigitalLibraryViewer> createState() =>
//       _DigitalLibraryViewerState();
// }


// class _DigitalLibraryViewerState extends State<DigitalLibraryViewer> {

//   bool isLoading = true;

//   late WebViewController controller;
// String getSanityUrl(String pageUrl) {
//   const mediaPath = '/media/';

//   final index = pageUrl.indexOf(mediaPath);

//   if (index == -1) {
//     return pageUrl;
//   }

//   final pathAfterMedia =
//       pageUrl.substring(index + mediaPath.length);

//   return 'https://sanity.merck-foundation.com/flipbook-proxy/$pathAfterMedia';
// }
//   @override
//   void initState() {
//     super.initState();
//     print("DIGIRALpdf");
//  print("${widget.pdfUrl}");

// // final pdfViewerUrl =

// // https://sanity.merck-foundation.com/flipbook-proxy/news_and_application/8552f984-235a-42b1-9db1-d36ed820f08e_TUM%20HI%20HO%203.pdf
// // https://sanity.merck-foundation.com/flipbook-proxy/news_and_applications/1764061440_61341f0c02e7cd3028aa.pdf
//     // 'https://mf-front-v2-uat.ortdemo.com/pdf-viewer'
//     // '?url=${Uri.encodeComponent(widget.pdfUrl)}';
//     // "https://sanity.merck-foundation.com/flipbook-proxy/news_and_applications/1764061440_61341f0c02e7cd3028aa.pdf";
// // final pdfViewerUrl =
// //     'https://sanity.merck-foundation.com/flipbook-proxy/news_and_applications/1764061440_61341f0c02e7cd3028aa.pdf';
//   // 'https://mf-front-v2-uat.ortdemo.com/pdf-viewer'
//     // '?url=${Uri.encodeComponent(widget.pdfUrl)}';

//     // https://sanity.merck-foundation.com/flipbook-proxy/digital_library/1639993429_cca7a831eeb6dbe2c188.pdf
//     // "https://sanity.merck-foundation.com/flipbook-proxy/${"/digital_library/1777285839_08f4b190035b71be43e1.pdf"}";
//     final sanityPdfUrl = getSanityUrl(widget.pdfUrl);

// final pdfViewerUrl =sanityPdfUrl;
//     // 'https://mf-front-v2-uat.ortdemo.com/pdf-viewer'
//     // '?url=${Uri.encodeComponent(sanityPdfUrl)}';
// debugPrint('PDF URL: ${widget.pdfUrl}');
// debugPrint('PDF Viewer URL: $pdfViewerUrl');

// controller = WebViewController()
//   ..setJavaScriptMode(JavaScriptMode.unrestricted)
//   ..setNavigationDelegate(
//     NavigationDelegate(
//       onPageStarted: (url) {
//         debugPrint('➡️ Started: $url');

//         if (mounted) {
//           setState(() {
//             isLoading = true;
//           });
//         }
//       },

//       onPageFinished: (url) {
//         debugPrint('✅ Finished: $url');

//         if (mounted) {
//           setState(() {
//             isLoading = false;
//           });
//         }
//       },

//       onUrlChange: (change) {
//         debugPrint('🔄 URL Changed: ${change.url}');
//       },

//       onWebResourceError: (error) {
//         debugPrint('❌ Web Error');
//         debugPrint('Description: ${error.description}');
//         debugPrint('Code: ${error.errorCode}');
//         debugPrint('URL: ${error.url}');
//       },
//     ),
//   )
//   ..loadRequest(Uri.parse(pdfViewerUrl));
// // print('PDF URL: ${widget.pdfUrl}');

// //     final flipBookUrl =
// //     // "https://mf-front-v2-uat.ortdemo.com/pdf-viewer?url=https%3A%2F%2Fmerck-uat-bucket.s3.ap-south-1.amazonaws.com%2Fmedia%2Fdigital_library%2F1760607426_e5e3447ae2996a8d743f.pdf";
// //        "${APIManager.baseURL}pdf-viewer?url=${Uri.encodeComponent(widget.pdfUrl)}";
// // controller = WebViewController()
// //   ..setJavaScriptMode(JavaScriptMode.unrestricted)

// //   ..setNavigationDelegate(
// //     NavigationDelegate(
// //       onPageStarted: (url) {
// //         debugPrint("➡️ Started: $url");
// //         setState(() {
// //           isLoading = true;
// //         });
// //       },

// //       onPageFinished: (url) async {
// //         debugPrint("✅ Finished: $url");

// //         setState(() {
// //           isLoading = false;
// //         });

// //         // Print console errors if any
// //         try {
// //           final title = await controller.getTitle();
// //           debugPrint("Title: $title");
// //         } catch (_) {}
// //       },

// //        onNavigationRequest: (request) async {
// //     debugPrint(request.url);

// //     if (request.url.contains("/api/pdf-proxy")) {
// //       // Download using Dio/http
// //       await downloadPdf(request.url);
// //       return NavigationDecision.prevent;
// //     }

// //     return NavigationDecision.navigate;
// //   },

// //       onUrlChange: (change) {
// //         debugPrint("🔄 URL Changed: ${change.url}");
// //       },

// //       onWebResourceError: (error) {
// //         debugPrint("❌ Web Error");
// //         debugPrint(error.description);
// //         debugPrint("Code: ${error.errorCode}");
// //         debugPrint("URL: ${error.url}");
// //       },
// //     ),
// //   )

// //   ..loadRequest(Uri.parse(flipBookUrl));

//     // controller = WebViewController()
//     //   ..setJavaScriptMode(JavaScriptMode.unrestricted)

//     //   ..setNavigationDelegate(
//     //     NavigationDelegate(

//     //       onPageStarted: (url){
//     //         setState(() {
//     //           isLoading = true;
//     //         });
//     //       },

//     //       onPageFinished: (url){
//     //         setState(() {
//     //           isLoading = false;
//     //         });
//     //       },

//     //       onWebResourceError: (error){
//     //         debugPrint(error.description);
//     //       },

//     //     ),
//     //   )

//     //   ..loadRequest(Uri.parse(flipBookUrl));

//   }



//   @override
//   Widget build(BuildContext context) {

//     return Scaffold(

//       backgroundColor: Colors.white,

//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         leading: IconButton(
//           icon: const Icon(
//             Icons.arrow_back,
//             color: Colors.black,
//           ),
//           onPressed: (){
//             Navigator.pop(context);
//           },
//         ),
//       ),


//       body: Stack(
//         children: [

//           WebViewWidget(
//             controller: controller,
//           ),


//           if(isLoading)
//             const Center(
//               child: CircularProgressIndicator(),
//             ),

//         ],
//       ),

//     );
//   }


// Future<void> downloadPdf(String url) async {
//  final dir = await getApplicationDocumentsDirectory();

//   final filePath = "${dir.path}/document.pdf";

//   await Dio().download(url, filePath);

//   print("Saved at $filePath");

//   final result = await OpenFilex.open(filePath);

//   print(result.type);
//   print(result.message);
// }
// }
// // class DigitalLibraryViewer extends StatefulWidget {

// //   final String pdfUrl;

// //   const DigitalLibraryViewer({
// //     super.key,
// //     required this.pdfUrl,
// //   });


// //   @override
// //   State<DigitalLibraryViewer> createState() =>
// //       _DigitalLibraryViewerState();
// // }



// // class _DigitalLibraryViewerState 
// //     extends State<DigitalLibraryViewer> {


// //   late WebViewController controller;


// //   @override
// //   void initState() {
// //     super.initState();


// //     final flipbookUrl =
// //         "https://sanity.merck-foundation.com/pdf-viewer?url=${widget.pdfUrl}";


// //     controller = WebViewController()
// //       ..setJavaScriptMode(
// //         JavaScriptMode.unrestricted,
// //       )
// //       ..setNavigationDelegate(
// //         NavigationDelegate(
// //           onPageStarted: (url){
// //             debugPrint("Loading: $url");
// //           },
// //           onPageFinished: (url){
// //             debugPrint("Finished: $url");
// //           },
// //         ),
// //       )
// //       ..loadRequest(
// //         Uri.parse(flipbookUrl),
// //       );
// //   }



// //   @override
// //   Widget build(BuildContext context) {

// //     return Scaffold(

// //       backgroundColor: Customcolor.white,

// //       appBar: AppBar(
// //         backgroundColor: Customcolor.white,
// //         leading: IconButton(
// //           icon: const Icon(
// //             Icons.arrow_back_ios,
// //             color: Colors.black,
// //           ),
// //           onPressed: (){
// //             Navigator.pop(context);
// //           },
// //         ),
// //       ),


// //       body: Padding(
// //         padding: const EdgeInsets.only(bottom: 5),
// //         child: WebViewWidget(
// //           controller: controller,
// //         ),
// //       ),

// //     );
// //   }
// // }
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:merckfoundation_252026/Utility/APIManager.dart';
import 'package:open_filex/open_filex.dart';
import 'package:path_provider/path_provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:merckfoundation_252026/CommonUtils/customcolor.dart';

class DigitalLibraryViewer extends StatefulWidget {
  final String pdfUrl;

  const DigitalLibraryViewer({
    super.key,
    required this.pdfUrl,
  });

  @override
  State<DigitalLibraryViewer> createState() =>
      _DigitalLibraryViewerState();
}

class _DigitalLibraryViewerState extends State<DigitalLibraryViewer> {
  bool isLoading = true;

  // Changed only from late to nullable so that
  // WebView is not created when URL is opened in browser.
  WebViewController? controller;

  // Used only for URL which doesn't contain /media/
  bool openInBrowser = false;

  String getSanityUrl(String pageUrl) {
    const mediaPath = '/media/';

    final index = pageUrl.indexOf(mediaPath);

    if (index == -1) {
      return pageUrl;
    }

    final pathAfterMedia =
        pageUrl.substring(index + mediaPath.length);

    return 'https://sanity.merck-foundation.com/flipbook-proxy/$pathAfterMedia';
  }

  @override
  void initState() {
    super.initState();

    print("DIGIRALpdf");
    print("${widget.pdfUrl}");

    const mediaPath = '/media/';

    // ---------------------------------------------------------
    // ONLY NEW LOGIC:
    // If /media/ is NOT found, open original URL in browser.
    // ---------------------------------------------------------

    if (!widget.pdfUrl.contains(mediaPath)) {
      debugPrint('⚠️ /media/ not found');
      debugPrint('🌐 Opening original URL in external browser');

      openInBrowser = true;

      WidgetsBinding.instance.addPostFrameCallback((_) {
        _openExternalBrowser(widget.pdfUrl);
      });

      return;
    }

    // ---------------------------------------------------------
    // YOUR EXISTING LOGIC STARTS HERE
    // ---------------------------------------------------------

    final sanityPdfUrl = getSanityUrl(widget.pdfUrl);

    final pdfViewerUrl = sanityPdfUrl;

    debugPrint('PDF URL: ${widget.pdfUrl}');
    debugPrint('PDF Viewer URL: $pdfViewerUrl');

    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (url) {
            debugPrint('➡️ Started: $url');

            if (mounted) {
              setState(() {
                isLoading = true;
              });
            }
          },

          onPageFinished: (url) {
            debugPrint('✅ Finished: $url');

            if (mounted) {
              setState(() {
                isLoading = false;
              });
            }
          },

          onUrlChange: (change) {
            debugPrint('🔄 URL Changed: ${change.url}');
          },

          onWebResourceError: (error) {
            debugPrint('❌ Web Error');
            debugPrint('Description: ${error.description}');
            debugPrint('Code: ${error.errorCode}');
            debugPrint('URL: ${error.url}');
          },
        ),
      )
      ..loadRequest(
        Uri.parse(pdfViewerUrl),
      );
  }

  Future<void> _openExternalBrowser(String url) async {
    try {
      final uri = Uri.parse(url);

      debugPrint('🌐 Opening browser: $url');

      final opened = await launchUrl(
        uri,
        mode: LaunchMode.externalApplication,
      );

      debugPrint('🌐 Browser opened: $opened');

      if (!opened) {
        debugPrint('❌ Could not open browser');

        if (mounted) {
          setState(() {
            isLoading = false;
          });

          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text(
                'Unable to open document in browser',
              ),
            ),
          );
        }
      } else {
        if (mounted) {
          setState(() {
            isLoading = false;
          });
        }
      }
    } catch (e) {
      debugPrint('❌ Error opening browser: $e');

      if (mounted) {
        setState(() {
          isLoading = false;
        });

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              'Unable to open document',
            ),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        backgroundColor: Colors.white,

        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),

      body: Stack(
        children: [
          // ---------------------------------------------------
          // Existing WebView logic.
          // It will only be shown when /media/ exists.
          // ---------------------------------------------------

          if (!openInBrowser && controller != null)
            WebViewWidget(
              controller: controller!,
            ),

          // ---------------------------------------------------
          // Loading indicator
          // ---------------------------------------------------

          if (isLoading && !openInBrowser)
            const Center(
              child: CircularProgressIndicator(),
            ),
        ],
      ),
    );
  }

  Future<void> downloadPdf(String url) async {
    final dir = await getApplicationDocumentsDirectory();

    final filePath = "${dir.path}/document.pdf";

    await Dio().download(
      url,
      filePath,
    );

    print("Saved at $filePath");

    final result = await OpenFilex.open(
      filePath,
    );

    print(result.type);
    print(result.message);
  }
}