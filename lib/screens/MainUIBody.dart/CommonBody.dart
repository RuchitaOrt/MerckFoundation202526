import 'dart:convert';

import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';
import 'package:merckfoundation_252026/widgets/CommonLoader.dart';
import 'package:merckfoundation_252026/widgets/EmptyStateWidget.dart';
import 'package:provider/provider.dart';

import 'package:merckfoundation_252026/Provider/PageProvider.dart';
import 'package:merckfoundation_252026/Utility/ResponsiveFlutter.dart';
import 'package:merckfoundation_252026/Utility/showdailog.dart';
import 'package:merckfoundation_252026/Utils/common_strings.dart';
import 'package:merckfoundation_252026/Utils/customcolor.dart';
import 'package:merckfoundation_252026/enum/commonEnum.dart';
import 'package:merckfoundation_252026/model/CommonModel.dart';

import 'package:merckfoundation_252026/screens/MainScreens/HomeNewScreen.dart';
import 'package:merckfoundation_252026/screens/WhoWeAreScreen.dart/ContentCarouselWidget.dart';

import 'package:merckfoundation_252026/widgets/CommonCarouselSection.dart';
import 'package:merckfoundation_252026/widgets/CommonList/HorizontalMediaSection.dart';
import 'package:merckfoundation_252026/widgets/CommonRichText.dart';
import 'package:merckfoundation_252026/widgets/DynamicTabView.dart';
import 'package:merckfoundation_252026/widgets/FooterFlowerImage.dart';
import 'package:merckfoundation_252026/widgets/Homewidget.dart/CommonStaticGrid.dart';
import 'package:merckfoundation_252026/widgets/Homewidget.dart/homeSlider.dart';
import 'package:merckfoundation_252026/widgets/LeaderCard.dart';
import 'package:merckfoundation_252026/widgets/SmartHtmlWidget.dart';
import 'package:merckfoundation_252026/widgets/botttomlink.dart';

class CommonBody extends StatefulWidget {
  final String? menuID;

  final bool showFooter;
  final bool showBottomLinks;

  const CommonBody(
    this.menuID, {
    super.key,
    this.showFooter = true,
    this.showBottomLinks = true,
  });

  @override
  State<CommonBody> createState() => _CommonBodyState();
}

class _CommonBodyState extends State<CommonBody> {
  bool isPdfPage = false;

  dynamic json = {};

  @override
  void initState() {
    super.initState();

    loadPage();
  }

