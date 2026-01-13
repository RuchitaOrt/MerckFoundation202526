import 'package:flutter/material.dart';
import 'package:merckfoundation_252026/Utility/ResponsiveFlutter.dart';
import 'package:merckfoundation_252026/Utils/common_images.dart';
import 'package:merckfoundation_252026/Utils/common_strings.dart';
import 'package:merckfoundation_252026/providers/follow_us_provider.dart';
import 'package:merckfoundation_252026/screens/ContactUs/ContactUs.dart';
import 'package:merckfoundation_252026/screens/MediaAndStoriesScreen/DigiitalLibrary.dart';
import 'package:merckfoundation_252026/screens/MediaAndStoriesScreen/MediaScreen.dart';
import 'package:merckfoundation_252026/screens/MediaAndStoriesScreen/NewsRelease.dart';
import 'package:merckfoundation_252026/screens/MediaAndStoriesScreen/PhotoGallery.dart';
import 'package:merckfoundation_252026/screens/MediaAndStoriesScreen/Testimonial.dart';
import 'package:merckfoundation_252026/screens/MediaAndStoriesScreen/videoLibrary.dart';
import 'package:merckfoundation_252026/screens/OurPartnersScreen/ourPartners.dart';
import 'package:merckfoundation_252026/screens/WhatWeDoScreen.dart/ourActivities.dart';
import 'package:merckfoundation_252026/screens/WhatWeDoScreen.dart/ourmission.dart';
import 'package:merckfoundation_252026/screens/WhatWeDoScreen.dart/ourpolicy.dart';
import 'package:merckfoundation_252026/screens/WhoWeAreScreen.dart/DataPrivacy.dart';
import 'package:merckfoundation_252026/screens/WhoWeAreScreen.dart/Leadership.dart';
import 'package:merckfoundation_252026/screens/WhoWeAreScreen.dart/LegalDisclaimer.dart';
import 'package:merckfoundation_252026/screens/WhoWeAreScreen.dart/PoliticalNeutralityDeclaration.dart';
import 'package:merckfoundation_252026/screens/WhoWeAreScreen.dart/messageFromLeadership.dart';
import 'package:merckfoundation_252026/screens/WhoWeAreScreen.dart/vision.dart';
import 'package:merckfoundation_252026/screens/dashboard.dart';
import 'package:merckfoundation_252026/Utils/customcolor.dart';
import 'package:merckfoundation_252026/widgets/Homewidget.dart/homefollow_us.dart';
import 'package:merckfoundation_252026/widgets/formLabel.dart';

Map<String, bool> expansionState = {};

class AppDrawer extends StatefulWidget {
  @override
  _AppDrawerState createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  final expansionList = [
    CommonStrings.whoWeAre,
    CommonStrings.whatWeDo,
    CommonStrings.mediaStories
  ];

  double socialIconSize = 5.5;

  void closeOpenExpansionList(String expansionName) {
    expansionList.forEach((name) {
      if (name != expansionName) expansionState[name] = false;
    });
    setState(() {
      expansionState[expansionName] = true;
    });
  }

