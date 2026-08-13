import 'dart:convert';

import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:merckfoundation_252026/Utility/ApiStatusHandler.dart';
import 'package:merckfoundation_252026/Utility/AppSizes.dart';
import 'package:merckfoundation_252026/Utility/api_status.dart';
import 'package:merckfoundation_252026/model/AwardResponse.dart';
import 'package:merckfoundation_252026/model/LayoutModel.dart';
import 'package:merckfoundation_252026/model/StoryModel.dart';
import 'package:merckfoundation_252026/routes/AppNavigation.dart';
import 'package:merckfoundation_252026/screens/CovidScreen/Covid/CovidFlipSection.dart';
import 'package:merckfoundation_252026/screens/DetailsScreen/OurAwardScreen.dart';
import 'package:merckfoundation_252026/screens/MainUIBody.dart/CommonContentPage.dart';
import 'package:merckfoundation_252026/screens/MediaAndStoriesScreen/MediaListingScreen.dart';
import 'package:merckfoundation_252026/widgets/CommonList/TestimonialVerticalSection.dart';
import 'package:merckfoundation_252026/widgets/CommonList/VerticalMediaSection.dart';
import 'package:merckfoundation_252026/widgets/CommonWidget/CommonFunctions.dart';

import 'package:merckfoundation_252026/widgets/CommonWidget/CommonLoader.dart';
import 'package:merckfoundation_252026/widgets/CommonWidget/CommonMarqueeWidget.dart';

import 'package:merckfoundation_252026/widgets/EmptyStateWidget.dart';
import 'package:merckfoundation_252026/widgets/FollowSocialSection.dart';
import 'package:merckfoundation_252026/widgets/ProgramCard.dart';
import 'package:provider/provider.dart';

import 'package:merckfoundation_252026/Provider/PageProvider.dart';
import 'package:merckfoundation_252026/Utility/ResponsiveFlutter.dart';
import 'package:merckfoundation_252026/Utility/showdailog.dart';
import 'package:merckfoundation_252026/CommonUtils/common_strings.dart';
import 'package:merckfoundation_252026/CommonUtils/customcolor.dart';
import 'package:merckfoundation_252026/enum/commonEnum.dart';
import 'package:merckfoundation_252026/model/CommonModel.dart';

import 'package:merckfoundation_252026/screens/MainScreens/HomeNewScreen.dart';
import 'package:merckfoundation_252026/widgets/CommonWidget/ContentCarouselWidget.dart';

import 'package:merckfoundation_252026/widgets/CommonList/CommonCarouselSection.dart';
import 'package:merckfoundation_252026/widgets/CommonList/HorizontalMediaSection.dart';

import 'package:merckfoundation_252026/widgets/DynamicTabView.dart';
import 'package:merckfoundation_252026/widgets/FooterFlowerImage.dart';
import 'package:merckfoundation_252026/widgets/CommonList/CommonStaticGrid.dart';
import 'package:merckfoundation_252026/widgets/Homewidget.dart/homeSlider.dart';
import 'package:merckfoundation_252026/widgets/LeaderCard.dart';
import 'package:merckfoundation_252026/widgets/SmartHtmlWidget.dart';
import 'package:merckfoundation_252026/widgets/Bottomcardlink.dart';

class CommonBody extends StatefulWidget {
  final String? menuID;

  final bool showFooter;
  final bool showBottomLinks;
  final Function(String title)? onPageTitleLoaded;
  final Function(bool title)? onPageshareLoaded;
  final Function(bool isVisible, List<dynamic> menus)? onProgramMenuChanged;

  const CommonBody(
    this.menuID, {
    super.key,
    this.showFooter = true,
    this.showBottomLinks = true,
    this.onProgramMenuChanged,
    this.onPageTitleLoaded,
    this.onPageshareLoaded,
  });

  @override
  State<CommonBody> createState() => _CommonBodyState();
}

class _CommonBodyState extends State<CommonBody> {
  bool isPdfPage = false;
  bool _isNavigating = false;
  dynamic json = {};
  final controller = ScrollController();
  late CarouselSliderController controllerCarousel;
  dynamic root = {};
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      controllerCarousel = CarouselSliderController();
      if (!mounted) return;

