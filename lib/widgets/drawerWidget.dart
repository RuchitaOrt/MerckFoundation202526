import 'package:flutter/material.dart';
import 'package:merckfoundation_252026/Utility/ResponsiveFlutter.dart';
import 'package:merckfoundation_252026/CommonUtils/customcolor.dart';
import 'package:merckfoundation_252026/widgets/formLabel.dart';

class DrawerWidget extends StatelessWidget {
  final String? image;
  final String value;
  final VoidCallback? onTapfun;

  const DrawerWidget({
    Key? key,
    this.image,
    required this.value,
    this.onTapfun,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveFlutter.of(context);

    return GestureDetector(
      onTap: onTapfun,
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: responsive.height(0.5), // very small padding
          horizontal: responsive.width(3),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (image != null && image!.isNotEmpty)
              Image.asset(
                image!,
                width: responsive.width(5),
                height: responsive.width(5),
              )
            else
              SizedBox(width: responsive.width(5), height: responsive.width(5)),
           16.0.widthBox,
            Expanded(
              child: FormLabel(
                text: value,
                maxLines: 3,
                textOverflow: TextOverflow.ellipsis,
                labelColor: Customcolor.textDarkBlueColor,
                fontSize: responsive.fontSize(2),
                fontheight: 1.1,
                fontweight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
