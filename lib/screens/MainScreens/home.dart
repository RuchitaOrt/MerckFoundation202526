import 'dart:io';

import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';

import 'package:merckfoundation_252026/Utility/customappbar.dart';
import 'package:merckfoundation_252026/Utility/showdailog.dart';
import 'package:merckfoundation_252026/Utility/ResponsiveFlutter.dart';
import 'package:merckfoundation_252026/Utils/common_strings.dart';
import 'package:merckfoundation_252026/Utils/customcolor.dart';
import 'package:merckfoundation_252026/data/model/CommonModel.dart';
import 'package:merckfoundation_252026/data/model/MockHomeData.dart';
import 'package:merckfoundation_252026/enum/commonEnum.dart';
import 'package:merckfoundation_252026/providers/follow_us_provider.dart';
import 'package:merckfoundation_252026/providers/home_provider.dart';
import 'package:merckfoundation_252026/widgets/CommonCarouselSection.dart';
import 'package:merckfoundation_252026/widgets/CommonRichText.dart';
import 'package:merckfoundation_252026/widgets/DynamicTabView.dart';
import 'package:merckfoundation_252026/widgets/FooterFlowerImage.dart';
import 'package:merckfoundation_252026/widgets/Homewidget.dart/CommonStaticGrid.dart';
import 'package:merckfoundation_252026/widgets/Homewidget.dart/OurListWidget.dart';
import 'package:merckfoundation_252026/widgets/Homewidget.dart/homeSlider.dart';
import 'package:merckfoundation_252026/widgets/Homewidget.dart/homeVideowidget.dart';
import 'package:merckfoundation_252026/widgets/Homewidget.dart/homefollow_us.dart';
import 'package:merckfoundation_252026/widgets/Homewidget.dart/homemarquee.dart';
import 'package:merckfoundation_252026/widgets/botttomlink.dart';
import 'package:merckfoundation_252026/widgets/drawer.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<HomeSliderProvider>().loadSliderData();

      final provider = context.read<HomeSliderProvider>();

      if (provider.ourStaticList.isEmpty) {
        provider.loadStaticData();
      }
    });
  }

  List<DynamicTabItem> buildTabs(BuildContext context) {
    final List<DynamicTabItem> tabs = [];

    // Later this comes from API
    if (MockHomeData.callForApp.isNotEmpty) {
      tabs.add(
        DynamicTabItem(
          key: "call_for_app",
          title: Callforapptext(),
          content: getcallforapp(context),
        ),
      );
    }

    if (MockHomeData.mmtm.isNotEmpty) {
      tabs.add(
        DynamicTabItem(
          key: "mmtm",
          title: Merckmtmtext(),
          content: getMMTMS(context),
        ),
      );
    }

    if (MockHomeData.digitalLibrary.isNotEmpty) {
      tabs.add(
        DynamicTabItem(
          key: "digital_library",
          title: Digitaltext(),
          content: getdigitallib(context),
        ),
      );
    }

    return tabs;
  }

  Widget getdigitallib(BuildContext context) {
    return CommonCarouselSection(
      controller: CarouselSliderController(),
      carouselHeight: CommonStrings.callcoursaheight,
      imageWidth: CommonStrings.callimagewidth,
      imageHeight: CommonStrings.callimageheight,
      onViewAll: () {},
      items: MockHomeData.digitalLibrary,
    );
  }

  Widget getcallforapp(BuildContext context) {
    return CommonCarouselSection(
      controller: CarouselSliderController(),
      carouselHeight: CommonStrings.callcoursaheight,
      imageWidth: CommonStrings.callimagewidth,
      imageHeight: CommonStrings.callimageheight,
      onViewAll: () {},
      items: MockHomeData.callForApp,
    );
  }

  Widget getMMTMS(BuildContext context) {
    return CommonCarouselSection(
      controller: CarouselSliderController(),
      carouselHeight: CommonStrings.callcoursaheight,
      imageWidth: CommonStrings.callAmbassadarimagewidth,
      imageHeight: CommonStrings.callimageheight,
      onViewAll: () {},
      items: MockHomeData.mmtm,
    );
  }

  @override
  Widget build(BuildContext context) {
   
    final responsive = ResponsiveFlutter.of(context);

    return WillPopScope(
      onWillPop: () async {
        final result = await ShowDialogs.showConfirmDialog(
          context,
         CommonStrings.exitText,
         CommonStrings.exitQuestion,
        );
        return result;
      },
      
      child: Scaffold(
        key: _scaffoldKey,
        backgroundColor: Customcolor.background,
       appBar:
       CommonAppBar(
    type: AppBarType.home,
    onDrawer: () => _scaffoldKey.currentState?.openDrawer(),
    onSearch: () {},
     height:Platform.isAndroid?responsive.height(9): responsive.height(7),
  ),
       
        drawer: Theme(
          data: Theme.of(context).copyWith(canvasColor: Colors.transparent),
          child: AppDrawer(),
        ),
        body: ListView(
          padding: EdgeInsets.zero,
          children: [
            const HomeSlider(),
            2.0.heightBox,
            const CommonMarquee(
              text:
                CommonStrings.marquee
            ),
            8.0.heightBox,
            const OurListWidget(),
            FollowUsSection(
              showFlower: true,
              iconSize: 45,
              title: CommonStrings.followUsTitle,
              icons: FollowUsProvider.merckFoundationIcons(context),
            ),
            FollowUsSection(
              showFlower: false,
              iconSize: 45,
              title: CommonStrings.followUsRashaTitle,
              icons: FollowUsProvider.rashaIcons(context),
            ),
            CommonRichText(
              title: CommonStrings.impactOfMerck,
              subtitle:CommonStrings.impactOn,
            ),
            CommonStaticGrid(
              items: context.watch<HomeSliderProvider>().ourStaticList,
            ),
            ListView(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: list(context),
            ),
            8.0.heightBox,
            SizedBox(
              height: CommonStrings.tabheight,
              child: DynamicTabView(
                tabs: buildTabs(context),
                indicatorColor: Customcolor.pinkbg,
              ),
            ),
            const FooterFlowerImage(),
            8.0.heightBox,
            Bottomcardlink(),
          ],
        ),
      ),
    );
  }
}
