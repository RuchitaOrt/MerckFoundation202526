import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:merckfoundation_252026/Utility/ResponsiveFlutter.dart';
import 'package:merckfoundation_252026/Utils/common_images.dart';
import 'package:merckfoundation_252026/Utils/common_strings.dart';
import 'package:merckfoundation_252026/Utils/customcolor.dart';
import 'package:merckfoundation_252026/screens/MainScreens/articles.dart';
import 'package:merckfoundation_252026/screens/MainScreens/callforApplication.dart';
import 'package:merckfoundation_252026/screens/MainScreens/home.dart';
import 'package:merckfoundation_252026/screens/MainScreens/ourPrograms.dart';
import 'package:merckfoundation_252026/screens/MainScreens/stories.dart';
import 'package:merckfoundation_252026/widgets/formLabel.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key, this.title, this.index = 0, this.apiurl})
      : super(key: key);

  final String? title;
  final int index;
  final dynamic apiurl;

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  late int currentIndex;
  late PageController pageController;

  @override
  void initState() {
    super.initState();
    currentIndex = widget.index;
    pageController = PageController(initialPage: widget.index);
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Customcolor.background,
       
      body: PageView(
        controller: pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          Home(),
          OurProgramScreen(),
          Stories(),
          ArticlesScreen(),
          CallforApplication(),
        ],
      ),
      bottomNavigationBar: BottomNavyBar(
        selectedIndex: currentIndex,
        showElevation: true,
        itemCornerRadius: 8,
        curve: Curves.easeInOut,
        onItemSelected: (index) {
          setState(() => currentIndex = index);
          pageController.jumpToPage(index);
        },
        items: [
          _navItem(
            index: 0,
            title: CommonStrings.home,
            selected: CommonImagePath.homeSelected,
            unselected: CommonImagePath.homeUnselected,
          ),
          _navItem(
            index: 1,
            title: CommonStrings.ourPrograms,
            selected: CommonImagePath.programSelected,
            unselected: CommonImagePath.programUnselected,
          ),
          _navItem(
            index: 2,
            title: CommonStrings.stories,
            selected: CommonImagePath.storiesSelected,
            unselected: CommonImagePath.storiesUnselected,
          ),
          _navItem(
            index: 3,
            title: CommonStrings.articles,
            selected: CommonImagePath.articlesSelected,
            unselected: CommonImagePath.articlesUnselected,
          ),
          _navItem(
            index: 4,
            title: CommonStrings.upcomingPrograms,
            selected: CommonImagePath.callSelected,
            unselected: CommonImagePath.callUnselected,
            maxLines: 2,
          ),
        ],
      ),
    );
  }

  BottomNavyBarItem _navItem({
    required int index,
    required String title,
    required String selected,
    required String unselected,
    int maxLines = 1,
  }) {
     final responsive = ResponsiveFlutter.of(context);
    return BottomNavyBarItem(
      icon: Image.asset(
        currentIndex == index ? selected : unselected,
        height:responsive.height(3),
      ),
      title: FormLabel(
        text: title,
        maxLines: maxLines,
        textAlignment: TextAlign.start,
        labelColor: Customcolor.colorBlue,
        fontweight: FontWeight.w800,
        fontSize: 12,
      ),
      activeColor: Customcolor.colorBlue,
      inactiveColor: Colors.grey,
      textAlign: TextAlign.start,
    );
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
}
