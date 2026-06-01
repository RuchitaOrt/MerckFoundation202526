import 'package:flutter/material.dart';
import 'package:merckfoundation_252026/Utility/ResponsiveFlutter.dart';
import 'package:merckfoundation_252026/Utility/sizeConfig.dart';
import 'package:merckfoundation_252026/CommonUtils/customcolor.dart';
import 'package:merckfoundation_252026/widgets/formLabel.dart';

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
                        labelColor: Customcolor.pinkColor,
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
