// import 'package:flutter/material.dart';
// import 'package:merckfoundation_252026/Utility/ResponsiveFlutter.dart';
// import 'package:merckfoundation_252026/Utils/common_images.dart';
// import 'package:merckfoundation_252026/Utils/common_strings.dart';
// import 'package:merckfoundation_252026/Utils/customcolor.dart';
// import 'package:merckfoundation_252026/screens/dashboard.dart';
// import 'package:merckfoundation_252026/widgets/formLabel.dart';

// class Landingpage extends StatelessWidget {
//   const Landingpage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final responsive = ResponsiveFlutter.of(context);

//     return Scaffold(
//       backgroundColor: Customcolor.background,
//       body: SafeArea(
//         child: ListView(
//           padding: EdgeInsets.symmetric(vertical: responsive.height(2)),
//           children: [
//             const _Logo(),
//            16.0.heightBox,
//             _VisionTitle(fontSize: responsive.fontSize(2)),
//             8.0.heightBox,
//             _VisionSubtitle(fontSize: responsive.fontSize(1.8)),
//            16.0.heightBox,
//             _VisionCard(
//               height: responsive.isTablet
//                   ? responsive.height(45)
//                   : responsive.height(38),
//             ),
//              16.0.heightBox,
//             _ContinueButton(width: responsive.width(60)),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class _Logo extends StatelessWidget {
//   const _Logo();

//   @override
//   Widget build(BuildContext context) {
//     final responsive = ResponsiveFlutter.of(context);

//     return Center(
//       child: Image.asset(
//         CommonImagePath.logoMenu,
//         width: responsive.width(45),
//         height: responsive.height(15),
//         fit: BoxFit.contain,
//       ),
//     );
//   }
// }

