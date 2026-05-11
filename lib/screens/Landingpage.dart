
// import 'package:flutter/material.dart';
// import 'package:merckfoundation_252026/Utility/ResponsiveFlutter.dart';
// import 'package:merckfoundation_252026/Utils/common_images.dart';
// import 'package:merckfoundation_252026/Utils/common_strings.dart';
// import 'package:merckfoundation_252026/Utils/customcolor.dart';

// import 'package:merckfoundation_252026/screens/dashboard.dart';
// import 'package:merckfoundation_252026/widgets/formLabel.dart';

// class Landingpage extends StatefulWidget {
//   const Landingpage({super.key});

//   @override
//   State<Landingpage> createState() => _LandingpageState();
// }

// class _LandingpageState extends State<Landingpage>
//     with SingleTickerProviderStateMixin {
//   double opacity = 0;

//   @override
//   void initState() {
//     super.initState();
//     Future.delayed(const Duration(milliseconds: 200), () {
//       setState(() {
//         opacity = 1;
//       });
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     final responsive = ResponsiveFlutter.of(context);
//     final width = MediaQuery.of(context).size.width;
//     final height = MediaQuery.of(context).size.height;

//     final isTablet = width > 600;
//     final isSmallPhone = height < 700;

//     return Scaffold(
//       body: Container(
//         // decoration: const BoxDecoration(
//         //   gradient: LinearGradient(
//         //     colors: [
//         //       Color(0xFFFDF4FF),
//         //       Color(0xFFF8F0FF),
//         //     ],
//         //     begin: Alignment.topCenter,
//         //     end: Alignment.bottomCenter,
//         //   ),
//         // ),
//         child: SafeArea(
//           child: AnimatedOpacity(
//             duration: const Duration(milliseconds: 800),
//             opacity: opacity,
//             child: SingleChildScrollView(
//               child: Padding(
//                 padding: EdgeInsets.symmetric(
//                   horizontal: isTablet ? responsive.width(10) : responsive.width(6),
//                   vertical: responsive.height(3),
//                 ),
//                 child: Column(
//                   children: [
//                     const _Logo(),
//                     SizedBox(height: isSmallPhone ? 20 : 30),

//                     _VisionTitle(
//                       fontSize: isTablet
//                           ? 26
//                           : isSmallPhone
//                               ? 16
//                               : 20,
//                     ),

//                     SizedBox(height: isSmallPhone ? 8 : 14),

//                     _VisionSubtitle(
//                       fontSize: isTablet
//                           ? 18
//                           : isSmallPhone
//                               ? 12
//                               : 14,
//                     ),

//                     SizedBox(height: isSmallPhone ? 25 : 35),

//                     _VisionCard(
//                       height: isTablet
//                           ? height * 0.35
//                           : isSmallPhone
//                               ? height * 0.30
//                               : height * 0.35,
//                     ),

//                     SizedBox(height: isSmallPhone ? 30 : 40),

//                     _ContinueButton(
//                       width: isTablet ? 300 : width * 0.5,
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
// class _Logo extends StatelessWidget {
//   const _Logo();

//   @override
//   Widget build(BuildContext context) {
//     final width = MediaQuery.of(context).size.width;
//     final isTablet = width > 600;

//     return Center(
//       child: Hero(
//         tag: "appLogo",
//         child: Image.asset(
//           CommonImagePath.logoMenu,
//           width: isTablet ? 250 : 180,
//           height: isTablet ? 120 : 90,
//           fit: BoxFit.contain,
//         ),
//       ),
//     );
//   }
// }
// class _VisionCard extends StatelessWidget {
//   final double height;
//   const _VisionCard({required this.height});

//   @override
//   Widget build(BuildContext context) {
//     final width = MediaQuery.of(context).size.width;
//     final isTablet = width > 600;

//     return Container(
//       height: height,
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(24),
//         gradient: const LinearGradient(
//           colors: [
//             Color(0xff532F8F),
//             Color(0xff532F8F),
//           ],
//         ),
//       ),
//       child: Padding(
//         padding: const EdgeInsets.all(24),
//         child: Center(
//           child: FormLabel(
//             text: CommonStrings.visionDescription,
//             labelColor: Colors.white,
//             fontheight: 1.2,
//             fontSize: isTablet ? 16 : 13,
//             textAlignment: TextAlign.center,
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
//     final isTablet = MediaQuery.of(context).size.width > 600;

