import 'package:flutter/material.dart';
import 'package:merckfoundation_252026/Utility/ResponsiveFlutter.dart';
import 'package:merckfoundation_252026/CommonUtils/common_images.dart';
import 'package:merckfoundation_252026/CommonUtils/customcolor.dart';

import 'package:merckfoundation_252026/enum/commonEnum.dart';
import 'package:merckfoundation_252026/screens/MainScreens/SearchScreen.dart';

import 'package:merckfoundation_252026/screens/MainScreens/dashboard.dart';
import 'package:merckfoundation_252026/widgets/SmartHtmlWidget.dart';
import 'package:merckfoundation_252026/widgets/formLabel.dart';
import 'package:merckfoundation_252026/widgets/share_bottom_sheet.dart';
import 'dart:math' as math;
class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  final AppBarType type;
  final String? title;
  final VoidCallback? onBack;
  final VoidCallback? onDrawer;
  final VoidCallback? onFilter;
  final VoidCallback? onSearch;
  final VoidCallback? onShare;
  final String? shareLink;
  
  final String? menuID;
  final double height;
  final String? mennuLogo;

  const CommonAppBar({
    super.key,
    required this.type,
    this.title,
    this.onBack,
    this.onDrawer,
    this.onFilter,
    this.onSearch,
    this.onShare,
    this.shareLink,
    
    this.height = 110,
    this.menuID,
    this.mennuLogo,
  });

  // @override
  // Size get preferredSize => Size.fromHeight(
  //    type != AppBarType.home? title!.length>100?120:height:
  //   height);
// @override
// Size get preferredSize => Size.fromHeight(
//   type != AppBarType.home && (title?.length ?? 0) > 100
//       ? 120
//       : height,
// );
// @override
// Size get preferredSize {
//   if (type == AppBarType.home) {
//     return const Size.fromHeight(76);
//   }

//   final titleHeight = (title?.length ?? 0) > 100 ? 60.0 : 50.0;

//   return Size.fromHeight(
//     59.0 + titleHeight,
//   );
// }
@override
Size get preferredSize {
  if (type == AppBarType.home) {
    return const Size.fromHeight(76);
  }

  final screenWidth = WidgetsBinding.instance.platformDispatcher.views.first
      .physicalSize.width /
      WidgetsBinding.instance.platformDispatcher.views.first.devicePixelRatio;

  final logoHeight = screenWidth < 380
      ? 40.0
      : screenWidth < 600
          ? 44.0
          : 48.0;

  final topRowHeight = logoHeight + 2.0 + 16.0 + 8.0;

  final titleHeight = (title?.length ?? 0) > 100 ? 60.0 : 50.0;

  return Size.fromHeight(
    topRowHeight + titleHeight,
  );
}
@override
Widget build(BuildContext context) {
  final responsive = ResponsiveFlutter.of(context);

  return Container(
    color: Customcolor.babyBlue,
    child: SafeArea(
      bottom: false,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _topRow(context, responsive),
          if (type == AppBarType.inner && title != null)
            _bottomTitleBar(context),
        ],
      ),
    ),
  );
}
  // @override
  // Widget build(BuildContext context) {
  //   final responsive = ResponsiveFlutter.of(context);

  //   return Container(
  //     color: Customcolor.babyBlue,
  //     padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
  //     child: Column(
  //       children: [
  //         _topRow(context, responsive),
  //         if (type == AppBarType.inner && title != null)
  //           _bottomTitleBar(context),
  //       ],
  //     ),
  //   );
  // }
Widget _topRow(
  BuildContext context,
  ResponsiveFlutter responsive,
) {
  final screenWidth = MediaQuery.of(context).size.width;

  final logoHeight = screenWidth < 380
      ? 40.0
      : screenWidth < 600
          ? 44.0
          : 48.0;

  final topRowHeight = type == AppBarType.home
      ? 76.0
      : logoHeight + 2.0 + 16.0 + 8.0; // extra bottom space

  return SizedBox(
    height: topRowHeight,
    child: Stack(
      alignment: Alignment.center,
      children: [

        // CENTER LOGO + TAGLINE
        Positioned.fill(
          child: Center(
            child: GestureDetector(
              onTap: () {
                if (type != AppBarType.home) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (_) => Dashboard(
                        index: 0,
                        menuID: menuID,
                        shareLink: shareLink,
                        menuLogo: mennuLogo ?? "",
                      ),
                    ),
                  );
                }
              },
              child: SizedBox(
                height: topRowHeight,
                width: 260,
                child:
                Column(
  mainAxisAlignment: MainAxisAlignment.center,
  mainAxisSize: MainAxisSize.min,
  children: [
    SizedBox(
      height: logoHeight,
      child: Image.asset(
        CommonImagePath.logoMenu,
        fit: BoxFit.contain,
      ),
    ),

    SmartHtmlWidget(
      html: "<i>The German not-for-profit organization</i>",
      textColor: Customcolor.colorVoilet,
      fontSize: 7,
      fontWeight: FontWeight.w500,
      ignoreHtmlStyles: false,
    ),
  ],
),
                //  Column(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     SizedBox(
                //       height: logoHeight,
                //       child: Image.asset(
                //         CommonImagePath.logoMenu,
                //         fit: BoxFit.contain,
                //       ),
                //     ),

                //     // const SizedBox(height: 2),

                //     SizedBox(
                //       height: 16,
                //       width: 260,
                //       child: FittedBox(
                //         fit: BoxFit.scaleDown,
                //         child: SmartHtmlWidget(
                //           html:
                //               "<i>The German not-for-profit organization</i>",
                //           textColor: Customcolor.colorVoilet,
                //           fontSize: 7,
                //           fontWeight: FontWeight.w500,
                //           ignoreHtmlStyles: false,
                //         ),
                //       ),
                //     ),

                //     // EXTRA SPACE BELOW TAGLINE
                //     const SizedBox(height: 6),
                //   ],
                // ),
              ),
            ),
          ),
        ),

        // LEFT ICON
        Positioned(
          left: 8,
          child: GestureDetector(
            onTap: () {
              if (type == AppBarType.home) {
                onDrawer?.call();
              } else {
                if (onBack != null) {
                  onBack!.call();
                } else {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (_) => Dashboard(
                        index: 0,
                        menuID: menuID,
                        shareLink: shareLink,
                        menuLogo: mennuLogo ?? "",
                      ),
                    ),
                  );
                }
              }
            },
            child: Image.asset(
              type == AppBarType.home
                  ? CommonImagePath.menu
                  : CommonImagePath.arrowBack,
              height: 24,
            ),
          ),
        ),

        // RIGHT ICONS
        Positioned(
          right: 10,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (shareLink?.isNotEmpty ?? false)
                _icon(
                  CommonImagePath.share,
                  () {
                    ShareBottomSheet.show(
                      context,
                      shareLink: shareLink!,
                    );
                  },
                  true,
                ),

              const SizedBox(width: 8),

              _icon(
                CommonImagePath.search,
                () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => SearchScreen(),
                    ),
                  );
                },
                false,
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
//   Widget _topRow(BuildContext context, ResponsiveFlutter responsive) {
//     print("SHareLink Value");
//     print(shareLink);
    
