import 'package:flutter/material.dart';
import 'package:merckfoundation_252026/Utility/ResponsiveFlutter.dart';

import 'package:merckfoundation_252026/Utils/common_strings.dart';
import 'package:merckfoundation_252026/data/model/CommonModel.dart';
import 'package:merckfoundation_252026/data/model/MockHomeData.dart';
import 'package:merckfoundation_252026/main.dart';
import 'package:merckfoundation_252026/screens/OurPrograms/MFCancerAccessProgram.dart';
import 'package:merckfoundation_252026/screens/OurPrograms/MFMoreThanMotherMovement.dart';
import 'package:merckfoundation_252026/widgets/Homewidget.dart/DynamicContent.dart';
import 'package:merckfoundation_252026/widgets/SmartHtmlWidget.dart';

import '../Utils/customcolor.dart';

class ProgramProvider extends ChangeNotifier {
  List<ProgramModel> get _programs => [
    ProgramModel(
      id: 'mmtm',
      title: CommonStrings.mmtmTitle,

      bgColor: Customcolor.prog1,
      onTap: _openMFMoreThanMotherMovement,
    ),
    ProgramModel(
      id: 'cancer',
      title: CommonStrings.cancerTitle,

      bgColor: Customcolor.prog2,
      onTap:_openMFCancerAccessProgram,
    ),
    ProgramModel(
      id: 'capacity',
      title: CommonStrings.capacityTitle,

      bgColor: Customcolor.prog3,
      onTap: () {},
    ),
    ProgramModel(
      id: 'Nationwide',
      title: CommonStrings.nationwideTitle,

      bgColor: Customcolor.prog7,
      onTap: () {},
    ),
    ProgramModel(
      id: 'FirstLadies',
      title: CommonStrings.firstLadiesTitle,

      bgColor: Customcolor.prog4,
      onTap: () {},
    ),
    ProgramModel(
      id: 'STEM',
      title: CommonStrings.stemTitle,

      bgColor: Customcolor.prog5,
      onTap: () {},
    ),
    ProgramModel(
      id: 'EducatingLinda',
      title: CommonStrings.educatingLindaTitle,

      bgColor: Customcolor.prog6,
      onTap: () {},
    ),
    ProgramModel(
      id: 'Africa',
      title: CommonStrings.africaAsiaTitle,

      bgColor: Customcolor.prog8,
      onTap: () {},
    ),
  ];

  List<ProgramModel> get programs => _programs;

  List<ProgramModel> get programsSubList => _programsSubList;

  List<ProgramModel> get _programsSubList => [
    ProgramModel(
      title: CommonStrings.aboutMtm,

      onTap: _openMFMoreThanMotherMovement,
    ),
    ProgramModel(title: CommonStrings.strategy, onTap: () {}),
    ProgramModel(title: CommonStrings.mtmAmbassadors, onTap: () {}),
    ProgramModel(title: CommonStrings.mtmScholarships, onTap: () {}),
    ProgramModel(title: CommonStrings.communityAwarenessAwards, onTap: () {}),
    ProgramModel(title: CommonStrings.empoweringBerna, onTap: () {}),
    ProgramModel(title: CommonStrings.localSongsStories, onTap: () {}),
    ProgramModel(title: CommonStrings.videos, onTap: () {}),
  ];
  final List<String> _multiSectionTypes = [
    "contents",
    "videos",
    "ceo_msg",
    "episodes",
    "gallery",
    "testimonial",
  ];

