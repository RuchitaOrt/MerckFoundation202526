

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:merckfoundation_252026/Utility/ResponsiveFlutter.dart';
import 'package:merckfoundation_252026/Utility/customappbar.dart';
import 'package:merckfoundation_252026/Utils/common_images.dart';
import 'package:merckfoundation_252026/Utils/customcolor.dart';
import 'package:merckfoundation_252026/enum/commonEnum.dart';
import 'package:merckfoundation_252026/screens/MainUIBody.dart/CommonBody.dart';
import 'package:merckfoundation_252026/screens/SubScreens/OurAwardScreen.dart';
import 'package:merckfoundation_252026/widgets/drawer.dart';

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
        height:responsive.height(9),
      ),

      drawer: Theme(
        data: Theme.of(context).copyWith(canvasColor: Colors.transparent),
        child: AppDrawer(),
      ),
      body:  CommonBody("1"),
    );
  }
}


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
              child: CategoryChip(title: e[0] as String, color: e[1] as Color),
            );
          }).toList(),
        ),
      ],
    );
  }
}

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

    return GestureDetector(
      onTap: () {
        /// ✅ OPEN OUR AWARD SCREEN
        if (title == "Our Awards") {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => const OurAwardScreen(),
            ),
          );
        }
      },
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 12,
        ),
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
  const FollowSection({super.key, required this.title});

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
                style:  TextStyle(
                  fontSize:screenWidth * 0.055,
                  
                  // Platform.isAndroid? 22:20,
                  fontWeight: FontWeight.w800,

                  color: Customcolor.text_blue,
                ),
              ),
            ),
            title == "Follow Us"
                ? Image.asset(CommonImagePath.homeFlowerNew, height: 70)
                : Container(),
          ],
        ),
        const SizedBox(height: 12),
        Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
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
        title == "Follow Us"
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
      child: SvgPicture.asset(icon, width: size * 0.5, height: size * 0.5),
    );
  }
}
