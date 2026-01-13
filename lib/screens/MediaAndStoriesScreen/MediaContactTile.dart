import 'package:flutter/material.dart';
import 'package:merckfoundation_252026/Utility/ResponsiveFlutter.dart';
import 'package:merckfoundation_252026/data/model/CommonModel.dart';

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
    final width = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          if (data.image != null)
            CircleAvatar(
              radius: width * 0.08,
              backgroundImage: AssetImage(data.image!),
              backgroundColor: Colors.white,
            ),
          8.0.heightBox,
          Text(
            data.name,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Color(0xffffcb04),
              fontSize: 17,
              fontFamily: "verdana",
              fontWeight: FontWeight.w500,
            ),
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
              child: Text(
                text,
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
