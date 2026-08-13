import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:merckfoundation_252026/CommonUtils/common_strings.dart';
import 'package:merckfoundation_252026/main.dart';
import 'package:merckfoundation_252026/widgets/DigitalLibraryViewer.dart';
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
        await launchUrl(fbWebUri, mode: LaunchMode.externalApplication);
      }
    } catch (e) {
      await launchUrl(fbWebUri, mode: LaunchMode.externalApplication);
    }
  }

  static Future<void> shareToFacebook(String shareUrl) async {
    final Uri url = Uri.parse(
      "https://www.facebook.com/sharer/sharer.php?u=${Uri.encodeComponent(shareUrl)}",
    );
    print("FACEBOOK");
    print(url);
    await launchUrl(url, mode: LaunchMode.externalApplication);
  }

  static Future<void> shareToTwitter(String text, String shareUrl) async {
    final Uri url = Uri.parse(
      "https://twitter.com/intent/tweet?text=${Uri.encodeComponent(text)}&url=${Uri.encodeComponent(shareUrl)}",
    );

    await launchUrl(url, mode: LaunchMode.externalApplication);
  }

  static Future<void> followuslink(String url, String msg) async {
    final Uri uri = Uri.parse(url);

    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      print('Could not launch $uri');
    }
  }

  static Future<void> launchLinkedin(String url) async {
    final Uri linkedInUri = Uri.parse(
      "https://www.linkedin.com/sharing/share-offsite/?url=${Uri.encodeComponent(url)}",
    );

    await launchUrl(linkedInUri, mode: LaunchMode.externalApplication);
  }

  static Future<void> launchWhatsappshare(String msg) async {
    final Uri uri = Uri.parse(
      "https://wa.me/?text=${Uri.encodeComponent(msg)}",
    );
    print("Whatsup");
    print(uri.toString());
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  }

  static Future<void> launchTwitter(String url) async {
    final Uri twitterAppUri = Uri.parse(
      'twitter://user?screen_name=merckfoundation',
    );

    final Uri twitterWebUri = Uri.parse(url);

    try {
      bool launched = await launchUrl(
        twitterAppUri,
        mode: LaunchMode.externalApplication,
      );

      if (!launched) {
        await launchUrl(twitterWebUri, mode: LaunchMode.externalApplication);
      }
    } catch (e) {
      await launchUrl(twitterWebUri, mode: LaunchMode.externalApplication);
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
        await launchUrl(storeUri, mode: LaunchMode.externalApplication);
      }
    } catch (e) {
      // Final fallback
      await launchUrl(storeUri, mode: LaunchMode.externalApplication);
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
        await launchUrl(instaWebUri, mode: LaunchMode.externalApplication);
      }
    } catch (e) {
      // If error → open in browser anyway
      await launchUrl(instaWebUri, mode: LaunchMode.externalApplication);
    }
  }

  static Future<void> launchURL(String url) async {
    try {
      print("CLICKED: $url");
      final uri = Uri.parse(url.startsWith('http') ? url : 'https://$url');
      if (url.contains("pdf")) {
        await Navigator.push(
          routeGlobalKey.currentContext!,
          MaterialPageRoute(builder: (_) => DigitalLibraryViewer(pdfUrl: url)),
        );
      } else {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
      }
    } catch (e) {
      debugPrint("Launch error: $e");
    }
  }
}
