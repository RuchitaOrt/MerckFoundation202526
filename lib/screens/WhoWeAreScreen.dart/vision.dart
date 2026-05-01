
import 'package:flutter/material.dart';

import 'package:merckfoundation_252026/Utility/customappbar.dart';
import 'package:merckfoundation_252026/Utils/common_strings.dart';
import 'package:merckfoundation_252026/Utils/customcolor.dart';

import 'package:merckfoundation_252026/enum/commonEnum.dart';

import 'package:merckfoundation_252026/screens/MainUIBody.dart/CommonBody.dart';


class OurVision extends StatefulWidget {
  static const String route = "/ourvisiion";
  String? menuID;
  String? title;
   OurVision({super.key,this.menuID,this.title});

  @override
  State<StatefulWidget> createState() {
    return OurVisionState();
  }
}

class OurVisionState extends State<OurVision> with TickerProviderStateMixin {

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      backgroundColor: Customcolor.background,
      appBar: CommonAppBar(
        type: AppBarType.inner,
        title: widget.title,
       
        onSearch: () {},
        onShare: () {},
        shareLink: "",
      ),
        body:  CommonBody(widget.menuID),
     
    );
  }

  
}
