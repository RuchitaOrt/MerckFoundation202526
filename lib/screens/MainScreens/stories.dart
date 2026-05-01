// import 'package:flutter/material.dart';
// import 'package:merckfoundation_252026/Provider/FilterProvider.dart';
// import 'package:merckfoundation_252026/Provider/StoryProvider.dart';
// import 'package:merckfoundation_252026/Utility/ResponsiveFlutter.dart';
// import 'package:merckfoundation_252026/Utility/customappbar.dart';
// import 'package:merckfoundation_252026/Utility/showdailog.dart';
// import 'package:merckfoundation_252026/Utils/common_strings.dart';
// import 'package:merckfoundation_252026/Utils/customcolor.dart';
// import 'package:merckfoundation_252026/enum/commonEnum.dart';
// import 'package:merckfoundation_252026/widgets/CommonSliverGrid.dart';
// import 'package:merckfoundation_252026/widgets/FooterFlowerImage.dart';
// import 'package:merckfoundation_252026/widgets/YouTubePreview.dart';
// import 'package:merckfoundation_252026/widgets/botttomlink.dart';
// import 'package:merckfoundation_252026/widgets/filterdrawer.dart';
// import 'package:merckfoundation_252026/widgets/mediaCard.dart';
// import 'package:provider/provider.dart';

// class Stories extends StatefulWidget {
//   const Stories({super.key});

//   @override
//   State<Stories> createState() => _StoriesState();
// }

// class _StoriesState extends State<Stories> {
//   final ScrollController _controller = ScrollController();
//   final GlobalKey<ScaffoldState> _scaffoldKey1 = new GlobalKey<ScaffoldState>();
//   @override
//   void initState() {
//     super.initState();

//     final filter = context.read<FilterProvider>();

//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       if (!mounted) return;
//       context.read<StoryProvider>().loadInitial(context, "");
//     });
//     if (filter.countries.isEmpty) {
//       filter.loadFilters(context);
//     }
//     _controller.addListener(() {
//       final provider = context.read<StoryProvider>();

//       if (_controller.position.pixels >=
//           _controller.position.maxScrollExtent - 200) {
//         /// ✅ Only load if empty (important)
//         final countryId = filter.selectedCountry?.id.toString() ?? "";

//         provider.loadMore(context, countryId);
//       }
//     });
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       key: _scaffoldKey1,
//       endDrawer: AppDrawerfilter(index: 2),
//       appBar: CommonAppBar(
//         type: AppBarType.inner,
//         title: CommonStrings.stories,
//         onSearch: () {},
//         onShare: () {},
//         onFilter: () {
//           _scaffoldKey1.currentState!.openEndDrawer();
//         },

//         shareLink: "",
//       ),
//       backgroundColor: Customcolor.background,
//       body: Consumer<StoryProvider>(
//         builder: (context, provider, _) {
//           /// 🔴 FIRST LOADER (same as MediaScreen)
//           if (provider.isLoading && provider.storyList.isEmpty) {
//             return const Center(child: CircularProgressIndicator());
//           }

//           return CustomScrollView(
//             controller: _controller,
//             slivers: [
//               /// 🔹 GRID WITH PAGINATION
//               SliverGrid(
//                 delegate: SliverChildBuilderDelegate(
//                   (context, index) {
//                     /// ✅ NORMAL ITEMS
//                     if (index < provider.storyList.length) {
//                       final item = provider.storyList[index];

//                       return MediaCard(
//                         image: getYoutubeThumbnail(item.videoLink),
//                         title: item.title,
//                         showPlayIcon: true,
//                         onTap: () {
//                                 var storykey = provider.storyList[index].videoLink
//                                                 .substring(provider.storyList[index].videoLink
//                                                         .length -
//                                                     11);
//                                             ShowDialogs.youtubevideolink(
//                                                 "https://www.youtube.com/watch?v=${storykey}?rel=0&autoplay=1");
//                         },
//                       );
//                     }

//                     /// 🔽 PAGINATION LOADER (same logic)
//                     return provider.hasMore
//                         ? const Center(
//                             child: Padding(
//                               padding: EdgeInsets.all(16),
//                               child: CircularProgressIndicator(),
//                             ),
//                           )
//                         : const SizedBox();
//                   },

//                   /// 🔥 IMPORTANT (same trick as MediaScreen)
//                   childCount: provider.storyList.length + 1,
//                 ),

//                 gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                   crossAxisCount: 2,
//                   childAspectRatio: 0.75,
//                 ),
//               ),

//               /// FOOTER
//               const SliverToBoxAdapter(child: FooterFlowerImage()),
//               const SliverToBoxAdapter(child: SizedBox(height: 8)),
//               const SliverToBoxAdapter(child: Bottomcardlink()),
//             ],
//           );
//         },
//       ),
//     );
//   }
// }

