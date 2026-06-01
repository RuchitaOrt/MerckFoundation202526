import 'package:flutter/material.dart';
import 'package:merckfoundation_252026/Utility/ResponsiveFlutter.dart';
import 'package:merckfoundation_252026/widgets/CommonWidget/customappbar.dart';
import 'package:merckfoundation_252026/CommonUtils/common_strings.dart';
import 'package:merckfoundation_252026/CommonUtils/customcolor.dart';
import 'package:merckfoundation_252026/model/CommonModel.dart';
import 'package:merckfoundation_252026/enum/commonEnum.dart';
import 'package:merckfoundation_252026/main.dart';

import 'package:merckfoundation_252026/screens/ContactUs/ContactEnquiryCard.dart';
import 'package:merckfoundation_252026/screens/MainScreens/HomeNewScreen.dart';
import 'package:merckfoundation_252026/widgets/FooterFlowerImage.dart';

import 'package:merckfoundation_252026/widgets/Bottomcardlink.dart';
import 'package:merckfoundation_252026/widgets/formLabel.dart';

class ContactUs extends StatelessWidget {
  ContactUs({super.key});

  final contacts = [
    ContactPerson(
      name: "Ms. Mehak Handa",
      phone: "+91 9319606669",
      email: "mehak.handa@external.merckgroup.com",
      image: "",
    ),
    ContactPerson(
      name: "Mr. Harsh Sharma",
      phone: "+91 9540932090",
      email: "harsh.sharma@external.merckgroup.com",
      image: "",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveFlutter.of(routeGlobalKey.currentContext!);
    return Scaffold(
      backgroundColor: Customcolor.background,
      appBar: CommonAppBar(
        type: AppBarType.inner,
        title: CommonStrings.contactUs,
        onSearch: () {},
       
      ),
      body: ListView(
        children: [
          16.0.heightBox,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child:
             FormLabel(
                text: CommonStrings.contactUs,
               fontSize: responsive.fontSize(3),
                labelColor:Customcolor.violetcolor,
                fontweight: FontWeight.bold,
               
              ),
            
            
          ),
          ContactEnquiryCard(contacts: contacts),
          FollowSection(title: "Follow Us"),
                  SizedBox(height: 20),
                  FollowSection(title: "Follow Senator, Dr. Rasha Kelej"),
                  SizedBox(height: 10),
          8.0.heightBox,
          const FooterFlowerImage(),
          8.0.heightBox,
          const Bottomcardlink(),
        ],
      ),
    );
  }
}
