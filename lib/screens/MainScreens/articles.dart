import 'package:flutter/material.dart';
import 'package:merckfoundation_252026/Utility/customappbar.dart';
import 'package:merckfoundation_252026/Utils/common_strings.dart';
import 'package:merckfoundation_252026/Utils/customcolor.dart';
import 'package:merckfoundation_252026/enum/commonEnum.dart';
import 'package:merckfoundation_252026/Provider/article_provider.dart';
import 'package:merckfoundation_252026/widgets/CommonListCard.dart';
import 'package:merckfoundation_252026/widgets/FooterFlowerImage.dart';
import 'package:merckfoundation_252026/widgets/botttomlink.dart';
import 'package:provider/provider.dart';

class ArticlesScreen extends StatefulWidget {
  const ArticlesScreen({super.key});

  @override
  State<ArticlesScreen> createState() => _ArticlesScreenState();
}

class _ArticlesScreenState extends State<ArticlesScreen> {
  final ScrollController _controller = ScrollController();

  @override
  void initState() {
    super.initState();

    /// ✅ Initial API call
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ArticleProvider>().loadInitial(context);
    });

    /// ✅ Pagination listener
    _controller.addListener(() {
      final provider = context.read<ArticleProvider>();

      if (_controller.position.pixels >=
          _controller.position.maxScrollExtent - 200) {
        provider.loadMore(context); // 👈 SAME as MediaScreen
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Customcolor.background,
      appBar: CommonAppBar(
        type: AppBarType.inner,
        title: CommonStrings.articles,
        onSearch: () {},
        onShare: () {},
        shareLink: "",
      ),
      body: Consumer<ArticleProvider>(
        builder: (context, provider, _) {
          /// 🔴 FIRST LOADER
          if (provider.isLoading && provider.articleList.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          }
    
          return CustomScrollView(
            controller: _controller,
            slivers: [
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    if (index < provider.articleList.length) {
                      final item = provider.articleList[index];
    
                      return CommonListCard(
                        imageUrl: item.image,
                        htmlTitle: item.title,
                        onTap: () {
                          // navigate
                        },
                      );
                    }
    
                    /// 🔽 PAGINATION LOADER
                    return provider.hasMore
                        ? const Padding(
                            padding: EdgeInsets.all(16),
                            child: Center(
                              child: CircularProgressIndicator(),
                            ),
                          )
                        : const SizedBox();
                  },
                  childCount: provider.articleList.length + 1,
                ),
              ),
    
              const SliverToBoxAdapter(child: FooterFlowerImage()),
              const SliverToBoxAdapter(child: Bottomcardlink()),
            ],
          );
        },
      ),
    );
  }
}