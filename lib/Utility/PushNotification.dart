import 'dart:convert';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:merckfoundation_252026/const/GlobalLists.dart';
import 'package:merckfoundation_252026/main.dart';
import 'package:merckfoundation_252026/screens/DetailsScreen/DetailScreen.dart';

class PushNotifications {
  static final FirebaseMessaging _messaging =
      FirebaseMessaging.instance;
       String? deviceId;

  static final FlutterLocalNotificationsPlugin _fln =
      FlutterLocalNotificationsPlugin();
      static void _saveNotificationData(Map<String, dynamic> data) {
  GlobalLists.launchedFromNotification = true;
  GlobalLists.notificationData = data;
}
static void _handleNavigation(Map<String, dynamic> data) {
  print("Notification Data: $data");
   
  // GlobalLists.notificationData = data;
  // GlobalLists.launchedFromNotification = true;
  routeGlobalKey.currentState?.push(
    MaterialPageRoute(
      builder: (_) => DetailScreen(
        "",
        "",
        title: data["title"] ?? "",
        articleId: data["article_id"] ?? "",
        languageId: data["language_id"] ?? "",
        isDetailApiCalled: true,
        shareLink: data["shareLink"] ?? "",
        menuID: data["menuID"] ?? "",
        isComingFromNotication:true
      ),
    ),
  );
}
  static Future<void> init() async {

    await _messaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    ); 
FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
   print("========== BACKGROUND TAP ==========");
  print("Data : ${message.data}");
  print("Data JSON : ${jsonEncode(message.data)}");
  print("===================================");

  _handleNavigation(message.data);
});
   // final token = await _messaging.getToken();
    try {
      if (Platform.isIOS) {
  String? apnsToken;

  while (apnsToken == null) {
    await Future.delayed(
      const Duration(seconds: 1),
    );

    apnsToken =
        await _messaging.getAPNSToken();

    print("APNS = $apnsToken");
  }
}

    final token = await _messaging.getToken();
    
    GlobalLists.fcmtokenvalue=token!;
    print("FCM TOKEN: $token");
  //  showToast("FCM: $token");
    if (token != null && token.isNotEmpty) {

        GlobalLists.fcmtokenvalue = token;

        print("FCM TOKEN : $token");
 print("deviceid : ${GlobalLists.deviceid},");
        // await SplashService().saveDeviceToken(
        //   routeGlobalKey.currentContext!,
        //   deviceId: GlobalLists.deviceid,
        //   fcmToken: token,
        // );
      }
  } catch (e) {
    print("TOKEN ERROR: ${e.toString()}");
    // showToast("ERROR: $e");
  }
    // print("🔥 FCM TOKEN: $token");

    FirebaseMessaging.onMessage.listen((message) {
      if (message.notification != null) {
         print("========== FOREGROUND ==========");
  print("Title: ${message.notification?.title}");
  print("Body : ${message.notification?.body}");
  print("Data : ${message.data}");
  print("Data JSON : ${jsonEncode(message.data)}");
  print("===============================");

        showNotification(
          title: message.notification!.title,
          body: message.notification!.body,
            payload: jsonEncode(message.data),
        );
      }
    });

    RemoteMessage? initialMessage =
    await FirebaseMessaging.instance.getInitialMessage();

if (initialMessage != null) {
 
    print("========== TERMINATED ==========");
  print("Data : ${initialMessage.data}");
  print("Data JSON : ${jsonEncode(initialMessage.data)}");
  print("===============================");

  _saveNotificationData(initialMessage.data);

}
  }
static Future<void> localNotiInit() async {
  const AndroidInitializationSettings androidSettings =
      AndroidInitializationSettings('@mipmap/ic_launcher');

  const DarwinInitializationSettings iosSettings =
      DarwinInitializationSettings(
    requestAlertPermission: true,
    requestBadgePermission: true,
    requestSoundPermission: true,
  );

  const InitializationSettings settings = InitializationSettings(
    android: androidSettings,
    iOS: iosSettings,
  );

  await _fln.initialize(
    settings,
    onDidReceiveNotificationResponse: (details) {
      print("Notification tapped: ${details.payload}");
      if (details.payload != null) {
    final data = jsonDecode(details.payload!);

    _handleNavigation(data);
  }
    },
  );
}
  static Future<void> showNotification({String? title, String? body,  String? payload,}) async {
    const androidDetails = AndroidNotificationDetails(
      'channel_id',
      'channel_name',
      importance: Importance.max,
      priority: Priority.high,
    );

   const details = NotificationDetails(
  android: androidDetails,
  iOS: DarwinNotificationDetails(),
);

    await _fln.show(0, title, body, details, payload: payload,);
  }
}
