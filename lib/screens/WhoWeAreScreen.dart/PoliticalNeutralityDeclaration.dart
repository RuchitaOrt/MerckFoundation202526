import 'package:flutter/material.dart';

import 'package:merckfoundation_252026/Utility/ResponsiveFlutter.dart';
import 'package:merckfoundation_252026/Utility/customappbar.dart';
import 'package:merckfoundation_252026/Utils/common_strings.dart';
import 'package:merckfoundation_252026/Utils/customcolor.dart';
import 'package:merckfoundation_252026/enum/commonEnum.dart';
import 'package:merckfoundation_252026/widgets/FooterFlowerImage.dart';
import 'package:merckfoundation_252026/widgets/botttomlink.dart';
import 'package:merckfoundation_252026/widgets/SmartHtmlWidget.dart';

class PoliticalNeutralityDeclaration extends StatefulWidget {
  static const String route = "/PoliticalNeutralityDeclaration";
  const PoliticalNeutralityDeclaration({super.key});

  @override
  State<StatefulWidget> createState() {
    return PoliticalNeutralityDeclarationState();
  }
}

class PoliticalNeutralityDeclarationState extends State<PoliticalNeutralityDeclaration> with TickerProviderStateMixin {
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
        title: CommonStrings.politicalNeutrality,
        onBack: () => Navigator.pop(context),
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
                      '<p style=\"text-align: justify;\"><span style=\"font-size:11.0pt;\"><span style=\"font-family:Verdana,Geneva,sans-serif;\">Merck Foundation Declaration of Political Neutrality:&nbsp;</span></span></p>\r\n\r\n<p style=\"text-align: justify;\"><span style=\"font-size:11.0pt;\"><span style=\"font-family:Verdana,Geneva,sans-serif;\">At Merck Foundation, we are fully committed to the elevation of humanity and the support of social and health developmental initiatives. Our work is focused solely on improving the well-being and quality of life for communities in need.&nbsp;</span></span></p>\r\n\r\n<p style=\"text-align: justify;\"><span style=\"font-size:11.0pt;\"><span style=\"font-family:Verdana,Geneva,sans-serif;\">We collaborate with various partners, including governments, to achieve our humanitarian goals. However, it is important to emphasize that our foundation is completely neutral in political matters. We do not support, endorse, or participate in any political regime, election, or government activity unrelated to our mission of human development.</span></span></p>\r\n\r\n<p style=\"text-align: justify;\"><span style=\"font-size:11.0pt;\"><span style=\"font-family:Verdana,Geneva,sans-serif;\">We remain dedicated to our sole purpose and mission of serving humanity and enhancing social and health outcomes, while maintaining a strict non-political stance in all of our endeavors.</span></span></p>\r\n\r\n<p style=\"text-align: justify;\">&nbsp;</p>\r\n\r\n<p style=\"text-align: justify;\">&nbsp;</p>\r\n',
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
