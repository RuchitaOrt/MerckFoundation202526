import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:merckfoundation_252026/CommonUtils/common_images.dart';
import 'package:merckfoundation_252026/Utility/ApiStatusHandler.dart';
import 'package:merckfoundation_252026/Utility/ResponsiveFlutter.dart';
import 'package:merckfoundation_252026/const/GlobalLists.dart';
import 'package:merckfoundation_252026/enum/commonEnum.dart';
import 'package:merckfoundation_252026/screens/MainScreens/dashboard.dart';
import 'package:merckfoundation_252026/widgets/CommonWidget/ImageShimmer.dart';
import 'package:provider/provider.dart';
import 'package:merckfoundation_252026/Provider/article_provider.dart';
import 'package:merckfoundation_252026/Utility/api_status.dart';
import 'package:merckfoundation_252026/widgets/CommonWidget/customappbar.dart';
import 'package:merckfoundation_252026/CommonUtils/customcolor.dart';

import 'package:merckfoundation_252026/widgets/CommonWidget/CommonLoader.dart';
import 'package:merckfoundation_252026/widgets/EmptyStateWidget.dart';
import 'package:merckfoundation_252026/widgets/FooterFlowerImage.dart';
import 'package:merckfoundation_252026/widgets/SmartHtmlWidget.dart';
import 'package:merckfoundation_252026/widgets/Bottomcardlink.dart';

class DetailScreen extends StatefulWidget {
  final String? title;
  final String? titleContent;
  final String? descriptionContent;
  final String? image;
  final String? articleId;
  final String? languageId;
  final bool isDetailApiCalled;
  final String? shareLink;
  final String? menuID;
  final bool? isComingFromNotication;
  final bool isLeader;
  final String? boilerPlateData;
 final bool? isLeadership;

  const DetailScreen(
    this.titleContent,
    this.descriptionContent, {
    super.key,
    this.title,
    this.image = "",
    this.articleId = "",
    this.languageId = "",
    this.isDetailApiCalled = false,
    this.shareLink,
    this.menuID,
    this.isComingFromNotication = false,  this.isLeader=false, this.boilerPlateData="",
    this.isLeadership
  });

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  void initState() {
    super.initState();
    GlobalLists.launchedFromNotification = false;
    if (widget.isDetailApiCalled) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        print("loadArticleDetail");
        context.read<ArticleProvider>().loadArticleDetail(
          context,
          articleId: widget.articleId ?? "",
          languageId: widget.languageId ?? "",
        );
      });
    }else if(widget.isLeader)
    {
       WidgetsBinding.instance.addPostFrameCallback((_) {
        print("isLeader");
        context.read<ArticleProvider>().loadLeaderDetail(
          context,
        leader_id:  widget.articleId!
        );
      });
    }
  }
