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

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveFlutter.of(context);

    return Container(
      color: Customcolor.babyBlue,
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      child: Column(
        children: [
          _topRow(context, responsive),
          if (type == AppBarType.inner && title != null)
            _bottomTitleBar(context),
        ],
      ),
    );
  }

  Widget _topRow(BuildContext context, ResponsiveFlutter responsive) {
    print("SHareLink Value");
    print(shareLink);
    
    return SizedBox(
      height: 60,
      child: Row(
        children: [
          8.0.widthBox,

          // LEFT ICON
          GestureDetector(
            onTap: () {
              if (type == AppBarType.home) {
                onDrawer?.call();
              } else {
                if (onBack != null) {
                  print("onBack");
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

          const Spacer(),

          // LOGO
          Image.asset(CommonImagePath.drawerImg, height:
           type == AppBarType.home?80: 45),

          const Spacer(),
          if (shareLink != "" 
          )
          
            _icon(CommonImagePath.share, () {
              print("CLICKED");
              if (shareLink != null && shareLink!.isNotEmpty) {
                print("CLICKED");
                ShareBottomSheet.show(context, shareLink: shareLink!);
              }
            }, true),
          // if (onShare != null) _icon(CommonImagePath.share, onShare,true),
          // // ACTION ICONS
          8.0.heightBox,
          // if (onSearch != null)
          // _icon(CommonImagePath.search, onSearch, false),
          _icon(
            CommonImagePath.search,
            () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => SearchScreen(
                    
                  ),
                ),
              );
            },
            // onSearch,
            false,
          ),
          10.0.heightBox,
        ],
      ),
    );
  }

  Widget _bottomTitleBar(BuildContext context) {
    return Container(
      height: 50,
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
              maxLines: 1,
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
        child: Image.asset(asset, height: 22),
      ),
    );
  }
}
