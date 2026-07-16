
import 'package:flutter/material.dart';
import 'package:merckfoundation_252026/Utility/ApiStatusHandler.dart';
import 'package:merckfoundation_252026/Utility/ResponsiveFlutter.dart';
import 'package:merckfoundation_252026/const/GlobalLists.dart';
import 'package:merckfoundation_252026/enum/commonEnum.dart';
import 'package:merckfoundation_252026/screens/MainScreens/dashboard.dart';
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

  const DetailScreen(
    this.titleContent,
    this.descriptionContent, {
    super.key,
    this.title,
    this.image = "",
    this.articleId = "",
    this.languageId = "",
    this.isDetailApiCalled = false,
    this.shareLink, this.menuID,this.isComingFromNotication=false
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
        context.read<ArticleProvider>().loadArticleDetail(
              context,
              articleId: widget.articleId ?? "",
              languageId: widget.languageId ?? "",
            );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
     final responsive = ResponsiveFlutter.of(context);
    return Scaffold(
      backgroundColor: Customcolor.background,
      appBar: CommonAppBar(
        type: AppBarType.inner,
        height: 70,
        // title: widget.title,
        onSearch: () {},
        shareLink: widget.shareLink ,
        onBack: (){
          if(widget.isComingFromNotication==true)
          {
Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (_) => Dashboard(
                        index: 0,
                        menuID: "1",
                        shareLink: "",
                        menuLogo:   "",
                      ),
                    ),
                  );
          }else{
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
       provider.retryDetail(
                  context,
                  articleId: widget.articleId ?? "",
                  languageId: widget.languageId ?? "",
                );
      },
  );
}
         
          final title = widget.isDetailApiCalled
              ? (detail?.title ?? "")
              : (widget.titleContent ?? "");

          final description = widget.isDetailApiCalled
              ? (detail?.details ?? "")
              : (widget.descriptionContent ?? "");

          final image = widget.isDetailApiCalled
              ? (detail?.image ?? "")
              : (widget.image ?? "");

          final isEmpty =
              title.isEmpty && description.isEmpty && image.isEmpty;

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
            children: [
              
              // if (image.isNotEmpty)
              //   Image.network(image, fit: BoxFit.cover),

              // const SizedBox(height: 12),

              if (title.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: SmartHtmlWidget(html: title,  textColor: Customcolor.colorVoilet,
                  fontSize: responsive.fontSize(3.0),
                  
                  fontWeight: FontWeight.w800,),
                ),

              if (description.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: SmartHtmlWidget(html: description),
                ),

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