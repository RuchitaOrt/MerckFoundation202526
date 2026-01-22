import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:merckfoundation_252026/Utility/ResponsiveFlutter.dart';
import 'package:merckfoundation_252026/Utility/customappbar.dart';
import 'package:merckfoundation_252026/Utils/common_images.dart';
import 'package:merckfoundation_252026/Utils/common_strings.dart';
import 'package:merckfoundation_252026/Utils/customcolor.dart';
import 'package:merckfoundation_252026/data/model/CommonModel.dart';
import 'package:merckfoundation_252026/enum/commonEnum.dart';
import 'package:merckfoundation_252026/widgets/FooterFlowerImage.dart';
import 'package:merckfoundation_252026/widgets/SmartHtmlWidget.dart';
import 'package:merckfoundation_252026/widgets/botttomlink.dart';

class MessageFromLeadership extends StatefulWidget {
  const MessageFromLeadership({super.key});

  @override
  State<MessageFromLeadership> createState() => _MessageFromLeadershipState();
}

class _MessageFromLeadershipState extends State<MessageFromLeadership> {
  final CarouselSliderController _controller = CarouselSliderController();
  int _currentIndex = 0;

  final List<LeaderMessage> leaders = const [
    LeaderMessage(
      name: "Prof. Dr. Frank Stangenberg-Haverkamp",
      designationHtml:
          "<p style=\"text-align: justify;\"><span style=\"font-size:11.0pt;\"><span style=\"font-family:Verdana,Geneva,sans-serif;\">I am extremely proud to be the CEO of Merck Foundation and work together with all of you to realize our vision of a world where everyone can lead a healthy and fulfilling life.</span></span></p>\r\n\r\n<p style=\"text-align: justify;\"><span style=\"font-size:11.0pt;\"><span style=\"font-family:Verdana,Geneva,sans-serif;\">Through Merck Foundation, we will continue to execute many impactful programs and will considerably expand its scope to address the health, social and economic challenges of the 21st century.</span></span></p>\r\n\r\n<p style=\"text-align: justify;\"><span style=\"font-size:11.0pt;\"><span style=\"font-family:Verdana,Geneva,sans-serif;\">It gives me a great honor to work closely with my dear sisters, the First Ladies of Africa and Asia, who are also the Ambassadors of Merck Foundation More than a Mother&rdquo; to reshape the future and make history together.</span></span></p>\r\n\r\n<p style=\"text-align: justify;\"><span style=\"font-size:11.0pt;\"><span style=\"font-family:Verdana,Geneva,sans-serif;\">Together with our Ambassadors and Partners, we will continue our commitment towards transforming the patient care landscape, improving access to quality &amp; equitable healthcare solutions, and raising&nbsp;awareness about a wide range of critical social and health issues such as; Breaking Infertility Stigma, Supporting Girl Education, Ending FGM &amp; Child Marriage, Stopping GBV, Diabetes &amp; Hypertension Awareness in developing countries &amp; underserved communities.</span></span></p>\r\n\r\n<p style=\"text-align: justify;\"><span style=\"font-size:11.0pt;\"><span style=\"font-family:Verdana,Geneva,sans-serif;\">We will continue to focus on building healthcare and scientific research and media capacity, empowering girls, women and youth in education with a special focus on STEM</span></span></p>\r\n\r\n<p style=\"text-align: justify;\"><span style=\"font-size:11.0pt;\"><span style=\"font-family:Verdana,Geneva,sans-serif;\">At Merck Foundation, we touch people&#39;s lives and make a diffrenace every day.</span></span></p>\r\n\r\n<p style=\"text-align: justify;\">&nbsp;</p>\r\n\r\n<p style=\"text-align: justify;\">&nbsp;</p>\r\n<gdiv></gdiv><gdiv></gdiv><gdiv></gdiv><gdiv></gdiv><gdiv></gdiv><gdiv></gdiv><gdiv></gdiv><gdiv></gdiv><gdiv></gdiv><gdiv></gdiv>",
      imageUrl:
          "https://merck-foundation.com/merckfoundation/public/uploads/leaders/Prof_Dr_Mohsin_Mahomed_Sidat.png",
      messageHtml:
          "<p>We at Merck, the world’s oldest pharmaceutical and chemical company...</p>",
    ),
    LeaderMessage(
      name: "Dr. Rasha Kelej",
      designationHtml:
          "<p style=\"text-align: justify;\"><span style=\"font-size:11.0pt;\"><span style=\"font-family:Verdana,Geneva,sans-serif;\">I am extremely proud to be the CEO of Merck Foundation and work together with all of you to realize our vision of a world where everyone can lead a healthy and fulfilling life.</span></span></p>\r\n\r\n<p style=\"text-align: justify;\"><span style=\"font-size:11.0pt;\"><span style=\"font-family:Verdana,Geneva,sans-serif;\">Through Merck Foundation, we will continue to execute many impactful programs and will considerably expand its scope to address the health, social and economic challenges of the 21st century.</span></span></p>\r\n\r\n<p style=\"text-align: justify;\"><span style=\"font-size:11.0pt;\"><span style=\"font-family:Verdana,Geneva,sans-serif;\">It gives me a great honor to work closely with my dear sisters, the First Ladies of Africa and Asia, who are also the Ambassadors of Merck Foundation More than a Mother&rdquo; to reshape the future and make history together.</span></span></p>\r\n\r\n<p style=\"text-align: justify;\"><span style=\"font-size:11.0pt;\"><span style=\"font-family:Verdana,Geneva,sans-serif;\">Together with our Ambassadors and Partners, we will continue our commitment towards transforming the patient care landscape, improving access to quality &amp; equitable healthcare solutions, and raising&nbsp;awareness about a wide range of critical social and health issues such as; Breaking Infertility Stigma, Supporting Girl Education, Ending FGM &amp; Child Marriage, Stopping GBV, Diabetes &amp; Hypertension Awareness in developing countries &amp; underserved communities.</span></span></p>\r\n\r\n<p style=\"text-align: justify;\"><span style=\"font-size:11.0pt;\"><span style=\"font-family:Verdana,Geneva,sans-serif;\">We will continue to focus on building healthcare and scientific research and media capacity, empowering girls, women and youth in education with a special focus on STEM</span></span></p>\r\n\r\n<p style=\"text-align: justify;\"><span style=\"font-size:11.0pt;\"><span style=\"font-family:Verdana,Geneva,sans-serif;\">At Merck Foundation, we touch people&#39;s lives and make a diffrenace every day.</span></span></p>\r\n\r\n<p style=\"text-align: justify;\">&nbsp;</p>\r\n\r\n<p style=\"text-align: justify;\">&nbsp;</p>\r\n<gdiv></gdiv><gdiv></gdiv><gdiv></gdiv><gdiv></gdiv><gdiv></gdiv><gdiv></gdiv><gdiv></gdiv><gdiv></gdiv><gdiv></gdiv><gdiv></gdiv>",
      imageUrl:
          "https://merck-foundation.com/merckfoundation/public/uploads/leaders/Senator_Dr_Rasha_Kelej.jpg",
      messageHtml:
          "<p>I strongly believe that empowering women and youth...</p>",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Customcolor.background,
      appBar: CommonAppBar(
        type: AppBarType.inner,
        title: CommonStrings.messageFromLeadership,
     
        onSearch: () {},
        onShare: () {},
        shareLink: "",
      ),
      body: Stack(
        children: [
          /// MAIN CAROUSEL
          CarouselSlider.builder(
            itemCount: leaders.length,
            carouselController: _controller,
            options: CarouselOptions(
              viewportFraction: 1,
              enableInfiniteScroll: true,
              height: MediaQuery.of(context).size.height,
              onPageChanged: (index, _) =>
                  setState(() => _currentIndex = index),
            ),
            itemBuilder: (_, index, __) {
              return _LeaderPage(leader: leaders[index]);
            },
          ),

          /// NAVIGATION ARROWS (OVERLAY)
          Positioned(
            top: MediaQuery.of(context).size.height * 0.22,
            left: 0,
            right: 0,
            child: _navigationArrows(),
          ),
        ],
      ),
    );
  }