//     return SizedBox(
//       height: 60,
//       child: Row(
//         children: [
//           8.0.widthBox,

//           // LEFT ICON
//           GestureDetector(
//             onTap: () {
//               if (type == AppBarType.home) {
//                 onDrawer?.call();
//               } else {
//                 if (onBack != null) {
//                   print("onBack");
//                   onBack!.call();
//                 } else {
//                   Navigator.pushReplacement(
//                     context,
//                     MaterialPageRoute(
//                       builder: (_) => Dashboard(
//                         index: 0,
//                         menuID: menuID,
//                         shareLink: shareLink,
//                         menuLogo: mennuLogo ?? "",
//                       ),
//                     ),
//                   );
//                 }
//               }
//             },
//             child: Image.asset(
//               type == AppBarType.home
//                   ? CommonImagePath.menu
//                   : CommonImagePath.arrowBack,
//               height: 24,
//             ),
//           ),

//           const Spacer(),

//           // LOGO
//           GestureDetector(
//             onTap: ()
//             {
//               if( type != AppBarType.home)
//               {
//  Navigator.pushReplacement(
//                     context,
//                     MaterialPageRoute(
//                       builder: (_) => Dashboard(
//                         index: 0,
//                         menuID: menuID,
//                         shareLink: shareLink,
//                         menuLogo: mennuLogo ?? "",
//                       ),
//                     ),
//                   );
//               }
             

//             },
//             child:
//              Image.asset(CommonImagePath.drawerImg, 
//                               //  Image.asset(CommonImagePath.drawerImg, 
                               
//                                height: type == AppBarType.home?150: 65
//                               ),
//       //         Column(
//       //           children: [
//       //             Image.asset(CommonImagePath.logoMenu, 
//       //                         //  Image.asset(CommonImagePath.drawerImg, 
                               
//       //                          height:
//       //                          type == AppBarType.home?50: 50),

//       //                        SmartHtmlWidget(
//       //   html: "The Philanthropic arm of Merck KGaA" ,
//       //   textColor: Customcolor.colorVoilet,
//       //   fontSize:  responsive.fontSize(1),
//       //   fontWeight: FontWeight.w900,
//       //   ignoreHtmlStyles: true,
//       // ),
//       //           ],
//       //         ),
//           ),

//           const Spacer(),
//           if (shareLink != "" 
//           )
          
//             _icon(CommonImagePath.share, () {
//               print("CLICKED");
//               if (shareLink != null && shareLink!.isNotEmpty) {
//                 print("CLICKED");
//                 ShareBottomSheet.show(context, shareLink: shareLink!);
//               }
//             }, true),
//           // if (onShare != null) _icon(CommonImagePath.share, onShare,true),
//           // // ACTION ICONS
//           8.0.heightBox,
//           // if (onSearch != null)
//           // _icon(CommonImagePath.search, onSearch, false),
//           _icon(
//             CommonImagePath.search,
//             () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (_) => SearchScreen(
                    
//                   ),
//                 ),
//               );
//             },
//             // onSearch,
//             false,
//           ),
//           10.0.heightBox,
//         ],
//       ),
//     );
//   }

  Widget _bottomTitleBar(BuildContext context) {
    return Container(
      height:
     type != AppBarType.home?  title!.length>100?60:
        50:50,
      width: double.infinity,
      color: Customcolor.colorVoilet,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Row(
        children: [
          Expanded(
            child: SmartHtmlWidget(
              html: title ?? "",
              textColor: Customcolor.white,
              fontSize: 14,
              fontWeight: FontWeight.bold,
              ignoreHtmlStyles: true,
              applyMaxLines: true,
              fontFamily: "Times New Roman",
              maxLines: 3,
              softWrap: true,
              textOverflow: TextOverflow.ellipsis,
            ),
    
          ),

          if (onFilter != null) _icon(CommonImagePath.filter, onFilter, false),
        ],
      ),
    );
  }

  Widget _icon(String asset, VoidCallback? onTap, bool isShare) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6),
      child: GestureDetector(
        onTap: onTap,
        child: Image.asset(asset, height:28),
      ),
    );
  }
}