//     return SizedBox(
//       width: width,
//       height: isTablet ? 60 : 42,
//       child: ElevatedButton(
//         style: ElevatedButton.styleFrom(
//           // elevation: 8,
//           backgroundColor: Customcolor.violet_col,
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(30),
//           ),
//         ),
//         onPressed: () {
//           Navigator.pushReplacement(
//             context,
//             MaterialPageRoute(builder: (_) =>
//            // MerckHomeScreen())
//               Dashboard(index: 0)),
//           );
//         },
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             FormLabel(
//               text: CommonStrings.continueText,
//               labelColor: Colors.white,
//               fontSize: isTablet ? 18 : 15,
//               fontweight: FontWeight.w700,
//             ),
//             const SizedBox(width: 10),
//             const Icon(Icons.arrow_forward, color: Colors.white),
//           ],
//         ),
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
//       child: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 16),
//         child: FormLabel(
//           text: CommonStrings.ourVision,
//           labelColor: Customcolor.colorVoilet,
//           fontSize: fontSize,
//           fontweight: FontWeight.w900,
//           maxLines: 2,
//           textAlignment: TextAlign.center,
//         ),
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
//       padding: const EdgeInsets.symmetric(horizontal: 24),
//       child: FormLabel(
//         text: CommonStrings.visionTitle,
//         labelColor: Customcolor.colorPink,
//         fontSize: fontSize,
//         fontweight: FontWeight.w600,
//         maxLines: 3,
//         textAlignment: TextAlign.center,
//         fontheight: 1.4,
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

    Future.delayed(
      const Duration(milliseconds: 200),
      () {
        if (mounted) {
          setState(() {
            opacity = 1;
          });
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveFlutter.of(context);

    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;

    final isTablet = width >= 600;
    final isSmallPhone = height < 700;

    return Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea(
        child: AnimatedOpacity(
          duration: const Duration(milliseconds: 800),
          opacity: opacity,

          child: LayoutBuilder(
            builder: (context, constraints) {
              return SingleChildScrollView(
                physics:
                    const BouncingScrollPhysics(),

                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight:
                        constraints.maxHeight,
                  ),

                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: isTablet
                          ? width * 0.08
                          : width * 0.06,
                      vertical: height * 0.025,
                    ),

                    child: Column(
                      children: [

                        /// LOGO
                        _Logo(
                          isTablet: isTablet,
                        ),

                        SizedBox(
                          height: height * 0.025,
                        ),

                        /// TITLE
                        _VisionTitle(
                          fontSize: isTablet
                              ? responsive.fontSize(
                                  3,
                                )
                              : isSmallPhone
                                  ? responsive
                                      .fontSize(
                                      2.2,
                                    )
                                  : responsive
                                      .fontSize(
                                      2.6,
                                    ),
                        ),

                        SizedBox(
                          height: height * 0.012,
                        ),

                        /// SUBTITLE
                        _VisionSubtitle(
                          fontSize: isTablet
                              ? responsive.fontSize(
                                  2,
                                )
                              : isSmallPhone
                                  ? responsive
                                      .fontSize(
                                      1.5,
                                    )
                                  : responsive
                                      .fontSize(
                                      1.8,
                                    ),
                        ),

                        SizedBox(
                          height: height * 0.035,
                        ),

                        /// CARD
                        _VisionCard(
                          height: isTablet
                              ? height * 0.32
                              : isSmallPhone
                                  ? height * 0.28
                                  : height * 0.30,
                        ),

                        SizedBox(
                          height: height * 0.05,
                        ),

                        /// BUTTON
                        _ContinueButton(
                          width: isTablet
                              ? width * 0.35
                              : width * 0.55,
                        ),

                        SizedBox(
                          height: height * 0.03,
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class _Logo extends StatelessWidget {
  final bool isTablet;

  const _Logo({
    required this.isTablet,
  });

  @override
  Widget build(BuildContext context) {
    final width =
        MediaQuery.of(context).size.width;

    return Center(
      child: Hero(
        tag: "appLogo",

        child: Image.asset(
          CommonImagePath.logoMenu,

          width: isTablet
              ? width * 0.28
              : width * 0.42,

          fit: BoxFit.contain,
        ),
      ),
    );
  }
}

class _VisionCard extends StatelessWidget {
  final double height;

  const _VisionCard({
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    final width =
        MediaQuery.of(context).size.width;

    final isTablet = width >= 600;

    return Container(
      width: double.infinity,
      constraints: BoxConstraints(
        minHeight: height,
      ),

      decoration: BoxDecoration(
        borderRadius:
            BorderRadius.circular(24),

        gradient: const LinearGradient(
          colors: [
            Color(0xff532F8F),
            Color(0xff532F8F),
          ],
        ),

        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(
              0.08,
            ),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),

      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: isTablet ? 30 : 20,
          vertical: isTablet ? 28 : 22,
        ),

        child: Center(
          child: FormLabel(
            text:
                CommonStrings.visionDescription,

            labelColor: Colors.white,

            fontheight: 1.5,

            fontSize: isTablet ? 17 : 13.5,

            textAlignment:
                TextAlign.center,
          ),
        ),
      ),
    );
  }
}

class _ContinueButton extends StatelessWidget {
  final double width;

  const _ContinueButton({
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    final widthScreen =
        MediaQuery.of(context).size.width;

    final isTablet = widthScreen >= 600;

    return SizedBox(
      width: width,

      height: isTablet ? 58 : 48,

      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 0,

          backgroundColor:
              Customcolor.violet_col,

          shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(40),
          ),
        ),

        onPressed: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (_) =>
                  Dashboard(index: 0),
            ),
          );
        },

        child: Row(
          mainAxisAlignment:
              MainAxisAlignment.center,

          children: [
            Flexible(
              child: FormLabel(
                text:
                    CommonStrings.continueText,

                labelColor: Colors.white,

                fontSize:
                    isTablet ? 18 : 15,

                fontweight:
                    FontWeight.w700,

                maxLines: 1,

                textOverflow:
                    TextOverflow.ellipsis,
              ),
            ),

            SizedBox(
              width: widthScreen * 0.02,
            ),

            const Icon(
              Icons.arrow_forward,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}

class _VisionTitle extends StatelessWidget {
  final double fontSize;

  const _VisionTitle({
    required this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.symmetric(
        horizontal: 12,
      ),

      child: FormLabel(
        text: CommonStrings.ourVision,

        labelColor:
            Customcolor.colorVoilet,

        fontSize: fontSize,

        fontweight: FontWeight.w900,

        maxLines: 2,

        textAlignment: TextAlign.center,
      ),
    );
  }
}

class _VisionSubtitle extends StatelessWidget {
  final double fontSize;

  const _VisionSubtitle({
    required this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.symmetric(
        horizontal: 18,
      ),

      child: FormLabel(
        text: CommonStrings.visionTitle,

        labelColor:
            Customcolor.colorPink,

        fontSize: fontSize,

        fontweight: FontWeight.w600,

        maxLines: 4,

        textAlignment: TextAlign.center,

        fontheight: 1.5,
      ),
    );
  }
}