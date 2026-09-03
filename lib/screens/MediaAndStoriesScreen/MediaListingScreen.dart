import 'package:flutter/material.dart';
import 'package:merckfoundation_252026/CommonUtils/common_strings.dart';
import 'package:merckfoundation_252026/Provider/FilterProvider.dart';
import 'package:merckfoundation_252026/Provider/MediaListingProvider.dart';
import 'package:merckfoundation_252026/Utility/ApiStatusHandler.dart';
import 'package:merckfoundation_252026/Utility/api_status.dart';
import 'package:merckfoundation_252026/model/CountryModel.dart';
import 'package:merckfoundation_252026/model/StoryModel.dart';
import 'package:merckfoundation_252026/screens/MainScreens/dashboard.dart';
import 'package:merckfoundation_252026/widgets/CommonWidget/CommonFunctions.dart';
import 'package:merckfoundation_252026/widgets/CommonWidget/customappbar.dart';
import 'package:merckfoundation_252026/Utility/showdailog.dart';
import 'package:merckfoundation_252026/CommonUtils/customcolor.dart';
import 'package:merckfoundation_252026/enum/commonEnum.dart';
import 'package:merckfoundation_252026/screens/DetailsScreen/DetailScreen.dart';
import 'package:merckfoundation_252026/screens/MediaAndStoriesScreen/PhotoAlumbScreen.dart';
import 'package:merckfoundation_252026/widgets/CommonWidget/CommonLoader.dart';
import 'package:merckfoundation_252026/widgets/EmptyStateWidget.dart';
import 'package:merckfoundation_252026/widgets/FooterFlowerImage.dart';
import 'package:merckfoundation_252026/widgets/ImagePreviewScreen.dart';
import 'package:merckfoundation_252026/widgets/YouTubePreview.dart';
import 'package:merckfoundation_252026/widgets/Bottomcardlink.dart';
import 'package:merckfoundation_252026/widgets/AppDrawerfilter.dart';
import 'package:merckfoundation_252026/widgets/mediaCard.dart';
import 'package:provider/provider.dart';

class MediaListingScreen extends StatefulWidget {
  final MediaType type;
  final String categoryID;
  final String albumName;
  final String albumID;
  final String menuID;
  final String title;
  final String? digitalLibraryCategoryName;

  final String? shareLink;
  final List<StoryModel>? initialList;
  final bool useLocalPagination;
  final isFilterApply;
  final String? videoNavigationKey;
  final HomeLayoutType? homeLayoutType;

  const MediaListingScreen({
    super.key,
    required this.type,
    required this.categoryID,
    required this.albumID,
    required this.albumName,
    required this.menuID,
    required this.title,
    this.shareLink,
    this.initialList,
    this.useLocalPagination = false,
    this.isFilterApply = true,
    this.digitalLibraryCategoryName,
     this.videoNavigationKey,  this.homeLayoutType,
  });

  @override
  State<MediaListingScreen> createState() => _MediaListingScreenState();
}

class _MediaListingScreenState extends State<MediaListingScreen> {
  final ScrollController _controller = ScrollController();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
String? categoryId;

