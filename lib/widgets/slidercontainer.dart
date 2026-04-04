import 'package:flutter/material.dart';
import 'package:merckfoundation_252026/Utility/ResponsiveFlutter.dart';
import 'package:merckfoundation_252026/Utility/sizeConfig.dart';
import 'package:merckfoundation_252026/Utils/customcolor.dart';
import 'package:merckfoundation_252026/widgets/formLabel.dart';

// class SliderCard extends StatelessWidget {
//   final String cardTitle;
//   final String? cardImage;
//   final String subTitle;

//   const SliderCard({
//     Key? key,
//     required this.cardTitle,
//     this.cardImage,
//     required this.subTitle,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
   
//     final responsive = ResponsiveFlutter.of(context);

//     return Container(
     
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(responsive.width(2)),
//         image: DecorationImage(
//           image: AssetImage(cardImage!),
//           fit: BoxFit.cover,
//         ),
//       ),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.start,
//         children: [
//           Container(
//             width: double.infinity,
//             padding: EdgeInsets.symmetric(
//               vertical: responsive.height(0.5),
//               horizontal: responsive.width(3),
//             ),
//             decoration: BoxDecoration(
//               color: Colors.white.withOpacity(0.6),
            
//             ),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 FormLabel(
//                   text: cardTitle,
//                   labelColor: Customcolor.pink_col,
//                   fontSize: responsive.fontSize(2),
//                   fontweight: FontWeight.bold,
//                   maxLines: 2,
//                   textAlignment: TextAlign.center,
//                 ),
//                 SizedBox(height: responsive.height(0.5)),
//                 FormLabel(
//                   text: subTitle,
//                   labelColor: Customcolor.colorBlue,
//                   fontSize: responsive.fontSize(1.6),
//                   fontweight: FontWeight.bold,
//                   maxLines: 2,
//                   textAlignment: TextAlign.center,
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

class Slidercard extends StatelessWidget {
  final String? cardTitle;
  final String? cardImage;
  final String? subTitle;

  const Slidercard({
    Key? key,
    this.cardTitle,
    this.cardImage,
    this.subTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          image: DecorationImage(
              image: NetworkImage(cardImage!), fit: BoxFit.cover)),
      width: SizeConfig.blockSizeHorizontal * 100,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 0, bottom: 15),
            child: Container(
              color: Colors.white.withOpacity(0.5),
              width: SizeConfig.blockSizeHorizontal * 100,
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 10, right: 10, top: 5, bottom: 5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    FormLabel(
                        text: cardTitle!,
                        labelColor: Customcolor.pink_col,
                        fontSize: ResponsiveFlutter.of(context).fontSize(1.6),
                        maxLines: 2,
                        fontweight: FontWeight.bold,
                        textAlignment: TextAlign.center),
                    SizedBox(
                      height: 2,
                    ),
                    FormLabel(
                        text: subTitle!,
                        labelColor: Customcolor.colorBlue,
                        fontSize: ResponsiveFlutter.of(context).fontSize(1.4),
                        fontweight: FontWeight.bold,
                        textAlignment: TextAlign.center),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
