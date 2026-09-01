import 'dart:async';
import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:merckfoundation_252026/Provider/SocialProvider.dart';
import 'package:merckfoundation_252026/Provider/navbar_provider.dart';
import 'package:merckfoundation_252026/const/GlobalLists.dart';
import 'package:merckfoundation_252026/main.dart';
import 'package:merckfoundation_252026/screens/DetailsScreen/DetailScreen.dart';

import 'package:merckfoundation_252026/screens/MainScreens/Landingpage.dart';
import 'package:merckfoundation_252026/service/SpashService.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
// import 'package:package_info/package_info.dart';
class SplashProvider with ChangeNotifier {
 final SplashService _service = SplashService();


  bool isLoading = true;
  String? appVersion;
  String? serverVersion;
  String? iosVersion;
  String? deviceId;

  Future<void> getAppVersion(BuildContext context) async {
  final response = await _service.getAppVersion(context);

  if (response != null) {
    serverVersion = response.data?.androidVersion;
    iosVersion = response.data?.iosVersion;
    print("Android: ${serverVersion}");

    debugPrint(serverVersion);
    debugPrint(iosVersion);
  }
}

Future<void> saveDeviceToken(
  BuildContext context,
  String token,
) async {
  final response = await _service.saveDeviceToken(
    context,
    deviceId: deviceId ?? "",
    fcmToken: token,
  );

  if (response != null) {
    debugPrint(response.response?.msg);
  }
}

  

bool isUpdateRequired(String current, String server) {
  List<int> currentParts =
      current.split('.').map((e) => int.tryParse(e) ?? 0).toList();

  List<int> serverParts =
      server.split('.').map((e) => int.tryParse(e) ?? 0).toList();

  int length =
      currentParts.length > serverParts.length
          ? currentParts.length
          : serverParts.length;

  while (currentParts.length < length) {
    currentParts.add(0);
  }

  while (serverParts.length < length) {
    serverParts.add(0);
  }

  for (int i = 0; i < length; i++) {
    if (serverParts[i] > currentParts[i]) {
      return true;
    }

    if (serverParts[i] < currentParts[i]) {
      return false;
    }
  }

  return false;
}


Future<void> showForceUpdateDialog(BuildContext context) async {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (_) {
      return PopScope(
        canPop: false,
        child: AlertDialog(
          title: const Text("Update Required"),
          content: const Text(
            "A newer version of the app is available. Please update the app to continue.",
          ),
          actions: [
           

            ElevatedButton(
              onPressed: () async {
                final String url =
                    Platform.isAndroid
                        ? "https://play.google.com/store/apps/details?id=de.merck.foundation"
                        : "https://apps.apple.com/app/de.merck.foundation";

                final uri = Uri.parse(url);

                if (await canLaunchUrl(uri)) {
                  await launchUrl(
                    uri,
                    mode: LaunchMode.externalApplication,
                  );
                }
              },
              child: const Text("Update"),
            ),
          ],
        ),
      );
    },
  );
}
Future<void> init(
  BuildContext context,
) async {

  isLoading = true;

  notifyListeners();
print("Notification flag = ${GlobalLists.launchedFromNotification}");
print("_getDeviceId init");
  await _getDeviceId();
await getCurrentVersion();
await getAppVersion(context);
String latestVersion =
    Platform.isAndroid
        ? (serverVersion ?? "")
        : (iosVersion ?? "");
        print("appVersion");
print(appVersion);
print(latestVersion);
if (isUpdateRequired(appVersion!, latestVersion)) {
  await showForceUpdateDialog(context);
  return;
}
// String? token;
// try {
//   token = await FirebaseMessaging.instance.getToken();

//   debugPrint("FCM Token : $token");

//   if (token != null && token.isNotEmpty) {
//     await saveDeviceToken(context, token);
//   }
// } catch (e, s) {
//   debugPrint("FCM Error : $e");
//   debugPrint("$s");
// }
  await Provider.of<NavbarProvider>(
    context,
    listen: false,
  ).getNavbar(context);
 await Provider.of<SocialProvider>(
    context,
    listen: false,
  ).getSocialMediaDrawer(context);

  final navbarProvider =
      Provider.of<NavbarProvider>(
    context,
    listen: false,
  );

  isLoading = false;

  notifyListeners();

  /// DEFAULT VALUES
  String menuId = "1";

  String menuUrl = "";
  String menuLogo="";
  if (navbarProvider
      .menuList.isNotEmpty) {

    menuId = navbarProvider
        .menuList.first.id
        .toString();
 menuLogo = navbarProvider
        .menuList.first.mobileLogo
        .toString();
    menuUrl = navbarProvider
        .menuList.first.menuUrl!;
  }

  _handleNavigation(
    context,
    menuId,
    menuUrl,
    menuLogo

  );

}
Future<void> getCurrentVersion() async {
  PackageInfo packageInfo = await PackageInfo.fromPlatform();

  appVersion = packageInfo.version;

  debugPrint("Installed Version : $appVersion");
}
  Future<void> _getDeviceId() async {
    print("_getDeviceId");
    final deviceInfo = DeviceInfoPlugin();

    if (Platform.isAndroid) {
      final android = await deviceInfo.androidInfo;
      deviceId = android.id;
    } else if (Platform.isIOS) {
      final ios = await deviceInfo.iosInfo;
      deviceId = ios.identifierForVendor;
    }

    GlobalLists.deviceid = deviceId ?? "";
      print("_getDeviceId ${GlobalLists.deviceid }");

  }

