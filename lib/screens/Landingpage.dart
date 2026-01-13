import 'package:flutter/material.dart';
import 'package:merckfoundation_252026/Utility/ResponsiveFlutter.dart';
import 'package:merckfoundation_252026/Utils/common_images.dart';
import 'package:merckfoundation_252026/Utils/common_strings.dart';
import 'package:merckfoundation_252026/Utils/customcolor.dart';
import 'package:merckfoundation_252026/screens/dashboard.dart';
import 'package:merckfoundation_252026/widgets/formLabel.dart';

class Landingpage extends StatelessWidget {
  const Landingpage({super.key});

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveFlutter.of(context);

    return Scaffold(
      backgroundColor: Customcolor.background,
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(vertical: responsive.height(2)),
          children: [
            const _Logo(),
           16.0.heightBox,
            _VisionTitle(fontSize: responsive.fontSize(2)),
            8.0.heightBox,
            _VisionSubtitle(fontSize: responsive.fontSize(1.8)),
           16.0.heightBox,
            _VisionCard(
              height: responsive.isTablet
                  ? responsive.height(45)
                  : responsive.height(38),
            ),
             16.0.heightBox,
            _ContinueButton(width: responsive.width(60)),
          ],
        ),
      ),
    );
  }
}

class _Logo extends StatelessWidget {
  const _Logo();

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveFlutter.of(context);

    return Center(
      child: Image.asset(
        CommonImagePath.logoMenu,
        width: responsive.width(45),
        height: responsive.height(15),
        fit: BoxFit.contain,
      ),
    );
  }
}

class _VisionTitle extends StatelessWidget {
  final double fontSize;
  const _VisionTitle({required this.fontSize});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FormLabel(
        text: CommonStrings.ourVision,
        labelColor: Customcolor.colorVoilet,
        fontSize: fontSize,
        maxLines: 2,
        fontweight: FontWeight.w800,
      ),
    );
  }
}

class _VisionSubtitle extends StatelessWidget {
  final double fontSize;
  const _VisionSubtitle({required this.fontSize});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: FormLabel(
        text: CommonStrings.visionTitle,
        labelColor: Customcolor.colorPink,
        fontSize: fontSize,
        maxLines: 3,
        fontweight: FontWeight.w800,
        textAlignment: TextAlign.center,
      ),
    );
  }
}

class _VisionCard extends StatelessWidget {
  final double height;
  const _VisionCard({required this.height});

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveFlutter.of(context);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: responsive.width(4)),
      child: Container(
        height: height,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(CommonImagePath.visionPattern),
            fit: BoxFit.fill,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.fromLTRB(
            responsive.width(6),
            responsive.height(6),
            responsive.width(6),
            responsive.height(2),
          ),
          child: FormLabel(
            text: CommonStrings.visionDescription,
            labelColor: Colors.white,
            fontheight: 1.4,
            fontSize: responsive.fontSize(2),
          ),
        ),
      ),
    );
  }
}

class _ContinueButton extends StatelessWidget {
  final double width;
  const _ContinueButton({required this.width});

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveFlutter.of(context);

    return Center(
      child: SizedBox(
        width: width,
        height: responsive.height(6),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Customcolor.colorPink,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => Dashboard(index: 0)),
            );
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FormLabel(
            text: CommonStrings.continueText,
            labelColor: Colors.white,
            
            fontSize: responsive.fontSize(2),
          ),
             
            16.0.widthBox,
              const Icon(Icons.arrow_forward, color: Colors.white),
            ],
          ),
        ),
      ),
    );
  }
}
