import 'dart:io';

import 'package:flutter/material.dart';
import 'package:merckfoundation_252026/Utility/APIManager.dart';
import 'package:merckfoundation_252026/Utility/api_result.dart';
import 'package:merckfoundation_252026/Utility/api_status.dart';
import 'package:merckfoundation_252026/Utility/showdailog.dart';
import 'package:merckfoundation_252026/model/AppVersionResponse.dart';
import 'package:merckfoundation_252026/model/SaveDeviceTokenResponse.dart';

class SplashService {
  Future<AppVersionResponse?> getAppVersion(
      BuildContext context) async {
    final ApiResult result = await APIManager().apiRequest(
      context,
      API.getappversion,
    );

    if (result.status == ApiStatus.success) {
      return result.data as AppVersionResponse;
    }

    return null;
  }

  Future<SaveDeviceTokenResponse?> saveDeviceToken(
    BuildContext context, {
    required String deviceId,
    required String fcmToken,
  }) async {
    Map<String, dynamic> body = {
      "device_id": deviceId,
      "fcm_token": fcmToken,
      "platform": Platform.isAndroid ? "android" : "ios",
    };
print(body);
    final ApiResult result = await APIManager().apiRequest(
      context,
      API.SaveUserDeviceTokenAPI,
      jsonval: body,
    );
    print("SaveFMREQUEST");
print(result);
    if (result.status == ApiStatus.success) {
        // showToast("FCM: ${result.status}");
      return result.data as SaveDeviceTokenResponse;
    }

    return null;
  }
}