  @override
  void initState() {
    super.initState();
    expansionList.forEach((name) {
      expansionState.putIfAbsent(name, () => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveFlutter.of(context);
    

    return  Drawer(
  child: Container(
    color: Customcolor.baby_blue,
    child: Column(
      children: [

        /// Scrollable drawer content
        Expanded(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              _buildHeader(context),
              16.0.heightBox,

              DrawerWidget(
                image: CommonImagePath.home,
                value: CommonStrings.home,
                onTapfun: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (_) => Dashboard(index: 0)),
                  );
                },
              ),

             16.0.heightBox,

              _buildWhoWeAre(),
              16.0.heightBox,
              _buildWhatWeDo(),
              16.0.heightBox,

              DrawerWidget(
                image: CommonImagePath.partner,
                value: CommonStrings.ourPartners,
                onTapfun: () {
                   Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        Ourpatner()));
                },
              ),

              16.0.heightBox,

              DrawerWidget(
                image: CommonImagePath.programs,
                value: CommonStrings.ourPrograms,
                onTapfun: () =>
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (_) => Dashboard(index: 1))),
              ),

             16.0.heightBox,

              _buildMediaStories(),

              16.0.heightBox,

              DrawerWidget(
                image: CommonImagePath.call,
                value: CommonStrings.contactUs,
                onTapfun: () {
                   Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        ContactUs()));
                },
              ),

      
            ],
          ),
        ),

        /// Fixed Follow Us Section
        FollowUsSection(
          showFlower: false,
          iconSize: 30,
          title: "",
          icons: FollowUsProvider.merckFoundationIcons(context),
        ),
      ],
    ),
  ),
);

  }
  Widget _buildHeader(BuildContext context) {
  final responsive = ResponsiveFlutter.of(context);

  return Container(
    color: Customcolor.background,
    padding: EdgeInsets.all(responsive.width(3)),
    child: Column(
      children: [
        16.0.heightBox,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              CommonImagePath.drawerLogo,
              width: responsive.width(40),
              height: responsive.height(12),
              fit: BoxFit.contain,
            ),
            Padding(
              padding:  EdgeInsets.only(top: 30),
              child: GestureDetector(
                onTap: () {
                  print("Clicked on aarow");
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (_) => Dashboard(index: 0),
                    ),
                  );
                },
                child: Container(
                  color: Colors.transparent,
                  child: Image.asset(
                    CommonImagePath.arrowForward,
                    width: responsive.width(5),
                    height: responsive.width(5),
                  ),
                ),
              ),
            ),
          ],
        ),
        16.0.heightBox,
      ],
    ),
  );
}
Widget _buildWhoWeAre() {
  return CustomExpansion(
    title: CommonStrings.whoWeAre,
    leadingIcon: CommonImagePath.whoWeAre,
    expanded: expansionState[CommonStrings.whoWeAre]!,
    onTap: () {
      setState(() {
        expansionState[CommonStrings.whoWeAre] =
            !expansionState[CommonStrings.whoWeAre]!;
        if (expansionState[CommonStrings.whoWeAre]!)
          closeOpenExpansionList(CommonStrings.whoWeAre);
      });
    },
    children: [
      DrawerWidget(value: CommonStrings.ourVision,onTapfun: () {
          Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        OurVision()));
      },),
      DrawerWidget(value: CommonStrings.leadership,onTapfun: () {
          Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        Leadership()));
      },),
      DrawerWidget(value: CommonStrings.messageFromLeadership,onTapfun: () {
         Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        MessageFromLeadership()));
      },),
      DrawerWidget(value: CommonStrings.merckOverview),
    ],
  );
}
Widget _buildWhatWeDo() {
  return CustomExpansion(
    title: CommonStrings.whatWeDo,
    leadingIcon: CommonImagePath.whatWeDo,
    expanded: expansionState[CommonStrings.whatWeDo]!,
    onTap: () {
      setState(() {
        expansionState[CommonStrings.whatWeDo] =
            !expansionState[CommonStrings.whatWeDo]!;
        if (expansionState[CommonStrings.whatWeDo]!)
          closeOpenExpansionList(CommonStrings.whatWeDo);
      });
    },
    children: [
      DrawerWidget(value: CommonStrings.ourMission,onTapfun: () {
         Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        OurMission()));
      },),
      DrawerWidget(value: CommonStrings.ourPolicies,onTapfun: () {
         Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        OurPolicy()));
      },),
      DrawerWidget(value: CommonStrings.ourActivities,onTapfun: () {
         Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        OurActivities()));
      },),
      DrawerWidget(value: CommonStrings.legalDisclaimer,onTapfun: ()
      {
          Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        LegalDisclaimer()));
      },),
      DrawerWidget(value: CommonStrings.dataPrivacy,onTapfun: () {
          Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        DataPrivacy()));
      },),
      DrawerWidget(value: CommonStrings.politicalNeutrality,onTapfun: () {
         Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        PoliticalNeutralityDeclaration()));
      },),
    ],
  );
}
Widget _buildMediaStories() {
  return CustomExpansion(
    title: CommonStrings.mediaStories,
    leadingIcon: CommonImagePath.mediaEvents,
    expanded: expansionState[CommonStrings.mediaStories]!,
    onTap: () {
      setState(() {
        expansionState[CommonStrings.mediaStories] =
            !expansionState[CommonStrings.mediaStories]!;
        if (expansionState[CommonStrings.mediaStories]!)
          closeOpenExpansionList(CommonStrings.mediaStories);
      });
    },
    children: [
      DrawerWidget(value: CommonStrings.videoLibrary,onTapfun: () {
         Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (_) => VideoLibrary()));
      },),
      DrawerWidget(
        value: CommonStrings.stories,
        onTapfun: () =>
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (_) => Dashboard(index: 2))),
      ),
      DrawerWidget(value: CommonStrings.alumniTestimonies,onTapfun: () {
         Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (_) => Testimonial()));
      },),
      DrawerWidget(
        value: CommonStrings.newslettersArticles,
        onTapfun: () =>
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (_) => Dashboard(index: 3))),
      ),
      DrawerWidget(
        value: CommonStrings.upcomingPrograms,
        onTapfun: () =>
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (_) => Dashboard(index: 4))),
      ),
      DrawerWidget(value: CommonStrings.newsRelease,onTapfun: () {
          Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (_) => NewsRelease()));
      },),
      DrawerWidget(value: CommonStrings.merckInMedia,onTapfun: ()
      {
         Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (_) => MediaScreen()));
      },),
      DrawerWidget(value: CommonStrings.digitalLibrary,onTapfun: () {
         Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (_) => DigiitalLibrary()));
      },),
      DrawerWidget(value: CommonStrings.photoGallery,onTapfun: () {
          Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (_) => PhotoGallery()));
      },),
    ],
  );
}

}

