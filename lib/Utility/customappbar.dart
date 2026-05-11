import 'package:flutter/material.dart';
import 'package:merckfoundation_252026/Utility/ResponsiveFlutter.dart';
import 'package:merckfoundation_252026/Utils/common_images.dart';
import 'package:merckfoundation_252026/Utils/customcolor.dart';
import 'package:merckfoundation_252026/enum/commonEnum.dart';
import 'package:merckfoundation_252026/screens/dashboard.dart';
import 'package:merckfoundation_252026/widgets/formLabel.dart';

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  final AppBarType type;
  final String? title;
  final VoidCallback? onBack;
  final VoidCallback? onDrawer;
  final VoidCallback? onFilter;
  final VoidCallback? onSearch;
  final VoidCallback? onShare;
  final String? shareLink;
  final double height;

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
  });

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveFlutter.of(context);

    return Container(
      color: Customcolor.baby_blue,
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
                    MaterialPageRoute(builder: (_) => Dashboard(index: 0)),
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
          Image.asset(CommonImagePath.drawerImg, height: 45),

          const Spacer(),

          if (onShare != null) _icon(CommonImagePath.share, () {}),
          // ACTION ICONS
          8.0.heightBox,
          if (onSearch != null) _icon(CommonImagePath.search, onSearch),

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
            child: FormLabel(
              text: title ?? "",
              maxLines: 1,
              fontSize: 14,
              softWrap: true,
              textOverflow: TextOverflow.ellipsis,
              labelColor: Colors.white,
              fontweight: FontWeight.bold,
              textAlignment: TextAlign.start,
            ),
          ),

          if (onFilter != null) _icon(CommonImagePath.filter, onFilter),
        ],
      ),
    );
  }

  Widget _icon(String asset, VoidCallback? onTap) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6),
      child: GestureDetector(
        onTap: onTap,
        child: Image.asset(asset, height: 22),
      ),
    );
  }
}
