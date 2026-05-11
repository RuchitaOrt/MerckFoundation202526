import 'package:flutter/material.dart';
import 'package:merckfoundation_252026/Provider/FilterProvider.dart';
import 'package:merckfoundation_252026/Provider/MediaListingProvider.dart';
import 'package:merckfoundation_252026/Utility/customappbar.dart';
import 'package:merckfoundation_252026/Utility/showdailog.dart';
import 'package:merckfoundation_252026/Utils/customcolor.dart';
import 'package:merckfoundation_252026/enum/commonEnum.dart';
import 'package:merckfoundation_252026/screens/MainUIBody.dart/DetailScreen.dart';
import 'package:merckfoundation_252026/screens/MediaAndStoriesScreen/PhotoAlumbScreen.dart';
import 'package:merckfoundation_252026/widgets/CommonLoader.dart';
import 'package:merckfoundation_252026/widgets/EmptyStateWidget.dart';
import 'package:merckfoundation_252026/widgets/FooterFlowerImage.dart';
import 'package:merckfoundation_252026/widgets/YouTubePreview.dart';
import 'package:merckfoundation_252026/widgets/botttomlink.dart';
import 'package:merckfoundation_252026/widgets/filterdrawer.dart';
import 'package:merckfoundation_252026/widgets/mediaCard.dart';
import 'package:provider/provider.dart';

class MediaListingScreen extends StatefulWidget {
  final MediaType type;
  final String categoryID;
  final String albumName;
  final String albumID;

  const MediaListingScreen({
    super.key,
    required this.type,
    required this.categoryID,
    required this.albumID,
    required this.albumName,
  });

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
      filter.loadFilters(context, type: widget.type);
      provider.loadInitial(
        context: context,
        type: widget.type,
        countryId: "",
        categoryId: widget.categoryID ?? "",
        languageId: "",
        albumID: widget.albumID,
      );
    });

    if (filter.countries.isEmpty ||
        filter.categories.isEmpty ||
        filter.languages.isEmpty) {
      filter.loadFilters(context, type: widget.type);
    }
    if (widget.type == MediaType.photoAlbum) {
      return;
    }

    _controller.addListener(() {
      final provider = context.read<MediaListingProvider>();

      if (_controller.position.pixels >=
              _controller.position.maxScrollExtent - 200 &&
          !provider.isLoading &&
          provider.hasMore) {
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
      case MediaType.photoGallery:
        return "Photo Gallery";
      case MediaType.activity:
        return "Our Activities";
      case MediaType.digitalLibrary:
        return "Digital Library";
      case MediaType.testimonialArticle:
        return "Testimonials of Merck Foundation Alumni";
      case MediaType.photoAlbum:
        return widget.albumName;
      case MediaType.episodes:
        return widget.albumName;
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
        onFilter:
            (widget.type == MediaType.photoGallery ||
                widget.type == MediaType.episodes ||
                widget.type == MediaType.activity)
            ? null
            : () => _scaffoldKey.currentState!.openEndDrawer(),
onBack: ()
{
  Navigator.pop(context);
},
        onSearch: () {},
        onShare:widget.type == MediaType.episodes ?null: () {},
        shareLink: "",
      ),

      backgroundColor: Customcolor.background,

      body: Consumer<MediaListingProvider>(
        builder: (context, provider, _) {
         
          if (provider.isLoading && provider.storyList.isEmpty) {
            return const Center(child:CommonLoader());
          }

          return CustomScrollView(
            controller: _controller,
            slivers: [
              /// 🔹 GRID
                  (provider.storyList.isEmpty)?
      SliverFillRemaining(
        hasScrollBody: false,
        child: Column(
          children: [
         Expanded(
        child: EmptyStateWidget(),
      ),

            const FooterFlowerImage(),
            const SizedBox(height: 8),
            const Bottomcardlink(),
          ],
        ),
      )
:
              SliverPadding(
                padding: const EdgeInsets.only(left: 8, right: 8, top: 8),
                sliver: SliverGrid(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      /// ✅ LOAD MORE LOADER
                      if (widget.type != MediaType.photoAlbum &&
                          index >= provider.storyList.length) {
                        return provider.hasMore && provider.isLoading
                            ? const Padding(
                                padding: EdgeInsets.all(16),
                                child: Center(
                                  child: CircularProgressIndicator(),
                                ),
                              )
                            : const SizedBox();
                      }

                      final item = provider.storyList[index];

                      /// 🖼️ PHOTO GALLERY
                      if (widget.type == MediaType.photoGallery ||
                          widget.type == MediaType.digitalLibrary ||
                          widget.type == MediaType.photoAlbum ||
                          widget.type == MediaType.activity) {
                        return MediaCard(
                          id: item.id.toString(),
                          image: widget.type == MediaType.photoAlbum
                              ? item.photo ?? ""
                              : widget.type == MediaType.digitalLibrary
                              ? item.thumbnail_image ?? ""
                              : item.image ?? "",
                          title: widget.type == MediaType.photoAlbum
                              ? item.photo_description ?? ""
                              : widget.type == MediaType.photoGallery
                              ? item.photo_category_name ?? ""
                              : item.title ?? "",
                          showPlayIcon: false,
                          onTap: () {
                            if (widget.type == MediaType.digitalLibrary) {
                              ShowDialogs.launchURL(item.document!);
                            }
                            if (widget.type == MediaType.photoGallery) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => PhotoAlumbScreen(
                                    pageTile: getTitle(),
                                    tile: item.photo_category_name,
                                    categoryID: item.id.toString(),
                                  ),
                                ),
                              );
                            } else {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => DetailScreen(
                                    item.title,
                                    item.details,
                                    title: getTitle(),
                                  ),
                                ),
                              );
                            }
                          },
                        );
                      }

                      /// 🎥 VIDEO TYPES
                      return MediaCard(
                         id: item.id.toString(),
                        image: getYoutubeThumbnail(item.videoLink),
                        title: widget.type==MediaType.episodes?item.episode_name ?? "" :item.videoDesc ?? "",
                        showmenu: widget.type==MediaType.episodes? true:false,
                        showPlayIcon: true,
                        onTap: () {
                          var key = item.videoLink.substring(
                            item.videoLink.length - 11,
                          );

                          ShowDialogs.youtubevideolink(
                            "https://www.youtube.com/watch?v=$key?autoplay=1",
                          );
                        },
                      );
                    },
                    childCount: widget.type == MediaType.photoAlbum
                        ? provider.storyList.length
                        : provider.storyList.length + 1,
                  ),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.80,
                  ),
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
