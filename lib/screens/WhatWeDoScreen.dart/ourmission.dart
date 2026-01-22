import 'package:flutter/material.dart';
import 'package:merckfoundation_252026/Utility/ResponsiveFlutter.dart';
import 'package:merckfoundation_252026/Utility/customappbar.dart';
import 'package:merckfoundation_252026/Utils/common_strings.dart';
import 'package:merckfoundation_252026/Utils/customcolor.dart';
import 'package:merckfoundation_252026/enum/commonEnum.dart';
import 'package:merckfoundation_252026/widgets/FooterFlowerImage.dart';
import 'package:merckfoundation_252026/widgets/SmartHtmlWidget.dart';
import 'package:merckfoundation_252026/widgets/botttomlink.dart';

class OurMission extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return OurMissionState();
  }
}

class OurMissionState extends State<OurMission> with TickerProviderStateMixin {
  
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
        title: CommonStrings.ourMission,
      
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
                      '<p style=\"text-align: justify;\"><span style=\"color:#8e44ad;\"><span style=\"font-size:12.0pt;\"><span style=\"font-family:Verdana,Geneva,sans-serif;\"><strong>Our Mission:&nbsp;</strong><strong>Together with its partners, Merck Foundation aims to:</strong></span></span></span></p>\r\n\r\n<ul>\r\n\t<li style=\"text-align: justify;\"><span style=\"font-size:11.0pt;\"><span style=\"font-family:Verdana,Geneva,sans-serif;\"><strong><span style=\"color:#c0392b;\">Expand professional capabilities</span>&nbsp;</strong><span style=\"color:#000000;\">in healthcare research and media.</span></span></span></li>\r\n\t<li style=\"text-align: justify;\"><span style=\"font-size:11.0pt;\"><span style=\"font-family:Verdana,Geneva,sans-serif;\"><strong><span style=\"color:#c0392b;\">Improve access</span>&nbsp;</strong><span style=\"color:#000000;\">to innovative and equitable healthcare solutions.</span></span></span></li>\r\n\t<li style=\"text-align: justify;\"><span style=\"font-size:11.0pt;\"><span style=\"font-family:Verdana,Geneva,sans-serif;\"><strong><span style=\"color:#c0392b;\">Empower women and youth</span>&nbsp;</strong><span style=\"color:#000000;\">in education with a special focus on STEM (Science, Technology, Engineering and Mathematics).</span></span></span></li>\r\n\t<li style=\"text-align: justify;\"><span style=\"font-size:11.0pt;\"><span style=\"font-family:Verdana,Geneva,sans-serif;\"><strong><span style=\"color:#c0392b;\">Build advocacy</span>&nbsp;</strong><span style=\"color:#000000;\">to address health, social and economic challenges.</span></span></span></li>\r\n\t<li style=\"text-align: justify;\"><span style=\"font-size:11.0pt;\"><span style=\"font-family:Verdana,Geneva,sans-serif;\"><strong><span style=\"color:#c0392b;\">Raise awareness</span>&nbsp;</strong><span style=\"color:#000000;\">of disease prevention and early detection through access to information, health and change of mind-set.</span></span></span></li>\r\n</ul>\r\n\r\n<p style=\"text-align: justify;\"><span style=\"font-size:11.0pt;\"><span style=\"font-family:Verdana,Geneva,sans-serif;\"><span style=\"color:#000000;\">Merck Foundation focuses on activities that will contribute towards the&nbsp;</span><span style=\"color:#c0392b;\"><strong>Sustainable Development Goals (SDGs)</strong></span>&nbsp;<span style=\"color:#000000;\">as outlined by the United Nations.</span></span></span><br />\r\n<br />\r\n<span style=\"color:#8e44ad;\"><span style=\"font-size:12.0pt;\"><span style=\"font-family:Verdana,Geneva,sans-serif;\"><strong>Our Approach:</strong></span></span></span><br />\r\n<br />\r\n<span style=\"font-size:11.0pt;\"><span style=\"font-family:Verdana,Geneva,sans-serif;\">To achieve our goals we develop and implement coherent strategies, result-oriented programs and initiatives, provide grants to support projects and help raise funds, as needed.<br />\r\n<br />\r\nThe basis of our work are long-term partnerships with local, regional and global experts and international organizations as well as Governments and academia.<br />\r\n<br />\r\n<span style=\"color:#8e44ad;\"><strong>Our Motivation:</strong></span><br />\r\n<br />\r\nOur people are motivated by not only doing well but also by doing good. For us, responsibility for communities in which we operate &ndash; locally and globally &ndash; is an integral part of who we are. We focus our activities on those areas where we can leverage our competencies to help making people&rsquo;s lives better. Because of our deep expertise in Healthcare, Life Science and Performance Materials, addressing related health challenges and advancing people&rsquo;s lives through science and technology are the cornerstone of Merck Foundation strategy.&nbsp;By creating the Merck Foundation, Merck is not only combining many of its CR activities under one roof, but also considerably expanding its scope and reach to address the health, social and economic challenges of the 21st century.</span></span></p>\r\n<gdiv></gdiv><gdiv></gdiv>',
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
