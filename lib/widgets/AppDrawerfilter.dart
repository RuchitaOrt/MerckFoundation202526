import 'package:flutter/material.dart';
import 'package:merckfoundation_252026/Provider/TestimonialProvider.dart';
import 'package:merckfoundation_252026/Provider/article_provider.dart';
import 'package:merckfoundation_252026/enum/commonEnum.dart';
import 'package:provider/provider.dart';
import '../Provider/FilterProvider.dart';
import '../Provider/MediaListingProvider.dart';
import '../CommonUtils/customcolor.dart';

class AppDrawerfilter extends StatefulWidget {
  final MediaType type;

  const AppDrawerfilter({super.key, required this.type});

  @override
  State<AppDrawerfilter> createState() => _AppDrawerfilterState();
}

class _AppDrawerfilterState extends State<AppDrawerfilter> {
  bool isCountryExpanded = false;
  bool isCategoryExpanded = false;
  bool isLanguageExpanded = false; // ✅ NEW

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Consumer<FilterProvider>(
          builder: (context, provider, _) {
            return Column(
              children: [
                /// 🔹 HEADER
                Container(
                  padding: const EdgeInsets.all(16),
                  width: double.infinity,
                  color: Customcolor.textDarkBlueColor,
                  child: const Text(
                    "Filters",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        /// ✅ CATEGORY (ALL TYPES EXCEPT STORIES)
                        if (widget.type != MediaType.stories &&
                            widget.type != MediaType.article)
                          _buildDropdown(
                            title: "Category",
                            value: widget.type == MediaType.testimonialArticle
                                ? (provider
                                              .selectedCategory
                                              ?.catgname
                                              ?.isNotEmpty ==
                                          true
                                      ? provider.selectedCategory!.catgname!
                                      : "All")
                                : (provider
                                              .selectedCategory
                                              ?.name
                                              ?.isNotEmpty ==
                                          true
                                      ? provider.selectedCategory!.name
                                      : "All"),
                            // provider.selectedCategory?.name ?? "All",
                            expanded: isCategoryExpanded,
                            onTap: () => setState(
                              () => isCategoryExpanded = !isCategoryExpanded,
                            ),
                            children: _buildCategoryList(provider),
                          ),

                        const SizedBox(height: 16),

                        /// ✅ LANGUAGE (ONLY DIGITAL LIBRARY)
                        if (widget.type == MediaType.digitalLibrary ||
                            widget.type == MediaType.article)
                          _buildDropdown(
                            title: "Language",
                            value: widget.type == MediaType.article
                                ? provider.selectedArticleLanguage?.language ??
                                      "All"
                                : provider.selectedLanguage?.name ?? "All",
                            // provider.selectedLanguage?.name ??
                            //     "All",
                            expanded: isLanguageExpanded,
                            onTap: () => setState(
                              () => isLanguageExpanded = !isLanguageExpanded,
                            ),
                            children: _buildLanguageList(provider),
                          ),

                        /// ✅ COUNTRY (EXCEPT DIGITAL LIBRARY & TESTIMONIAL)
                        if (widget.type != MediaType.testimonial &&
                        // widget.type != MediaType.stories &&
                            //  widget.type != MediaType.testimonialArticle &&
                            widget.type != MediaType.digitalLibrary &&
                            widget.type != MediaType.article)
                          Column(
                            children: [
                              const SizedBox(height: 16),
                              _buildDropdown(
                                title: "Country",
                                value: provider.selectedCountry?.name ?? "All",
                                expanded: isCountryExpanded,
                                onTap: () => setState(
                                  () => isCountryExpanded = !isCountryExpanded,
                                ),
                                children: _buildCountryList(provider),
                              ),
                            ],
                          ),
                      ],
                    ),
                  ),
                ),

                /// 🔹 APPLY BUTTON
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Customcolor.textDarkBlueColor,
                      minimumSize: const Size(double.infinity, 50),
                    ),

                    onPressed: () async {
                      final filter = context.read<FilterProvider>();

                      Navigator.pop(context);

                      /// =========================
                      if (widget.type == MediaType.article) {
                        // final languageId =
                        //     filter.selectedArticleLanguage?.id == 0
                        //     ? ""
                        //     : filter.selectedArticleLanguage?.id?.toString() ??
                        //           "";
final languageId =
      filter.selectedArticleLanguage?.id?.toString() ?? "10";
                        await context.read<ArticleProvider>().loadInitial(
                          context,
                          languageId: languageId,
                        );

                        return;
                      }

                      /// ✅ TESTIMONIAL ARTICLE
                      if (widget.type == MediaType.testimonialArticle) {
                        final categoryId = filter.selectedCategory?.id == 0
                            ? ""
                            : filter.selectedCategory!.id.toString();
                      print("Category ${categoryId} ${filter.selectedCountry!.id.toString()}");
                        await context
                            .read<TestimonialArticleProvider>()
                            .fetchTestimonials(
                              context,
                              categoryId,
                              filter.selectedCountry!.id.toString(),
                            );

                        return;
                      }

                      /// ✅ OTHER SCREENS
                      final provider = context.read<MediaListingProvider>();

                      await provider.loadInitial(
                        context: context,
                        type: widget.type,
                        countryId: widget.type == MediaType.digitalLibrary
                            ? ""
                            : (filter.selectedCountry?.id == 0
                                  ? ""
                                  : filter.selectedCountry!.id.toString()),
                        categoryId: filter.selectedCategory?.id == 0
                            ? ""
                            : filter.selectedCategory!.id.toString(),
                        languageId: widget.type == MediaType.digitalLibrary
                            ? (filter.selectedLanguage?.id == 0
                                  ? ""
                                  : filter.selectedLanguage!.id.toString())
                            : "",
                      );
                    },
                    child: const Text(
                      "Apply",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  /// 🔹 COMMON DROPDOWN UI
  Widget _buildDropdown({
    required String title,
    required String value,
    required bool expanded,
    required VoidCallback onTap,
    required List<Widget> children,
  }) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          ListTile(
            title: Text(title),
            subtitle: Text(value),
            trailing: Icon(
              expanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
            ),
            onTap: onTap,
          ),
          if (expanded) ...children,
        ],
      ),
    );
  }

  /// 🔹 CATEGORY LIST
