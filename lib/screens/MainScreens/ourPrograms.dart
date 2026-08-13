import 'package:flutter/material.dart';

import 'package:merckfoundation_252026/widgets/CommonWidget/customappbar.dart';

import 'package:merckfoundation_252026/CommonUtils/customcolor.dart';
import 'package:merckfoundation_252026/enum/commonEnum.dart';
import 'package:merckfoundation_252026/screens/MainUIBody.dart/CommonBody.dart';

class OurProgramScreen extends StatelessWidget {
  final String menuID;
  final String title;

  final String? shareLink;
  const OurProgramScreen({
    super.key,
    required this.menuID,
    required this.title,
    this.shareLink,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Customcolor.background,
      appBar: CommonAppBar(
        type: AppBarType.inner,
        title: title,
        shareLink: shareLink,
        onSearch: () {},
      ),
      body: CommonBody(menuID),
    );
  }
}
