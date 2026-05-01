// import 'package:flutter/material.dart';
// import 'package:merckfoundation_252026/Utility/ResponsiveFlutter.dart';
// import 'package:merckfoundation_252026/Utility/customappbar.dart';
// import 'package:merckfoundation_252026/Utils/common_strings.dart';
// import 'package:merckfoundation_252026/Utils/customcolor.dart';
// import 'package:merckfoundation_252026/data/model/CommonModel.dart';
// import 'package:merckfoundation_252026/enum/commonEnum.dart';
// import 'package:merckfoundation_252026/providers/PageProvider.dart';
// import 'package:merckfoundation_252026/providers/ouractivities_provider.dart';
// import 'package:merckfoundation_252026/widgets/CommonList/HorizontalMediaSection.dart';
// import 'package:merckfoundation_252026/widgets/CommonList/TestimonialSection.dart';

// import 'package:merckfoundation_252026/widgets/CommonSliverGrid.dart';
// import 'package:merckfoundation_252026/widgets/FooterFlowerImage.dart';
// import 'package:merckfoundation_252026/widgets/SmartHtmlWidget.dart';
// import 'package:merckfoundation_252026/widgets/botttomlink.dart';
// import 'package:merckfoundation_252026/widgets/mediaCard.dart';
// import 'package:provider/provider.dart';

// class Ourpatner extends StatefulWidget {
//   @override
//   State<StatefulWidget> createState() {
//     return OurpatnerState();
//   }
// }

// class OurpatnerState extends State<Ourpatner> {
//   @override
//   void initState() {
//     super.initState();
//     // WidgetsBinding.instance.addPostFrameCallback((_) {
//     //   context.read<OurActivityProvider>().loadStaticStories();
//     // });
//     Future.microtask(() {
//       Provider.of<PageProvider>(
//         context,
//         listen: false,
//       ).fetchPage(context, "11");
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Customcolor.background,
//       appBar: CommonAppBar(
//         type: AppBarType.inner,
//         title: CommonStrings.ourPartners,

//         onSearch: () {},
//         onShare: () {},
//         shareLink: "",
//       ),
//       body: Consumer<PageProvider>(
//         builder: (context, provider, _) {
//           if (provider.isLoading) {
//             return CircularProgressIndicator();
//           }

//           final data = provider.pageData;

//           final slider = data?['data']?['json_data']?['slider'] ?? [];
//           final top = data?['data']?['json_data']?['top'] ?? [];
//           final middleLeft = data?['data']?['json_data']?['middle_left'] ?? [];
//           final middleRight =
//               data?['data']?['json_data']?['middle_right'] ?? [];
//           final bottom = data?['data']?['json_data']?['bottom'] ?? [];

//           // 👉 Find OurPartners layout
//           Map<String, dynamic>? ourPartnersLayout;

//           for (var layout in bottom) {
//             if (layout['layout_type'] == "OurPartners") {
//               ourPartnersLayout = layout;
//               break;
//             }
//           }

//           // 👉 Extract content list
//           final partners = ourPartnersLayout?['content'] ?? [];

//           List allLayouts = [];

//           // ✅ Merge all sections
//           allLayouts.addAll(slider);
//           allLayouts.addAll(top);
//           allLayouts.addAll(middleLeft);
//           allLayouts.addAll(middleRight);
//           allLayouts.addAll(bottom);

//           // ✅ Sort by layout_index
//           allLayouts.sort(
//             (a, b) =>
//                 (a['layout_index'] ?? 0).compareTo(b['layout_index'] ?? 0),
//           );

//           return ListView.builder(
//             itemCount: allLayouts.length,
//             itemBuilder: (context, index) {
//               final layout = allLayouts[index];
//               return renderLayout(layout);
//             },
//           );
//         },
//       ),

//       //  Consumer<OurActivityProvider>(
//       //   builder: (context, provider, _) {
//       //     return CustomScrollView(
//       //       slivers: [
//       //          const SliverToBoxAdapter(
//       //           child: Padding(
//       //             padding: EdgeInsets.all(20.0),
//       //             child: SmartHtmlWidget(
//       //               html:
//       //                   '<p class=\"txt-dblue\" style=\"text-align: justify;\"><span style=\"color:#2980b9;\"><span style=\"font-size:11.0pt;\"><span style=\"font-family:Verdana,Geneva,sans-serif;\"><strong>We know we can make a greater difference in people&rsquo;s lives when working together with others. We cooperate with governments, academic institutions, global and local communities, donors, patient associations, international organizations and NGOs.</strong></span></span></span></p>\r\n\r\n<ul>\r\n\t<li style=\"text-align: justify;\"><span style=\"font-size:11.0pt;\"><span style=\"font-family:Verdana,Geneva,sans-serif;\">We are open to partner in programs that contribute to our goal of improving the health and well being.</span></span></li>\r\n\t<li style=\"text-align: justify;\"><span style=\"font-size:11.0pt;\"><span style=\"font-family:Verdana,Geneva,sans-serif;\">We care for people living in underserved communities and want to advance their lives through science and technology.</span></span></li>\r\n\t<li style=\"text-align: justify;\"><span style=\"font-size:11.0pt;\"><span style=\"font-family:Verdana,Geneva,sans-serif;\">We are dedicated to sharing our expertise to jointly develop and implement those programs.</span></span></li>\r\n</ul>\r\n<gdiv></gdiv>',
//       //             ),
//       //           ),
//       //         ),