  Future<void> loadPage() async {
    final provider = Provider.of<PageProvider>(context, listen: false);

    await provider.fetchPage(context, widget.menuID ?? "");

    final data = provider.pageData;

    if (data is Map) {
      final dataType =
          data['data']?['data_type']?.toString().toLowerCase() ?? "";

      /// PDF
      if (dataType == "pdf") {
        isPdfPage = true;

        final pdfUrl = data['data']?['pdf_data']?['pdf_url'] ?? "";

        if (pdfUrl.toString().isNotEmpty) {
          await ShowDialogs.launchURL(pdfUrl);

          if (mounted && Navigator.canPop(context)) {
            Navigator.pop(context);
          }
        }

        return;
      }

      /// LAYOUT
      if (dataType == "layout") {
        json = data['data']?['json_data'] ?? {};
      }
    } else if (data is String) {
      json = jsonDecode(data);
    }

    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<PageProvider>();

    /// LOADING
    if (provider.isLoading) {
      return const Center(child: CommonLoader());
    }

    /// PDF SCREEN
    if (isPdfPage) {
      return const SizedBox();
    }

    List allLayouts = [];

    allLayouts.addAll(json['slider'] ?? []);
    allLayouts.addAll(json['top'] ?? []);
    allLayouts.addAll(json['middle_left'] ?? []);
    allLayouts.addAll(json['middle_right'] ?? []);
    allLayouts.addAll(json['bottom'] ?? []);

    /// NO DATA
    if (allLayouts.isEmpty) {
      return CustomScrollView(
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Column(
              children: [
                /// CENTER CONTENT
                Expanded(child: EmptyStateWidget()),

                /// FOOTER AT SCREEN BOTTOM
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
    allLayouts.sort((a, b) {
      final aOrder = homelayoutOrder[a['layout_type']] ?? 999;

      final bOrder = homelayoutOrder[b['layout_type']] ?? 999;

      return aOrder.compareTo(bOrder);
    });

    int extraCount = 0;

    if (widget.showFooter) extraCount++;

    if (widget.showBottomLinks) extraCount++;

    return ListView.builder(
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
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

  Widget renderLayout(Map layout, List allLayouts) {
    final responsive = ResponsiveFlutter.of(context);

    final HomeLayoutType type = (layout['layout_type'] ?? "")
        .toString()
        .toHomeLayoutType();

    /// ✅ HANDLE TABS (GLOBAL)
    if (tabTypes.contains(layout['layout_type'])) {
      /// 👉 get all tab layouts from FULL list
      final tabLayouts = allLayouts
          .where(
            (e) =>
                tabTypes.contains(e['layout_type']) &&
                (e['content'] ?? []).isNotEmpty,
          )
          .toList();

      /// ❌ prevent duplicate rendering
      if (layout != tabLayouts.first) {
        return const SizedBox();
      }

      /// 👉 build tabs dynamically
      final tabs = tabLayouts.map<DynamicTabItem>((tabLayout) {
        final List content = tabLayout['content'];

        final items = content.map<CarouselItem>((e) {
          return CarouselItem(
            image: e['thumbnail'] ?? "",
            title: e['title'],
            onTap: () {},
          );
        }).toList();

        return DynamicTabItem(
          key: tabLayout['layout_type'],

          /// ✅ TITLE FROM API (dynamic)
          title: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              tabLayout['title'] ?? "",
              textAlign: TextAlign.center,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),

          /// ✅ CONTENT
          content: CommonCarouselSection(
            controller: CarouselSliderController(),
            carouselHeight: CommonStrings.callcoursaheight,
            imageWidth: CommonStrings.callimagewidth,
            imageHeight: CommonStrings.callimageheight,
            onViewAll: () {
              debugPrint("View all → ${tabLayout['layout_type']}");
            },
            items: items,
          ),
        );
      }).toList();

      if (tabs.isEmpty) return const SizedBox();

      return SizedBox(
        height: CommonStrings.tabheight,
        child: DynamicTabView(tabs: tabs, indicatorColor: Customcolor.pinkbg),
      );
    }

    switch (type) {
      case HomeLayoutType.slider:
        return HomeSlider(content: layout['content']);

      case HomeLayoutType.impact:
        final List content = layout['content'] ?? [];

        final items = content.map<StaticListItem>((e) {
          return StaticListItem(image: e['thumbnail'] ?? "", isNetwork: true);
        }).toList();

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CommonRichText(title: layout['title'] ?? "", subtitle: ""),
            CommonStaticGrid(items: items),
          ],
        );

      case HomeLayoutType.photoGallery:
      case HomeLayoutType.episodes:
      case HomeLayoutType.video:
      case HomeLayoutType.newsLettersAndArticles:
      case HomeLayoutType.merckFoundationInMedia:
      case HomeLayoutType.testimonials:
        return HorizontalMediaSection(
          content: layout['content'] ?? [],
          buttonText:(type == HomeLayoutType.newsLettersAndArticles || type == HomeLayoutType.photoGallery || type == HomeLayoutType.merckFoundationInMedia || type == HomeLayoutType.testimonials )
              ? CommonStrings.viewMore: (type == HomeLayoutType.video ||type == HomeLayoutType.episodes)
              ? CommonStrings.watchMore
              : CommonStrings.viewAll,
          type: type,
          title: layout['title'],
          showDescription: type == HomeLayoutType.testimonials,
          showMenu: type == HomeLayoutType.episodes,
        );

      case HomeLayoutType.content:
        final List<dynamic> contentList = layout['content'] ?? [];

        if (contentList.isEmpty) {
          return const SizedBox();
        }

        if (contentList.length == 1) {
          final item = contentList.first;

          return Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SmartHtmlWidget(
                  html: item['title'] ?? "",
                  textColor: Customcolor.colorVoilet,
                  fontSize: responsive.fontSize(3.0),
                  fontWeight: FontWeight.w800,
                ),

                const SizedBox(height: 10),

                SmartHtmlWidget(html: item['description'] ?? ""),

                const SizedBox(height: 10),

                SmartHtmlWidget(html: item['subdescription'] ?? ""),
              ],
            ),
          );
        }

        return ContentCarouselWidget(contentList: contentList);
      case HomeLayoutType.leadership:
        return LeaderCard(content: layout['content'] ?? []);

      case HomeLayoutType.marquee:
        return Column(
          children: [
            _buildMarquee(layout['title']),
            SizedBox(height: 10),
            CategorySection(),
            SizedBox(height: 30),
            FollowSection(title: "Follow Us"),
            SizedBox(height: 20),
            FollowSection(title: "Follow Senator, Dr. Rasha Kelej"),
            SizedBox(height: 10),
          ],
        );

      case HomeLayoutType.socialLinks:
        return widget.menuID == "1"
            ? Column(
                children: [
                  FollowSection(title: "Follow Us"),
                  SizedBox(height: 20),
                  FollowSection(title: "Follow Senator, Dr. Rasha Kelej"),
                  SizedBox(height: 10),
                ],
              )
            : Container();
      default:
        return const SizedBox();
    }
  }

  Widget _buildMarquee(String title) {
    return GestureDetector(
      onTap: () {
        print("hint");
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 8),
        child: Container(
          height: 20,
          child: Marquee(
            text: title,
            style: TextStyle(
              color: Customcolor.text_blue,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }
}
