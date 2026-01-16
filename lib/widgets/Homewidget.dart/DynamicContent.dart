import 'package:flutter/material.dart';
import 'package:merckfoundation_252026/Utility/ResponsiveFlutter.dart';
import 'package:merckfoundation_252026/data/model/CommonModel.dart';
import 'package:merckfoundation_252026/widgets/CommonListSection.dart';
import 'package:merckfoundation_252026/widgets/Customcard.dart';

enum HomeSectionType {
  content,
  videos,
  ceoMessage,
  gallery,
  testimonial,
  episodes,
}

class HomeSectionConfig {
  final HomeSectionType type;

  /// Either a single card or list of items
  final SectionItem? singleItem;
  final List<SectionItem>? items;

  /// For custom UI like HTML content
  final Widget? customWidget;

  final String? title;
  final String? subtitle;
  final String? buttonText;
  final VoidCallback? onWatchMore;
  final bool ishtmlContent;
  HomeSectionConfig({
    required this.type,
    this.singleItem,
    this.items,
    this.customWidget, // ✅ ADD
    this.title,
    this.subtitle,
    this.buttonText,
    this.onWatchMore,
    this.ishtmlContent = false,
  });
}

class DynamicSectionRenderer extends StatelessWidget {
  final List<HomeSectionConfig> sections;

  const DynamicSectionRenderer({super.key, required this.sections});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: sections.map((section) {
        // 🔹 SINGLE CARD SECTION

        if (section.type == HomeSectionType.content &&
            section.customWidget != null) {
          return Padding(
            padding: const EdgeInsets.only(top: 16),
            child: section.customWidget!,
          );
        }

        if (section.singleItem != null) {
          final item = section.singleItem!;
          return Padding(
            padding: EdgeInsets.only(top: 20),
            child: IntrinsicHeight(
              child: CustomCard(
                headerPrefix: item.title ?? "",
                title: item.subtitle ?? "",
                subtitle: item.description,
                htmlSubtitle: item.htmlSubtitle,
                        
                imageUrl: item.videoUrl ?? item.imageUrl ?? "",
                showYoutubeIcon: item.showYoutubeIcon,
                showShareIcon: item.showShareIcon,
                showInfoIcon: item.showInfoIcon,
                onCardTap: () {},
                onButtonTap: () {},
                buttonText: item.buttonText,

              ),
            ),
          );
        }

        // 🔹 LIST SECTION
        if (section.items != null && section.items!.isNotEmpty) {
          return CommonListSection<SectionItem>(
            title: section.title ?? "",
            subtitle: section.subtitle ?? "",
            buttonText: section.buttonText ?? "",
            items: section.items!,
            htmlContent: section.ishtmlContent,
            itemBuilder: (context, item) => Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Align(
                alignment: Alignment.topLeft,
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: ResponsiveFlutter.of(context).width(80),
                  ),
                  child: CustomCard(
                    headerPrefix: item.title ?? "",
                    title: item.subtitle ?? "",
                    subtitle: item.description,
                    htmlSubtitle: item.htmlSubtitle,
                    imageUrl: item.videoUrl ?? item.imageUrl ?? "",
                    showYoutubeIcon: item.showYoutubeIcon,
                    showShareIcon: item.showShareIcon,
                    showInfoIcon: item.showInfoIcon,
                    onCardTap: () {},
                    onButtonTap: () {},
                  ),
                ),
              ),
            ),
            onWatchMore: section.onWatchMore,
          );
        }

        return const SizedBox.shrink();
      }).toList(),
    );
  }
}
