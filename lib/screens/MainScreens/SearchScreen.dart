import 'dart:async';

import 'package:flutter/material.dart';
import 'package:merckfoundation_252026/CommonUtils/common_images.dart';
import 'package:merckfoundation_252026/CommonUtils/customcolor.dart';
import 'package:merckfoundation_252026/Provider/SearchProvider.dart';
import 'package:merckfoundation_252026/Utility/showdailog.dart';
import 'package:merckfoundation_252026/enum/commonEnum.dart';
import 'package:merckfoundation_252026/model/TestimonialModel.dart';
import 'package:merckfoundation_252026/screens/DetailsScreen/DetailScreen.dart';
import 'package:merckfoundation_252026/screens/DetailsScreen/TestimonialArticlesScreen.dart';
import 'package:merckfoundation_252026/screens/MainUIBody.dart/CommonContentPage.dart';
import 'package:merckfoundation_252026/screens/MediaAndStoriesScreen/MediaListingScreen.dart';
import 'package:merckfoundation_252026/widgets/CommonWidget/CommonFunctions.dart';
import 'package:merckfoundation_252026/widgets/CommonWidget/customappbar.dart';
import 'package:merckfoundation_252026/widgets/ImagePreviewScreen.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final controller = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  Timer? _debounce;
  @override
  void initState() {
    super.initState();
controller.clear()
;   
 context.read<SearchProvider>().clearSearch();

 _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent - 150) {
        context.read<SearchProvider>().loadMore();
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();

    _debounce?.cancel();

    controller.dispose();
    super.dispose();
  }

  void _onSearchChanged(String value) {
    if (_debounce?.isActive ?? false) {
      _debounce!.cancel();
    }

    _debounce = Timer(const Duration(milliseconds: 500), () {
      if (value.trim().length >= 2) {
        context.read<SearchProvider>().search(value.trim());
      } else {
        context.read<SearchProvider>().clearSearch();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Customcolor.background,
      appBar: CommonAppBar(
        type: AppBarType.inner,
        title: "Search",

        onSearch: () {},
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Container(
              height: 48,
              child: TextField(
                controller: controller,
                autofocus: true,
                decoration: InputDecoration(
                  hintText: "Search",
                  prefixIcon: const Icon(Icons.search),
isDense: true,
      contentPadding: const EdgeInsets.symmetric(
        vertical: 12,
        horizontal: 12,
      ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onChanged: _onSearchChanged,
              ),
            ),
          ),

          Expanded(
            child: Consumer<SearchProvider>(
              builder: (_, provider, __) {
                if (provider.isLoading) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (provider.searchList.isEmpty) {
                  return const Center(child: Text("No Results Found"));
                }

                return ListView.builder(
                  controller: _scrollController,
                  itemCount:
                      provider.searchList.length +
                      (provider.isLoadingMore ? 1 : 0),

                  itemBuilder: (_, index) {
                    if (index == provider.searchList.length) {
                      return const Padding(
                        padding: EdgeInsets.all(16),
                        child: Center(child: CircularProgressIndicator()),
                      );
                    }

                    final item = provider.searchList[index];
                    final thumb = item.thumbnail ?? "";

                    final isYoutube =
                        thumb.contains("youtube.com") ||
                        thumb.contains("youtu.be");

                    String imageUrl = thumb;

                    if (isYoutube) {
                      final videoId = getYoutubeId(thumb);

                      imageUrl =
                          "https://img.youtube.com/vi/$videoId/hqdefault.jpg";
                    }
                    return InkWell(
                      borderRadius: BorderRadius.circular(14),
                      onTap: () {
                        print(item.sourceType);
                        if (item.sourceType == "video" || item.sourceType=="episode") {
                          ShowDialogs.launchURL(item.thumbnail ?? "");
                        }else if(item.sourceType =="media")
                        {
                           ShowDialogs.launchURL(item.pageUrl ?? "");
                        }else if(item.sourceType =="media" || item.sourceType=="digital_library" ||item.sourceType=="call_for_application" || item.sourceType=="news_release")
                        {
                           ShowDialogs.launchURL(item.pageUrl ?? "");
                        }else if(item.sourceType=="newsletter_article")
                        {
Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => DetailScreen(
              "",
              "",
              title: "Articles",
              articleId: item.id,
              languageId: "" ,
              isDetailApiCalled: true,
              shareLink: "",
              menuID:  item.pageMenuId.toString(),
            ),
          ),
        );
                        }else if(item.sourceType=="photo_album")
                        {
                          print("object");
                            print(item.sourceType);
   Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) =>
                        MediaListingScreen(type: MediaType.photoAlbum,categoryID:item.description.toString() ,albumID:item.id.toString() ,albumName:item.title,
                        menuID: item.pageMenuId.toString(),shareLink: "",title: item.title,isFilterApply: false,),
                  ),
                );
                        }else if(item.sourceType=="ambassador")
                        {
                          showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                       backgroundColor: Colors.transparent,
barrierColor: Colors.transparent,
                        builder: (_) => ImagePreviewDialog(
                          items: provider.searchList,
      initialIndex: index,
      imageUrl: (item) => item.thumbnail ?? "",
      title: (item) => item.title ?? "",
                          // imageUrl: item.thumbnail ?? "",
                          // title: item.title,
                        ),
                      );
                        }else if(item.sourceType=="award")
                        {
                           Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => CommonContentPage(
                title: item.title,
                menuID: item.pageMenuId.toString() ?? "",
                shareLink: "",
              ),
            ),
          );
                        }else if(item.sourceType=="testimonial")
                        {


                      final clickedTestimonial = TestimonialModel(
                        image: item.thumbnail ?? "",
                        title: item.title ?? "",
                        departmentName: "",
                        shortDescription: item.description ?? "",
                        details: item.subdescription ?? "",
                      );

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => TestimonialArticlesScreen(
                            title: item.title ?? "",
                            shareLink:   "",
                            initialList: [
                              clickedTestimonial,
                            ], // 👈 only one item
                            useLocalPagination: true,
                          ),
                        ),
                      );
                        }
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 14,
                          vertical: 6,
                        ),
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(14),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.04),
                              blurRadius: 6,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),

                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            /// IMAGE
                            (item.layoutType == "Content" ||
                                    item.layoutType == "Awards")
                                ? Container()
                                : ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.network(
                                      imageUrl,
                                      width: 80,
                                      height: 80,
                                      fit: BoxFit.cover,
                                      errorBuilder: (_, __, ___) {
                                        return Container(
                                          width: 80,
                                          height: 80,
                                          color: Colors.grey.shade200,
                                          child: Image.asset(
                                            CommonImagePath.placeHolder,
                                          ),
                                        );
                                      },
                                    ),
                                  ),

                            const SizedBox(width: 12),

                            /// TITLE
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(top: 2),
                                child: Text(
                                   stripHtml(item.title),
                                  // item.title!,
                                  maxLines: 4,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    height: 1.35,
                                    color: Color(0xff222222),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
