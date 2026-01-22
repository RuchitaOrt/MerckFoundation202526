import 'package:flutter/material.dart';

import 'package:merckfoundation_252026/Utility/ResponsiveFlutter.dart';
import 'package:merckfoundation_252026/Utility/customappbar.dart';
import 'package:merckfoundation_252026/Utils/common_strings.dart';
import 'package:merckfoundation_252026/Utils/customcolor.dart';
import 'package:merckfoundation_252026/enum/commonEnum.dart';
import 'package:merckfoundation_252026/widgets/FooterFlowerImage.dart';
import 'package:merckfoundation_252026/widgets/botttomlink.dart';
import 'package:merckfoundation_252026/widgets/SmartHtmlWidget.dart';

class LegalDisclaimer extends StatefulWidget {
  static const String route = "/LegalDisclaimer";
  const LegalDisclaimer({super.key});

  @override
  State<StatefulWidget> createState() {
    return LegalDisclaimerState();
  }
}

class LegalDisclaimerState extends State<LegalDisclaimer> with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      backgroundColor: Customcolor.background,
      appBar: CommonAppBar(
        type: AppBarType.inner,
        title: CommonStrings.legalDisclaimer,

        onSearch: () {},
        onShare: () {},
        shareLink: "",
      ),
      body: ListView(
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        physics: ScrollPhysics(),
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
               
             
                SmartHtmlWidget(
                  html:
                      '<p style=\"text-align: justify;\"><span style=\"font-size:11.0pt;\"><span style=\"font-family:Verdana,Geneva,sans-serif;\"><span style=\"color:#000000;\"><b>Address:</b><br />\r\nMerck Foundation gGmbH,<br />\r\nFrankfurter Stra&szlig;e 250,<br />\r\n64293 Darmstadt<br />\r\n<b>Phone: &nbsp;&nbsp;&nbsp;</b>+49 6151 72-25375<br />\r\n<b>Fax:</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; +49 6151 72-21929<br />\r\n<b>Email:</b>&nbsp;</span><a href=\"mailto:Info@merck-foundation.com\" target=\"_top\"><span style=\"color:#3498db;\">info@merck-foundation.com</span></a><br />\r\n<br />\r\n<span style=\"color:#000000;\"><b>Details:</b><br />\r\n<b>Legal form:</b>&nbsp;non-profit limited liability company<br />\r\n<b>Commercial Register:</b>&nbsp;AG Darmstadt HRB 96678<br />\r\n<b>Registered Office:</b>&nbsp;Darmstadt<br />\r\n<b>Chief Executive Officer (Gesch&auml;ftsf&uuml;hrerin):</b>&nbsp;Dr. Rasha Kelej<br />\r\n<b>Tax Number:</b>&nbsp;007 250 42537<br />\r\n<br />\r\n<b>Competent Governmental Authority:</b>&nbsp;Regierungspr&auml;sidium Darmstadt (Germany).<br />\r\n<br />\r\nThis imprint is also valid for the Social Media platforms of the Merck Foundation gGmbH, e.g. for the site&nbsp;</span><a href=\"https://www.facebook.com/merckfoundation\" target=\"_blank\"><span style=\"color:#3498db;\">https://www.facebook.com/merckfoundation</span></a><br />\r\n<br />\r\n<span style=\"color:#000000;\">You may also have a look at our privacy statement to see that we take data protection and confidentiality very seriously and, on our site, do not make further use of your social media contributions.<br />\r\n<br />\r\nThe Merck Foundation is the philanthropic arm of Merck KGaA Germany, an independent non-profit organization that exclusively and directly serves charitable purposes. Given its status as a charitable institution Merck Foundation does not engage in any corporate activity of Merck KGaA. Therefore, its activities will not be listed in Merck&rsquo;s Corporate Responsibility report or corresponding reports. Merck Foundation will issue its own reports and manage their programs independently.</span></span></span></p>\r\n<gdiv></gdiv><gdiv></gdiv>',
                ),
              ],
            ),
          ),
          const FooterFlowerImage(),
          8.0.heightBox,
          Bottomcardlink(),
        ],
      ),
    );
  }
}
