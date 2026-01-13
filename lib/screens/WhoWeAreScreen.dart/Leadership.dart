import 'package:flutter/material.dart';
import 'package:merckfoundation_252026/Utility/ResponsiveFlutter.dart';
import 'package:merckfoundation_252026/Utility/customappbar.dart';
import 'package:merckfoundation_252026/Utils/common_strings.dart';
import 'package:merckfoundation_252026/Utils/customcolor.dart';
import 'package:merckfoundation_252026/data/model/CommonModel.dart';
import 'package:merckfoundation_252026/enum/commonEnum.dart';
import 'package:merckfoundation_252026/widgets/FooterFlowerImage.dart';
import 'package:merckfoundation_252026/widgets/SmartHtmlWidget.dart';
import 'package:merckfoundation_252026/widgets/botttomlink.dart';
import 'package:merckfoundation_252026/widgets/formLabel.dart';
class Leadership extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveFlutter.of(context);

    return Scaffold(
      backgroundColor: Customcolor.background,
      appBar: CommonAppBar(
        type: AppBarType.inner,
        title: CommonStrings.leadership,
        onBack: () => Navigator.pop(context),
        onSearch: () {},
        onShare: () {},
        shareLink: "",
      ),
      body: ListView(
        children: [
          LeaderCard(leader: ceoLeader),

          Padding(
            padding: const EdgeInsets.only(left: 10, top: 12),
            child: FormLabel(
              text:CommonStrings.boardOfTrust,
              labelColor: Customcolor.pink_col,
              fontSize: responsive.fontSize(2.5),
              fontweight: FontWeight.w800,
            ),
          ),

          ListView.builder(
            itemCount: trustees.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (_, index) {
              return LeaderCard(leader: trustees[index]);
            },
          ),

          const FooterFlowerImage(),
          8.0.heightBox,
          Bottomcardlink(),
        ],
      ),
    );
  }
}
class LeaderCard extends StatelessWidget {
  final LeaderModel leader;

  const LeaderCard({super.key, required this.leader});

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveFlutter.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          AspectRatio(
            aspectRatio: 4 / 4,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                leader.imageUrl,
                fit: BoxFit.contain,
                loadingBuilder: (c, w, l) =>
                    l == null ? w : const Center(child: CircularProgressIndicator()),
                errorBuilder: (_, __, ___) =>
                    const Icon(Icons.person, size: 80),
              ),
            ),
          ),
        8.0.heightBox,

          SmartHtmlWidget(
            html: leader.name,
            textColor: Customcolor.colorVoilet,
            fontSize: responsive.fontSize(3),
            fontWeight: FontWeight.w600,
          ),

          8.0.heightBox,

          SmartHtmlWidget(html: leader.designationHtml),

          8.0.heightBox,

          SmartHtmlWidget(
            html: leader.bioHtml,
            textColor: Customcolor.pink_col,
            fontSize: responsive.fontSize(2.5),
            fontWeight: FontWeight.w600,
          ),
        ],
      ),
    );
  }
}
final LeaderModel ceoLeader = LeaderModel(
  imageUrl:
      "https://merck-foundation.com/merckfoundation/public/uploads/leaders/Senator_Dr_Rasha_Kelej.jpg",
  name: "Senator, Dr. Rasha Kelej (Ret.)",
  designationHtml: '''<p style=\"margin: 0in 0in 10pt;\"><span style=\"font-size:11.0pt;\"><span style=\"font-family:Verdana,Geneva,sans-serif;\"><span style=\"\"><b><span style=\"color:#000000;\"><span lang=\"EN-GB\"><span style=\"\">Chief Executive Officer - CEO of Merck Foundation</span></span></span></b></span></span></span><br />\r\n<span style=\"font-size:11.0pt;\"><span style=\"font-family:Verdana,Geneva,sans-serif;\"><span style=\"\"><b><span lang=\"EN-US\"><span style=\"\">Member of the Egyptian Senate (2020- 2025)</span></span></b></span><br />\r\n<span style=\"\"><b><span style=\"\"><span style=\"color:#0070c0\">One of the 100 Most Influential African Women&nbsp;<br />\r\n(2019, 2020,&nbsp;2021, 2022,&nbsp;2023, 2024 &amp; 2025)</span><br />\r\n<span style=\"color:black\">President of &ldquo;More Than a Mother&rdquo; Campaign<br />\r\nPresident of Merck Foundation First Ladies Initiative - MFFLI</span></span></b></span></span></span><br />\r\n<span style=\"font-size:11.0pt;\"><span style=\"font-family:Verdana,Geneva,sans-serif;\"><strong>Follow on:&nbsp;<a href=\"https://www.facebook.com/KelejRasha/\"><img alt=\"\" src=\"https://merck-foundation.com/merckfoundation/public/assets/plugins/ckfinder/core/connector/php/connector.php?command=Proxy&amp;type=Files&amp;currentFolder=%2F&amp;fileName=facebook.png\" style=\"\" /></a>&nbsp;<a href=\"https://www.instagram.com/rasha_kelej/\"><img alt=\"\" src=\"https://merck-foundation.com/public/img/icons/instagram.png\" style=\"\" /></a>&nbsp;<a href=\"https://www.youtube.com/channel/UCO_bN_T_NodcOYwcPjknaog\"><img alt=\"\" src=\"https://merck-foundation.com/public/img/icons/youtube.png\" style=\"\" /></a>&nbsp;<a href=\"https://twitter.com/Rashakelej\"><img alt=\"\" src=\"https://merck-foundation.com/public/img/icons/twitter.png\" style=\"\" /></a>&nbsp;<a href=\"https://www.flickr.com/photos/rashakelej/\"><img alt=\"\" src=\"https://merck-foundation.com/public/img/icons/flickr.png\" style=\"\" /></a>&nbsp;<a href=\"https://www.threads.net/@rasha_kelej\"><img alt=\"\" src=\"https://merck-foundation.com/public/img/icons/threads.png\" style=\"\" /></a></strong></span></span></p>\r\n<gdiv></gdiv><gdiv></gdiv><gdiv></gdiv><gdiv></gdiv><gdiv></gdiv><gdiv></gdiv>''',
  bioHtml: "((View Bio))",
);

final List<LeaderModel> trustees = [
  LeaderModel(
    imageUrl:
        "https://merck-foundation.com/merckfoundation/public/uploads/leaders/Prof_Dr_Mohsin_Mahomed_Sidat.png",
    name: "Prof. Dr. Mohsin Mahomed Sidat",
    designationHtml:
        "<p><span style=\"font-size:11.0pt;\"><span style=\"font-family:Verdana,Geneva,sans-serif;\"><strong>Chairman of Merck Foundation Board of Trustees &amp;<br />\r\nFormer Chairman of Executive Board of E. Merck KG</strong></span></span></p>",
    bioHtml: "((View Bio))",
  ),
   LeaderModel(
    imageUrl:
        "https://merck-foundation.com/merckfoundation/public/uploads/leaders/Prof_Dr_Mohsin_Mahomed_Sidat.png",
    name: "Prof. Dr. Mohsin Mahomed Sidat",
    designationHtml:
        "<p><span style=\"font-size:11.0pt;\"><span style=\"font-family:Verdana,Geneva,sans-serif;\"><strong>Chairman of Merck Foundation Board of Trustees &amp;<br />\r\nFormer Chairman of Executive Board of E. Merck KG</strong></span></span></p>",
    bioHtml: "((View Bio))",
  ),
];