//       //         /// 🔹 STORIES GRID
//       //         CommonSliverGrid(
//       //               items: provider.cards,
//       //               itemBuilder: (context, item, index) {
//       //                 return MediaCard(data: item,fontColor: Customcolor.colorBlue,);
//       //               },
//       //             ),

//       //         /// 🔹 FOOTER IMAGE
//       //         const SliverToBoxAdapter(
//       //           child: FooterFlowerImage(),
//       //         ),

//       //        SliverToBoxAdapter(child:  8.0.heightBox,),
//       //         /// 🔹 BOTTOM LINKS
//       //         const SliverToBoxAdapter(
//       //           child: Bottomcardlink(),
//       //         ),

//       //       ],
//       //     );
//       //   },
//       // ),
//     );
//   }

//   Widget renderLayout(Map layout) {
//     final type = layout['layout_type'];

//     final Map<String, Widget Function(Map)> layoutBuilders = {
//       "OurPartners": (l) => buildOurPartners(l['content'], l['title']),
//       "PhotoGallery": (l) => HorizontalMediaSection(
//         content: l['content'],
//         title: l['title'],
       
//       ),
//       "Episodes": (l) => HorizontalMediaSection(
//         content: l['content'],
//         title: l['title'],
//         showDescription: true,
       
//       ),
//       "Testimonials": (l) => HorizontalMediaSection(
//         content: l['content'],
//         title: l['title'],
//         showDescription: true, // 🔥 key difference
        
//       ),
//       "Slider": (l) => buildSlider(l['content']),
//       "LeaderShip": (l) => buildLeader(l['content']),
//       "Awards": (l) => buildAwards(l['content']),
//     };

//     return layoutBuilders[type]?.call(layout) ?? buildGenericLayout(layout);
//   }

//   Widget buildGenericLayout(Map layout) {
//     final content = layout['content'] ?? [];
//     final title = layout['title'] ?? "";
//     final type = layout['layout_type'];

//     if (content.isEmpty) return SizedBox();

//     return SizedBox();
//   }

//   Widget renderSection(List layouts) {
//     return Column(
//       children: layouts.map<Widget>((layout) {
//         return renderLayout(layout);
//       }).toList(),
//     );
//   }

//   Widget buildOurPartners(List content, String? title) {
//     if (content.isEmpty) return SizedBox();

//     return Padding(
//       padding: const EdgeInsets.all(12),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             title ?? "Our Partners",
//             style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//           ),
//           SizedBox(height: 10),

//           GridView.builder(
//             shrinkWrap: true,
//             physics: NeverScrollableScrollPhysics(),
//             itemCount: content.length,
//             gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//               crossAxisCount: 2,
//               crossAxisSpacing: 10,
//               mainAxisSpacing: 10,
//             ),
//             itemBuilder: (context, index) {
//               final item = content[index];

//               return Container(
//                 padding: EdgeInsets.all(8),
//                 decoration: BoxDecoration(
//                   border: Border.all(color: Colors.grey.shade300),
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     if ((item['thumbnail'] ?? "").isNotEmpty)
//                       Image.network(
//                         item['thumbnail'],
//                         height: 60,
//                         fit: BoxFit.contain,
//                       ),

//                     SizedBox(height: 8),

//                     Text(
//                       item['title'] ?? "",
//                       textAlign: TextAlign.center,
//                       style: TextStyle(fontSize: 12),
//                       maxLines: 3,
//                       overflow: TextOverflow.ellipsis,
//                     ),
//                   ],
//                 ),
//               );
//             },
//           ),
//         ],
//       ),
//     );
//   }

//   Widget buildPhotoGallery(List content) {
//     if (content.isEmpty) return SizedBox();

//     // 🔥 Convert List<Map> → List<MediaCardData>
//     final items = content
//         .map<MediaCardData>((e) => MediaCardData.fromJson(e))
//         .toList();

//     return SizedBox(
//       height: 400, // important for sliver inside normal widget
//       child: CustomScrollView(
//         shrinkWrap: true,
//         physics: NeverScrollableScrollPhysics(),
//         slivers: [
//           CommonSliverGrid(
//             items: items,
//             itemBuilder: (context, item, index) {
//               return MediaCard(data: item); // ✅ correct type
//             },
//           ),

//           const SliverToBoxAdapter(child: FooterFlowerImage()),

//           SliverToBoxAdapter(child: 8.0.heightBox),

//           const SliverToBoxAdapter(child: Bottomcardlink()),
//         ],
//       ),
//     );
//   }

//   Widget buildNews(List content) => SizedBox();

//   Widget buildSlider(List content) => SizedBox();

//   Widget buildLeader(List content) => SizedBox();

//   Widget buildAwards(List content) => SizedBox();
// }
