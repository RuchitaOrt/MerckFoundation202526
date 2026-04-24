
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';
import 'package:merckfoundation_252026/Utility/ResponsiveFlutter.dart';
import 'package:merckfoundation_252026/Utility/customappbar.dart';
import 'package:merckfoundation_252026/Utility/sizeConfig.dart';
import 'package:merckfoundation_252026/Utils/common_images.dart';
import 'package:merckfoundation_252026/Utils/common_strings.dart';
import 'package:merckfoundation_252026/Utils/customcolor.dart';
import 'package:merckfoundation_252026/enum/commonEnum.dart';
import 'package:merckfoundation_252026/providers/PageProvider.dart';
import 'package:merckfoundation_252026/providers/home_provider.dart';
import 'package:merckfoundation_252026/widgets/CommonList/HorizontalMediaSection.dart';
import 'package:merckfoundation_252026/widgets/CommonRichText.dart';
import 'package:merckfoundation_252026/widgets/DynamicTabView.dart';
import 'package:merckfoundation_252026/widgets/FooterFlowerImage.dart';
import 'package:merckfoundation_252026/widgets/Homewidget.dart/CommonStaticGrid.dart';
import 'package:merckfoundation_252026/widgets/Homewidget.dart/homeSlider.dart';
import 'package:merckfoundation_252026/widgets/botttomlink.dart';
import 'package:merckfoundation_252026/widgets/drawer.dart';
import 'package:merckfoundation_252026/widgets/dynamic_tab_builder.dart';
import 'package:provider/provider.dart';

class MerckHomeScreen extends StatelessWidget {
   MerckHomeScreen({super.key});
final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
   final responsive = ResponsiveFlutter.of(context);
  
    return Scaffold(
     key: _scaffoldKey,
        backgroundColor: Customcolor.background,
        appBar: CommonAppBar(
          type: AppBarType.home,
          onDrawer: () => _scaffoldKey.currentState?.openDrawer(),
          onSearch: () {},
          height: Platform.isAndroid
              ? responsive.height(9)
              : responsive.height(8),
        ),

        drawer: Theme(
          data: Theme.of(context).copyWith(canvasColor: Colors.transparent),
          child: AppDrawer(),
        ),
      body: 
      
      const _HomeBody(),
      // bottomNavigationBar: const _BottomNavBar(),
    );
  }
}


