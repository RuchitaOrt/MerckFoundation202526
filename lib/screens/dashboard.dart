import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:merckfoundation_252026/Provider/navbar_provider.dart';
import 'package:merckfoundation_252026/Utility/ResponsiveFlutter.dart';
import 'package:merckfoundation_252026/Utils/common_images.dart';
import 'package:merckfoundation_252026/Utils/common_strings.dart';
import 'package:merckfoundation_252026/Utils/customcolor.dart';
import 'package:merckfoundation_252026/enum/commonEnum.dart';
import 'package:merckfoundation_252026/model/NavBarResponse.dart';
import 'package:merckfoundation_252026/screens/MainScreens/Articles.dart';
import 'package:merckfoundation_252026/screens/MainScreens/CallforApplication.dart';
import 'package:merckfoundation_252026/screens/MainScreens/HomeNewScreen.dart';
import 'package:merckfoundation_252026/screens/MainScreens/ourPrograms.dart';
import 'package:merckfoundation_252026/screens/MediaAndStoriesScreen/MediaListingScreen.dart';
import 'package:merckfoundation_252026/widgets/formLabel.dart';
import 'package:provider/provider.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({
    Key? key,
    this.title,
    this.index = 0,
    this.apiurl,
    this.menuID,
    this.shareLink,
  }) : super(key: key);

  final String? title;
  final int index;
  final dynamic apiurl;
  final String? menuID;
  final String? shareLink;

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  late int currentIndex;
  late PageController pageController;

  @override
  void initState() {
    super.initState();
print("DASHBOARD ${widget.shareLink}");
    currentIndex = widget.index;

    pageController = PageController(
      initialPage: widget.index,
    );
  }

  Widget getScreen(MobileBottomMenu menu) {
  switch (menu.id) {

    case 1:
      return MerckHomeScreen(
        menuID: menu.id.toString(),
        shareLink: menu.menuUrl ?? "",
        title: menu.menuTitle ?? "",
      );

    case 16:
      return OurProgramScreen(
        menuID: menu.id.toString(),
        shareLink: menu.menuUrl ?? "",
        title: menu.menuTitle ?? "",
      );

    case 27:
      return MediaListingScreen(
        type: MediaType.stories,
        categoryID: "",
        albumID: "",
        albumName: "",
        menuID: menu.id.toString(),
        shareLink: menu.menuUrl ?? "",
        title: menu.menuTitle ?? "",
      );

    case 29:
      return ArticlesScreen(
        menuID: menu.id.toString(),
        shareLink: menu.menuUrl ?? "",
        title: menu.menuTitle ?? "",
      );

    case 30:
      return CallforApplication(
        menuID: menu.id.toString(),
        shareLink: menu.menuUrl ?? "",
        title: menu.menuTitle ?? "",
      );

    default:
      return const SizedBox();
  }
}
  BottomNavyBarItem _navItemDynamic({
    required int index,
    required int menuId,
    required String title,
  }) {
    final responsive = ResponsiveFlutter.of(context);

    String selectedIcon = CommonImagePath.homeSelected;
    String unselectedIcon = CommonImagePath.homeUnselected;

    switch (menuId) {

      // Home
      case 1:
        selectedIcon = CommonImagePath.homeSelected;
        unselectedIcon = CommonImagePath.homeUnselected;
        break;

      // Our Programs
      case 16:
        selectedIcon = CommonImagePath.programSelected;
        unselectedIcon = CommonImagePath.programUnselected;
        break;

      // Stories
      case 27:
        selectedIcon = CommonImagePath.storiesSelected;
        unselectedIcon = CommonImagePath.storiesUnselected;
        break;

      // Articles
      case 29:
        selectedIcon = CommonImagePath.articlesSelected;
        unselectedIcon = CommonImagePath.articlesUnselected;
        break;

      // Upcoming Programs
      case 30:
        selectedIcon = CommonImagePath.callSelected;
        unselectedIcon = CommonImagePath.callUnselected;
        break;
    }

    return BottomNavyBarItem(
      icon: Image.asset(
        currentIndex == index
            ? selectedIcon
            : unselectedIcon,
        height: responsive.height(3),
      ),
      title: FormLabel(
        text: title,
        maxLines: 1,
        textAlignment: TextAlign.center,
        labelColor: Customcolor.colorBlue,
        fontweight: FontWeight.w800,
        fontSize: 12,
      ),
      activeColor: Customcolor.colorBlue,
      inactiveColor: Colors.grey,
      textAlign: TextAlign.center,
    );
  }

  @override
  Widget build(BuildContext context) {
    final navbarProvider = Provider.of<NavbarProvider>(context);

   final navMenus =
    navbarProvider.mobileBottomMenus;

    return Scaffold(
      backgroundColor: Customcolor.background,

      body: navMenus.isEmpty
          ?  Center(
        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.center,
          children: [

            const Icon(
              Icons.wifi_off,
              size: 70,
              color: Colors.grey,
            ),

            const SizedBox(height: 16),

            const Text(
              "No internet connection",
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {

            

              },
              child: const Text("Retry"),
            ),
          ],
        ),
      )
          : PageView(
              controller: pageController,
              physics: const NeverScrollableScrollPhysics(),
              children: navMenus
    .map(
      (e) => getScreen(e),
    )
    .toList(),
            ),

      bottomNavigationBar: navMenus.isEmpty
          ? const SizedBox()
          : SafeArea(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 10),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.12),
                        blurRadius: 15,
                        offset: const Offset(0, 6),
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: SizedBox(
                      height: 56,
                      child: BottomNavyBar(
                        selectedIndex: currentIndex,
                        showElevation: false,
                        backgroundColor: Colors.white,
                        mainAxisAlignment:
                            MainAxisAlignment.spaceAround,

                        onItemSelected: (index) {
                          setState(() {
                            currentIndex = index;
                          });

                          pageController.jumpToPage(index);
                        },

                        items: List.generate(
                          navMenus.length,
                          (index) {
                            final item = navMenus[index];

                            return _navItemDynamic(
                              index: index,
                              menuId: item.id,
                              title: item.menuTitle,
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
    );
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
}
// import 'package:bottom_navy_bar/bottom_navy_bar.dart';
// import 'package:flutter/material.dart';
// import 'package:merckfoundation_252026/Utility/ResponsiveFlutter.dart';
// import 'package:merckfoundation_252026/Utils/common_images.dart';
// import 'package:merckfoundation_252026/Utils/common_strings.dart';
// import 'package:merckfoundation_252026/Utils/customcolor.dart';
// import 'package:merckfoundation_252026/enum/commonEnum.dart';
// import 'package:merckfoundation_252026/screens/MainScreens/HomeNewScreen.dart';
// import 'package:merckfoundation_252026/screens/MainScreens/Articles.dart';
// import 'package:merckfoundation_252026/screens/MainScreens/CallforApplication.dart';

// import 'package:merckfoundation_252026/screens/MainScreens/ourPrograms.dart';

// import 'package:merckfoundation_252026/screens/MediaAndStoriesScreen/MediaListingScreen.dart';
// import 'package:merckfoundation_252026/widgets/formLabel.dart';

// class Dashboard extends StatefulWidget {
//   const Dashboard({Key? key, this.title, this.index = 0, this.apiurl, this.menuID, this.shareLink})
//       : super(key: key);

//   final String? title;
//   final int index;
//   final dynamic apiurl;
//  final String? menuID;

//   final String? shareLink;

//   @override
//   State<Dashboard> createState() => _DashboardState();
// }

// class _DashboardState extends State<Dashboard> {
//   late int currentIndex;
//   late PageController pageController;

//   @override
//   void initState() {
//     super.initState();
//     currentIndex = widget.index;
//     pageController = PageController(initialPage: widget.index);
//   }

//   @override
//   Widget build(BuildContext context) {

//     return Scaffold(
//       backgroundColor: Customcolor.background,
       
//       body: PageView(
//         controller: pageController,
//         physics: const NeverScrollableScrollPhysics(),
//         children: [
//          //  Home(),
//           MerckHomeScreen(),
//           OurProgramScreen(),
//           MediaListingScreen(type: MediaType.stories,categoryID: "",albumID: "",albumName: "",menuID: widget.menuID ?? "",shareLink: widget.shareLink,title: CommonStrings.stories,),

//           // Stories(),
//           ArticlesScreen(),
//           CallforApplication(),
//         ],
//       ),
//       bottomNavigationBar: SafeArea(
//   child: Padding(
//     padding: const EdgeInsets.fromLTRB(16, 0, 16, 10),
//     child: Container(
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(10),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.12),
//             blurRadius: 15,
//             offset: const Offset(0, 6),
//           ),
//         ],
//       ),
//       child: ClipRRect(
//         borderRadius: BorderRadius.circular(10),
//         child: SizedBox(
//           height: 56, // 🔥 key
//           child: BottomNavyBar(
//             selectedIndex: currentIndex,
//             showElevation: false,
//             backgroundColor: Colors.white,
//             mainAxisAlignment: MainAxisAlignment.spaceAround,
//             onItemSelected: (index) {
//               setState(() => currentIndex = index);
//               pageController.jumpToPage(index);
//             },
//             items: [
//               _navItem(index: 0, title: CommonStrings.home,
//                   selected: CommonImagePath.homeSelected,
//                   unselected: CommonImagePath.homeUnselected),
//               _navItem(index: 1, title: CommonStrings.ourPrograms,
//                   selected: CommonImagePath.programSelected,
//                   unselected: CommonImagePath.programUnselected),
//               _navItem(index: 2, title: CommonStrings.stories,
//                   selected: CommonImagePath.storiesSelected,
//                   unselected: CommonImagePath.storiesUnselected),
//               _navItem(index: 3, title: CommonStrings.articles,
//                   selected: CommonImagePath.articlesSelected,
//                   unselected: CommonImagePath.articlesUnselected),
//               _navItem(index: 4, title: CommonStrings.upcomingPrograms,
//                   selected: CommonImagePath.callSelected,
//                   unselected: CommonImagePath.callUnselected),
//             ],
//           ),
//         ),
//       ),
//     ),
//   ),
// ),

//     );
//   }

//   BottomNavyBarItem _navItem({
//     required int index,
//     required String title,
//     required String selected,
//     required String unselected,
//     int maxLines = 1,
//   }) {
//      final responsive = ResponsiveFlutter.of(context);
//     return BottomNavyBarItem(
//       icon: Image.asset(
//         currentIndex == index ? selected : unselected,
//         height:responsive.height(3),
//       ),
//       title: FormLabel(
//         text: title,
//         maxLines: maxLines,
//         textAlignment: TextAlign.start,
//         labelColor: Customcolor.colorBlue,
//         fontweight: FontWeight.w800,
//         fontSize: 12,
//       ),
//       activeColor: Customcolor.colorBlue,
//       inactiveColor: Colors.grey,
//       textAlign: TextAlign.start,
//     );
//   }

//   @override
//   void dispose() {
//     pageController.dispose();
//     super.dispose();
//   }
// }
