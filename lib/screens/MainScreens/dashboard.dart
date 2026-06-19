import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:merckfoundation_252026/Provider/SocialProvider.dart';
import 'package:merckfoundation_252026/Provider/navbar_provider.dart';
import 'package:merckfoundation_252026/Utility/ApiStatusHandler.dart';
import 'package:merckfoundation_252026/Utility/ResponsiveFlutter.dart';
import 'package:merckfoundation_252026/Utility/api_status.dart';

import 'package:merckfoundation_252026/CommonUtils/common_strings.dart';
import 'package:merckfoundation_252026/CommonUtils/customcolor.dart';
import 'package:merckfoundation_252026/routes/app_screen_factory.dart';
import 'package:merckfoundation_252026/widgets/CommonWidget/CommonLoader.dart';
import 'package:merckfoundation_252026/widgets/formLabel.dart';
import 'package:provider/provider.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({
    Key? key,
    this.title,
    this.index = 0,
    this.apiurl,
    this.menuID,
    this.shareLink, required this.menuLogo,
  }) : super(key: key);

  final String? title;
  final int index;
  final dynamic apiurl;
  final String? menuID;
  final String? shareLink;
  final String menuLogo;

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

    pageController = PageController(initialPage: widget.index);
  }

 BottomNavyBarItem _navItemDynamic({
  required int index,
  required int menuId,
  required String title,
  required String menuLogo,
}) {
  final responsive = ResponsiveFlutter.of(context);

  return BottomNavyBarItem(
    icon: Image.network(
      menuLogo,
      color: currentIndex == index?null:Customcolor.textGreyColor.withOpacity(0.5),
      height: responsive.height(3),
      errorBuilder: (_, __, ___) {
        return  Icon(Icons.image,color: Customcolor.textGreyColor.withOpacity(0.5),);
      },
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
  
  // BottomNavyBarItem _navItemDynamic({
  //   required int index,
  //   required int menuId,
  //   required String title,
  // }) {
  //   final responsive = ResponsiveFlutter.of(context);

  //   String selectedIcon = CommonImagePath.homeSelected;
  //   String unselectedIcon = CommonImagePath.homeUnselected;

  //   switch (menuId) {
  //     // Home
  //     case 1:
  //       selectedIcon = CommonImagePath.homeSelected;
  //       unselectedIcon = CommonImagePath.homeUnselected;
  //       break;

  //     // Our Programs
  //     case 16:
  //       selectedIcon = CommonImagePath.programSelected;
  //       unselectedIcon = CommonImagePath.programUnselected;
  //       break;

  //     // Stories
  //     case 27:
  //       selectedIcon = CommonImagePath.storiesSelected;
  //       unselectedIcon = CommonImagePath.storiesUnselected;
  //       break;

  //     // Articles
  //     case 29:
  //       selectedIcon = CommonImagePath.articlesSelected;
  //       unselectedIcon = CommonImagePath.articlesUnselected;
  //       break;

  //     // Upcoming Programs
  //     case 30:
  //       selectedIcon = CommonImagePath.callSelected;
  //       unselectedIcon = CommonImagePath.callUnselected;
  //       break;
  //   }

  //   return BottomNavyBarItem(
  //     icon: Image.asset(
  //       currentIndex == index ? selectedIcon : unselectedIcon,
  //       height: responsive.height(3),
  //     ),
  //     title: FormLabel(
  //       text: title,
  //       maxLines: 1,
  //       textAlignment: TextAlign.center,
  //       labelColor: Customcolor.colorBlue,
  //       fontweight: FontWeight.w800,
  //       fontSize: 12,
  //     ),
  //     activeColor: Customcolor.colorBlue,
  //     inactiveColor: Colors.grey,
  //     textAlign: TextAlign.center,
  //   );
  // }
@override
Widget build(BuildContext context) {
  final navbarProvider = Provider.of<NavbarProvider>(context);
  final navMenus = navbarProvider.mobileBottomMenus;
 

  
  return Scaffold(
    backgroundColor: Customcolor.background,

  
    // ✅ ONLY BODY CHANGES
    body: _buildBody(navbarProvider, navMenus),

    bottomNavigationBar: _buildBottomBar(navbarProvider, navMenus),
  );
}
Widget _buildBody(NavbarProvider navbarProvider, List navMenus) {
  final status = navbarProvider.status;

  /// LOADING
  if (status == ApiStatus.loading) {
    return const Center(child: CommonLoader());
  }
if (status != ApiStatus.success &&
    status != ApiStatus.loading &&
    status != ApiStatus.initial) {

  return ApiStatusHandler(
    status: status,
    errorMessage: navbarProvider.errorMessage,
    onRetry: () {
     navbarProvider.retryNavbar(context);
    },
  );
}
 

  /// EMPTY
  if (navMenus.isEmpty) {
    return const Center(child: Text("No menu found"));
  }

  /// SUCCESS
   return Stack(
  children: [
    PageView(
      controller: pageController,
      physics: const NeverScrollableScrollPhysics(),
      children: navMenus.map((e) => AppScreenFactory.getScreen(e)).toList(),
    ),

    if (status == ApiStatus.noInternet)
      Positioned(
        top: 0,
        left: 0,
        right: 0,
        child: Material(
          color: Colors.red,
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Text(
              CommonStrings.noInternetConnection,
              style: TextStyle(color: Colors.white),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
  ],
);
  
}
Widget _buildBottomBar(NavbarProvider navbarProvider, List navMenus) {
  if (navbarProvider.status != ApiStatus.success || navMenus.isEmpty) {
    return const SizedBox();
  }

  return SafeArea(
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
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              onItemSelected: (index) {
                setState(() {
                  currentIndex = index;
                });
                pageController.jumpToPage(index);
              },
              items: List.generate(navMenus.length, (index) {
                final item = navMenus[index];
                // return _navItemDynamic(
                //   index: index,
                //   menuId: item.id,
                //   title: item.menuTitle,
                // );
                return _navItemDynamic(
  index: index,
  menuId: item.id,
  title: item.menuTitle,
  menuLogo: item.mobileMenuIcon,
);
              }),
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
