import 'dart:io';

import 'package:flutter/material.dart';
import 'package:merckfoundation_252026/Utility/showdailog.dart';
import 'package:merckfoundation_252026/Utils/common_images.dart';
import 'package:merckfoundation_252026/Utils/common_strings.dart';
import 'package:merckfoundation_252026/data/model/CommonModel.dart';

class FollowUsProvider {
  static List<SocialIconModel> merckFoundationIcons(BuildContext context) {
    return [
      SocialIconModel(
        icon: CommonImagePath.instagram,
        onTap: () {
          Platform.isAndroid
              ? ShowDialogs.followuslink(
                  CommonStrings.followinsta,
                  CommonStrings.followmsg,
                )
              : ShowDialogs.launchInstagram(
                  CommonStrings.followinsta,
                  "merckfoundation",
                );
        },
      ),
      SocialIconModel(
        icon: CommonImagePath.facebook,
        onTap: () => ShowDialogs.launchFacebook(
          CommonStrings.followfacebook,
          "1053979038068008",
        ),
      ),
      SocialIconModel(
        icon: CommonImagePath.twitter,
        onTap: () {
          Platform.isAndroid
              ? ShowDialogs.followuslink(
                  CommonStrings.followtwitter,
                  CommonStrings.followmsg,
                )
              : ShowDialogs.launchTwitter(CommonStrings.followtwitter);
        },
      ),
      SocialIconModel(
        icon: CommonImagePath.youtube,
        onTap: () {
          Platform.isAndroid
              ? ShowDialogs.followuslink(
                  CommonStrings.followyoutube,
                  CommonStrings.followmsg,
                )
              : ShowDialogs.youtubevideolink(CommonStrings.followyoutube);
        },
      ),
      SocialIconModel(
        icon: CommonImagePath.flickr,
        onTap: () {
          Platform.isAndroid
              ? ShowDialogs.followuslink(
                  CommonStrings.followflicker,
                  CommonStrings.followmsg,
                )
              : ShowDialogs.launchURL(CommonStrings.followflicker);
        },
      ),
      SocialIconModel(
        icon: CommonImagePath.threads,
        onTap: () => ShowDialogs.openThreadsApp(CommonStrings.followthreas),
      ),
    ];
  }

  static List<SocialIconModel> rashaIcons(BuildContext context) {
    return [
      SocialIconModel(
        icon: CommonImagePath.instagram,
        onTap: () {
          Platform.isAndroid
              ? ShowDialogs.followuslink(
                  CommonStrings.followrashainsta,
                  CommonStrings.followmsg,
                )
              : ShowDialogs.launchInstagram(
                  CommonStrings.followrashainsta,
                  "merckfoundation",
                );
        },
      ),
      SocialIconModel(
        icon: CommonImagePath.facebook,
        onTap: () => ShowDialogs.launchFacebook(
          CommonStrings.followrashafacebook,
          "550280998481446",
        ),
      ),
      SocialIconModel(
        icon: CommonImagePath.twitter,
        onTap: () {
          Platform.isAndroid
              ? ShowDialogs.followuslink(
                  CommonStrings.followrashatwitter,
                  CommonStrings.followmsg,
                )
              : ShowDialogs.launchTwitter(CommonStrings.followrashatwitter);
        },
      ),
      SocialIconModel(
        icon: CommonImagePath.youtube,
        onTap: () {
          Platform.isAndroid
              ? ShowDialogs.followuslink(
                  CommonStrings.followerashayoutube,
                  CommonStrings.followmsg,
                )
              : ShowDialogs.youtubevideolink(CommonStrings.followerashayoutube);
        },
      ),
      SocialIconModel(
        icon: CommonImagePath.flickr,
        onTap: () {
          Platform.isAndroid
              ? ShowDialogs.followuslink(
                  CommonStrings.followrashaflicker,
                  CommonStrings.followmsg,
                )
              : ShowDialogs.launchURL(CommonStrings.followrashaflicker);
        },
      ),
      SocialIconModel(
        icon: CommonImagePath.threads,
        onTap: () =>
            ShowDialogs.openThreadsApp(CommonStrings.followthreasrasha),
      ),
    ];
  }


  //Merck FOundation More Than a Mother Movement on

    static List<SocialIconModel> merckFoundationMOreThanAMotherMovement(BuildContext context) {
    return [
       SocialIconModel(
        icon: CommonImagePath.facebook,
        onTap: () => ShowDialogs.launchFacebook(
          CommonStrings.followfacebook,
          "1053979038068008",
        ),
      ),
       SocialIconModel(
        icon: CommonImagePath.twitter,
        onTap: () {
          Platform.isAndroid
              ? ShowDialogs.followuslink(
                  CommonStrings.followrashatwitter,
                  CommonStrings.followmsg,
                )
              : ShowDialogs.launchTwitter(CommonStrings.followrashatwitter);
        },
      ),
      SocialIconModel(
        icon: CommonImagePath.instagram,
        onTap: () {
          Platform.isAndroid
              ? ShowDialogs.followuslink(
                  CommonStrings.followrashainsta,
                  CommonStrings.followmsg,
                )
              : ShowDialogs.launchInstagram(
                  CommonStrings.followrashainsta,
                  "merckfoundation",
                );
        },
      ),
     
     
      SocialIconModel(
        icon: CommonImagePath.youtube,
        onTap: () {
          Platform.isAndroid
              ? ShowDialogs.followuslink(
                  CommonStrings.followerashayoutube,
                  CommonStrings.followmsg,
                )
              : ShowDialogs.youtubevideolink(CommonStrings.followerashayoutube);
        },
      ),
   
    
    ];
  }
//Follow Merck Foundation Cancer Access Program on

    static List<SocialIconModel> merckFoundationCancerAccessProgram(BuildContext context) {
    return [
       SocialIconModel(
        icon: CommonImagePath.facebook,
        onTap: () => ShowDialogs.launchFacebook(
          CommonStrings.followfacebook,
          "1053979038068008",
        ),
      ),
       SocialIconModel(
        icon: CommonImagePath.twitter,
        onTap: () {
          Platform.isAndroid
              ? ShowDialogs.followuslink(
                  CommonStrings.followrashatwitter,
                  CommonStrings.followmsg,
                )
              : ShowDialogs.launchTwitter(CommonStrings.followrashatwitter);
        },
      ),
    
     
      SocialIconModel(
        icon: CommonImagePath.youtube,
        onTap: () {
          Platform.isAndroid
              ? ShowDialogs.followuslink(
                  CommonStrings.followerashayoutube,
                  CommonStrings.followmsg,
                )
              : ShowDialogs.youtubevideolink(CommonStrings.followerashayoutube);
        },
      ),
   
    
    ];
  }
}
