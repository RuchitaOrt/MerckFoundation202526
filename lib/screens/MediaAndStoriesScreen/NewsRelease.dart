import 'package:flutter/material.dart';
import 'package:merckfoundation_252026/Utility/ResponsiveFlutter.dart';
import 'package:merckfoundation_252026/Utility/customappbar.dart';
import 'package:merckfoundation_252026/Utils/common_images.dart';
import 'package:merckfoundation_252026/Utils/common_strings.dart';
import 'package:merckfoundation_252026/Utils/customcolor.dart';
import 'package:merckfoundation_252026/data/model/CommonModel.dart';
import 'package:merckfoundation_252026/enum/commonEnum.dart';
import 'package:merckfoundation_252026/providers/newsrelease_provider.dart';
import 'package:merckfoundation_252026/screens/MediaAndStoriesScreen/MediaEnquiryCard.dart';
import 'package:merckfoundation_252026/widgets/CommonListCard.dart';
import 'package:merckfoundation_252026/widgets/FooterFlowerImage.dart';
import 'package:merckfoundation_252026/widgets/botttomlink.dart';
import 'package:provider/provider.dart';

class NewsRelease extends StatelessWidget {
  const NewsRelease({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => NewsReleaseProvider()..loadInitial(),
      child: Scaffold(
          backgroundColor: Customcolor.background,
          appBar: CommonAppBar(
            type: AppBarType.inner,
            title: CommonStrings.newsRelease,
            onSearch: () {},
            onShare: () {},
            shareLink: "",
          ),
          body: Consumer<NewsReleaseProvider>(
            builder: (context, provider, _) {
              return CustomScrollView(
                slivers: [

                    SliverToBoxAdapter(child: MediaEnquiryCard(
  contacts: [
    MediaContactModel(
      name: "Ms. Mehak Handa",
      phone: "+91 93196 06669",
      email: "mehak.handa@external.merckgroup.com",
     
    ),
    MediaContactModel(
      name: "Mr. Harsh Sharma",
      phone: "+91 95409 32090",
      email: "harsh.sharma@external.merckgroup.com",
     
    ),
  ],
)),
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        return CommonListCard(
                          isAssetImage: true,
                          imageUrl: CommonImagePath.pdfImage,
                          htmlTitle: provider.articles[index].titleHtml,
                          onTap: () {
                            // navigate to article detail
                          },
                        );
                        
                      },
                      childCount: provider.articles.length,
                    ),
                  ),
                  SliverToBoxAdapter(child:  8.0.heightBox,),
                  const SliverToBoxAdapter(child: FooterFlowerImage()),
                  SliverToBoxAdapter(child:  8.0.heightBox,),
                  const SliverToBoxAdapter(child: Bottomcardlink()),
                ],
              );
            },
          )),
    );
  }
}
