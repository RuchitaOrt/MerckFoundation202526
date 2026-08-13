// import 'package:flutter/material.dart';
// import 'package:flutter_pdf_flipbook/flutter_pdf_flipbook.dart';
// import 'package:merckfoundation_252026/CommonUtils/customcolor.dart';


// class DigitalLibraryViewer extends StatelessWidget {

//   final String pdfUrl;

//   const DigitalLibraryViewer({
//     super.key,
//     required this.pdfUrl,
//   });


//   @override
//   Widget build(BuildContext context) {

//     return Scaffold(
//       backgroundColor: Customcolor.white,
//       appBar: AppBar(
//         backgroundColor: Customcolor.white,
//         leading: GestureDetector(
//         onTap: ()
//         {
//           Navigator.pop(context);
//         },
//         child: Icon(Icons.arrow_back,color: Colors.black,)),),
//       body: 
      
//       PdfBookViewer(
       
//         showNavigationControls: false,
//         backgroundColor: Customcolor.white,
//         pdfUrl: pdfUrl,
        
//       ),

//     );
//   }
// }

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:merckfoundation_252026/Utility/APIManager.dart';
import 'package:open_filex/open_filex.dart';
import 'package:path_provider/path_provider.dart';
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

  late WebViewController controller;


  @override
  void initState() {
    super.initState();
    print("pdf");

final pdfViewerUrl =
    'https://mf-front-v2-uat.ortdemo.com/pdf-viewer'
    '?url=${Uri.encodeComponent(widget.pdfUrl)}';

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
  ..loadRequest(Uri.parse(pdfViewerUrl));
// print('PDF URL: ${widget.pdfUrl}');

//     final flipBookUrl =
//     // "https://mf-front-v2-uat.ortdemo.com/pdf-viewer?url=https%3A%2F%2Fmerck-uat-bucket.s3.ap-south-1.amazonaws.com%2Fmedia%2Fdigital_library%2F1760607426_e5e3447ae2996a8d743f.pdf";
//        "${APIManager.baseURL}pdf-viewer?url=${Uri.encodeComponent(widget.pdfUrl)}";
// controller = WebViewController()
//   ..setJavaScriptMode(JavaScriptMode.unrestricted)

//   ..setNavigationDelegate(
//     NavigationDelegate(
//       onPageStarted: (url) {
//         debugPrint("➡️ Started: $url");
//         setState(() {
//           isLoading = true;
//         });
//       },

//       onPageFinished: (url) async {
//         debugPrint("✅ Finished: $url");

//         setState(() {
//           isLoading = false;
//         });

//         // Print console errors if any
//         try {
//           final title = await controller.getTitle();
//           debugPrint("Title: $title");
//         } catch (_) {}
//       },

//        onNavigationRequest: (request) async {
//     debugPrint(request.url);

//     if (request.url.contains("/api/pdf-proxy")) {
//       // Download using Dio/http
//       await downloadPdf(request.url);
//       return NavigationDecision.prevent;
//     }

//     return NavigationDecision.navigate;
//   },

//       onUrlChange: (change) {
//         debugPrint("🔄 URL Changed: ${change.url}");
//       },

//       onWebResourceError: (error) {
//         debugPrint("❌ Web Error");
//         debugPrint(error.description);
//         debugPrint("Code: ${error.errorCode}");
//         debugPrint("URL: ${error.url}");
//       },
//     ),
//   )

//   ..loadRequest(Uri.parse(flipBookUrl));

    // controller = WebViewController()
    //   ..setJavaScriptMode(JavaScriptMode.unrestricted)

    //   ..setNavigationDelegate(
    //     NavigationDelegate(

    //       onPageStarted: (url){
    //         setState(() {
    //           isLoading = true;
    //         });
    //       },

    //       onPageFinished: (url){
    //         setState(() {
    //           isLoading = false;
    //         });
    //       },

    //       onWebResourceError: (error){
    //         debugPrint(error.description);
    //       },

    //     ),
    //   )

    //   ..loadRequest(Uri.parse(flipBookUrl));

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
          onPressed: (){
            Navigator.pop(context);
          },
        ),
      ),


      body: Stack(
        children: [

          WebViewWidget(
            controller: controller,
          ),


          if(isLoading)
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

  await Dio().download(url, filePath);

  print("Saved at $filePath");

  final result = await OpenFilex.open(filePath);

  print(result.type);
  print(result.message);
}
}
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



// class _DigitalLibraryViewerState 
//     extends State<DigitalLibraryViewer> {


//   late WebViewController controller;


//   @override
//   void initState() {
//     super.initState();


//     final flipbookUrl =
//         "https://sanity.merck-foundation.com/pdf-viewer?url=${widget.pdfUrl}";


//     controller = WebViewController()
//       ..setJavaScriptMode(
//         JavaScriptMode.unrestricted,
//       )
//       ..setNavigationDelegate(
//         NavigationDelegate(
//           onPageStarted: (url){
//             debugPrint("Loading: $url");
//           },
//           onPageFinished: (url){
//             debugPrint("Finished: $url");
//           },
//         ),
//       )
//       ..loadRequest(
//         Uri.parse(flipbookUrl),
//       );
//   }



//   @override
//   Widget build(BuildContext context) {

//     return Scaffold(

//       backgroundColor: Customcolor.white,

//       appBar: AppBar(
//         backgroundColor: Customcolor.white,
//         leading: IconButton(
//           icon: const Icon(
//             Icons.arrow_back_ios,
//             color: Colors.black,
//           ),
//           onPressed: (){
//             Navigator.pop(context);
//           },
//         ),
//       ),


//       body: Padding(
//         padding: const EdgeInsets.only(bottom: 5),
//         child: WebViewWidget(
//           controller: controller,
//         ),
//       ),

//     );
//   }
// }