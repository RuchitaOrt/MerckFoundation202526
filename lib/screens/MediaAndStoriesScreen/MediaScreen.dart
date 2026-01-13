import 'package:flutter/material.dart';
import 'package:merckfoundation_252026/Utility/ResponsiveFlutter.dart';
import 'package:merckfoundation_252026/Utility/customappbar.dart';
import 'package:merckfoundation_252026/Utils/common_strings.dart';
import 'package:merckfoundation_252026/Utils/customcolor.dart';
import 'package:merckfoundation_252026/enum/commonEnum.dart';
import 'package:merckfoundation_252026/providers/article_provider.dart';
import 'package:merckfoundation_252026/widgets/CommonListCard.dart';
import 'package:merckfoundation_252026/widgets/FooterFlowerImage.dart';
import 'package:merckfoundation_252026/widgets/botttomlink.dart';
import 'package:provider/provider.dart';

class MediaScreen extends StatelessWidget {
  const MediaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ArticlesProvider()..loadInitial(),
      child: Scaffold(
          backgroundColor: Customcolor.background,
          appBar: CommonAppBar(
            type: AppBarType.inner,
            title: CommonStrings.merckInMedia,
            onSearch: () {},
            onShare: () {},
            shareLink: "",
          ),
          body: Consumer<ArticlesProvider>(
            builder: (context, provider, _) {
              return CustomScrollView(
                slivers: [
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        return CommonListCard(
                          imageUrl: provider.articles[index].imageUrl,
                          htmlTitle: provider.articles[index].titleHtml,
                          onTap: () {
                            // navigate to article detail
                          },
                        );
                        
                      },
                      childCount: provider.articles.length,
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: 8.0.heightBox,
                  ),
                  const SliverToBoxAdapter(child: FooterFlowerImage()),
                  SliverToBoxAdapter(
                    child: 8.0.heightBox,
                  ),
                  const SliverToBoxAdapter(child: Bottomcardlink()),
                ],
              );
            },
          )),
    );
  }
}