String? extractLastPathFromLeaderLang(String html) {
  final match = RegExp(
    r'''href\s*=\s*["']([^"']+)["']''',
    caseSensitive: false,
  ).firstMatch(html);

  if (match == null) return null;

  final href = match.group(1);

  if (href == null || href.isEmpty) return null;

  final uri = Uri.tryParse(href);

  if (uri == null) return null;

  final segments = uri.pathSegments
      .where((segment) => segment.isNotEmpty)
      .toList();

  if (segments.isEmpty) return null;

  return segments.last;
}
  @override
  Widget build(BuildContext context) {
    print("DetailScreen Build  ${widget.isDetailApiCalled} ");
    final responsive = ResponsiveFlutter.of(context);
    return Scaffold(
      backgroundColor: Customcolor.background,
      appBar: CommonAppBar(
        type: AppBarType.inner,
        height: 70,
        // title: widget.title,
        onSearch: () {},
        shareLink: widget.shareLink,
        onBack: () {
          if (widget.isComingFromNotication == true) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (_) => Dashboard(
                  index: 0,
                  menuID: "1",
                  shareLink: "",
                  menuLogo: "",
                ),
              ),
            );
          } else {
            Navigator.pop(context);
          }
        },
        menuID: widget.menuID,
      ),
      body: Consumer<ArticleProvider>(
        builder: (context, provider, child) {
          final state = provider.detailStatus;
          final detail = provider.articleDetail;

          /// LOADING
          if (state == ApiStatus.loading) {
            return const Center(child: CommonLoader());
          }
          if (provider.status != ApiStatus.success &&
              provider.status != ApiStatus.loading &&
              provider.status != ApiStatus.initial) {
            return ApiStatusHandler(
              status: provider.status,
              errorMessage: provider.errorMessage,
              onRetry: () {
                if(widget.isDetailApiCalled){
                provider.retryDetail(
                  context,
                  articleId: widget.articleId ?? "",
                  languageId: widget.languageId ?? "",
                );
                }else if(widget.isLeader)
                {
                   provider.retryLeaderDetail(
                  context,
leader_id:widget.articleId!
                );
                }
              },
            );
          }

          final title = widget.isDetailApiCalled
              ? (detail?.title ?? "")
              : (widget.title ?? "");

          final description = widget.isDetailApiCalled
              ? (detail?.details ?? "")
              : (widget.descriptionContent ?? "");

          final image = widget.isDetailApiCalled
              ? (detail?.image ?? "")
              : (widget.image ?? "");

          final isEmpty = title.isEmpty && description.isEmpty && image.isEmpty;

          /// EMPTY
          if (isEmpty) {
            return const Column(
              children: [
                Expanded(child: Center(child: EmptyStateWidget())),
                FooterFlowerImage(),
                Bottomcardlink(),
              ],
            );
          }

          /// SUCCESS
          return ListView(
            cacheExtent: 500,
            children: [
// (provider.articleDetail?.leader_lang?.trim().isNotEmpty ?? false)
//     ? Padding(
//         padding: const EdgeInsets.symmetric(
//           horizontal: 12,
//           vertical: 3,
//         ),
//         child: SmartHtmlWidget(
//           html: '''
//             <div style="text-align: right;">
//               ${provider.articleDetail!.leader_lang!}
//             </div>
//           ''',
//           onLinkTap: (url) {
//             if (url.isEmpty) return;

//             debugPrint('Clicked URL: $url');

//             final uri = Uri.tryParse(url);

//             if (uri == null) return;

//             final segments = uri.pathSegments
//                 .where((e) => e.isNotEmpty)
//                 .toList();

//             if (segments.isEmpty) return;

//             final slug = segments.last;

//             debugPrint('Slug: $slug');

//             // Call your API here
//             // provider.yourApiMethod(slug);
//           },
//         ),
//       )
//     : const SizedBox(),
              if (title!.isNotEmpty &&  widget.isLeader ==false)
                Padding(
                  padding: const EdgeInsets.only(left: 12, right: 12),
                  child: SmartHtmlWidget(
                    html: title,
                    textColor: Customcolor.colorVoilet,
                    fontSize: responsive.fontSize(3.0),
                    fontFamily: "Times New Roman",
                    fontWeight: FontWeight.w900,
                  ),
                ),
            widget.isDetailApiCalled==false
                  ? SizedBox()
                  : provider.articleDetail!.availableLanguages!.isNotEmpty
                  ? Padding(
                      padding: const EdgeInsets.only(right: 10,top: 8,bottom: 16),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Wrap(
                          crossAxisAlignment: WrapCrossAlignment.center,
                          alignment: WrapAlignment.end,
                          spacing: 6,
                          children: [
                            const Text(
                              "View:",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            ...provider.articleDetail!.availableLanguages!.map(
                              (language) => InkWell(
                                onTap: () {
                                  print(language.language);
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) => DetailScreen(
                                        "",
                                        "",
                                        title: "",
                                        articleId: language.articleId
                                            .toString(),
                                        languageId: language.languageId,
                                        isDetailApiCalled: true,
                                        shareLink: widget.shareLink,
                                        menuID: widget.menuID,
                                      ),
                                    ),
                                  );
                                },
                                child: Text(
                                  language.language,
                                  style: const TextStyle(
                                    color: Colors.blue,
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  : const SizedBox(),
          widget.isDetailApiCalled==true?SizedBox():     Padding(
                padding: const EdgeInsets.only(
                  left: 16,
                  right: 16,
                  top: 16,
                  bottom: 8,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(24),

                  // child:
                  // AspectRatio(
                  //   aspectRatio: 4 / 4,
                  child: 
                   CachedNetworkImage(
                    memCacheHeight: 1000,
  imageUrl: image,
  fit: BoxFit.contain,
   placeholder: (context, url) => const ImageShimmer(),
  
  errorWidget: (_, __, ___) => Image.asset(
    CommonImagePath.placeHolder,
    fit: BoxFit.contain,
  ),
),

                  // FadeInImage.assetNetwork(
                  //   placeholder: CommonImagePath.placeHolder,

                  //   image: image,

                  //   fit: BoxFit.contain,

                  //   placeholderFit: BoxFit.cover,

                  //   fadeInDuration: const Duration(milliseconds: 200),

                  //   imageErrorBuilder: (context, error, stackTrace) {
                  //     return Container(
                  //       color: Colors.grey.shade200,

                  //       child: const Icon(
                  //         Icons.broken_image,

                  //         size: 40,

                  //         color: Colors.grey,
                  //       ),
                  //     );
                  //   },
                  // ),
                  // ),
                ),
              ),
                if (title!.isNotEmpty &&  widget.isLeader )
                Padding(
                  padding: const EdgeInsets.only(left: 12, right: 12),
                  child: SmartHtmlWidget(
                    html: '<div style="text-align:center;">${title!}</div>',
                    textColor: Customcolor.colorBlue,
                    fontSize: responsive.fontSize(3.0),

                    fontWeight: FontWeight.w800,
                  ),
                ),
  if (widget.titleContent!.isNotEmpty && widget.isLeader )
                Padding(
                  padding: const EdgeInsets.only(left: 12, right: 12,bottom: 6),
                  child: SmartHtmlWidget(html: '<div style="text-align:center;">${widget.titleContent!}</div>',),
                ),

              if (description.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.only(left: 12, right: 12),
                  child: SmartHtmlWidget(html: description),
                ),

              const SizedBox(height: 10),
              widget.isDetailApiCalled==false?Container()
: 
(provider.articleDetail?.boilerPlateData?.content?.trim().isNotEmpty ?? false)
    ? Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: SmartHtmlWidget(
          html: provider.articleDetail!.boilerPlateData!.content!,
        ),
      )
    : const SizedBox.shrink(),
// (provider.articleDetail!.boilerPlateData!.content!.isNotEmpty )?
//                 Padding(
//                   padding: const EdgeInsets.only(left: 12, right: 12),
//                   child: SmartHtmlWidget(html: provider.articleDetail!.boilerPlateData!.content!),
//                 ):Container(),
 const SizedBox(height: 20),
              const FooterFlowerImage(),
              const Bottomcardlink(),
            ],
          );
        },
      ),
    );
  }
}
