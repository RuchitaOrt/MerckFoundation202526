import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:merckfoundation_252026/CommonUtils/common_images.dart';
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
  // late PageController pageController;
   late PageController pageController;

  OverlayEntry? _exitOverlay;

  @override
  void initState() {
    super.initState();
    print("DASHBOARD ${widget.shareLink}");
    currentIndex = widget.index;

    pageController = PageController(initialPage: widget.index);
  }
  bool _canExit = false;
void _showExitMessage() {
  ScaffoldMessenger.of(context).hideCurrentSnackBar();

  final screenWidth = MediaQuery.of(context).size.width;

  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      behavior: SnackBarBehavior.floating,

      // Position above bottom navigation
      margin: EdgeInsets.only(
        left: 16,
        right: 16,
       bottom: MediaQuery.of(context).padding.bottom + 16,
      ),

      duration: const Duration(seconds: 3),

      padding: EdgeInsets.zero,

      content: Center(
        child: Container(
          width: screenWidth > 512
              ? 480
              : screenWidth - 32,

          padding: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 8,
          ),

          decoration: BoxDecoration(
            color: Customcolor.textsubtitlecolor,
            borderRadius: BorderRadius.circular(40),
          ),

          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              // My logo
            
Container(
                width: 22,
                height: 22,
                decoration: const BoxDecoration(
                  color:Colors.white,
                  shape: BoxShape.circle,
                ),
                alignment: Alignment.center,
                child:   Image.asset(CommonImagePath.logoMenu,width: 20,height: 20,),
              ),
              const SizedBox(width: 14),

              const Expanded(
                child: Text(
                  "Press back again to exit",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );

  Future.delayed(const Duration(seconds: 3), () {
    if (mounted) {
      _canExit = false;
    }
  });
}
 BottomNavyBarItem _navItemDynamic({
  required int index,
  required int menuId,
  required String title,
  required String menuLogo,
}) {
  final responsive = ResponsiveFlutter.of(context);

  return BottomNavyBarItem(
    // icon: 
    
    // Image.network(
    //   menuLogo,
    //   color: currentIndex == index?null:Customcolor.textGreyColor.withOpacity(0.5),
    //   height: responsive.height(3),
    //   errorBuilder: (_, __, ___) {
    //     return  Icon(Icons.image,color: Customcolor.textGreyColor.withOpacity(0.5),);
    //   },
    // ),
icon: CachedNetworkImage(
  imageUrl: menuLogo,
  height: responsive.height(3),
  color: currentIndex == index
      ? null
      : Customcolor.textGreyColor.withOpacity(0.5),
  placeholder: (context, url) => SizedBox(
    height: responsive.height(3),
    width: responsive.height(3),
    child: const Center(
      child: SizedBox(
        width: 16,
        height: 16,
        child: CircularProgressIndicator(strokeWidth: 2),
      ),
    ),
  ),
  errorWidget: (context, url, error) => Icon(
    Icons.image,
    color: Customcolor.textGreyColor.withOpacity(0.5),
  ),
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
//   void _showExitMessage() {
//   _exitOverlay?.remove();

//   _exitOverlay = OverlayEntry(
//     builder: (context) {
//       return Positioned(
//         left: 16,
//         right: 16,
//         bottom: 10,
//         child: Material(
//           color: Colors.transparent,
//           child: Container(
//             padding: const EdgeInsets.symmetric(
//               horizontal: 16,
//               vertical: 12,
//             ),
//             decoration: BoxDecoration(
//               color: Colors.black87,
//               borderRadius: BorderRadius.circular(30),
//             ),
//             child: Row(
//               children: [
//                 const Expanded(
//                   child: Text(
//                     "Press back again to exit",
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 14,
//                       fontWeight: FontWeight.w500,
//                     ),
//                   ),
//                 ),

//                 TextButton(
//                   onPressed: () {
//                     _exitOverlay?.remove();
//                     _exitOverlay = null;
//                     _isExitMessageShown = false;

//                     SystemNavigator.pop();
//                   },
//                   child: const Text(
//                     "EXIT",
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       );
//     },
//   );

//   Overlay.of(context).insert(_exitOverlay!);
// bool _isExitMessageShown = false;
//   Future.delayed(const Duration(seconds: 3), () {
//     if (_exitOverlay != null) {
//       _exitOverlay?.remove();
//       _exitOverlay = null;

//       _isExitMessageShown = false;
//     }
//   });
// }
bool _isExitMessageShown = false;

@override
Widget build(BuildContext context) {
  final navbarProvider = Provider.of<NavbarProvider>(context);
  final navMenus = navbarProvider.mobileBottomMenus;
 

  
  return PopScope(
    canPop: false,
  onPopInvokedWithResult: (didPop, result) {
    if (didPop) return;

    if (_canExit) {
      // Second back press
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      SystemNavigator.pop();
    } else {
      // First back press
      _canExit = true;
      _showExitMessage();
    }
  },
    child: Scaffold(
      
      backgroundColor: Customcolor.background,
    
    
      // ✅ ONLY BODY CHANGES
      body: _buildBody(navbarProvider, navMenus),
    
      bottomNavigationBar: _buildBottomBar(navbarProvider, navMenus),
    ),
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
  menuLogo: item.mobileMenuIcon ?? "",
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
  _exitOverlay?.remove();
  _exitOverlay = null;

  pageController.dispose();
  super.dispose();
}
}