  List<HomeSectionConfig> getProgramSections() {
    return _multiSectionTypes.map((type) {
      switch (type) {
        case "contents":
          return HomeSectionConfig(
            type: HomeSectionType.content,
            customWidget: SmartHtmlWidget(
              html:
                  "<p style=\"text-align:justify; margin:0in 0in 8pt\"><span style=\"font-family:Verdana,Geneva,sans-serif;\"><span style=\"font-size:11pt\"><span style=\"line-height:107%\"><span style=\"color:#990066;\"><b><span style=\"font-size:12.0pt\"><span style=\"background:white\"><span style=\"line-height:107%\">&quot;Merck Foundation More Than a Mother&quot;</span></span></span></b></span><br />\r\n<span style=\"color:#3333ff;\"><b><span style=\"font-size:12.0pt\"><span style=\"background:white\"><span style=\"line-height:107%\">&#39;Say No to Infertility Stigma&#39;</span></span></span></b></span></span></span></span><br />\r\n&nbsp;</p>\r\n\r\n<p style=\"text-align: justify;\"><span style=\"color:#8e44ad;\"><span style=\"font-size:11.0pt;\"><span style=\"font-family:Verdana,Geneva,sans-serif;\"><strong>&quot;Merck Foundation More Than a Mother&quot;</strong></span></span></span><span style=\"color:#000000;\"><span style=\"font-size:11.0pt;\"><span style=\"font-family:Verdana,Geneva,sans-serif;\">&nbsp;</span></span></span><span style=\"color:#000000;\"><span style=\"font-size:11.0pt;\"><span style=\"font-family:Verdana,Geneva,sans-serif;\">is a strong movement that aims to empower infertile and childless women through access to information, education, health and change of mindset. <span style=\"line-height:107%\">This powerful campaign supports in defining policies and interventions to build quality and equitable Reproductive and Fertility Care Capacity, Break Infertility Stigma and Raise Awareness about Infertility Prevention and Male Infertility.</span> In partnership with African and Asian First Ladies, Ministries of Health, Information, Education &amp; Gender, Academia, Policymakers, International Fertility Societies, Media and Art, this initiative also provides training for Fertility specialists and Embryologists to build and advance Fertility care capacity in Africa, Asia and developing countries.</span></span></span></p>\r\n\r\n<p style=\"text-align: justify;\"><span style=\"color:#000000;\"><span style=\"font-size:11.0pt;\"><span style=\"font-family:Verdana,Geneva,sans-serif;\">With &quot;Merck Foundation More Than a Mother&quot;, we have initiated a cultural shift to de-stigmatize infertility at all levels. By improving awareness, training local experts in the fields of Fertility care and media, building advocacy in cooperation with African and Asian&nbsp;First Ladies and women leaders and by supporting childless women in starting their own small businesses. It&rsquo;s all about giving every woman the respect and the help she deserves to lead a fulfilling life, with or without a child.</span></span></span></p>\r\n\r\n<p style=\"margin: 0in 0in 8pt; text-align: center;\"><span style=\"font-size:20.0pt;\"><span style=\"color:#ff00ff;\"><span style=\"line-height:107%\"><span style=\"font-family:Calibri,sans-serif\"><b><i><span style=\"background:white\"><span style=\"line-height:107%\">The Ambassadors of &quot;Merck Foundation More Than a Mother&rdquo; are:</span></span></i></b></span></span></span></span></p>\r\n\r\n<p style=\"margin: 0in 0in 8pt; text-align: center;\"><img src=\"https://merck-foundation.com/merckfoundation/public/assets/plugins/ckfinder/core/connector/php/connector.php?command=Proxy&amp;type=Files&amp;currentFolder=%2F&amp;fileName=Final_MF+Ambassadors+List.png\" style=\"width: 600px; height: 508px;\" /></p>\r\n\r\n<p style=\"margin: 0in 0in 8pt;\"><span style=\"color:#2980b9;\"><span style=\"font-size:11.0pt;\"><span style=\"font-family:Verdana,Geneva,sans-serif;\"><strong>&quot;Merck Foundation More Than a Father&quot;</strong></span></span></span><span style=\"color:#000000;\"><span style=\"font-size:11.0pt;\"><span style=\"font-family:Verdana,Geneva,sans-serif;\"> is a twin campaign of &quot;Merck Foundation More Than a Mother&quot;, which focuses on Fertility being a Shared Responsibility as infertility affects both men and women equally. About 50% of the causes of infertility are due to or include male factors.</span></span></span></p>\r\n\r\n<p style=\"margin: 0in 0in 8pt; text-align: center;\"><span style=\"color:#ff00ff;\"><span style=\"font-size:11pt\"><span style=\"line-height:107%\"><span style=\"font-family:Calibri,sans-serif\"><b><i><span style=\"font-size:22.0pt\"><span style=\"background:white\"><span style=\"line-height:107%\">Impact</span></span></span></i></b></span></span></span></span></p>\r\n\r\n<p style=\"margin: 0in 0in 8pt; text-align: center;\"><img src=\"https://merck-foundation.com/merckfoundation/public/assets/plugins/ckfinder/core/connector/php/connector.php?command=Proxy&amp;type=Files&amp;currentFolder=%2F&amp;fileName=MTM%281%29.png\" style=\"width: 600px; height: 450px;\" /></p>\r\n<gdiv></gdiv><gdiv></gdiv><gdiv></gdiv><gdiv></gdiv>",
              fontSize: ResponsiveFlutter.of(
                routeGlobalKey.currentContext!,
              ).fontSize(2),
            ),
          );

        case "videos":
          return HomeSectionConfig(
            type: HomeSectionType.videos,
            title: "Our ",
            subtitle: "Videos",
            buttonText: CommonStrings.watchMore,
            onWatchMore: () {},
            items: [
              SectionItem(
                imageUrl: "https://picsum.photos/800/400?3",
                showYoutubeIcon: true,
                description:
                    "Dr. Rasha Kelej’s Speech at Merck Foundation Africa Asia Luminary 2025 Dr. Rasha Kelej’s Speech at Merck Foundation Africa Asia Luminary 2025",
              ),
              SectionItem(
                description:
                    "Dr. Rasha Kelej’s Speech at Merck Foundation Africa Asia Luminary 2025",
                imageUrl: "https://picsum.photos/800/400?3",
                showYoutubeIcon: true,
              ),
            ],
          );

        case "ceo_msg":
          return HomeSectionConfig(
            title: "Latest  ",
            subtitle: "Updates",
            type: HomeSectionType.ceoMessage,
            buttonText: CommonStrings.viewMore,
            onWatchMore: () {},
            items: [
              SectionItem(
                imageUrl: "https://picsum.photos/800/400?3",
                showYoutubeIcon: false,
                description:
                    "Dr. Rasha Kelej’s Speech at Merck Foundation Africa Asia Luminary 2025",
              ),
              SectionItem(
                description:
                    "Dr. Rasha Kelej’s Speech at Merck Foundation Africa Asia Luminary 2025",
                imageUrl: "https://picsum.photos/800/400?3",
                showYoutubeIcon: false,
              ),
            ],
          );

        case "gallery":
          return HomeSectionConfig(
            title: "Merck Foundation In  ",
            subtitle: "Media",
            type: HomeSectionType.ceoMessage,
            buttonText: CommonStrings.viewMore,
            onWatchMore: () {},
            items: [
              SectionItem(
                imageUrl: "https://picsum.photos/800/400?3",
                showYoutubeIcon: false,
                description:
                    "Dr. Rasha Kelej’s Speech at Merck Foundation Africa Asia Luminary 2025",
              ),
              SectionItem(
                description:
                    "Dr. Rasha Kelej’s Speech at Merck Foundation Africa Asia Luminary 2025",
                imageUrl: "https://picsum.photos/800/400?3",
                showYoutubeIcon: false,
              ),
            ],
          );

        case "testimonial":
          return HomeSectionConfig(
            title: "Merck Foundation  ",
            subtitle: "Alumini Testimonials",
            type: HomeSectionType.ceoMessage,
            buttonText: CommonStrings.viewMore,
            ishtmlContent: true,
            onWatchMore: () {},
            items: [
              SectionItem(
                imageUrl: "https://picsum.photos/800/400?3",
                showYoutubeIcon: false,
                htmlSubtitle:
                    "Dr. Rasha Kelej’s Speech at Merck Foundation Africa Asia Luminary 2025 Dr. Rasha Kelej’s Speech at Merck Foundation Africa Asia Luminary 2025",
                description:
                    "Dr. Rasha Kelej’s Speech at Merck Foundation Africa Asia Luminary 2025",
              ),
              SectionItem(
                htmlSubtitle:
                    "Dr. Rasha Kelej’s Speech at Merck Foundation Africa Asia Luminary 2025",
                description:
                    "Dr. Rasha Kelej’s Speech at Merck Foundation Africa Asia Luminary 2025",
                imageUrl: "https://picsum.photos/800/400?3",
                showYoutubeIcon: false,
              ),
            ],
          );

        default:
          return HomeSectionConfig(type: HomeSectionType.videos);
      }
    }).toList();
  }

  void _openMFMoreThanMotherMovement() => _push(MFMoreThanMotherMovement());
   void _openMFCancerAccessProgram() => _push(MFCancerAccessProgram());
  void _push(Widget page) {
    Navigator.push(
      routeGlobalKey.currentContext!,
      MaterialPageRoute(builder: (_) => page),
    );
  }

  List<HomeTabModel> _tabs = [];

  List<HomeTabModel> get tabs => _tabs;

  Future<void> loadProgramTabs() async {
    final response = MockProgramData.homeTabsApiResponse();

    _tabs = response.map((e) => HomeTabModel.fromJson(e)).toList();

    notifyListeners();
  }
}
