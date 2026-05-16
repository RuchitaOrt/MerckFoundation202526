import 'dart:async';
import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:merckfoundation_252026/Provider/navbar_provider.dart';
import 'package:merckfoundation_252026/const/GlobalLists.dart';

import 'package:merckfoundation_252026/screens/Landingpage.dart';
import 'package:provider/provider.dart';
// import 'package:package_info/package_info.dart';
class SplashProvider with ChangeNotifier {
 


  bool isLoading = true;
  String? appVersion;
  String? serverVersion;
  String? iosVersion;
  String? deviceId;
Future<void> init(
  BuildContext context,
) async {

  isLoading = true;

  notifyListeners();

  await _getAppVersion();

  await _getDeviceId();

  await Provider.of<NavbarProvider>(
    context,
    listen: false,
  ).getNavbar(context);

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

  if (navbarProvider
      .menuList.isNotEmpty) {

    menuId = navbarProvider
        .menuList.first.id
        .toString();

    menuUrl = navbarProvider
        .menuList.first.menuUrl;
  }

  _handleNavigation(
    context,
    menuId,
    menuUrl,
  );
}
 
// Future<void> init(BuildContext context) async {
//   isLoading = true;
//   notifyListeners();

//   await _getAppVersion();
//   await _getDeviceId();

//   await Provider.of<NavbarProvider>(
//     context,
//     listen: false,
//   ).getNavbar(context);

//   isLoading = false;
//   notifyListeners();

//   final navbarProvider =
//       Provider.of<NavbarProvider>(context, listen: false);

//   /// example
//  final String menuId =
//     navbarProvider.menuList.isNotEmpty
//         ? navbarProvider.menuList.first.id.toString()
//         : "1";
//          final String shareLink =
//     navbarProvider.menuList.isNotEmpty
//         ? navbarProvider.menuList.first.menuUrl.toString()
//         : "";

//   _handleNavigation(context, menuId,shareLink);
// }
  Future<void> _getAppVersion() async {
    // final info = await PackageInfo.fromPlatform();
    // appVersion = info.version;
  }

  Future<void> _getDeviceId() async {
    final deviceInfo = DeviceInfoPlugin();

    if (Platform.isAndroid) {
      final android = await deviceInfo.androidInfo;
      deviceId = android.id;
    } else if (Platform.isIOS) {
      final ios = await deviceInfo.iosInfo;
      deviceId = ios.identifierForVendor;
    }

    GlobalLists.deviceid = deviceId ?? "";
  }

void _handleNavigation(
  BuildContext context,
  String menuId,
  String shareLink
) {
  Timer(const Duration(seconds: 2), () {
    onDoneLoading(context, menuId,shareLink);
  });
}
Future<void> onDoneLoading(
  BuildContext context,
  String menuId,
  String shareLink
) async {
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(
      builder: (_) => Landingpage(
        menuId: menuId,
        shareLink: shareLink,
      ),
    ),
  );
}
  // Future<void> onDoneLoading(BuildContext context) async {
  

  //     Navigator.pushReplacement(
  //       context,
  //       MaterialPageRoute(builder: (_) => Landingpage()),
  //     );
 
  // }
}
