import 'package:flutter/material.dart';
import 'package:merckfoundation_252026/Utility/ResponsiveFlutter.dart';
import 'package:merckfoundation_252026/model/CommonModel.dart';
import 'package:merckfoundation_252026/main.dart';
import 'package:merckfoundation_252026/widgets/formLabel.dart';

class MediaContactTile extends StatelessWidget {
  final MediaContactModel data;
  final VoidCallback? onPhoneTap;
  final VoidCallback? onEmailTap;

  const MediaContactTile({
    super.key,
    required this.data,
    this.onPhoneTap,
    this.onEmailTap,
  });

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveFlutter.of(routeGlobalKey.currentContext!);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          8.0.heightBox,
          FormLabel(
            text: data.name,
            textAlignment: TextAlign.center,
            fontSize: responsive.fontSize(3),
            labelColor: Color(0xffffcb04),
            fontweight: FontWeight.w500,
          ),

          8.0.heightBox,
          if (data.phone != null)
            _iconTextRow(
              icon: Icons.call,
              text: data.phone!,
              onTap: onPhoneTap,
            ),
          if (data.email != null)
            _iconTextRow(
              icon: Icons.mail,
              text: data.email!,
              onTap: onEmailTap,
            ),
        ],
      ),
    );
  }

  Widget _iconTextRow({
    required IconData icon,
    required String text,
    VoidCallback? onTap,
  }) {
    return Padding(
      padding: const EdgeInsets.only(top: 6),
      child: GestureDetector(
        onTap: onTap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: Colors.white, size: 20),
            8.0.widthBox,
            Flexible(
              child: FormLabel(text: text, labelColor: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
