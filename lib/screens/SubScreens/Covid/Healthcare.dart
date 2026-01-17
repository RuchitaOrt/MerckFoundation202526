import 'package:flutter/material.dart';
import 'package:merckfoundation_252026/Utility/ResponsiveFlutter.dart';
import 'package:merckfoundation_252026/Utility/customappbar.dart';
import 'package:merckfoundation_252026/Utility/showdailog.dart';
import 'package:merckfoundation_252026/Utils/common_images.dart';
import 'package:merckfoundation_252026/Utils/common_strings.dart';
import 'package:merckfoundation_252026/Utils/customcolor.dart';
import 'package:merckfoundation_252026/enum/commonEnum.dart';
import 'package:merckfoundation_252026/widgets/FooterFlowerImage.dart';
import 'package:merckfoundation_252026/widgets/botttomlink.dart';
import 'package:merckfoundation_252026/widgets/formLabel.dart';
class Healthcare extends StatelessWidget {
  const Healthcare({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Customcolor.background,
      appBar: CommonAppBar(
        type: AppBarType.inner,
        title: CommonStrings.healthCareText,
        onSearch: () {},
        onShare: () {},
        shareLink: "",
      ),
      body: ListView(
    
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20,right: 20,top: 20),
            child: Column(
              children: [
                HealthcareText(CommonStrings.healthCareIntro1),
                 HealthcareText(CommonStrings.healthCareIntro2),
            HealthcareText(CommonStrings.healthCareIntro3),
            HealthcareText(CommonStrings.healthCareIntro4),
            
            20.0.heightBox,
            
            FormLabel(
              text: CommonStrings.callForApplication,
              labelColor: Colors.black54,
              fontSize: ResponsiveFlutter.of(context).fontSize(2.4),
              fontweight: FontWeight.w600,
              textAlignment: TextAlign.center,
            ),
            
                    
            
            HealthcareDownloadSection(
              title: "",
              imagePath: CommonImagePath.healthCare1,
              downloadUrl:
                  "https://www.merck-foundation.com/servlet/rtaImage?eid=a2t1r000004YIDD&feoid=00Nw0000009EtWJ&refid=0EM1r000002ewVB",
            ),
            
            HealthcareDownloadSection(
              title: CommonStrings.eligibilityAcute,
              imagePath: CommonImagePath.healthCare2,
              downloadUrl:
                  "https://www.merck-foundation.com/servlet/servlet.FileDownload?file=00P1r00002ZUFcjEAH",
            ),
            
            HealthcareDownloadSection(
              title: CommonStrings.eligibilityRespiratory,
              imagePath: CommonImagePath.healthCare3,
              downloadUrl:
                  "https://www.merck-foundation.com/servlet/servlet.FileDownload?file=00P1r00002ZUPwCEAX",
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
class HealthcareText extends StatelessWidget {
  final String text;

  const HealthcareText(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: FormLabel(
        text: text,
        labelColor: Colors.black54,
        fontSize: ResponsiveFlutter.of(context).fontSize(2.3),
        fontweight: FontWeight.w500,
      ),
    );
  }
}
class HealthcareDownloadSection extends StatelessWidget {
  final String title;
  final String imagePath;
  final String downloadUrl;

  const HealthcareDownloadSection({
    super.key,
    required this.title,
    required this.imagePath,
    required this.downloadUrl,
  });

  @override
  Widget build(BuildContext context) {
    final rf = ResponsiveFlutter.of(context);

    return Column(
      children: [
        FormLabel(
          text: title,
          labelColor: Colors.black54,
          fontSize: rf.fontSize(2.3),
          fontweight: FontWeight.w500,
          textAlignment: TextAlign.center,
        ),
        8.0.heightBox,
        Image.asset(imagePath, height: rf.height(35)),
        8.0.heightBox,
        GestureDetector(
          onTap: () => ShowDialogs.launchURL(downloadUrl),
          child: FormLabel(
            text: CommonStrings.downloadHere,
            labelColor: Customcolor.colorBlue,
            fontSize: rf.fontSize(2.2),
            fontweight: FontWeight.w600,
            textAlignment: TextAlign.center,
          ),
        ),
        20.0.heightBox,
      ],
    );
  }
}