//   List<Widget> _buildCategoryList(FilterProvider provider) {
//     return provider.categories
//         .map(
//           (e) => ListTile(
//             title: Text(
//               widget.type == MediaType.testimonialArticle
//                   ? e.catgname ?? ""
//                   : e.name,
//             ),
//             selected: provider.selectedCategory?.id == e.id,
//             onTap: () async {
//               provider.selectCategory(e);
// if (widget.type == MediaType.testimonialArticle) {
//     provider.selectedCountry = provider.allCountry;

//     await provider.loadFilters(
//       context,
//       type: MediaType.testimonialArticle,
//     );
//   }
//               if (widget.type == MediaType.videoLibrary) {
//                  await provider.loadVideoCountriesByCategory(context);
//                 // provider.selectedCountry = provider.allCountry;
//                 // await provider.loadFilters(context, type: widget.type);
//               }

//               if (widget.type == MediaType.digitalLibrary) {
//                 await provider.loadFilters(context, type: widget.type);
//               }

//               setState(() => isCategoryExpanded = false);
//             },
//           ),
//         )
//         .toList();
//   }
List<Widget> _buildCategoryList(FilterProvider provider) {
  final items = provider.categories.toList();

  return List.generate(
    items.length,
    (index) {
      final e = items[index];

      return Column(
        children: [
          ListTile(
            title: Text(
              widget.type == MediaType.testimonialArticle
                  ? e.catgname ?? ""
                  : e.name,
            ),
            selected: provider.selectedCategory?.id == e.id,
            onTap: () async {
              provider.selectCategory(e);

              if (widget.type == MediaType.testimonialArticle) {
                provider.selectedCountry = provider.allCountry;

                await provider.loadFilters(
                  context,
                  type: MediaType.testimonialArticle,
                );
              }

              if (widget.type == MediaType.videoLibrary) {
                await provider.loadVideoCountriesByCategory(context);
              }

              if (widget.type == MediaType.digitalLibrary) {
                await provider.loadFilters(
                  context,
                  type: widget.type,
                );
              }

              setState(() => isCategoryExpanded = false);
            },
          ),

          // Divider ONLY between items
          if (index < items.length - 1)
            const Divider(height: 1,color: Customcolor.textGreyColor,thickness: 0.2,),
        ],
      );
    },
  );
}
  /// 🔹 COUNTRY LIST
  // List<Widget> _buildCountryList(FilterProvider provider) {
  //   return provider.countries
  //       .map(
  //         (e) => ListTile(
  //           title: Text(e.name),
  //           selected: provider.selectedCountry?.id == e.id,
  //           onTap: () {
  //             provider.selectCountry(e);
  //             setState(() => isCountryExpanded = false);
  //           },
  //         ),
  //       )
  //       .toList();
  // }
