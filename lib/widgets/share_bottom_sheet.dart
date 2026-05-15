import 'package:flutter/material.dart';
import 'package:merckfoundation_252026/Utility/ResponsiveFlutter.dart';
import 'package:merckfoundation_252026/Utility/showdailog.dart';
import 'package:merckfoundation_252026/Utils/customcolor.dart';
import 'package:merckfoundation_252026/const/GlobalLists.dart';
import 'package:merckfoundation_252026/screens/MainScreens/HomeNewScreen.dart';
import 'package:merckfoundation_252026/widgets/formLabel.dart';

class ShareBottomSheet {
  static void show(
    BuildContext context, {
    required String shareLink,
    String title = "Share",
    double imgHeight = 25,
  }) {
    showModalBottomSheet<void>(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 10),
                child: FormLabel(
                  text: title,
                  labelColor: Customcolor.pink_col,
                  fontSize: ResponsiveFlutter.of(context).fontSize(2.5),
                  fontweight: FontWeight.w500,
                ),
              ),

              /// SOCIAL ICONS
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    /// FACEBOOK
                    SocialIcon(
                      "assets/newImages/FB.svg",
                      iconSize: imgHeight,
                      onTap: () {
                        ShowDialogs.shareToFacebook(
                          "${GlobalLists.liveWebsiteUrl}${shareLink}",
                        );
                      },
                    ),
                    const SizedBox(width: 10),

                    /// TWITTER
                    SocialIcon(
                      "assets/newImages/twitt.svg",
                      iconSize: imgHeight,
                      onTap: () {
                        ShowDialogs.shareToTwitter(
                          "Merck Foundation",
                          "${GlobalLists.liveWebsiteUrl}${shareLink}",
                        );
                      },
                    ),

                    const SizedBox(width: 10),

                    /// LINKEDIN
                    SocialIcon(
                      "assets/newImages/linkdin.svg",
                      iconSize: imgHeight,
                      onTap: () {
                        ShowDialogs.launchLinkedin(
                          "${GlobalLists.liveWebsiteUrl}${shareLink}",
                        );
                      },
                    ),

                    const SizedBox(width: 10),

                    /// WHATSAPP
                    /// 
                    SocialIcon(
                      "assets/newImages/whatsaup.svg",
                      iconSize: imgHeight,
                      onTap: () {
                        ShowDialogs.launchWhatsappshare(
                          "${GlobalLists.liveWebsiteUrl}${shareLink}",
                        );
                      },
                    ),
                   
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
