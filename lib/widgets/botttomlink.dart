import 'package:flutter/material.dart';

import 'package:merckfoundation_252026/Utils/customcolor.dart';

class Bottomcardlink extends StatelessWidget {
  const Bottomcardlink({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
   
    return Container(
      padding: EdgeInsets.only(top: 10, bottom: 10),
      color: Customcolor.colorBlue,
      child: Text(
        "© Merck Foundation is a German Non-Profit limited liability Company, established on 31 May 2017",
        style: TextStyle(color: Colors.white, fontSize: 12),
        textAlign: TextAlign.center,
      ),
    );
  }
}
