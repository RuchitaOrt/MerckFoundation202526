import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:merckfoundation_252026/Utility/ResponsiveFlutter.dart';
import 'package:merckfoundation_252026/Utility/customappbar.dart';
import 'package:merckfoundation_252026/Utils/common_images.dart';
import 'package:merckfoundation_252026/Utils/customcolor.dart';
import 'package:merckfoundation_252026/enum/commonEnum.dart';
import 'package:merckfoundation_252026/main.dart';
import 'package:merckfoundation_252026/screens/MainUIBody.dart/CommonBody.dart';
import 'package:merckfoundation_252026/screens/SubScreens/OurAwardScreen.dart';
import 'package:merckfoundation_252026/widgets/drawer.dart';

class MerckHomeScreen extends StatelessWidget {
   final String menuID;
  final String title;
  

  final String? shareLink;

  MerckHomeScreen({super.key, required this.menuID, required this.title, this.shareLink});
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
        height: responsive.height(9),
      ),

      drawer: Theme(
        data: Theme.of(context).copyWith(canvasColor: Colors.transparent),
        child: AppDrawer(),
      ),
      body: CommonBody(menuID),
    );
  }
}

class CategorySection extends StatelessWidget {
  final List content;

  const CategorySection({
    super.key,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {

    /// ✅ hide if empty
    if (content.isEmpty) {
      return const SizedBox();
    }

    return Wrap(
      spacing: 10,
      runSpacing: 10,
      children: content.map<Widget>((e) {

        final String title =
            e['title'] is String ? e['title'] : "";

        final String description =
            e['description'] is String
                ? e['description']
                : "";
                 final String colorString =
            e['subdescription'] is String
                ? e['subdescription']
                : "";
final Color color =
    Color(int.parse(colorString));
       
        return CategoryChip(
          title: title,
          color: color,
        
        );
      }).toList(),
    );
  }


}
class CategoryChip extends StatelessWidget {
  final String title;
  final Color color;

  const CategoryChip({super.key, required this.title, required this.color});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: () {
        /// ✅ OPEN OUR AWARD SCREEN
        if (title == "Our Awards") {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const OurAwardScreen()),
          );
        }
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
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
      ),
    );
  }
}

class FollowSection extends StatelessWidget {
  final String title;
  final double? iconSize;
  final int position;
  const FollowSection({super.key, required this.title,  this.iconSize,  this.position=0});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
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
                style: TextStyle(
                  fontSize: screenWidth * 0.055,

                  // Platform.isAndroid? 22:20,
                  fontWeight: FontWeight.w800,

                  color: Customcolor.text_blue,
                ),
              ),
            ),
            position == 0
                ? Container()
                : position == 1
                ? Image.asset(CommonImagePath.homeFlowerNew, height: 70)
                : Container(),
          ],
        ),
        const SizedBox(height: 12),
        Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child:  Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SocialIcon("assets/newImages/ins.svg",iconSize:iconSize ,onTap: () {
                
              },),

              SocialIcon("assets/newImages/FB.svg",iconSize:iconSize ,onTap: () {
                
              },),
              SocialIcon("assets/newImages/twitt.svg",iconSize:iconSize,onTap: () {
                
              }, ),
              SocialIcon("assets/newImages/youtu.svg",iconSize:iconSize ,onTap: () {
                
              },),
              SocialIcon("assets/newImages/flick.svg",iconSize:iconSize ,onTap: () {
                
              },),

              SocialIcon("assets/newImages/threads.svg",iconSize:iconSize,onTap: () {
                
              },),
            ],
          ),
        ),
        position == 0
            ? Container()
            : position == 1
            ? Container()
            : Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Image.asset(CommonImagePath.homeFlowerNew, height: 70),
              ),
      ],
    );
  }
}

class SocialIcon extends StatelessWidget {
  final String icon;
  final double? iconSize;
  final VoidCallback onTap;

  const SocialIcon(
    this.icon, {
    super.key,
    this.iconSize, required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final size =
        MediaQuery.of(routeGlobalKey.currentContext!)
                .size
                .width *
            0.12;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(size * 0.25),
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
         color: Colors.white,
        ),
        child: SvgPicture.asset(
          icon,
          width: iconSize ?? size * 0.5,
          height: iconSize ?? size * 0.5,
        ),
      ),
    );
  }

}
