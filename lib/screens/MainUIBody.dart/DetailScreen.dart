import 'package:flutter/material.dart';
import 'package:merckfoundation_252026/Provider/article_provider.dart';
import 'package:merckfoundation_252026/Utility/ResponsiveFlutter.dart';
import 'package:merckfoundation_252026/Utility/customappbar.dart';
import 'package:merckfoundation_252026/Utils/common_images.dart';
import 'package:merckfoundation_252026/Utils/customcolor.dart';
import 'package:merckfoundation_252026/enum/commonEnum.dart';
import 'package:merckfoundation_252026/widgets/CommonLoader.dart';
import 'package:merckfoundation_252026/widgets/EmptyStateWidget.dart';
import 'package:merckfoundation_252026/widgets/FooterFlowerImage.dart';

import 'package:merckfoundation_252026/widgets/SmartHtmlWidget.dart';
import 'package:merckfoundation_252026/widgets/botttomlink.dart';
import 'package:provider/provider.dart';

class DetailScreen extends StatefulWidget {
  final String? title;
  final String? titleContent;
  final String? descriptionContent;
  final String? image;
  final String? articleId;
  final String? languageId;
  final bool isDetailApiCalled;

  const DetailScreen(
    this.titleContent,
    this.descriptionContent, {
    super.key,
    this.title,
    this.image = "",
    this.articleId = "",
    this.languageId = "",
    this.isDetailApiCalled = false,
  });

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  void initState() {
    super.initState();

    if (widget.isDetailApiCalled) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!mounted) return;

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
        title: widget.title,
        onSearch: () {},
        onShare: () {},
        shareLink: "",
      ),

      body: Consumer<ArticleProvider>(
        builder: (context, provider, child) {
          final detail = provider.articleDetail;

          final title = widget.isDetailApiCalled
              ? (detail?.title ?? "")
              : (widget.titleContent ?? "");

          final description = widget.isDetailApiCalled
              ? (detail?.details ?? "")
              : (widget.descriptionContent ?? "");

          final image = widget.isDetailApiCalled
              ? (detail?.image ?? "")
              : (widget.image ?? "");

          if (widget.isDetailApiCalled && provider.isDetailLoading) {
            return const Center(child: CommonLoader());
          }
          return LayoutBuilder(
            builder: (context, constraints) {
              final isEmpty =
                  image.isEmpty && title.isEmpty && description.isEmpty;

              /// EMPTY SCREEN
              if (isEmpty) {
                return Column(
                  children: [
                    /// CENTER EMPTY CONTENT
                    const Expanded(
                      child: Center(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: EmptyStateWidget(),
                        ),
                      ),
                    ),

                    /// FIXED FOOTER BOTTOM
                    FooterFlowerImage(),

                    Bottomcardlink(),
                  ],
                );
              }

              /// NORMAL CONTENT SCREEN
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 12,
                        right: 12,
                        top: 8,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          /// IMAGE
                          if (image.isNotEmpty)
                            AspectRatio(
                              aspectRatio: 4 / 4,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.network(
                                  image,
                                  fit: BoxFit.contain,
                                  loadingBuilder: (c, w, l) => l == null
                                      ? w
                                      : const Center(child: CommonLoader()),
                                  errorBuilder: (context, error, stackTrace) {
                                    return Container(
                                      color: Colors.grey.shade300,
                                      alignment: Alignment.center,
                                      child: Image.asset(
                                        CommonImagePath.placeHolder,
                                        width: double.infinity,
                                        height: double.infinity,
                                        fit: BoxFit.cover,
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),

                          if (image.isNotEmpty) 16.0.heightBox,

                          /// TITLE
                          if (title.isNotEmpty)
                            SmartHtmlWidget(
                              html: title,
                              textColor: Customcolor.colorVoilet,
                              fontSize: responsive.fontSize(3),
                              fontWeight: FontWeight.w600,
                            ),

                          if (title.isNotEmpty) 16.0.heightBox,

                          /// LANGUAGE SWITCHER
                          if (widget.isDetailApiCalled &&
                              detail != null &&
                              detail.availableLanguages.isNotEmpty)
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Wrap(
                                crossAxisAlignment: WrapCrossAlignment.center,
                                children: [
                                  const Text(
                                    "View ",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),

                                  ...List.generate(
                                    detail.availableLanguages.length,
                                    (index) {
                                      final lang =
                                          detail.availableLanguages[index];

                                      return Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              provider.loadArticleDetail(
                                                context,
                                                articleId: lang.articleId
                                                    .toString(),
                                                languageId: lang.languageId,
                                              );
                                            },
                                            child: Text(
                                              lang.language,
                                              style: const TextStyle(
                                                color: Colors.blue,
                                                fontWeight: FontWeight.w600,
                                                decoration:
                                                    TextDecoration.underline,
                                              ),
                                            ),
                                          ),

                                          if (index !=
                                              detail.availableLanguages.length -
                                                  1)
                                            const Padding(
                                              padding: EdgeInsets.symmetric(
                                                horizontal: 8,
                                              ),
                                              child: Text("|"),
                                            ),
                                        ],
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ),

                          16.0.heightBox,

                          /// DESCRIPTION
                          if (description.isNotEmpty)
                            SmartHtmlWidget(html: description),

                          24.0.heightBox,
                        ],
                      ),
                    ),

                    /// FOOTER AFTER CONTENT
                    FooterFlowerImage(),

                    Bottomcardlink(),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