List<Widget> _buildCountryList(FilterProvider provider) {
  final items = provider.countries.toList();

  return List.generate(
    items.length,
    (index) {
      final e = items[index];

      return Column(
        children: [
          ListTile(
            title: Text(e.name),
            selected: provider.selectedCountry?.id == e.id,
            onTap: () {
              provider.selectCountry(e);
              setState(() => isCountryExpanded = false);
            },
          ),

          // Divider ONLY between items
          if (index < items.length - 1)
              const Divider(height: 1,color: Customcolor.textGreyColor,thickness: 0.2,),
        ],
      );
    },
  );
}
List<Widget> _buildLanguageList(FilterProvider provider) {
  if (widget.type == MediaType.article) {
    final items = provider.articleLanguages.toList();

    return List.generate(
      items.length,
      (index) {
        final e = items[index];

        return Column(
          children: [
            ListTile(
              title: Text(e.language ?? ""),
              selected:
                  provider.selectedArticleLanguage?.id == e.id,
              onTap: () {
                provider.selectArticleLanguage(e);

                setState(() {
                  isLanguageExpanded = false;
                });
              },
            ),

            if (index < items.length - 1)
            const Divider(height: 1,color: Customcolor.textGreyColor,thickness: 0.2,),
          ],
        );
      },
    );
  }

  final items = provider.languages.toList();

  return List.generate(
    items.length,
    (index) {
      final e = items[index];

      return Column(
        children: [
          ListTile(
            title: Text(e.name),
            selected: provider.selectedLanguage?.id == e.id,
            onTap: () {
              provider.selectLanguage(e);

              setState(() {
                isLanguageExpanded = false;
              });
            },
          ),

          if (index < items.length - 1)
            const Divider(height: 1,color: Customcolor.textGreyColor,thickness: 0.2,),
        ],
      );
    },
  );
}
  /// 🔹 LANGUAGE LIST ✅ NEW
  // List<Widget> _buildLanguageList(FilterProvider provider) {
  //   /// ARTICLE LANGUAGES
  //   if (widget.type == MediaType.article) {
  //     return provider.articleLanguages
  //         .map(
  //           (e) => ListTile(
  //             title: Text(e.language ?? ""),
  //             selected: provider.selectedArticleLanguage?.id == e.id,
  //             onTap: () {
  //               provider.selectArticleLanguage(e);

  //               setState(() {
  //                 print("RUCHITA ARTICLE");
  //                 isLanguageExpanded = false;
  //               });
  //             },
  //           ),
  //         )
  //         .toList();
  //   }

  //   /// DIGITAL LIBRARY LANGUAGES
  //   return provider.languages
  //       .map(
  //         (e) => ListTile(
  //           title: Text(e.name),
  //           selected: provider.selectedLanguage?.id == e.id,
  //           onTap: () {
  //             provider.selectLanguage(e);

  //             setState(() {
  //               isLanguageExpanded = false;
  //             });
  //           },
  //         ),
  //       )
  //       .toList();
  // }

  //  List<Widget> _buildLanguageList(FilterProvider provider) {
  //     return provider.languages
  //         .map(
  //           (e) => ListTile(
  //             title: Text(e.name),
  //             selected:
  //                 provider.selectedLanguage?.id == e.id,
  //             onTap: () {
  //               provider.selectLanguage(e);
  //               setState(() => isLanguageExpanded = false);
  //             },
  //           ),
  //         )
  //         .toList();
  //   }
}
