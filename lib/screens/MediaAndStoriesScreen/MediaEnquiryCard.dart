import 'package:flutter/material.dart';
import 'package:merckfoundation_252026/Utility/ResponsiveFlutter.dart';
import 'package:merckfoundation_252026/Utils/common_strings.dart';
import 'package:merckfoundation_252026/Utils/customcolor.dart';
import 'package:merckfoundation_252026/data/model/CommonModel.dart';
import 'package:merckfoundation_252026/screens/MediaAndStoriesScreen/MediaContactTile.dart';

class MediaEnquiryCard extends StatelessWidget {
  final List<MediaContactModel> contacts;

  const MediaEnquiryCard({super.key, required this.contacts});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      child: Card(
        color: Customcolor.prog1,
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 12),
                child: Text(
                  CommonStrings.mediaHeader,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                  ),
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