      loadPage();
    });
    controller.addListener(() {});
  }

  bool hasLoaded = false;
  bool isProgramMenuVisible = false;
  List<dynamic> programMenus = [];
  Future<void> loadPage() async {
    final provider = Provider.of<PageProvider>(context, listen: false);

    setState(() {
      hasLoaded = false; // reset before API
    });

    await provider.fetchPage(context, widget.menuID ?? "");

    // final data = provider.pageData;
    final data = provider.pageDataFor(widget.menuID ?? "");
    if (!mounted) return;

    if (data == null) {
      setState(() => hasLoaded = true);
      return;
    }

    root = data['data'];

    if (root is Map) {
      setState(() {
        isProgramMenuVisible = root['mobile_submenus_show'] == true;

        programMenus = root['page_menu_list'] ?? [];
      });

      widget.onProgramMenuChanged?.call(isProgramMenuVisible, programMenus);
      final dataType = (root['data_type'] ?? "").toString().toLowerCase();

      if (dataType == "layout") {
        json = root['json_data'] ?? {};
      }
      final pageTitle = root['menu_title'] ?? "";
      widget.onPageTitleLoaded?.call(pageTitle);

      final shareLink = root['share_link'] ?? "";
      widget.onPageshareLoaded?.call(shareLink);
      // if (dataType == "pdf") {
      //   isPdfPage = true;
      // }
      if (dataType == "pdf" || dataType == "redirectionlink") {
        isPdfPage = true;

        final pdfUrl = root['pdf_data']?['pdf_url'] ?? "";

        if (pdfUrl.toString().isNotEmpty) {
          await ShowDialogs.launchURL(pdfUrl);

          if (mounted && Navigator.canPop(context)) {
            Navigator.pop(context);
          }
        }

        setState(() {
          hasLoaded = true;
        });

        return;
      }
    }

    setState(() {
      hasLoaded = true; // ✅ IMPORTANT
    });
  }

  @override
  Widget build(BuildContext context) {
    // final provider = context.watch<PageProvider>();
    final provider = Provider.of<PageProvider>(context);

    final allLayouts = provider.layoutsFor(widget.menuID ?? "");
    // LOADING
    if (provider.isLoading) {
      return const Center(child: CommonLoader());
    }

    if (provider.status != ApiStatus.success &&
        provider.status != ApiStatus.loading &&
        provider.status != ApiStatus.initial) {
      return ApiStatusHandler(
        status: provider.status,
        errorMessage: provider.errorMessage,
        onRetry: () {
          loadPage();
        },
      );
    }

    /// PDF SCREEN
    if (isPdfPage) {
      return const SizedBox();
    }

    // List allLayouts = [];

    // if (json['slider'] is List) {
    //   allLayouts.addAll(json['slider']);
    // }

    // if (json['top'] is List) {
    //   allLayouts.addAll(json['top']);
    // }

    // if (json['middle_left'] is List) {
    //   allLayouts.addAll(json['middle_left']);
    // }

    // if (json['middle_right'] is List) {
    //   allLayouts.addAll(json['middle_right']);
    // }

    // if (json['bottom'] is List) {
    //   allLayouts.addAll(json['bottom']);
    // }

    if (!provider.isLoading && hasLoaded && allLayouts.isEmpty) {
      return CustomScrollView(
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Column(
              children: [
                Expanded(child: EmptyStateWidget()),
                if (widget.showFooter) const FooterFlowerImage(),
                if (widget.showBottomLinks) ...[
                  const SizedBox(height: 8),
                  const Bottomcardlink(),
                ],
              ],
            ),
          ),
        ],
      );
    }

    int extraCount = 0;

    if (widget.showFooter) extraCount++;

    if (widget.showBottomLinks) extraCount++;
    // return ListView.builder(
    //   itemCount: allLayouts.length,
    //   itemBuilder: (context, index) {
    //     return Container(
    //       height: 100,
    //       margin: const EdgeInsets.all(8),
    //       color: Colors.red,
    //       child: Center(
    //         child: Text(
    //           allLayouts[index].type.toString(),
    //           style: const TextStyle(color: Colors.white),
    //         ),
    //       ),
    //     );
    //   },
    // );
    return ListView.builder(
      controller: controller,
      cacheExtent: 300,
      shrinkWrap: true,
      //physics: BouncingScrollPhysics(),
      // physics: const ScrollPhysics(),
      itemCount: allLayouts.length + extraCount,
      itemBuilder: (context, index) {
        int currentIndex = allLayouts.length;

        if (widget.showFooter && index == currentIndex) {
          return const FooterFlowerImage();
        }

        if (widget.showFooter) {
          currentIndex++;
        }

        if (widget.showBottomLinks && index == currentIndex) {
          return Column(
            children: const [SizedBox(height: 8), Bottomcardlink()],
          );
        }

        return renderLayout(allLayouts[index], allLayouts);
      },
    );
  }

  bool tabShowViewButton = false;

  // Widget renderLayout(Map layout, List allLayouts) {
  Widget renderLayout(LayoutModel layout, List<LayoutModel> allLayouts) {
    final responsive = ResponsiveFlutter.of(context);
    final bool showViewButton = layout.viewButton == true;
    // final HomeLayoutType type = (layout.type ?? "")
    //     .toString()
    //     .toHomeLayoutType();

    final HomeLayoutType type = layout.type;

    /// ✅ HANDLE TABS (GLOBAL)
    if (tabTypes.contains(layout.type) &&
        (layout.mobileView == "horizontal" ||
            layout.mobileView == "Horizontal")) {
      /// ✅ only layouts having content
      final validTabLayouts = allLayouts.where((e) {
        final List content = e.content ?? [];

        return tabTypes.contains(e.type) && content.isNotEmpty;
      }).toList();

      /// ✅ if no valid tabs -> hide whole section
      if (validTabLayouts.isEmpty) {
        return const SizedBox();
      }

      /// ✅ prevent duplicate rendering
      if (layout != validTabLayouts.first) {
        return const SizedBox();
      }

      /// ✅ build only valid tabs
      final tabs = validTabLayouts.map<DynamicTabItem>((tabLayout) {
        final List content = tabLayout.content ?? [];

        tabShowViewButton = tabLayout.viewButton == true;

        final items = content.map<CarouselItem>((e) {
          final image = e['thumbnail'];
          final title = e['title'];
          final pageUrl = e['page_url'];

          return CarouselItem(
            image: image is String ? image : "",
            title: title is String ? title : "",
            onTap: tabLayout.type == HomeLayoutType.MerckMoreThanAmbasdar
                ? null
                : () {
                    ShowDialogs.launchURL(pageUrl);
                  },
          );
        }).toList();
        return DynamicTabItem(
          key: tabLayout.type.name,

          title: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 2),
            child: 
            SmartHtmlWidget(
              html: tabLayout.title ?? "",
              fontSize: AppSizes.body(context),
             
              ignorefontStyles: true,
              // textColor: Customcolor.textBlueColor,

              //  ignoreHtmlStyles: true,
            ),
          ),

          content: CommonCarouselSection(
            controller: controllerCarousel,
            carouselHeight: CommonStrings.callcoursaheight,
            imageWidth: CommonStrings.callimagewidth,
            imageHeight: CommonStrings.callimageheight,

            /// ✅ hide button if false
            buttonText: tabShowViewButton ? (tabLayout.buttonText ?? "") : "",

            onViewAll: () {
              AppNavigation.navigateByMenuId(
                context,
                menuId: tabLayout.buttonMenuId.toString(),
                albumId: "",
                type:
                    tabLayout.type.name ==
                        HomeLayoutType.CallForApplication.name
                    ? HomeLayoutType.CallForApplication
                    : tabLayout.type.name ==
                          HomeLayoutType.MerckMoreThanAmbasdar.name
                    ? HomeLayoutType.MerckMoreThanAmbasdar
                    : HomeLayoutType.DigitalLibrary,
                albumName: "",
                categoryId: "",
                title: tabLayout.title ?? "",
                shareLink: tabLayout.buttonLink,
              );
            },

            items: items,
          ),
        );
      }).toList();

      /// ✅ final safety
      if (tabs.isEmpty) {
        return const SizedBox();
      }

      return SizedBox(
        height: tabShowViewButton
            ? CommonStrings.tabheightwithview
            : CommonStrings.tabheight,
        child: DynamicTabView(
          tabs: tabs,
          indicatorColor: Customcolor.pinkBgColor,
        ),
      );
    }
    final isFirstContentLayout =
        type == HomeLayoutType.content &&
        allLayouts.where((e) => e.type == HomeLayoutType.content).first ==
            layout;
    switch (type) {
      case HomeLayoutType.slider:
        return HomeSlider(content: layout.content);
      case HomeLayoutType.award:
        // final List content = layout.content ?? [];
        final screenWidth = MediaQuery.of(context).size.width;

        final items = layout.awards;
        // context.read<PageProvider>().awardsFor(
        //   widget.menuID ?? "",
        // );

        return widget.menuID == "98"
            ? CovidFlipSection(content: layout.content)
            : Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 15, bottom: 5),
                      child: SmartHtmlWidget(
                        html: "Our Awards",
                        textColor: Customcolor.textBlueColor,
                        fontSize: screenWidth * 0.055,
                        fontWeight: FontWeight.w800,
                        ignoreHtmlStyles: true,
                      ),
                    ),

                    SizedBox(
                      height: 120, // give a fixed height
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: items.length,
                        separatorBuilder: (_, __) => const SizedBox(width: 12),
                        itemBuilder: (context, index) {
                          final award = items[index];

                          final Color color = Color(
                            int.tryParse(award.subdescription ?? '') ??
                                0xff0e69af,
                          );

                          return Container(
                            margin: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 4,
                            ),

                            decoration: BoxDecoration(
                              color: color,
                              borderRadius: BorderRadius.circular(22),

                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.06),
                                  blurRadius: 12,
                                  offset: const Offset(0, 5),
                                ),
                              ],
                            ),

                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                /// CONTENT
                                Padding(
                                  padding: const EdgeInsets.all(16),

                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      /// TITLE
                                      Text(
                                        stripHtml(award.title),
                                        // award.title,
                                        maxLines: 3,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          fontSize: responsive.fontSize(2.15),
                                          fontWeight: FontWeight.w700,
                                          height: 1.4,
                                          color: Colors.white,
                                        ),
                                      ),

                                      const SizedBox(height: 16),

                                      /// BUTTON
                                      InkWell(
                                        borderRadius: BorderRadius.circular(30),

                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (_) => CommonContentPage(
                                                title: award.title,
                                                menuID: award.subtitle
                                                    .toString(),
                                                shareLink: award.pageUrl,
                                              ),
                                            ),
                                          );
                                        },

                                        child: Container(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 18,
                                            vertical: 10,
                                          ),

                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(
                                              30,
                                            ),
                                          ),

                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Text(
                                                CommonStrings.readMore,
                                                style: TextStyle(
                                                  color: Color(0xff0e69af),
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: responsive.fontSize(
                                                    1.7,
                                                  ),
                                                ),
                                              ),

                                              const SizedBox(width: 8),

                                              Icon(
                                                Icons.arrow_forward_rounded,
                                                color: Color(0xff0e69af),
                                                size: 20,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              );
      case HomeLayoutType.impact:
        final List content = layout.content ?? [];

        final items = content.map<StaticListItem>((e) {
          return StaticListItem(image: e['thumbnail'] ?? "", isNetwork: true);
        }).toList();

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15,right: 15),
              child: SmartHtmlWidget(
                html: layout.title ?? "",
                // textColor: Customcolor.textBlueColor,
                fontSize: AppSizes.heading(context),
                ignorefontStyles: true,
                // fontWeight: FontWeight.w800,
                // ignoreHtmlStyles: true,
              ),
            ),
            CommonStaticGrid(items: items),
          ],
        );

      case HomeLayoutType.photoGallery:
      case HomeLayoutType.PhotoCategory:
      case HomeLayoutType.episodes:
      case HomeLayoutType.video:
      case HomeLayoutType.newsLettersAndArticles:
      case HomeLayoutType.merckFoundationInMedia:
      case HomeLayoutType.testimonials:
      case HomeLayoutType.DigitalLibrary:
      case HomeLayoutType.MerckMoreThanAmbasdar:
      case HomeLayoutType.MerckMoreThanAmbasdarFormer:
      case HomeLayoutType.CallForApplication:
        return (type == HomeLayoutType.testimonials &&
                    layout.mobileView == "vertical" ||
                layout.mobileView == "Vertical")
            ? TestimonialVerticalSection(
                // content: (layout.content as List? ?? [])
                //     .map((e) => StoryModel.fromJson(e))
                //     .toList(),
                content: layout.stories,
                shareLink: layout.buttonLink ?? '',
                title: layout.title ?? '',
              )
            : (layout.mobileView == "vertical" ||
                  layout.mobileView == "Vertical")
            ? VerticalMediaSection(
                // content: (layout.content as List? ?? [])
                //     .map((e) => StoryModel.fromJson(e))
                //     .toList(),
                content: layout.stories,
                shareLink: layout.buttonLink ?? '',

                type: type,
                title: layout.title ?? "",
                buttonText: showViewButton ? (layout.buttonText ?? "") : "",
                menuID: layout.buttonMenuId.toString(),
                content_button: layout.contentButton,
              )
            : HorizontalMediaSection(
                content: layout.content ?? [],
                shareLink: layout.buttonLink ?? '',
                buttonText: showViewButton ? (layout.buttonText ?? "") : "",

                buttonLink: layout.buttonLink ?? '',
                type: type,
                title: layout.title ?? "",
                showDescription: type == HomeLayoutType.testimonials,
                showMenu: type == HomeLayoutType.episodes,
                menuID: layout.buttonMenuId.toString(),
              );

      case HomeLayoutType.content:
        final List<dynamic> contentList = layout.content ?? [];

        if (contentList.isEmpty) {
          return const SizedBox();
        }

        if (contentList.length == 1) {
          final item = contentList.first;

          return Padding(
            padding: const EdgeInsets.only(
              left: 16,
              right: 16,
              top: 16,
              bottom: 2,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // if (!isFirstContentLayout)
                //   layout.title.isNotEmpty
                //       ? SmartHtmlWidget(
                //           html: layout.title ?? "",
                //           textColor: Customcolor.colorVoilet,
                //           fontSize: responsive.fontSize(3.0),
                //           fontWeight: FontWeight.w800,
                //         )
                //       : SmartHtmlWidget(
                //           html: item['title'] ?? "",
                //           // textColor: Customcolor.colorVoilet,
                //           // fontSize: responsive.fontSize(3.0),
                //           // fontWeight: FontWeight.w800,
                //         ),
 SmartHtmlWidget(
                          html: layout.title ?? "",
                          textColor: Customcolor.colorVoilet,
                          fontSize: responsive.fontSize(3.0),
                          fontWeight: FontWeight.w800,
                        ),
               
                SmartHtmlWidget(html: """${item['description']}""" ?? ""),
                //  const SizedBox(height: 10),
              ],
            ),
          );
        }

        return ContentCarouselWidget(contentList: contentList);
      case HomeLayoutType.leadership:
        return LeaderCard(
          content: layout.content ?? [],
          shareLink: layout.buttonLink ?? '',
          menuID: widget.menuID ?? "",
        );

      case HomeLayoutType.marquee:
        return Column(
          children: [CommonMarqueeWidget(contents: layout.content ?? [])],
        );
      case HomeLayoutType.MenuManagement:
        return Column(
          children: [
            SizedBox(height: 10),
            CategorySection(content: layout.content ?? []),
          ],
        );
      case HomeLayoutType.socialLinks:
        final List content = layout.content ?? [];

        if (content.isEmpty) {
          return const SizedBox();
        }

        return Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Column(
            children: content.map<Widget>((item) {
              final String title = item['title']?.toString() ?? "";

              final int position = item['position'] is int
                  ? item['position']
                  : int.tryParse(item['position'].toString()) ?? 0;

              List<dynamic> socialLinks = [];

              try {
                final description = item['description']?.toString() ?? "[]";

                socialLinks = jsonDecode(description);
              } catch (e) {
                debugPrint("Social parse error: $e");
              }

              return Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: FollowSocialSection(
                  title: title,
                  position: position,
                  socialLinks: socialLinks,
                ),
              );
            }).toList(),
          ),
        );

      case HomeLayoutType.OurProgramsManagement:
        return Padding(
          padding: const EdgeInsets.only(left: 10, right: 10, top: 20),
          child: Column(
            children: List.generate((layout.content ?? []).length, (index) {
              final item = layout.content[index];
              final Color color = Color(
                int.tryParse(item['subdescription'] ?? '') ?? 0xff0e69af,
              );
              return ProgramCard(
                program: ProgramModel(
                  title: item['title'],
                  shareLink: item['description'],
                  menuID: item['id'].toString(),
                  bgColor: color,
                ),
                fontSize: responsive.fontSize(1.9),
              );
            }),
          ),
        );

      default:
        return const SizedBox();
    }
  }
}