  @override
  void initState() {
    super.initState();

        final filter = context.read<FilterProvider>();
    final provider = context.read<MediaListingProvider>();

WidgetsBinding.instance.addPostFrameCallback((_) async {
  if (!mounted) return;

  final filter = context.read<FilterProvider>();
  final provider = context.read<MediaListingProvider>();

  // Reset previous filter state
  filter.clearFilters();

  // Ambassador album does not need filters
  if (widget.type != MediaType.ambassadorAlbum) {
    await filter.loadFilters(
      context,
      type: widget.type,
    );

    if (!mounted) return;

    // ============================
    // RESTRICT VIDEO CATEGORIES
    // ============================
    if (widget.type == MediaType.all &&
        widget.categoryID.isNotEmpty) {
      
      final allowedCategoryIds = widget.categoryID
          .split(',')
          .map((e) => int.tryParse(e.trim()))
          .whereType<int>()
          .toSet();

      debugPrint(
        "Allowed category IDs: $allowedCategoryIds",
      );

      filter.categories = filter.categories
          .where(
            (category) =>
                allowedCategoryIds.contains(category.id),
          )
          .toList();

      debugPrint(
        "Filtered categories: "
        "${filter.categories.map((e) => '${e.id}-${e.name}').toList()}",
      );
    }

    // ============================
    // DIGITAL LIBRARY
    // ============================
    if (widget.type == MediaType.digitalLibraryall) {
      final id = int.tryParse(
        widget.categoryID.trim(),
      );

      if (id != null) {
        final matchedCategory =
            filter.categories.firstWhere(
          (category) => category.id == id,
          orElse: () => filter.allCategory,
        );

        if (matchedCategory.id == id) {
          filter.categories = [matchedCategory];

          filter.selectCategory(
            matchedCategory,
          );

          debugPrint(
            "Selected Digital Library Category: "
            "${matchedCategory.id} - "
            "${matchedCategory.name}",
          );
        } else {
          filter.categories = [];

          debugPrint(
            "Category not found: $id",
          );
        }
      }
    }
     if (widget.type == MediaType.photoAlbum &&
        widget.categoryID.isNotEmpty) {
      
      final allowedCategoryIds = widget.categoryID
          .split(',')
          .map((e) => int.tryParse(e.trim()))
          .whereType<int>()
          .toSet();

      debugPrint(
        "Allowed PhotoAlbum category IDs: $allowedCategoryIds",
      );

      filter.categories = filter.categories
          .where(
            (category) =>
                allowedCategoryIds.contains(category.id),
          )
          .toList();

      debugPrint(
        "FilteredPhotoAlbum categories: "
        "${filter.categories.map((e) => '${e.id}-${e.name}').toList()}",
      );
    }
  }

  // ============================
  // LOAD MEDIA
  // ============================
  if (widget.useLocalPagination &&
      widget.initialList != null) {
    provider.setLocalData(
      widget.initialList!,
    );
  } else {
    provider.loadInitial(
      context: context,
      type: widget.type,
      countryId: "",
      categoryId: widget.categoryID,
      languageId: "",
      albumID: widget.albumID,
    );
  }
});
     
    /// 🔥 RESET FILTER (prevent carry-over)

//     WidgetsBinding.instance.addPostFrameCallback((_) async {
//       if (!mounted) return;
//       context.read<FilterProvider>().clearFilters();
//       if(widget.type!=MediaType.ambassadorAlbum)
//       {
//  await filter.loadFilters(context, type: widget.type);
//  if (widget.type == MediaType.all && widget.categoryID.isNotEmpty) {
//   print("RANGA");
//   final allowedCategoryIds = widget.categoryID
//       .split(',')
//       .map((e) => int.tryParse(e.trim()))
//       .whereType<int>()
//       .toSet();
//  print("RANGA ${allowedCategoryIds}");
//   filter.categories = filter.categories
//       .where((category) => allowedCategoryIds.contains(category.id))
//       .toList();

//        print("RANGA ${filter.categories}");
// }
// if (widget.type == MediaType.digitalLibraryall) {
//   print("RANGA digitalLibraryall");
//   print("Category ID = ${widget.categoryID}");

//   final categoryId = int.tryParse(widget.categoryID.trim());

//   if (categoryId != null) {
//     final matchedCategory = filter.categories.firstWhere(
//       (category) => category.id == categoryId,
//       orElse: () => filter.allCategory,
//     );

//     if (matchedCategory.id == categoryId) {
//       // Show ONLY the selected category.
//       filter.categories = [matchedCategory];

//       // Automatically select that category.
//       filter.selectCategory(matchedCategory);

//       print(
//         "Selected Digital Library Category: "
//         "${matchedCategory.id} - ${matchedCategory.name}",
//       );
//     } else {
//       filter.categories = [];
//       print("Category not found: $categoryId");
//     }
//   }
// }
// // if(widget.type==MediaType.digitalLibraryall)
// // {
// //   print("object");
// //   print(widget.type);
// //   if (widget.digitalLibraryCategoryName!.isNotEmpty) {
// //     print("Selected Category Name: '${widget.digitalLibraryCategoryName}'");

// // for (final item in filter.categories) {
// //   print(
// //     "ID: ${item.id}, "
// //     "Name: '${item.name}', "
// //     "CatgName: '${item.catgname}'",
// //   );
// // }

// // final category = filter.categories.firstWhere(
// //   (e) =>
// //       (e.name ?? "").trim().toLowerCase() ==
// //       (widget.digitalLibraryCategoryName ?? "")
// //           .trim()
// //           .toLowerCase(),
// //   orElse: () => CategoryModel(id: 0, name: ""),
// // );

// // print("Matched Category:");
// // print("ID: ${category.id}");
// // print("Name: ${category.name}");
// // print("CatgName: ${category.catgname}");

// // if (category.id != 0) {
// //   categoryId = category.id.toString();
// //   filter.selectCategory(category);
// //   print("Category ID: $categoryId");
// // } else {
// //   print("No matching category found.");
// // }
// //     }
// // }
//       }
//       // if(widget.type==MediaType.all){
//       //   print("VIDEO ALL");
//       //  provider.loadInitial(
//       //     context: context,
//       //     type: widget.type,
//       //     countryId: "",
//       //     categoryId: widget.categoryID,
//       //     languageId: "",
//       //     albumID: widget.albumID,
//       //   );
//       // }else{
//         if (widget.useLocalPagination && widget.initialList != null) {
//         provider.setLocalData(widget.initialList!);
//       } else {
//         provider.loadInitial(
//           context: context,
//           type: widget.type,
//           countryId: "",
//           categoryId:widget.categoryID,
//           languageId: "",
//           albumID: widget.albumID,
//         );
//       }
//       // }
//     });
    // WidgetsBinding.instance.addPostFrameCallback((_) {
     

    //   if (filter.countries.isEmpty ||
    //       filter.categories.isEmpty ||
    //       filter.languages.isEmpty) {
    //     if (widget.type != MediaType.episodes &&
    // widget.type != MediaType.ambassadorAlbum) {
    //       filter.loadFilters(context, type: widget.type);
    //     }
    //   }
    // });

    // if (widget.type == MediaType.photoAlbum) {
    //   return;
    // }

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
      // return widget.title;
      case MediaType.videoLibrary:
      // return "Video Library";
      case MediaType.testimonial:
      // return "Testimonials";
      case MediaType.photoGallery:
      // return "Photo Gallery";
      case MediaType.activity:
      // return "Our Activities";
      case MediaType.digitalLibraryall:
      case MediaType.digitalLibrary:
      // return "Digital Library";
      case MediaType.testimonialArticle:
        // return "Testimonials of Merck Foundation Alumni";
        return widget.title;
      case MediaType.photoAlbum:
        return widget.albumName;
      case MediaType.episodes:
        return widget.albumName;
        case MediaType.article:
        return "";
      case MediaType.ambassadorAlbum:
       case MediaType.all:
        return widget.title;
    }
  }
