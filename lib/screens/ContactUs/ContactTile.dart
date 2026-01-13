import 'package:flutter/material.dart';
import 'package:merckfoundation_252026/Utility/ResponsiveFlutter.dart';
import 'package:merckfoundation_252026/Utils/customcolor.dart';
import 'package:merckfoundation_252026/data/model/CommonModel.dart';
import 'package:merckfoundation_252026/main.dart';

class ContactTile extends StatelessWidget {
  final ContactPerson person;
  final VoidCallback onCall;
  final VoidCallback onMail;

  const ContactTile({
    super.key,
    required this.person,
    required this.onCall,
    required this.onMail,
  });

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveFlutter.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
             
              Text(
                person.name,
                style: TextStyle(
                  fontSize: responsive.fontSize(2.2),
                  fontWeight: FontWeight.w600,
                  color: Customcolor.text_darkgrey,
                ),
              ),
            ],
          ),

          8.0.heightBox,

          iconRow(Icons.call, person.phone, onCall),
          iconRow(Icons.mail_outline, person.email, onMail),
        ],
      ),
    );
  }

  
}
Widget iconRow(IconData icon, String text, VoidCallback onTap) {
     final responsive = ResponsiveFlutter.of(routeGlobalKey.currentContext!);
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: Row(
          children: [
            Icon(icon, size: 18),
           8.0.widthBox,
            Text(text, style:  TextStyle(color: Colors.black,fontSize:  responsive.fontSize(2.2),)),
          ],
        ),
      ),
    );
  }