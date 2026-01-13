import 'dart:async';
import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:merckfoundation_252026/const/GlobalLists.dart';

import 'package:merckfoundation_252026/data/Repository/splashRepository.dart';
import 'package:merckfoundation_252026/screens/Landingpage.dart';
// import 'package:package_info/package_info.dart';
class SplashProvider with ChangeNotifier {
  final SplashRepository repo;

  SplashProvider(this.repo);

  bool isLoading = true;
  String? appVersion;
  String? serverVersion;
  String? iosVersion;
  String? deviceId;

  Future<void> init(BuildContext context) async {
    isLoading = true;
    notifyListeners();

    await _getAppVersion();
    await _getDeviceId();
    await _checkVersionFromServer(context);

    isLoading = false;
    notifyListeners();

    _handleNavigation(context);
  }

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

  Future<void> _checkVersionFromServer(BuildContext context) async {
    final resp = await repo.checkVersion();
    serverVersion = resp.list?.version;
    iosVersion = resp.list?.iosVersion;
     _handleNavigation(context);
  }

  void _handleNavigation(BuildContext context) {
    Timer(const Duration(seconds: 2), () {
      onDoneLoading(context);
    });
  }

  Future<void> onDoneLoading(BuildContext context) async {
  
// 
    // if (token.isNotEmpty) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => Landingpage()),
      );
    // } else {
    //   Navigator.pushReplacement(
    //     context,
    //     MaterialPageRoute(builder: (_) => Dashboard(index: 0)),
    //   );
    // }
  }
}