Future<void> _handleNavigation(
  BuildContext context,
  String menuId,
  String shareLink,
  String mennuLogo

) async {
  // Timer(const Duration(seconds: 2), () {
  //   onDoneLoading(context, menuId,shareLink,mennuLogo);
  // });
  await Future.delayed(const Duration(seconds: 2));

print("Notification flag = ${GlobalLists.launchedFromNotification}");
print("Notification data = ${GlobalLists.notificationData}");
    onDoneLoading(context, menuId,shareLink,mennuLogo);

}
Future<void> onDoneLoading(
  BuildContext context,
  String menuId,
  String shareLink,
  String menuLogo,
) async {

  if (GlobalLists.launchedFromNotification &&
      GlobalLists.notificationData != null) {

    GlobalLists.launchedFromNotification = false;

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => DetailScreen(
          "",
          "",
          title: GlobalLists.notificationData!["title"] ?? "",
          articleId: GlobalLists.notificationData!["article_id"] ?? "",
          languageId: GlobalLists.notificationData!["language_id"] ?? "",
          isDetailApiCalled: true,
          isComingFromNotication: true,
        ),
      ),
    );

    return;
  }

  Navigator.pushReplacement(
    context,
    MaterialPageRoute(
      builder: (_) => Landingpage(
        menuId: menuId,
        shareLink: shareLink,
        mennuLogo: menuLogo,
      ),
    ),
  );
}
// Future<void> onDoneLoading(
//   BuildContext context,
//   String menuId,
//   String shareLink,
//    String mennuLogo
// ) async {
//   if (GlobalLists.launchedFromNotification &&
//     GlobalLists.notificationData != null) {

//   Navigator.pushReplacement(
//     context,
//     MaterialPageRoute(
//       builder: (_) => DetailScreen(
//         "",
//         "",
//         title: GlobalLists.notificationData!["title"] ?? "",
//         articleId: GlobalLists.notificationData!["article_id"] ?? "",
//         languageId: GlobalLists.notificationData!["language_id"] ?? "",
//         isDetailApiCalled: true,
//       ),
//     ),
//   );

//   return;
// }else{
//   Navigator.pushReplacement(
//     context,
//     MaterialPageRoute(
//       builder: (_) => Landingpage(
//         menuId: menuId,
//         shareLink: shareLink,
//         mennuLogo: mennuLogo,
//       ),
//     ),
//   );
// }
// }
  
}