class _HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const _HomeAppBar();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Customcolor.background,
      elevation: 0,
      leading: const Icon(Icons.menu, color: Colors.black),
      centerTitle: true,
      title: Image.asset(CommonImagePath.drawerImg, height: 40),
      actions: const [
        Padding(
          padding: EdgeInsets.only(right: 16),
          child: Icon(Icons.search, color: Colors.black),
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

//////////////////////////////////////////////////////////////
/// BODY
//////////////////////////////////////////////////////////////

class _HomeBody extends StatefulWidget {
  const _HomeBody();

  @override
  State<_HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<_HomeBody> {


   @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<HomeSliderProvider>().loadSliderData();

      final provider = context.read<HomeSliderProvider>();
      provider.loadHomeTabs();
      if (provider.ourStaticList.isEmpty) {
        provider.loadStaticData();
      }
    });

    Future.microtask(() {
    Provider.of<PageProvider>(context, listen: false)
        .fetchPage(context,"1");
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

  allLayouts.sort((a, b) =>
      (a['layout_index'] ?? 0).compareTo(b['layout_index'] ?? 0));

  return ListView.builder(
    padding: const EdgeInsets.only(bottom: 20),
    itemCount: allLayouts.length,
    itemBuilder: (context, index) {
      return renderLayout(allLayouts[index]);
    },
  );
}
Widget renderLayout(Map layout) {
  final type = layout['layout_type'];

  switch (type) {
    case "PhotoGallery":
    case "Episodes":
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

    case "OurPartners":
      return buildOurPartners(layout['content'], layout['title']);

    case "Slider":
      return HomeSlider(content: layout['content']);

    default:
      return const SizedBox();
  }
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
          style: const TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),

        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: content.length,
          gridDelegate:
              const SliverGridDelegateWithFixedCrossAxisCount(
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
  // @override
  // Widget build(BuildContext context) {
  //     final tabs = context.watch<HomeSliderProvider>().tabs;
  //   return SingleChildScrollView(
  //     // padding: const EdgeInsets.fromLTRB(16, 10, 16, 20),
  //     child: Column(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children:  [
  //         Padding(
  //           padding: const EdgeInsets.fromLTRB(16, 10, 16, 4),
  //           child: HomeSlider(),
  //         ),
  //         SizedBox(height: 20),
  //         Padding(
  //            padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
  //           child: CategorySection(),
  //         ),
  //         SizedBox(height: 30),
  //         FollowSection(title: "Follow Us"),
  //         SizedBox(height: 20),
  //         FollowSection(title: "Follow Senator, Dr. Rasha Kelej"),
  //         SizedBox(height: 10),
        
  //        CommonRichText(
  //             title: CommonStrings.impactOfMerck,
  //             subtitle: CommonStrings.impactOn,
  //           ),
  //            CommonStaticGrid(
  //             items: context.watch<HomeSliderProvider>().ourStaticList,
  //           ),
  //         SizedBox(height: 5),
  //         Padding(
  //             padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
  //           child: OurStorySection(),
  //         ),
  //          SizedBox(height: 20),
  //         Padding(
  //           padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
  //           child: RAHSASection(),
  //         ),
  //          SizedBox(height: 20),
  //          Padding(
  //            padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
  //            child: AfricaSection(),
  //          ),
  //          SizedBox(height: 20),
  //         Padding(
  //             padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
  //           child: GallerySection(),
  //         ),
  //          SizedBox(height: 20),
  //         Padding(
  //             padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
  //           child: TestimonialSection(),
  //         ),
  //         8.0.heightBox,
  //           SizedBox(
  //             height: CommonStrings.tabheight,
  //             child: DynamicTabView(
  //               tabs: DynamicTabBuilder.build(context, tabs),
  //               indicatorColor: Customcolor.pinkbg,
  //             ),
  //           ),

  //           const FooterFlowerImage(),
  //           8.0.heightBox,
  //           Bottomcardlink(),
  //       ],
  //     ),
  //   );
  // }
}

//////////////////////////////////////////////////////////////
/// BANNER
//////////////////////////////////////////////////////////////

class BannerSection extends StatelessWidget {
  const BannerSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        const BannerCard(),

        Positioned(
          right: -15,
          bottom: -10,
          child: Image.asset(
            CommonImagePath.homeToolbar,
            height: 65,
          ),
        ),
      ],
    );
  }
}

