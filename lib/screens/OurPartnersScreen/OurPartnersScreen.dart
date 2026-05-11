import 'package:flutter/material.dart';
import 'package:merckfoundation_252026/Provider/OurPartnersProvider.dart';
import 'package:merckfoundation_252026/Utility/customappbar.dart';
import 'package:merckfoundation_252026/Utility/showdailog.dart';
import 'package:merckfoundation_252026/enum/commonEnum.dart';
import 'package:merckfoundation_252026/screens/MainUIBody.dart/CommonBody.dart';
import 'package:merckfoundation_252026/widgets/CommonLoader.dart';
import 'package:merckfoundation_252026/widgets/EmptyStateWidget.dart';
import 'package:merckfoundation_252026/widgets/FooterFlowerImage.dart';
import 'package:merckfoundation_252026/widgets/botttomlink.dart';
import 'package:provider/provider.dart';

class OurPartnersScreen extends StatefulWidget {
  final String menuID;
  final String title;

  const OurPartnersScreen({
    super.key,
    required this.menuID,
    required this.title,
  });

  @override
  State<OurPartnersScreen> createState() => _OurPartnersScreenState();
}

class _OurPartnersScreenState extends State<OurPartnersScreen> {
  final ScrollController _scrollController = ScrollController();
  bool _isLoadMoreRunning = false; // 🔥 UI lock
  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      context.read<OurPartnersProvider>().loadInitial(context);
    });

    _scrollController.addListener(() async {
      final provider = context.read<OurPartnersProvider>();

      if (_scrollController.position.pixels >=
              _scrollController.position.maxScrollExtent - 200 &&
          !_isLoadMoreRunning &&
          !provider.isLoading &&
          provider.hasMore) {
        _isLoadMoreRunning = true; // 🔥 LOCK UI

        await provider.loadMore(context);

        _isLoadMoreRunning = false; // 🔥 UNLOCK after API completes
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        type: AppBarType.inner,
        title: widget.title,
        onSearch: () {},
        onShare: () {},
        shareLink: "",
      ),
      body: Consumer<OurPartnersProvider>(
        builder: (context, provider, child) {
          

          /// 🔹 FIRST LOADER
          if (provider.isFirstLoad) {
            return const Center(child: CommonLoader());
          }

          /// 🔹 EMPTY STATE
          if (provider.partners.isEmpty) {
            return CustomScrollView(
              slivers: [
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: Column(
                    children: [
                      /// CENTER CONTENT
                      Expanded(child: EmptyStateWidget()),

                      const FooterFlowerImage(),

                      const SizedBox(height: 8),
                      const Bottomcardlink(),
                    ],
                  ),
                ),
              ],
            );
          }

          return CustomScrollView(
            controller: _scrollController,
            slivers: [
              /// 🔼 TOP
              SliverToBoxAdapter(
                child: CommonBody(
                  widget.menuID,
                  showFooter: false,
                  showBottomLinks: false,
                ),
              ),

              /// 🔽 GRID
              SliverPadding(
                padding: const EdgeInsets.all(12),
                sliver: SliverGrid(
                  delegate: SliverChildBuilderDelegate((context, index) {
                    final item = provider.partners[index];

                    return GestureDetector(
                      onTap: () {
                        ShowDialogs.launchURL(item.pageUrl);
                      },
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey.shade300),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            if ((item.image ?? "").isNotEmpty)
                              Image.network(
                                item.image!,
                                height: 60,
                                errorBuilder: (_, __, ___) =>
                                    const Icon(Icons.image_not_supported),
                              ),

                            const SizedBox(height: 8),

                            Text(
                              item.title ?? "",
                              textAlign: TextAlign.center,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                    );
                  }, childCount: provider.partners.length),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 1.2,
                  ),
                ),
              ),

              /// 🔹 LOAD MORE LOADER
              SliverToBoxAdapter(
                child: provider.isLoading
                    ? const Padding(
                        padding: EdgeInsets.all(16),
                        child: Center(child: CommonLoader()),
                      )
                    : const SizedBox(),
              ),

              /// 🔽 FOOTER
              const SliverToBoxAdapter(child: FooterFlowerImage()),
              SliverToBoxAdapter(child: Bottomcardlink()),
            ],
          );
        },
      ),
    );
  }
}
