
import 'package:flutter/material.dart';


class FormLabel extends StatelessWidget {
  dynamic text;
  Color labelColor;
  double fontSize;
  TextAlign textAlignment;
  int? maxLines;
  FontWeight? fontweight;
  dynamic fontfamily;
  double? fontheight;
  TextOverflow? textOverflow;
  bool? softWrap;

  FormLabel(
      {Key? key,
      this.text,
      this.labelColor = Colors.white,
      this.fontSize = 15,
      this.textAlignment = TextAlign.left,
      this.fontweight,
      this.maxLines,this.textOverflow,
      this.softWrap=false,
      this.fontfamily,this.fontheight=0.0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (this.maxLines == null) {
      maxLines = 1;
    }

    return Text(
      softWrap: true,
      text,
      maxLines: 10,
      
      textAlign: textAlignment,
      overflow: textOverflow,
      
      style: TextStyle(
        color: labelColor,
        
        fontSize: fontSize,
        fontWeight: fontweight,
        height: fontheight
        //fontFamily: AppFonts.normal
      ),
    );
  }
}