class BannerCard extends StatelessWidget {
  const BannerCard({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Image.asset(
            "assets/images/slider1.jpg",
            height: 220,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
            color: Colors.white.withOpacity(0.92),
            child: Column(
              children: const [
                Text(
                  "Merck Foundation First Ladies Initiative Summit - FLLI 2025",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: Customcolor.pink_col,
                  ),
                ),
                SizedBox(height: 6),
                Text(
                  "Together we make a Difference",
                  style: TextStyle(
                    fontSize: 13.5,
                    fontWeight: FontWeight.w600,
                    color: Customcolor.text_blue,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

//////////////////////////////////////////////////////////////
/// CATEGORY SECTION
//////////////////////////////////////////////////////////////

class CategorySection extends StatelessWidget {
  const CategorySection({super.key});

  @override
  Widget build(BuildContext context) {
    final items = [
      ["Our Vision", Customcolor.pink_col],
      ["Our Programs", Customcolor.green_col],
      ["Our Articles", Customcolor.lightgreen_col],
      ["Our Awards", Customcolor.violet_col],
      ["Media & Events", Customcolor.skyblue_col],
      ["Our Policies", Customcolor.orange_col],
      ["Our Mission", Customcolor.darkblue_col],
      ["Covid Response", Customcolor.covid_19_tile],
      ["Our Africa By Merck Foundation (TV Program)", Customcolor.prog3],
    ];

    return Stack(
      clipBehavior: Clip.none,
      children: [
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: items.map((e) {
            return SizedBox(
              // width: MediaQuery.of(context).size.width / 2 - 22,
              child: CategoryChip(
                title: e[0] as String,
                color: e[1] as Color,
              ),
            );
          }).toList(),
        ),

       
      ],
    );
  }
}

//////////////////////////////////////////////////////////////
/// CATEGORY CHIP
//////////////////////////////////////////////////////////////
class CategoryChip extends StatelessWidget {
  final String title;
  final Color color;

  const CategoryChip({
    super.key,
    required this.title,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color, width: 2),
      ),
      child: Text(
        title,
        textAlign: TextAlign.center,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          fontSize: width * 0.035,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

class FollowSection extends StatelessWidget {
  final String title;
  const FollowSection({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 0, 0),
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w800, 
                 
                  color: Customcolor.text_blue,
                ),
              ),
            ),
         title=="Follow Us"?  Image.asset(
            CommonImagePath.homeFlowerNew,
            height: 70,
          ):Container(),
          ],
        ),
        const SizedBox(height: 12),
        Padding(
          padding: const EdgeInsets.only(left: 10,right: 10),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
               SocialIcon("assets/newImages/ins.svg"),

              SocialIcon("assets/newImages/FB.svg"),
              SocialIcon("assets/newImages/twitt.svg"),
                SocialIcon("assets/newImages/youtu.svg"),
              SocialIcon("assets/newImages/flick.svg"),
             
              SocialIcon("assets/newImages/threads.svg"),
              
            
            ],
          ),
        ),
          title=="Follow Us"?Container():Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Image.asset(
              CommonImagePath.homeFlowerNew,
              height: 70,
            ),
          )
      ],
    );
  }
}
class SocialIcon extends StatelessWidget {
  final String icon;
  const SocialIcon(this.icon, {super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.width * 0.12;

    return Container(
      padding: EdgeInsets.all(size * 0.25),
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
      ),
      child: SvgPicture.asset(
        icon,
        width: size * 0.5,
        height: size * 0.5,
      ),
    );
  }
}

