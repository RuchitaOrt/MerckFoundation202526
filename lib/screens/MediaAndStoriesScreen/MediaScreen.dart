import 'package:flutter/material.dart';
import 'package:merckfoundation_252026/Provider/MediaProvider.dart';

import 'package:merckfoundation_252026/Utility/customappbar.dart';
import 'package:merckfoundation_252026/Utility/showdailog.dart';
import 'package:merckfoundation_252026/Utils/common_strings.dart';
import 'package:merckfoundation_252026/Utils/customcolor.dart';
import 'package:merckfoundation_252026/enum/commonEnum.dart';

import 'package:merckfoundation_252026/widgets/CommonListCard.dart';
import 'package:merckfoundation_252026/widgets/FooterFlowerImage.dart';
import 'package:merckfoundation_252026/widgets/botttomlink.dart';
import 'package:provider/provider.dart';
class MediaScreen extends StatefulWidget {
  const MediaScreen({super.key});

  @override
  State<MediaScreen> createState() => _MediaScreenState();
}

class _MediaScreenState extends State<MediaScreen> {
  final ScrollController _controller = ScrollController();

  @override
  void initState() {
    super.initState();

    /// ✅ Delay API call after build
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final provider = context.read<MediaProvider>();
      provider.loadInitial(context);
    });

    _controller.addListener(() {
      final provider = context.read<MediaProvider>();

      if (_controller.position.pixels >=
          _controller.position.maxScrollExtent - 200) {
        provider.loadMore(context);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Customcolor.background,
      appBar: CommonAppBar(
        type: AppBarType.inner,
        title: CommonStrings.merckInMedia,
        onSearch: () {},
        onShare: () {},
        shareLink: "",
      ),
      body: Consumer<MediaProvider>(
        builder: (context, provider, _) {
          /// 🔴 FIRST LOADER
          if (provider.isLoading && provider.mediaList.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          }

          return CustomScrollView(
            controller: _controller,
            slivers: [
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    if (index < provider.mediaList.length) {
                      final item = provider.mediaList[index];

                      return CommonListCard(
                        imageUrl: item.image, // ✅ FIXED
                        htmlTitle: item.title,
                        onTap: () {
                           ShowDialogs.launchURL(item.articleUrl);
                        },
                      );
                    }

                    /// 🔽 PAGINATION LOADER
                    return provider.hasMore
                        ? const Padding(
                            padding: EdgeInsets.all(16),
                            child: Center(
                                child: CircularProgressIndicator()),
                          )
                        : const SizedBox();
                  },
                  childCount: provider.mediaList.length + 1,
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