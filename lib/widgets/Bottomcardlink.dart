import 'package:flutter/material.dart';
import 'package:merckfoundation_252026/Utility/ResponsiveFlutter.dart';

import 'package:merckfoundation_252026/CommonUtils/customcolor.dart';
import 'package:merckfoundation_252026/main.dart';
import 'package:merckfoundation_252026/widgets/formLabel.dart';

class Bottomcardlink extends StatelessWidget {
  const Bottomcardlink({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveFlutter.of(routeGlobalKey.currentContext!);
    return Container(
      padding: EdgeInsets.only(top: 10, bottom: 10),
      color: Customcolor.colorBlue,
      child:
       FormLabel(text:  "© Merck Foundation is a German Non-Profit limited liability Company, established on 31 May 2017",
          textAlignment: TextAlign.center,
          labelColor: Colors.white,fontSize: responsive.fontSize(2), ),
      
     
    );
  }
}