class GallerySection extends StatelessWidget {
  const GallerySection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    final itemWidth = screenWidth * 0.8;
    final imageHeight = screenWidth * 0.45;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Photo Gallery",
            style: TextStyle(
              fontSize: MediaQuery.of(context).size.width * 0.055,
              fontWeight: FontWeight.w800,
              color: Customcolor.text_blue,
            ),
          ),

          const SizedBox(height: 12),

          SizedBox(
            height: imageHeight + 70,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: 6,
              separatorBuilder: (_, __) => const SizedBox(width: 16),
              itemBuilder: (_, index) {
                return SizedBox(
                  width: itemWidth,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.network(
                          "https://merck-foundation.com/merckfoundation/public/uploads/gallery/1698904631_8be7e035d15fd6d4b188.jpeg",
                          height: imageHeight,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),

                      const SizedBox(height: 8),

                      Text(
                        "Dr. Rasha Kelej at Inauguration of Merck Foundation First Ladies Initiative - MFFLI Summit 2025",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                           fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),

          const SizedBox(height: 10),

          Center(
            child: Container(
              padding: const EdgeInsets.symmetric(
                  vertical: 10, horizontal: 20),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.orange, width: 2),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                "View All",
                style: TextStyle(
                  fontSize: screenWidth * 0.035,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


class OurStorySection extends StatelessWidget {
  const OurStorySection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    // Width for each gallery item ~ 80% of screen
    final itemWidth = screenWidth * 0.85;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Here Our Stories",
          style: TextStyle(
             fontSize: MediaQuery.of(context).size.width * 0.055,
            fontWeight: FontWeight.w800,
            color: Customcolor.text_blue,
          ),
        ),
        const SizedBox(height: 12),
SizedBox(
  height: 260,
  child: ListView.separated(
    padding: const EdgeInsets.symmetric(horizontal: 4),
    scrollDirection: Axis.horizontal,
    itemCount: 6,
    separatorBuilder: (_, __) => const SizedBox(width: 10),
    itemBuilder: (_, index) {
      return SizedBox(
        width: itemWidth,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
      Container(
  width: itemWidth,
  decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(30),
  ),
  clipBehavior: Clip.antiAlias,
  child: Image.network(
    "https://merck-foundation.com/merckfoundation/public/uploads/gallery/1698904631_8be7e035d15fd6d4b188.jpeg",
    height: 200,
    width: double.infinity,
    fit: BoxFit.cover,
  ),
),

            const SizedBox(height: 10),

             Padding(
              padding: EdgeInsets.symmetric(horizontal: 4),
              child: Text(
                "Dr. Rasha Kelej at Inauguration of Merck Foundation First Ladies Initiative - MFFLI Summit 2025",
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(color: Customcolor.colorblack,fontSize: 14,fontWeight: FontWeight.w600),
              ),
            ),
          ],
        ),
      );
    },
  ),
),
SizedBox(height: 2,),
        Center(
          child: Container(
                    width: MediaQuery.of(context).size.width /3,
                    decoration: BoxDecoration(
                     border: BoxBorder.all(color: Colors.yellow.shade700,width: 3),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 8),
                        child: Text(
                          "Watch More",
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
        )
      ],
    );
  }
}

class RAHSASection extends StatelessWidget {
  const RAHSASection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    // Width for each gallery item ~ 80% of screen
    final itemWidth = screenWidth * 0.85;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         Text(
          "Messages From Dr. Rasha Kelej, CEO of Merck Foundation",
          style: TextStyle(
            fontSize: MediaQuery.of(context).size.width * 0.055,
            fontWeight: FontWeight.w800,
            color: Customcolor.text_blue,
          ),
        ),
        const SizedBox(height: 12),
SizedBox(
  height: 260,
  child: ListView.separated(
    padding: const EdgeInsets.symmetric(horizontal: 4),
    scrollDirection: Axis.horizontal,
    itemCount: 6,
    separatorBuilder: (_, __) => const SizedBox(width: 10),
    itemBuilder: (_, index) {
      return SizedBox(
        width: itemWidth,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
      Container(
  width: itemWidth,
  decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(30),
  ),
  clipBehavior: Clip.antiAlias,
  child: Image.network(
    "https://merck-foundation.com/merckfoundation/public/uploads/gallery/1698904631_8be7e035d15fd6d4b188.jpeg",
    height: 200,
    width: double.infinity,
    fit: BoxFit.cover,
  ),
),

            const SizedBox(height: 10),

             Padding(
              padding: EdgeInsets.symmetric(horizontal: 4),
              child: Text(
                "Dr. Rasha Kelej at Inauguration of Merck Foundation First Ladies Initiative - MFFLI Summit 2025",
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(color: Customcolor.colorblack,fontSize: 14,fontWeight: FontWeight.w600),
              ),
            ),
          ],
        ),
      );
    },
  ),
),
SizedBox(height: 2,),
        Center(
          child: Container(
                    width: MediaQuery.of(context).size.width /3,
                    decoration: BoxDecoration(
                     border: BoxBorder.all(color: Colors.yellow.shade700,width: 3),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 8),
                        child: Text(
                          "Watch More",
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
        )
      ],
    );
  }
}

