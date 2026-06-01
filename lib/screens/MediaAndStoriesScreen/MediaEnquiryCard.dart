import 'package:flutter/material.dart';
import 'package:merckfoundation_252026/Utility/ResponsiveFlutter.dart';
import 'package:merckfoundation_252026/CommonUtils/common_strings.dart';
import 'package:merckfoundation_252026/CommonUtils/customcolor.dart';
import 'package:merckfoundation_252026/model/CommonModel.dart';
import 'package:merckfoundation_252026/main.dart';
import 'package:merckfoundation_252026/screens/MediaAndStoriesScreen/MediaContactTile.dart';
import 'package:merckfoundation_252026/widgets/formLabel.dart';

class MediaEnquiryCard extends StatelessWidget {
  final List<MediaContactModel> contacts;

  const MediaEnquiryCard({super.key, required this.contacts});

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveFlutter.of(routeGlobalKey.currentContext!);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      child: Card(
        color: Customcolor.darkProgramBlueColor,
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Column(
            children: [
               Padding(
                padding: EdgeInsets.symmetric(horizontal: 12),
                child: 
                
                   FormLabel(
            text:  CommonStrings.mediaHeader,
            textAlignment: TextAlign.center,
            fontSize: responsive.fontSize(3),
            labelColor: Colors.white,
            fontweight: FontWeight.w500,
          ),
                
             
              ),
              8.0.heightBox,
              ...contacts.map(
                (contact) => MediaContactTile(
                  data: contact,
                  onPhoneTap: () {
                    // launch call
                  },
                  onEmailTap: () {
                    // launch email
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
