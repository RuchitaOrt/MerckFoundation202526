import 'package:flutter/material.dart';
import 'package:merckfoundation_252026/Utility/ResponsiveFlutter.dart';
import 'package:merckfoundation_252026/CommonUtils/common_strings.dart';
import 'package:merckfoundation_252026/CommonUtils/customcolor.dart';
import 'package:merckfoundation_252026/model/CommonModel.dart';
import 'package:merckfoundation_252026/main.dart';
import 'package:merckfoundation_252026/screens/ContactUs/ContactTile.dart';
import 'package:merckfoundation_252026/widgets/formLabel.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactEnquiryCard extends StatelessWidget {
  final List<ContactPerson> contacts;

  const ContactEnquiryCard({super.key, required this.contacts});

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveFlutter.of(routeGlobalKey.currentContext!);
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          iconRow(Icons.mail_outline, "info@merck-foundation.com", () {}),
          8.0.heightBox,

          FormLabel(
            text: CommonStrings.mediaEnquiries,
            fontSize: responsive.fontSize(3),
            labelColor: Customcolor.violetcolor,
            fontweight: FontWeight.bold,
          ),
          8.0.heightBox,

          ...contacts.map(
            (c) => ContactTile(
              person: c,
              onCall: () => launchUrl(Uri(scheme: 'tel', path: c.phone)),
              onMail: () => launchUrl(
                Uri(
                  scheme: 'mailto',
                  path: c.email,
                  queryParameters: {'subject': 'Merck Foundation'},
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