class AfricaSection extends StatelessWidget {
  const AfricaSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    // Width for each gallery item ~ 80% of screen
    final itemWidth = screenWidth * 0.85;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         Text(
          "Merck Foundation Presents Our Africa by Merck Foundation (TV Program)",
          style: TextStyle(
            fontSize: MediaQuery.of(context).size.width * 0.055,
            fontWeight: FontWeight.w800,
            color: Customcolor.text_blue,
          ),
        ),
        const SizedBox(height: 12),
SizedBox(
  height: 260,
  child: ListView.separated(
    padding: const EdgeInsets.symmetric(horizontal: 4),
    scrollDirection: Axis.horizontal,
    itemCount: 6,
    separatorBuilder: (_, __) => const SizedBox(width: 10),
    itemBuilder: (_, index) {
      return SizedBox(
        width: itemWidth,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
      Container(
  width: itemWidth,
  decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(30),
  ),
  clipBehavior: Clip.antiAlias,
  child: Image.network(
    "https://merck-foundation.com/merckfoundation/public/uploads/gallery/1698904631_8be7e035d15fd6d4b188.jpeg",
    height: 200,
    width: double.infinity,
    fit: BoxFit.cover,
  ),
),

            const SizedBox(height: 10),

             Padding(
              padding: EdgeInsets.symmetric(horizontal: 4),
              child: Text(
                "Dr. Rasha Kelej at Inauguration of Merck Foundation First Ladies Initiative - MFFLI Summit 2025",
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(color: Customcolor.colorblack,fontSize: 14,fontWeight: FontWeight.w600),
              ),
            ),
          ],
        ),
      );
    },
  ),
),
SizedBox(height: 2,),
        Center(
          child:Container(
                    width: MediaQuery.of(context).size.width /3,
                    decoration: BoxDecoration(
                     border: BoxBorder.all(color: Colors.yellow.shade700,width: 3),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 8),
                        child: Text(
                          "Watch More",
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
        )
      ],
    );
  }
}



class TestimonialSection extends StatelessWidget {
  const TestimonialSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    // Width for each gallery item ~ 80% of screen
    final itemWidth = screenWidth * 0.85;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         Text(
          "Alumni Testimonials",
          style: TextStyle(
             fontSize: MediaQuery.of(context).size.width * 0.055,
            fontWeight: FontWeight.w800,
            color: Customcolor.text_blue,
          ),
        ),
        const SizedBox(height: 12),
SizedBox(
  height: 260,
  child: ListView.separated(
    padding: const EdgeInsets.symmetric(horizontal: 4),
    scrollDirection: Axis.horizontal,
    itemCount: 6,
    separatorBuilder: (_, __) => const SizedBox(width: 10),
    itemBuilder: (_, index) {
      return SizedBox(
        width: itemWidth,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
      Container(
  width: itemWidth,
  decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(30),
  ),
  clipBehavior: Clip.antiAlias,
  child: Image.network(
    "https://merck-foundation.com/merckfoundation/public/uploads/gallery/1698904631_8be7e035d15fd6d4b188.jpeg",
    height: 200,
    width: double.infinity,
    fit: BoxFit.cover,
  ),
),

            const SizedBox(height: 10),

             Padding(
              padding: EdgeInsets.symmetric(horizontal: 4),
              child: Text(
                "Dr. Rasha Kelej at Inauguration of Merck Foundation First Ladies Initiative - MFFLI Summit 2025",
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(color: Customcolor.colorblack,fontSize: 14,fontWeight: FontWeight.w600),
              ),
            ),
          ],
        ),
      );
    },
  ),
),
SizedBox(height: 2,),
        Center(
          child: Container(
                    width: MediaQuery.of(context).size.width /3,
                    decoration: BoxDecoration(
                     border: BoxBorder.all(color: Colors.yellow.shade700,width: 3),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 8),
                        child: Text(
                          "Watch More",
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
        )
      ],
    );
  }
}
class NavItem extends StatelessWidget {
  final IconData icon;
  final bool selected;

  const NavItem(this.icon, this.selected, {super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: selected ? Colors.grey.shade200 : Colors.transparent,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Icon(
        icon,
        color: selected ? Customcolor.colorVoilet : Colors.grey,
      ),
    );
  }
}

