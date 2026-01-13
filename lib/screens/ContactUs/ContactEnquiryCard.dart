import 'package:flutter/material.dart';
import 'package:merckfoundation_252026/Utility/ResponsiveFlutter.dart';
import 'package:merckfoundation_252026/Utils/common_strings.dart';
import 'package:merckfoundation_252026/Utils/customcolor.dart';
import 'package:merckfoundation_252026/data/model/CommonModel.dart';
import 'package:merckfoundation_252026/main.dart';
import 'package:merckfoundation_252026/screens/ContactUs/ContactTile.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactEnquiryCard extends StatelessWidget {
  final List<ContactPerson> contacts;

  const ContactEnquiryCard({super.key, required this.contacts});

  @override
  Widget build(BuildContext context) {
     final responsive = ResponsiveFlutter.of(routeGlobalKey.currentContext!);
    return Padding(
      padding: const EdgeInsets.only(left: 16,right: 16,top: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           iconRow(Icons.mail_outline, "info@merck-foundation.com", ()
     {
      
     }),
     8.0.heightBox,
          Text(
            CommonStrings.mediaEnquiries,
            style:  TextStyle(
              fontSize:  responsive.fontSize(3),
              color: Customcolor.violet_col,
              fontWeight: FontWeight.bold,
            ),
          ),
    
          8.0.heightBox,
    
          ...contacts.map(
            (c) => ContactTile(
              person: c,
              onCall: () => launchUrl(Uri(scheme: 'tel', path: c.phone)),
              onMail: () => launchUrl(Uri(
                scheme: 'mailto',
                path: c.email,
                queryParameters: {'subject': 'Merck Foundation'},
              )),
            ),
          ),
        ],
      ),
    );
  }
}
