import 'package:flutter/material.dart';
import 'package:merckfoundation_252026/Utils/customcolor.dart';

class CommonPopupMenu extends StatelessWidget {
  final Color iconcolor;
  final Function(String value)? onSelected;

  const CommonPopupMenu({
    super.key,
    this.onSelected,  this.iconcolor=Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      padding: EdgeInsets.zero,

      position: PopupMenuPosition.under,

      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),

      elevation: 8,

      icon:  Icon(
        Icons.more_vert,
        color: iconcolor,
        size: 20,
      ),

      onSelected: (value) {
        onSelected?.call(value);
      },

      itemBuilder: (context) => const [

        PopupMenuItem<String>(
          value: "Share",
          child: Row(
            children: [
              Icon(
                Icons.share,
                size: 18,
                color: Customcolor.text_blue,
              ),

              SizedBox(width: 10),

              Text("Share"),
            ],
          ),
        ),

        PopupMenuItem<String>(
          value: "More Info",
          child: Row(
            children: [
              Icon(
                Icons.info_outline,
                size: 18,
                color: Customcolor.text_blue,
              ),

              SizedBox(width: 10),

              Text("More Info"),
            ],
          ),
        ),
      ],
    );
  }
}