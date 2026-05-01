import 'package:flutter/material.dart';
import 'package:merckfoundation_252026/Provider/FilterProvider.dart';
import 'package:merckfoundation_252026/Provider/MediaListingProvider.dart';
import 'package:merckfoundation_252026/Utility/customappbar.dart';
import 'package:merckfoundation_252026/Utility/showdailog.dart';
import 'package:merckfoundation_252026/Utils/customcolor.dart';
import 'package:merckfoundation_252026/enum/commonEnum.dart';
import 'package:merckfoundation_252026/widgets/FooterFlowerImage.dart';
import 'package:merckfoundation_252026/widgets/YouTubePreview.dart';
import 'package:merckfoundation_252026/widgets/botttomlink.dart';
import 'package:merckfoundation_252026/widgets/filterdrawer.dart';
import 'package:merckfoundation_252026/widgets/mediaCard.dart';
import 'package:provider/provider.dart';


class MediaListingScreen extends StatefulWidget {
  final MediaType type;

  const MediaListingScreen({super.key, required this.type});

  @override
  State<MediaListingScreen> createState() => _MediaListingScreenState();
}

class _MediaListingScreenState extends State<MediaListingScreen> {
  final ScrollController _controller = ScrollController();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
void initState() {
  super.initState();

  final filter = context.read<FilterProvider>();
  final provider = context.read<MediaListingProvider>();

  /// 🔥 RESET FILTER (prevent carry-over)
  filter.clearFilters();

  WidgetsBinding.instance.addPostFrameCallback((_) {
    provider.loadInitial(
      context: context,
      type: widget.type,
      countryId: "",
      categoryId: "",
    );
  });

  if (filter.countries.isEmpty || filter.categories.isEmpty) {
    filter.loadFilters(context);
  }

  _controller.addListener(() {
    if (_controller.position.pixels >=
        _controller.position.maxScrollExtent - 200) {
      provider.loadMore(context);
    }
  });
}
  String getCountryId() {
    final filter = context.read<FilterProvider>();
    return filter.selectedCountry?.id.toString() ?? "";
  }


String getCategoryId() {
  final filter = context.read<FilterProvider>();
  return filter.selectedCategory?.id.toString() ?? "";
}
  String getTitle() {
    switch (widget.type) {
      case MediaType.stories:
        return "Stories";
      case MediaType.videoLibrary:
        return "Video Library";
      case MediaType.testimonial:
        return "Testimonials";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      endDrawer: AppDrawerfilter(type: widget.type),

      appBar: CommonAppBar(
        type: AppBarType.inner,
        title: getTitle(),
        onFilter: () => _scaffoldKey.currentState!.openEndDrawer(),
        onSearch: () {},
        onShare: () {},
        shareLink: "",
      ),

      backgroundColor: Customcolor.background,

      body: Consumer<MediaListingProvider>(
        builder: (context, provider, _) {

          if (provider.isLoading && provider.storyList.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          }

          return CustomScrollView(
            controller: _controller,
            slivers: [

              /// 🔹 GRID
              SliverGrid(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {

                    if (index < provider.storyList.length) {
                      final item = provider.storyList[index];

                      return MediaCard(
                        image: getYoutubeThumbnail(item.videoLink),
                        title: item.title,
                        showPlayIcon: true,
                        onTap: () {
                          var key = item.videoLink.substring(
                              item.videoLink.length - 11);

                          ShowDialogs.youtubevideolink(
                            "https://www.youtube.com/watch?v=$key?autoplay=1",
                          );
                        },
                      );
                    }

                    return provider.hasMore
                        ? const Center(child: CircularProgressIndicator())
                        : const SizedBox();
                  },
                  childCount: provider.storyList.length + 1,
                ),
                gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.75,
                ),
              ),

              /// 🔹 FOOTER
              const SliverToBoxAdapter(child: FooterFlowerImage()),
              const SliverToBoxAdapter(child: SizedBox(height: 8)),
              const SliverToBoxAdapter(child: Bottomcardlink()),
            ],
          );
        },
      ),
    );
  }
}