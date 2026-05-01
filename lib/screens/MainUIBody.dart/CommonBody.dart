import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';

import 'package:merckfoundation_252026/Utility/ResponsiveFlutter.dart';
import 'package:merckfoundation_252026/Utility/customappbar.dart';
import 'package:merckfoundation_252026/Utils/common_strings.dart';
import 'package:merckfoundation_252026/Utils/customcolor.dart';
import 'package:merckfoundation_252026/data/model/CommonModel.dart';
import 'package:merckfoundation_252026/enum/commonEnum.dart';
import 'package:merckfoundation_252026/providers/PageProvider.dart';
import 'package:merckfoundation_252026/screens/MainScreens/HomeNewScreen.dart';
import 'package:merckfoundation_252026/widgets/CommonCarouselSection.dart';
import 'package:merckfoundation_252026/widgets/CommonList/HorizontalMediaSection.dart';
import 'package:merckfoundation_252026/widgets/CommonRichText.dart';
import 'package:merckfoundation_252026/widgets/DynamicTabView.dart';
import 'package:merckfoundation_252026/widgets/FooterFlowerImage.dart';
import 'package:merckfoundation_252026/widgets/Homewidget.dart/CommonStaticGrid.dart';
import 'package:merckfoundation_252026/widgets/Homewidget.dart/homeSlider.dart';
import 'package:merckfoundation_252026/widgets/botttomlink.dart';
import 'package:merckfoundation_252026/widgets/SmartHtmlWidget.dart';
import 'package:provider/provider.dart';
class CommonBody extends StatefulWidget {
  String? menuID;
   CommonBody(this.menuID);

  @override
  State<CommonBody> createState() => _CommonBodyState();
}

class _CommonBodyState extends State<CommonBody> {
  @override
  void initState() {
    super.initState();
 Future.microtask(() {
  if (!mounted) return;
      Provider.of<PageProvider>(context, listen: false).fetchPage(context, widget.menuID!);
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<PageProvider>();

    if (provider.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    final data = provider.pageData;
    final json = data?['data']?['json_data'] ?? {};

    List allLayouts = [];

    allLayouts.addAll(json['slider'] ?? []);
    allLayouts.addAll(json['top'] ?? []);
    allLayouts.addAll(json['middle_left'] ?? []);
    allLayouts.addAll(json['middle_right'] ?? []);
    allLayouts.addAll(json['bottom'] ?? []);

    allLayouts.sort((a, b) {
      final aOrder = homelayoutOrder[a['layout_type']] ?? 999;
      final bOrder = homelayoutOrder[b['layout_type']] ?? 999;
      return aOrder.compareTo(bOrder);
    });

    return ListView.builder(
      padding: const EdgeInsets.only(bottom: 5),
      itemCount: allLayouts.length + 2,
      itemBuilder: (context, index) {
        if (index == allLayouts.length) {
          return const FooterFlowerImage();
        }

        if (index == allLayouts.length + 1) {
          return Column(
            children: [
              SizedBox(height: 8),
              Bottomcardlink(),
              // SizedBox(height: 20),
            ],
          );
        }

        return renderLayout(allLayouts[index], allLayouts);
      },
    );
  }

  Widget renderLayout(Map layout, List allLayouts) {
    final responsive = ResponsiveFlutter.of(context);
    final type = layout['layout_type'];

    /// ✅ HANDLE TABS (GLOBAL)
    if (tabTypes.contains(type)) {
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

    /// 🔽 NORMAL CASES (your existing code)
final content = layout['content']?[0];
    switch (type) {
      case "Slider":
        return HomeSlider(content: layout['content']);

      case "Impact":
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

      case "PhotoGallery":
      case "Episodes":
      case "Video":
      case 'NewsLettersAndArticles':
      case 'MerckFoundationInMedia':
        return HorizontalMediaSection(
          content: layout['content'] ?? [],
          title: layout['title'],
          showDescription: false,
         
        );

      case "Testimonials":
        return HorizontalMediaSection(
          content: layout['content'] ?? [],
          title: layout['title'],
          showDescription: true,
          
        );
 case "Content":
        return 
        ListView(
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        physics: ScrollPhysics(),
        children: [
          
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 SmartHtmlWidget(
            html:content?['title'] ?? "",
            textColor: Customcolor.colorVoilet,
            fontSize: responsive.fontSize(3),
            fontWeight: FontWeight.w600,
          ),

        
                8.0.heightBox,
                SmartHtmlWidget(
                    html:
                        content?['subtitle'] ?? "",
                ),
                8.0.heightBox,
                SmartHtmlWidget(
                  html:
                     content?['description'] ?? "",
                ),
              ],
            ),
          ),
         
        ],
      );
      case "Marquee":
        return _buildMarquee( layout['title']);
      case "OurPartners":
        return buildOurPartners(layout['content'], layout['title']);
      case "SocialLinks":
        return Column(
          children: [
            CategorySection(),
            SizedBox(height: 30),
            FollowSection(title: "Follow Us"),
            SizedBox(height: 20),
            FollowSection(title: "Follow Senator, Dr. Rasha Kelej"),
            SizedBox(height: 10),
          ],
        );

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
            style: TextStyle(color: Customcolor.text_blue,fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w700),
          ),
        ),
      ),
    );
  }

  Widget buildOurPartners(List content, String? title) {
    if (content.isEmpty) return const SizedBox();

    return Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title ?? "Our Partners",
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),

          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: content.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 1.2,
            ),
            itemBuilder: (context, index) {
              final item = content[index];

              return Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if ((item['thumbnail'] ?? "").isNotEmpty)
                      Image.network(
                        item['thumbnail'],
                        height: 60,
                        fit: BoxFit.contain,
                      ),

                    const SizedBox(height: 8),

                    Text(
                      item['title'] ?? "",
                      textAlign: TextAlign.center,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontSize: 12),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}