  Widget _navigationArrows() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed:
                _currentIndex > 0 ? () => _controller.previousPage() : null,
          ),
          IconButton(
            icon: const Icon(Icons.arrow_forward_ios),
            onPressed: () => _controller.nextPage(),
          ),
        ],
      ),
    );
  }
}

class _LeaderPage extends StatelessWidget {
  final LeaderMessage leader;
  const _LeaderPage({required this.leader});

  @override
  Widget build(BuildContext context) {
  
    final responsive = ResponsiveFlutter.of(context);
    return ListView(
     
      children: [
        /// IMAGE SECTION (NO FIXED HEIGHT)
        Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  /// LEADER IMAGE
                  Center(
                    child: AspectRatio(
                      aspectRatio: 4 / 4,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: FadeInImage.assetNetwork(
                          placeholder:CommonImagePath.placeHolder,
                          image: leader.imageUrl,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
              
                 
                ],
              ),
               8.0.heightBox,
        SmartHtmlWidget(
            html: leader.name,
            textColor: Customcolor.colorVoilet,
            fontSize: responsive.fontSize(3),
            fontWeight: FontWeight.w600),
        const Divider(height: 32),

        /// DESIGNATION HTML
        Center(
          child: SmartHtmlWidget(
            html: leader.designationHtml,
          ),
        ),

        /// MESSAGE HTML (FULL FLEXIBLE)
        SmartHtmlWidget(
          html: leader.messageHtml,
        ),

        8.0.heightBox,
            ],
          ),
        ),

       

        /// FOOTER FLOWER
        const FooterFlowerImage(),
        8.0.heightBox,

       

        Bottomcardlink(),
      ],
    );
  }
}
