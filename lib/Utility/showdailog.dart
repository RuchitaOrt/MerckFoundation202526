import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:merckfoundation_252026/Utility/sizeConfig.dart';
import 'package:merckfoundation_252026/Utils/common_strings.dart';
import 'package:merckfoundation_252026/Utils/customcolor.dart';
import 'package:merckfoundation_252026/widgets/formLabel.dart';
import 'package:url_launcher/url_launcher.dart';
  void showToast(String message) {
    Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.BOTTOM,
    backgroundColor: Colors.black.withOpacity(0.7),
    textColor: Colors.white,
    fontSize: 12.0,
  );
  }
class ShowDialogs {
  ShowDialogs._();

  /// Responsive confirm dialog
  static Future<bool> showConfirmDialog(
      BuildContext context, String dialogTitle, String dialogMessage) async {
    SizeConfig().init(context);

    final double titleFont =
        SizeConfig.blockSizeVertical * 2.5; // responsive title
    final double messageFont =
        SizeConfig.blockSizeVertical * 2; // responsive message
    final double buttonFont = SizeConfig.blockSizeVertical * 2;

    bool yesNo = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(SizeConfig.blockSizeVertical * 2),
          ),
          contentPadding: EdgeInsets.zero,
          titlePadding: EdgeInsets.zero,
          title: Container(
            padding: EdgeInsets.symmetric(
                vertical: SizeConfig.blockSizeVertical,
                horizontal: SizeConfig.blockSizeHorizontal * 2),
            decoration: BoxDecoration(
              color: Customcolor.colorBlue,
              borderRadius:
                  BorderRadius.circular(SizeConfig.blockSizeVertical * 2),
            ),
            child: Center(
              child: FormLabel(
                text: dialogTitle,
                textAlignment: TextAlign.center,
                labelColor: Colors.white,
                fontweight: FontWeight.w600,
                fontSize: titleFont,
              ),
            ),
          ),
          content: Container(
            padding: EdgeInsets.symmetric(
                vertical: SizeConfig.blockSizeVertical,
                horizontal: SizeConfig.blockSizeHorizontal * 3),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius:
                  BorderRadius.circular(SizeConfig.blockSizeVertical * 2),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                 FormLabel(
                              text:  dialogMessage,
                              textAlignment:  TextAlign.center,
                              labelColor:  Customcolor.colorBlue,
                              fontSize: messageFont,
                              
                            )
                ,
                SizedBox(height: SizeConfig.blockSizeVertical * 3),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: SizeConfig.blockSizeVertical * 5,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    SizeConfig.blockSizeVertical),
                                side: BorderSide(color: Customcolor.colorBlue),
                              ),
                            ),
                            onPressed: () => Navigator.of(context).pop(false),
                            child: FormLabel(
                              text: 'Stay',
                              labelColor: Customcolor.colorBlue,
                              fontSize: buttonFont,
                              fontweight: FontWeight.w500,
                            )),
                      ),
                    ),
                    SizedBox(width: SizeConfig.blockSizeHorizontal * 4),
                    Expanded(
                      child: SizedBox(
                        height: SizeConfig.blockSizeVertical * 5,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Customcolor.colorBlue,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  SizeConfig.blockSizeVertical),
                            ),
                          ),
                          onPressed: () => SystemNavigator.pop(),
                          child:
                          FormLabel(
                              text:  'Yes, Quit',
                              labelColor: Colors.white,
                              fontSize: buttonFont,
                              fontweight: FontWeight.w500,
                            )
                          
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );

    return yesNo;
  }

  static Future<void> launchFacebook(String url, String pageId) async {
    final Uri fbAppUri = Platform.isIOS
        ? Uri.parse("fb://profile/$pageId")
        : Uri.parse("fb://page/$pageId");

    final Uri fbWebUri = Uri.parse(url);

    try {
      bool launched = await launchUrl(
        fbAppUri,
        mode: LaunchMode.externalApplication,
      );

      if (!launched) {
        await launchUrl(
          fbWebUri,
          mode: LaunchMode.externalApplication,
        );
      }
    } catch (e) {
      await launchUrl(
        fbWebUri,
        mode: LaunchMode.externalApplication,
      );
    }
  }

  static Future<void> shareToFacebook(String shareUrl) async {
    final Uri url =
        Uri.parse("https://www.facebook.com/sharer/sharer.php?u=$shareUrl");

    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      print('Could not launch Facebook share');
    }
  }

  static Future<void> shareToTwitter(String text, String shareUrl) async {
    final String tweetText = Uri.encodeComponent(text);
    final String tweetUrl = Uri.encodeComponent(shareUrl);

    final Uri url = Uri.parse(
        "https://twitter.com/intent/tweet?text=$tweetText&url=$tweetUrl");

    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      print('Could not launch Twitter share');
    }
  }

  static Future<void> followuslink(String url, String msg) async {
    final Uri uri = Uri.parse(url);

    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      print('Could not launch $uri');
    }
  }

  static Future<void> launchTwitter(String url) async {
    final Uri twitterAppUri =
        Uri.parse('twitter://user?screen_name=merckfoundation');

    final Uri twitterWebUri = Uri.parse(url);

    try {
      bool launched = await launchUrl(
        twitterAppUri,
        mode: LaunchMode.externalApplication,
      );

      if (!launched) {
        await launchUrl(
          twitterWebUri,
          mode: LaunchMode.externalApplication,
        );
      }
    } catch (e) {
      await launchUrl(
        twitterWebUri,
        mode: LaunchMode.externalApplication,
      );
    }
  }

  static Future<void> youtubevideolink(String videourl) async {
    final Uri uri = Uri.parse(videourl);

    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      print('Could not launch $uri');
    }
  }

  static Future<void> openThreadsApp(String url) async {
    final Uri appUri = Uri.parse(CommonStrings.threadsUrlScheme); // threads://
    final Uri storeUri = Uri.parse(url); // App Store / Play Store URL

    try {
      // Try opening the Threads app
      bool launched = await launchUrl(
        appUri,
        mode: LaunchMode.externalApplication,
      );

      if (!launched) {
        // Fallback → open store
        await launchUrl(
          storeUri,
          mode: LaunchMode.externalApplication,
        );
      }
    } catch (e) {
      // Final fallback
      await launchUrl(
        storeUri,
        mode: LaunchMode.externalApplication,
      );
    }
  }

  static Future<void> launchInstagram(String url, String username) async {
    final Uri instaAppUri = Uri.parse('instagram://user?username=$username');
    final Uri instaWebUri = Uri.parse(url);

    // Try opening Instagram app
    try {
      bool launched = await launchUrl(
        instaAppUri,
        mode: LaunchMode.externalApplication,
      );

      if (!launched) {
        // Fallback → open browser
        await launchUrl(
          instaWebUri,
          mode: LaunchMode.externalApplication,
        );
      }
    } catch (e) {
      // If error → open in browser anyway
      await launchUrl(
        instaWebUri,
        mode: LaunchMode.externalApplication,
      );
    }
  }

 

 static  Future<void> launchURL(String url) async {
  try {
     print("CLICKED: $url");
    final uri = Uri.parse(
      url.startsWith('http') ? url : 'https://$url',
    );

    await launchUrl(
      uri,
      mode: LaunchMode.externalApplication,
    );
  } catch (e) {
    debugPrint("Launch error: $e");
  }
}
}
