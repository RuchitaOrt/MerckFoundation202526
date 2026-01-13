import 'package:flutter/material.dart';
import 'package:merckfoundation_252026/Utility/ResponsiveFlutter.dart';
import 'package:merckfoundation_252026/Utils/customcolor.dart';
import 'package:merckfoundation_252026/widgets/formLabel.dart';

class SliderCard extends StatelessWidget {
  final String cardTitle;
  final String? cardImage;
  final String subTitle;

  const SliderCard({
    Key? key,
    required this.cardTitle,
    this.cardImage,
    required this.subTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
   
    final responsive = ResponsiveFlutter.of(context);

    return Container(
     
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(responsive.width(2)),
        image: DecorationImage(
          image: AssetImage(cardImage!),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(
              vertical: responsive.height(0.5),
              horizontal: responsive.width(3),
            ),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.6),
            
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                FormLabel(
                  text: cardTitle,
                  labelColor: Customcolor.pink_col,
                  fontSize: responsive.fontSize(2),
                  fontweight: FontWeight.bold,
                  maxLines: 2,
                  textAlignment: TextAlign.center,
                ),
                SizedBox(height: responsive.height(0.5)),
                FormLabel(
                  text: subTitle,
                  labelColor: Customcolor.colorBlue,
                  fontSize: responsive.fontSize(1.6),
                  fontweight: FontWeight.bold,
                  maxLines: 2,
                  textAlignment: TextAlign.center,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