// class _VisionTitle extends StatelessWidget {
//   final double fontSize;
//   const _VisionTitle({required this.fontSize});

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: FormLabel(
//         text: CommonStrings.ourVision,
//         labelColor: Customcolor.colorVoilet,
//         fontSize: fontSize,
//         maxLines: 2,
//         fontweight: FontWeight.w800,
//       ),
//     );
//   }
// }

// class _VisionSubtitle extends StatelessWidget {
//   final double fontSize;
//   const _VisionSubtitle({required this.fontSize});

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.symmetric(horizontal: 16),
//       child: FormLabel(
//         text: CommonStrings.visionTitle,
//         labelColor: Customcolor.colorPink,
//         fontSize: fontSize,
//         maxLines: 3,
//         fontweight: FontWeight.w800,
//         textAlignment: TextAlign.center,
//       ),
//     );
//   }
// }

// class _VisionCard extends StatelessWidget {
//   final double height;
//   const _VisionCard({required this.height});

//   @override
//   Widget build(BuildContext context) {
//     final responsive = ResponsiveFlutter.of(context);

//     return Padding(
//       padding: EdgeInsets.symmetric(horizontal: responsive.width(4)),
//       child: Container(
//         height: height,
//         decoration: const BoxDecoration(
//           image: DecorationImage(
//             image: AssetImage(CommonImagePath.visionPattern),
//             fit: BoxFit.fill,
//           ),
//         ),
//         child: Padding(
//           padding: EdgeInsets.fromLTRB(
//             responsive.width(6),
//             responsive.height(6),
//             responsive.width(6),
//             responsive.height(2),
//           ),
//           child: FormLabel(
//             text: CommonStrings.visionDescription,
//             labelColor: Colors.white,
//             fontheight: 1.4,
//             fontSize: responsive.fontSize(2),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class _ContinueButton extends StatelessWidget {
//   final double width;
//   const _ContinueButton({required this.width});

//   @override
//   Widget build(BuildContext context) {
//     final responsive = ResponsiveFlutter.of(context);

//     return Center(
//       child: SizedBox(
//         width: width,
//         height: responsive.height(6),
//         child: ElevatedButton(
//           style: ElevatedButton.styleFrom(
//             backgroundColor: Customcolor.colorPink,
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(8),
//             ),
//           ),
//           onPressed: () {
//             Navigator.pushReplacement(
//               context,
//               MaterialPageRoute(builder: (_) => Dashboard(index: 0)),
//             );
//           },
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               FormLabel(
//             text: CommonStrings.continueText,
//             labelColor: Colors.white,
            
//             fontSize: responsive.fontSize(2),
//           ),
             
//             16.0.widthBox,
//               const Icon(Icons.arrow_forward, color: Colors.white),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:merckfoundation_252026/Utility/ResponsiveFlutter.dart';
import 'package:merckfoundation_252026/Utils/common_images.dart';
import 'package:merckfoundation_252026/Utils/common_strings.dart';
import 'package:merckfoundation_252026/Utils/customcolor.dart';
import 'package:merckfoundation_252026/screens/dashboard.dart';
import 'package:merckfoundation_252026/widgets/formLabel.dart';

class Landingpage extends StatefulWidget {
  const Landingpage({super.key});

  @override
  State<Landingpage> createState() => _LandingpageState();
}

class _LandingpageState extends State<Landingpage>
    with SingleTickerProviderStateMixin {
  double opacity = 0;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 200), () {
      setState(() {
        opacity = 1;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveFlutter.of(context);
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    final isTablet = width > 600;
    final isSmallPhone = height < 700;

    return Scaffold(
      body: Container(
        // decoration: const BoxDecoration(
        //   gradient: LinearGradient(
        //     colors: [
        //       Color(0xFFFDF4FF),
        //       Color(0xFFF8F0FF),
        //     ],
        //     begin: Alignment.topCenter,
        //     end: Alignment.bottomCenter,
        //   ),
        // ),
        child: SafeArea(
          child: AnimatedOpacity(
            duration: const Duration(milliseconds: 800),
            opacity: opacity,
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: isTablet ? responsive.width(10) : responsive.width(6),
                  vertical: responsive.height(3),
                ),
                child: Column(
                  children: [
                    const _Logo(),
                    SizedBox(height: isSmallPhone ? 20 : 30),

                    _VisionTitle(
                      fontSize: isTablet
                          ? 26
                          : isSmallPhone
                              ? 16
                              : 20,
                    ),

                    SizedBox(height: isSmallPhone ? 8 : 14),

                    _VisionSubtitle(
                      fontSize: isTablet
                          ? 18
                          : isSmallPhone
                              ? 12
                              : 14,
                    ),

                    SizedBox(height: isSmallPhone ? 25 : 35),

                    _VisionCard(
                      height: isTablet
                          ? height * 0.35
                          : isSmallPhone
                              ? height * 0.30
                              : height * 0.35,
                    ),

                    SizedBox(height: isSmallPhone ? 30 : 40),

                    _ContinueButton(
                      width: isTablet ? 300 : width * 0.5,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
class _Logo extends StatelessWidget {
  const _Logo();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isTablet = width > 600;

    return Center(
      child: Hero(
        tag: "appLogo",
        child: Image.asset(
          CommonImagePath.logoMenu,
          width: isTablet ? 250 : 180,
          height: isTablet ? 120 : 90,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
class _VisionCard extends StatelessWidget {
  final double height;
  const _VisionCard({required this.height});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isTablet = width > 600;

    return Container(
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        gradient: const LinearGradient(
          colors: [
            Color(0xff532F8F),
            Color(0xff532F8F),
          ],
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Center(
          child: FormLabel(
            text: CommonStrings.visionDescription,
            labelColor: Colors.white,
            fontheight: 1.2,
            fontSize: isTablet ? 16 : 13,
            textAlignment: TextAlign.center,
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
    final isTablet = MediaQuery.of(context).size.width > 600;

    return SizedBox(
      width: width,
      height: isTablet ? 60 : 42,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          // elevation: 8,
          backgroundColor: Customcolor.violet_col,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
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
              fontSize: isTablet ? 18 : 15,
              fontweight: FontWeight.w700,
            ),
            const SizedBox(width: 10),
            const Icon(Icons.arrow_forward, color: Colors.white),
          ],
        ),
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
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: FormLabel(
          text: CommonStrings.ourVision,
          labelColor: Customcolor.colorVoilet,
          fontSize: fontSize,
          fontweight: FontWeight.w900,
          maxLines: 2,
          textAlignment: TextAlign.center,
        ),
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
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: FormLabel(
        text: CommonStrings.visionTitle,
        labelColor: Customcolor.colorPink,
        fontSize: fontSize,
        fontweight: FontWeight.w600,
        maxLines: 3,
        textAlignment: TextAlign.center,
        fontheight: 1.4,
      ),
    );
  }
}
