import 'package:flutter/material.dart';
import 'package:merckfoundation_252026/Provider/OurPartnersProvider.dart';
import 'package:merckfoundation_252026/Utility/api_status.dart';
import 'package:merckfoundation_252026/Utility/customappbar.dart';
import 'package:merckfoundation_252026/Utility/showdailog.dart';
import 'package:merckfoundation_252026/Utils/common_strings.dart';
import 'package:merckfoundation_252026/enum/commonEnum.dart';
import 'package:merckfoundation_252026/screens/MainUIBody.dart/CommonBody.dart';
import 'package:merckfoundation_252026/widgets/CommonApiStatusWidget.dart';
import 'package:merckfoundation_252026/widgets/CommonLoader.dart';
import 'package:merckfoundation_252026/widgets/EmptyStateWidget.dart';
import 'package:merckfoundation_252026/widgets/FooterFlowerImage.dart';
import 'package:merckfoundation_252026/widgets/botttomlink.dart';
import 'package:provider/provider.dart';

class OurPartnersScreen extends StatefulWidget {
  final String menuID;
  final String title;
  

  final String? shareLink;

  const OurPartnersScreen({
    super.key,
    required this.menuID,
    required this.title, this.shareLink,
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

    // _scrollController.addListener(() async {
    //   final provider = context.read<OurPartnersProvider>();

    //   if (_scrollController.position.pixels >=
    //           _scrollController.position.maxScrollExtent - 200 &&
    //       !_isLoadMoreRunning &&
    //       !provider.isLoading &&
    //       provider.hasMore) {
    //     _isLoadMoreRunning = true; // 🔥 LOCK UI

    //     await provider.loadMore(context);

    //     _isLoadMoreRunning = false; // 🔥 UNLOCK after API completes
    //   }
    // });
    _scrollController.addListener(() async {
  final provider = context.read<OurPartnersProvider>();

  final isAtBottom =
      _scrollController.position.pixels >=
      _scrollController.position.maxScrollExtent - 200;

  if (isAtBottom &&
      provider.hasMore &&
      !provider.isFetchingMore &&
      provider.status != ApiStatus.loading) {
    
    await provider.loadMore(context);
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
        shareLink: widget.shareLink,
      ),
      body: Consumer<OurPartnersProvider>(
        builder: (context, provider, child) {

  /// NO INTERNET
  if (provider.status == ApiStatus.noInternet) {
    return CommonApiStatusWidget(
      icon: Icons.wifi_off,
      title: CommonStrings.noInternetConnection,
      onRetry: () => provider.retry(context),
    );
  }

  /// TIMEOUT
  if (provider.status == ApiStatus.timeout) {
    return CommonApiStatusWidget(
      icon: Icons.access_time,
      title: "Request Timeout",
      onRetry: () => provider.retry(context),
    );
  }

  /// ERROR
  if (provider.status == ApiStatus.error) {
    return CommonApiStatusWidget(
      icon: Icons.error_outline,
      title: provider.errorMessage,
      onRetry: () => provider.retry(context),
    );
  }

  /// LOADING (FIRST TIME ONLY)
  if (provider.status == ApiStatus.loading && provider.partners.isEmpty) {
    return const Center(child: CommonLoader());
  }

  /// EMPTY (ONLY SUCCESS CASE)
  if (provider.status == ApiStatus.success && provider.partners.isEmpty) {
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Column(
            children: [
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

  /// SUCCESS UI
  return CustomScrollView(
    controller: _scrollController,
    slivers: [
      
      SliverToBoxAdapter(
        child: CommonBody(
          widget.menuID,
          showFooter: false,
          showBottomLinks: false,
        ),
      ),

      SliverPadding(
        padding: const EdgeInsets.all(12),
        sliver: SliverGrid(
          delegate: SliverChildBuilderDelegate((context, index) {
            final item = provider.partners[index];

            return GestureDetector(
              onTap: () => ShowDialogs.launchURL(item.pageUrl),
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

      /// PAGINATION LOADER (FIXED)
      SliverToBoxAdapter(
        child: provider.isFetchingMore
            ? const Padding(
                padding: EdgeInsets.all(16),
                child: Center(child: CommonLoader()),
              )
            : const SizedBox(),
      ),

      const SliverToBoxAdapter(child: FooterFlowerImage()),
      const SliverToBoxAdapter(child: Bottomcardlink()),
    ],
  );
}
//         builder: (context, provider, child) {
          
// if (provider.status == ApiStatus.noInternet) {
//   return CommonApiStatusWidget(
//     icon: Icons.wifi_off,
//     title: CommonStrings.noInternetConnection,
//     onRetry: () => provider.retry(context),
//   );
// }

// if (provider.status == ApiStatus.timeout) {
//   return CommonApiStatusWidget(
//     icon: Icons.access_time,
//     title: "Request Timeout",
//     onRetry: () => provider.retry(context),
//   );
// }

// if (provider.status == ApiStatus.error) {
//   return CommonApiStatusWidget(
//     icon: Icons.error_outline,
//     title: provider.errorMessage,
//     onRetry: () => provider.retry(context),
//   );
// }
//           /// 🔹 FIRST LOADER
//           if (provider.status == ApiStatus.loading && provider.partners.isEmpty){
//             return const Center(child: CommonLoader());
//           }

//           /// 🔹 EMPTY STATE
//           if (provider.partners.isEmpty) {
//             return CustomScrollView(
//               slivers: [
//                 SliverFillRemaining(
//                   hasScrollBody: false,
//                   child: Column(
//                     children: [
//                       /// CENTER CONTENT
//                       Expanded(child: EmptyStateWidget()),

//                       const FooterFlowerImage(),

//                       const SizedBox(height: 8),
//                       const Bottomcardlink(),
//                     ],
//                   ),
//                 ),
//               ],
//             );
//           }

//           return CustomScrollView(
//             controller: _scrollController,
//             slivers: [
//               /// 🔼 TOP
//               SliverToBoxAdapter(
//                 child: CommonBody(
//                   widget.menuID,
//                   showFooter: false,
//                   showBottomLinks: false,
//                 ),
//               ),

//               /// 🔽 GRID
//               SliverPadding(
//                 padding: const EdgeInsets.all(12),
//                 sliver: SliverGrid(
//                   delegate: SliverChildBuilderDelegate((context, index) {
//                     final item = provider.partners[index];

//                     return GestureDetector(
//                       onTap: () {
//                         ShowDialogs.launchURL(item.pageUrl);
//                       },
//                       child: Container(
//                         padding: const EdgeInsets.all(8),
//                         decoration: BoxDecoration(
//                           border: Border.all(color: Colors.grey.shade300),
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             if ((item.image ?? "").isNotEmpty)
//                               Image.network(
//                                 item.image!,
//                                 height: 60,
//                                 errorBuilder: (_, __, ___) =>
//                                     const Icon(Icons.image_not_supported),
//                               ),

//                             const SizedBox(height: 8),

//                             Text(
//                               item.title ?? "",
//                               textAlign: TextAlign.center,
//                               maxLines: 2,
//                               overflow: TextOverflow.ellipsis,
//                               style: const TextStyle(fontSize: 12),
//                             ),
//                           ],
//                         ),
//                       ),
//                     );
//                   }, childCount: provider.partners.length),
//                   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                     crossAxisCount: 2,
//                     crossAxisSpacing: 10,
//                     mainAxisSpacing: 10,
//                     childAspectRatio: 1.2,
//                   ),
//                 ),
//               ),

//               /// 🔹 LOAD MORE LOADER
//               SliverToBoxAdapter(
//                 child: (provider.status == ApiStatus.loading && provider.partners.isEmpty)
//                     ? const Padding(
//                         padding: EdgeInsets.all(16),
//                         child: Center(child: CommonLoader()),
//                       )
//                     : const SizedBox(),
//               ),

//               /// 🔽 FOOTER
//               const SliverToBoxAdapter(child: FooterFlowerImage()),
//               SliverToBoxAdapter(child: Bottomcardlink()),
//             ],
//           );
//         },
      ),
    );
  }
}