/// Custom Expansion widget (replacement for ExpansionTile)
class CustomExpansion extends StatelessWidget {
  final String title;
  final String leadingIcon;
  final bool expanded;
  final VoidCallback onTap;
  final List<Widget> children;

  const CustomExpansion({
    Key? key,
    required this.title,
    required this.leadingIcon,
    required this.expanded,
    required this.onTap,
    required this.children,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveFlutter.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
            padding: EdgeInsets.symmetric(
              vertical: responsive.height(0.8),
              horizontal: responsive.width(3),
            ),
            child: Row(
              children: [
                Image.asset(leadingIcon,
                    width: responsive.width(5), height: responsive.width(5)),
                16.0.widthBox,
                Expanded(
                  child: FormLabel(
                    text: title,
                    labelColor: Customcolor.text_darkblue,
                    fontSize: responsive.fontSize(2.2),
                    fontweight: FontWeight.w700,
                    fontheight: 1.2,
                  ),
                ),
                Icon(
                  expanded
                      ? Icons.keyboard_arrow_up
                      : Icons.keyboard_arrow_down,
                  size: responsive.width(5),
                  color: Customcolor.text_darkblue,
                ),
              ],
            ),
          ),
        ),
        if (expanded)
          Column(
            children: children,
          ),
      ],
    );
  }
  
}

/// DrawerWidget remains same as before
class DrawerWidget extends StatelessWidget {
  final String? image;
  final String value;
  final VoidCallback? onTapfun;

  const DrawerWidget({
    Key? key,
    this.image,
    required this.value,
    this.onTapfun,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveFlutter.of(context);

    return GestureDetector(
      onTap: onTapfun,
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: responsive.height(0.5),
          horizontal: responsive.width(3),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (image != null && image!.isNotEmpty)
              Image.asset(
                image!,
                width: responsive.width(5),
                height: responsive.width(5),
              )
            else
              SizedBox(width: responsive.width(5), height: responsive.width(5)),
           16.0.widthBox,
            Expanded(
              child: FormLabel(
                text: value,
                maxLines: 3,
                textOverflow: TextOverflow.ellipsis,
                labelColor: Customcolor.text_darkblue,
                fontSize: responsive.fontSize(2),
                fontheight: 1.1,
                fontweight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
