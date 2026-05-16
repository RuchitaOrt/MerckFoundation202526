
import 'package:flutter/material.dart';
import 'package:merckfoundation_252026/Utils/common_strings.dart';
import 'package:provider/provider.dart';

import 'package:merckfoundation_252026/Provider/article_provider.dart';
import 'package:merckfoundation_252026/model/ArticleModel.dart';
import 'package:merckfoundation_252026/screens/MainScreens/CommonListingScreen.dart';
import 'package:merckfoundation_252026/screens/MainUIBody.dart/DetailScreen.dart';

// // class ArticlesScreen extends StatelessWidget {
// //    final String menuID;
// //   final String title;
  

// //   final String? shareLink;
// //   const ArticlesScreen({super.key, required this.menuID, required this.title, this.shareLink});

// //   @override
// //   Widget build(BuildContext context) {
// //     return CommonListingScreen<ArticleModel, ArticleProvider>(
// //       title:CommonStrings.articles,

// //       getList: (provider) => provider.articleList,
// //       isLoading: (provider) => provider.isLoading,
// //       hasMore: (provider) => provider.hasMore,

// //       loadInitial: (context) =>
// //           context.read<ArticleProvider>().loadInitial(context),

// //       loadMore: (context) =>
// //           context.read<ArticleProvider>().loadMore(context),

// //       getImage: (item) => item.image ?? "",
// //       getTitle: (item) => item.title ?? "",
// //       shareLink: shareLink,
// //       menuID: menuID,
// //       onTap: (context, item) {
// //         Navigator.push(
// //           context,
// //           MaterialPageRoute(
// //             builder: (_) => DetailScreen(
// //               "","",
// //               // item.title ?? "",
// //               // item.details ?? "",
// //               title: "Articles",
// //               articleId:item.id.toString(),
// //               languageId: item.language_id ?? "",
// //               isDetailApiCalled: true,
// //               shareLink: shareLink,

// //             ),
// //           ),
// //         );
// //       },
// //     );
// //   }
// // }
// import 'package:flutter/material.dart';
// import 'package:merckfoundation_252026/Utility/api_status.dart';
// import 'package:provider/provider.dart';

// import 'package:merckfoundation_252026/Provider/article_provider.dart';
// import 'package:merckfoundation_252026/model/ArticleModel.dart';
// import 'package:merckfoundation_252026/screens/MainScreens/CommonListingScreen.dart';
// import 'package:merckfoundation_252026/screens/MainUIBody.dart/DetailScreen.dart';

// import 'package:merckfoundation_252026/widgets/CommonApiStatusWidget.dart';

// class ArticlesScreen extends StatelessWidget {

//   final String menuID;

//   final String title;

//   final String? shareLink;

//   const ArticlesScreen({
//     super.key,
//     required this.menuID,
//     required this.title,
//     this.shareLink,
//   });

//   @override
//   Widget build(BuildContext context) {

//     return Consumer<ArticleProvider>(
//       builder: (context, provider, _) {

//         /// LOADING
//         if (provider.status ==
//             ApiStatus.loading &&
//             provider.articleList.isEmpty) {

//           return const Scaffold(
//             body: Center(
//               child:
//                   CircularProgressIndicator(),
//             ),
//           );
//         }

//         /// NO INTERNET
//         if (provider.status ==
//             ApiStatus.noInternet) {

//           return Scaffold(
//             body:
//                 CommonApiStatusWidget(
//               icon: Icons.wifi_off,

//               title:
//                   "No Internet Connection",

//               onRetry: () {

//                 provider.retryInitial(
//                   context,
//                 );
//               },
//             ),
//           );
//         }

//         /// TIMEOUT
//         if (provider.status ==
//             ApiStatus.timeout) {

//           return Scaffold(
//             body:
//                 CommonApiStatusWidget(
//               icon: Icons.access_time,

//               title:
//                   "Request Timeout",

//               onRetry: () {

//                 provider.retryInitial(
//                   context,
//                 );
//               },
//             ),
//           );
//         }

//         /// SERVER ERROR
//         if (provider.status ==
//             ApiStatus.serverError) {

//           return Scaffold(
//             body:
//                 CommonApiStatusWidget(
//               icon: Icons.cloud_off,

//               title: "Server Error",

//               onRetry: () {

//                 provider.retryInitial(
//                   context,
//                 );
//               },
//             ),
//           );
//         }

//         /// OTHER ERROR
//         if (provider.status ==
//             ApiStatus.error) {

//           return Scaffold(
//             body:
//                 CommonApiStatusWidget(
//               icon: Icons.error_outline,

//               title:
//                   provider.errorMessage,

//               onRetry: () {

//                 provider.retryInitial(
//                   context,
//                 );
//               },
//             ),
//           );
//         }

//         /// SUCCESS UI
//         return CommonListingScreen<
//             ArticleModel,
//             ArticleProvider>(

//           title: title,

//           getList: (provider) =>
//               provider.articleList,

//           isLoading: (provider) =>
//               provider.isLoading,

//           hasMore: (provider) =>
//               provider.hasMore,
//   getStatus: (provider) =>
//       provider.status,

//   getErrorMessage:
//       (provider) =>
//           provider.errorMessage,

//   onRetry: (context) =>
//       context
//           .read<ArticleProvider>()
//           .retryInitial(context),

 
//           loadInitial: (context) =>
//               context
//                   .read<ArticleProvider>()
//                   .loadInitial(
//                     context,
//                   ),

//           loadMore: (context) =>
//               context
//                   .read<ArticleProvider>()
//                   .loadMore(
//                     context,
//                   ),

//           getImage: (item) =>
//               item.image ?? "",

//           getTitle: (item) =>
//               item.title ?? "",

//           shareLink: shareLink,

//           menuID: menuID,

//           onTap: (context, item) {

//             Navigator.push(
//               context,
//               MaterialPageRoute(
//                 builder: (_) =>
//                     DetailScreen(
//                   "",
//                   "",
//                   title: "Articles",
//                   articleId:
//                       item.id.toString(),
//                   languageId:
//                       item.language_id ??
//                           "",
//                   isDetailApiCalled:
//                       true,
//                   shareLink:
//                       shareLink,
//                 ),
//               ),
//             );
//           },
//         );
//       },
//     );
//   }
// }

class ArticlesScreen extends StatelessWidget {
  final String menuID;
  final String title;
  final String? shareLink;

  const ArticlesScreen({
    super.key,
    required this.menuID,
    required this.title,
    this.shareLink,
  });

  @override
  Widget build(BuildContext context) {
    return CommonListingScreen<ArticleModel, ArticleProvider>(
      title: title,
      menuID: menuID,
      shareLink: shareLink,

      getList: (provider) => provider.articleList,
      isLoading: (provider) => provider.isLoading,
      hasMore: (provider) => provider.hasMore,
      getStatus: (provider) => provider.status,
      getErrorMessage: (provider) => provider.errorMessage,

      onRetry: (context) =>
          context.read<ArticleProvider>().retryInitial(context),

      loadInitial: (context) =>
          context.read<ArticleProvider>().loadInitial(context),

      loadMore: (context) =>
          context.read<ArticleProvider>().loadMore(context),

      getImage: (item) => item.image ?? "",
      getTitle: (item) => item.title ?? "",

      onTap: (context, item) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => DetailScreen(
              "",
              "",
              title: "Articles",
              articleId: item.id.toString(),
              languageId: item.language_id ?? "",
              isDetailApiCalled: true,
              shareLink: shareLink,
            ),
          ),
        );
      },
    );
  }
}