String getContentTitle() {
    switch (widget.type) {
      case MediaType.stories:
      case MediaType.testimonial:
      // return "Testimonials";
      case MediaType.photoGallery:
      // return "Photo Gallery";
      case MediaType.activity:
      // return "Our Activities";
      case MediaType.digitalLibrary:
        case MediaType.digitalLibraryall:
      // return "Digital Library";
     
      case MediaType.testimonialArticle:
        // return "Testimonials of Merck Foundation Alumni";
        return widget.title;
      case MediaType.photoAlbum:
        return widget.albumName;
      case MediaType.episodes:
        return widget.albumName;
      case MediaType.ambassadorAlbum:
        return widget.title;
         
 case MediaType.all:
 return widget.title;
        
      case MediaType.article:
      return "";
        case MediaType.videoLibrary:
      return "Videos";
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
       onWillPop: () async {
         print("onpop");
        print(widget.type);
    (widget.type == MediaType.stories || widget.type == MediaType.all ||
                  widget.type == MediaType.photoGallery)
              ?   Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (_) => Dashboard(
              index: 0,
              menuID: widget.menuID,
              shareLink: widget.shareLink,
              menuLogo: "",
            ),
          ),
        )
              : () {
                print("Coming Phot c");
                  Navigator.pop(context);
                };

    return true;
  },
      child: Scaffold(
        key: _scaffoldKey,
        endDrawer: AppDrawerfilter(type: widget.type),
      
        appBar: CommonAppBar(
          type: AppBarType.inner,
          title:getContentTitle(),
          // getTitle(),
          onFilter:
              (widget.type == MediaType.photoGallery ||
                  widget.type == MediaType.photoAlbum ||
                  widget.type == MediaType.episodes ||
                  widget.type == MediaType.activity ||widget.type == MediaType.ambassadorAlbum )
              ? null
              : widget.isFilterApply
              ? () => _scaffoldKey.currentState!.openEndDrawer()
              : null,
          onBack:
              (widget.type == MediaType.stories || widget.type == MediaType.all ||
                  widget.type == MediaType.photoGallery)
              ? null
              : () {
                print("Coming Phot c");
                  Navigator.pop(context);
                },
          onSearch: () {},
          shareLink: widget.shareLink ?? "",
          menuID: widget.menuID,
        ),
      
        backgroundColor: Customcolor.background,
      
        body: Consumer<MediaListingProvider>(
          builder: (context, provider, _) {
            // if (provider.isLoading && provider.storyList.isEmpty) {
            //   return const Center(child:CommonLoader());
            // }
            /// LOADING
            if (provider.status == ApiStatus.loading &&
                provider.storyList.isEmpty) {
              return const Center(child: CommonLoader());
            }
            if (provider.status != ApiStatus.success &&
                provider.status != ApiStatus.loading &&
                provider.status != ApiStatus.initial) {
              return ApiStatusHandler(
                status: provider.status,
                errorMessage: provider.errorMessage,
                onRetry: () {
                  provider.retry(context);
                },
              );
            }
      
            return CustomScrollView(
              controller: _controller,
              slivers: [
                /// 🔹 GRID
                (provider.storyList.isEmpty)
                    ? SliverFillRemaining(
                        hasScrollBody: false,
                        child: Column(
                          children: [
                            Expanded(child: EmptyStateWidget()),
      
                            const FooterFlowerImage(),
                            const SizedBox(height: 8),
                            const Bottomcardlink(),
                          ],
                        ),
                      )
                    : SliverPadding(
                        padding: const EdgeInsets.only(left: 8, right: 8, top: 8),
                        sliver: SliverGrid(
                          delegate: SliverChildBuilderDelegate(
                            (context, index) {
                              /// ✅ LOAD MORE LOADER
                              // if (widget.type != MediaType.photoAlbum &&
                              //     index >= provider.storyList.length) {
                              //   return provider.hasMore && provider.isLoading
                              //       ? const Padding(
                              //           padding: EdgeInsets.all(16),
                              //           child: Center(child: CommonLoader()),
                              //         )
                              //       : const SizedBox();
                              // }
      if (index >= provider.storyList.length) {
  return const Padding(
    padding: EdgeInsets.all(16),
    child: Center(
      child: CommonLoader(),
    ),
  );
}
                              final item = provider.storyList[index];
      
                              /// 🖼️ PHOTO GALLERY
                              if (widget.type == MediaType.photoGallery || widget.type == MediaType.ambassadorAlbum ||
                                  widget.type == MediaType.digitalLibrary ||
                                  widget.type == MediaType.digitalLibraryall || 
                                  widget.type == MediaType.photoAlbum ||
                                  widget.type == MediaType.activity) {
                                return 
                                MediaCard(
                                  mediaType: widget.type ,
                                  type: widget.homeLayoutType,
                                  menuID: widget.menuID,
                                  shareLink: widget.shareLink,
                                  id: item.id.toString(),
                                  image: (widget.type == MediaType.photoAlbum|| widget.type == MediaType.ambassadorAlbum)
                                      ? item.photo ?? ""
                                      : (widget.type == MediaType.digitalLibrary ||widget.type == MediaType.digitalLibraryall)
                                      ? item.thumbnail_image ?? ""
                                      : item.image ?? "",
                                  title:  (widget.type == MediaType.photoAlbum|| widget.type == MediaType.ambassadorAlbum)
                                      ? item.photo_description ?? ""
                                      : widget.type == MediaType.photoGallery
                                      ? item.photo_category_name ?? ""
                                      : item.title,
                                  showPlayIcon: false,
                                  onTap: () {
                                    if (widget.type == MediaType.digitalLibrary ||widget.type == MediaType.digitalLibraryall ) {
                                      ShowDialogs.launchURL(item.document!);
                                    }else
                                    if (widget.type == MediaType.photoGallery) {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (_) => PhotoAlumbScreen(
                                            homeLayoutType: HomeLayoutType.photoGallery,
                                            pageTile: getTitle(),
                                            tile: item.photo_category_name,
                                            categoryID: item.id.toString(),
                                            menuID: widget.menuID,
                                            shareLink: widget.shareLink,
                                          ),
                                        ),
                                      );
                                    } else if (widget.type ==
                                        MediaType.photoAlbum || widget.type ==
                                        MediaType.ambassadorAlbum) {
                                      showModalBottomSheet(
                                        context: context,
                                        isScrollControlled: true,
                                     backgroundColor: Colors.transparent,
      barrierColor: Colors.transparent,
                                        builder: (_) => 
                                        ImagePreviewDialog(
                                          items: provider.storyList,
      initialIndex: index,

      imageUrl: (item) => item.photo ?? "",

      title: (item) =>
          item.photo_description ?? "",
                                          // imageUrl: item.photo ?? "",
                                          // title: item.photo_description ?? "",
                                        ),
                                      );
                                    } else {
                                      print("COm ${widget.type}");
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (_) => DetailScreen(
                                            item.title,
                                            item.details,
                                            title: getTitle(),
                                            shareLink: widget.shareLink,
                                            isDetailApiCalled: true,
                                            articleId: item.id.toString(),
                                            languageId: item.languageid,
                                            menuID: widget.menuID,
                                          ),
                                        ),
                                      );
                                    }
                                  },
                                );
                              }
      
                              /// 🎥 VIDEO TYPES
                              return
                               MediaCard(
                                mediaType: widget.type ,
                                menuID: widget.menuID,
                                shareLink: widget.shareLink,
                                id: item.id.toString(),
                                image: getYoutubeThumbnail(item.videoLink),
                                title: widget.type == MediaType.episodes
                                    ? item.episode_name ?? ""
                                    : item.videoDesc,
                                showmenu: widget.type == MediaType.episodes
                                    ? true
                                    : false,
                                showPlayIcon: true,
                                onTap: () {
                                  print("25Aug");
                                  final key = getYoutubeVideoId(item.videoLink);

if (key != null && key.isNotEmpty) {
  ShowDialogs.youtubevideolink(
    "https://www.youtube.com/watch?v=$key&autoplay=1",
  );
}
                                  // var key = item.videoLink.substring(
                                  //   item.videoLink.length - 11,
                                  // );
      
                                  // ShowDialogs.youtubevideolink(
                                  //   "https://www.youtube.com/watch?v=$key?autoplay=1",
                                  // );
                                },
                              );
                            },
                            childCount: provider.storyList.length +
    ((widget.type != MediaType.photoAlbum &&
            provider.hasMore &&
            provider.isLoading)
        ? 1
        : 0),
                            // childCount: widget.type == MediaType.photoAlbum
                            //     ? provider.storyList.length
                            //     : provider.storyList.length + 1,
                          ),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
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
      ),
    );
  }
}
