
import 'package:flutter/material.dart';

import 'package:merckfoundation_252026/Utility/customappbar.dart';
import 'package:merckfoundation_252026/Utils/customcolor.dart';

import 'package:merckfoundation_252026/enum/commonEnum.dart';

import 'package:merckfoundation_252026/screens/MainUIBody.dart/CommonBody.dart';

class CommonContentPage extends StatefulWidget {
  static const String route = "/commonContent";

  final String? menuID;
  final String? title;
  final String? shareLink;

  const CommonContentPage({
    super.key,
    this.menuID,
    this.title,
    this.shareLink,
  });

  @override
  State<CommonContentPage> createState() => _CommonContentPageState();
}

class _CommonContentPageState extends State<CommonContentPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Customcolor.background,
      appBar: CommonAppBar(
        type: AppBarType.inner,
        title: widget.title,
        onSearch: () {},
        onShare: () {
          // use widget.shareLink here
        },
        shareLink: widget.shareLink ?? "",
      ),
      body: CommonBody(widget.menuID),
    );
  }
}
