import 'dart:convert';
import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:merckfoundation_252026/Utility/showdailog.dart';

class PushNotifications {
  static final FirebaseMessaging _messaging =
      FirebaseMessaging.instance;

  static final FlutterLocalNotificationsPlugin _fln =
      FlutterLocalNotificationsPlugin();

  static Future<void> init() async {

    await _messaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );

   // final token = await _messaging.getToken();
    try {
    final token = await _messaging.getToken();
    print("FCM TOKEN: $token");
    // showToast("FCM: $token");
  } catch (e) {
    print("TOKEN ERROR: $e");
    // showToast("ERROR: $e");
  }
    // print("🔥 FCM TOKEN: $token");

    FirebaseMessaging.onMessage.listen((message) {
      if (message.notification != null) {
        showNotification(
          title: message.notification!.title,
          body: message.notification!.body,
        );
      }
    });
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
    },
  );
}
  static Future<void> showNotification({String? title, String? body}) async {
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

    await _fln.show(0, title, body, details);
  }
}
// import 'dart:convert';
// import 'dart:io';

// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';

// class PushNotifications {
//   static  late FirebaseMessaging _messaging;
//   static final FlutterLocalNotificationsPlugin
//       _flutterLocalNotificationsPlugin =
//       FlutterLocalNotificationsPlugin();
//   static Future<void> init() async {
//       _messaging = FirebaseMessaging.instance;
//     await _messaging.requestPermission(
//       alert: true,
//       badge: true,
//       sound: true,
//     );

//     String? token = await _messaging.getToken();
//     print("FCM TOKEN: $token");

//     // Foreground messages
//     FirebaseMessaging.onMessage.listen((message) {
//       print("FOREGROUND: ${message.notification?.title}");

//       if (message.notification != null) {
//         showSimpleNotification(
//           title: message.notification!.title,
//           body: message.notification!.body,
//           payload: message.data.toString(),
//         );
//       }
//     });

//     // App opened from notification
//     FirebaseMessaging.onMessageOpenedApp.listen((message) {
//       print("CLICKED: ${message.data}");
//     });
//   }

//   static Future<void> localNotiInit() async {
//     const android = AndroidInitializationSettings('@mipmap/ic_launcher');

//     const settings = InitializationSettings(android: android);

//     await FlutterLocalNotificationsPlugin().initialize(settings);
//   }

//     static Future<void> showSimpleNotification({
//     String? title,
//     String? body,
//     String? payload,
//   }) async {
//     const AndroidNotificationDetails androidDetails =
//         AndroidNotificationDetails(
//       'channel_id',
//       'channel_name',
//       importance: Importance.max,
//       priority: Priority.high,
//     );

//     const NotificationDetails details = NotificationDetails(
//       android: androidDetails,
//       iOS: DarwinNotificationDetails(),
//     );

//     await _flutterLocalNotificationsPlugin.show(
//       0,
//       title,
//       body,
//       details,
//       payload: payload,
//     );
//   }

// }
// // import 'dart:convert';
// // import 'dart:io';

// // import 'package:firebase_messaging/firebase_messaging.dart';
// // import 'package:firebase_core/firebase_core.dart';
// // import 'package:flutter_local_notifications/flutter_local_notifications.dart';

// // import '../main.dart';
// // class PushNotifications {
// //   static final FirebaseMessaging _messaging =
// //       FirebaseMessaging.instance;

// //   static final FlutterLocalNotificationsPlugin
// //       _flutterLocalNotificationsPlugin =
// //       FlutterLocalNotificationsPlugin();

// //   static Future<void> init() async {
// //     await _messaging.requestPermission(
// //       alert: true,
// //       badge: true,
// //       sound: true,
// //     );

// //     final token = await _messaging.getToken();
// //     print("FCM TOKEN: $token");

// //     FirebaseMessaging.onMessage.listen((message) {
// //       if (message.notification != null) {
// //         showSimpleNotification(
// //           title: message.notification!.title,
// //           body: message.notification!.body,
// //           payload: message.data.toString(),
// //         );
// //       }
// //     });
// //   }

// //   //   /// 🚀 SHOW NOTIFICATION
// //   static Future<void> showSimpleNotification({
// //     String? title,
// //     String? body,
// //     String? payload,
// //   }) async {
// //     const AndroidNotificationDetails androidDetails =
// //         AndroidNotificationDetails(
// //       'channel_id',
// //       'channel_name',
// //       importance: Importance.max,
// //       priority: Priority.high,
// //     );

// //     const NotificationDetails details = NotificationDetails(
// //       android: androidDetails,
// //       iOS: DarwinNotificationDetails(),
// //     );

// //     await _flutterLocalNotificationsPlugin.show(
// //       0,
// //       title,
// //       body,
// //       details,
// //       payload: payload,
// //     );
  
// // }

// //   static Future<void> localNotiInit() async {
// //     const AndroidInitializationSettings androidInit =
// //         AndroidInitializationSettings('@mipmap/ic_launcher');

// //     final DarwinInitializationSettings iosInit =
// //         DarwinInitializationSettings();

// //      InitializationSettings initSettings = InitializationSettings(
// //       android: androidInit,
// //       iOS: iosInit,
// //     );

// //     await _flutterLocalNotificationsPlugin.initialize(
// //       initSettings,
// //       onDidReceiveNotificationResponse: (details) {
// //         print("🔔 Notification tapped: ${details.payload}");
// //       },
// //     );
// //   }
// // }
// // // class PushNotifications {
// // //   /// ✅ Lazy getter (IMPORTANT FIX)
// // //   // static FirebaseMessaging get _firebaseMessaging =>
// // //   //     FirebaseMessaging.instance;
// // // static FirebaseMessaging? _messaging;
// // // static FirebaseMessaging get _firebaseMessaging {
// // //   _messaging ??= FirebaseMessaging.instance;
// // //   return _messaging!;
// // // }
// // //   static final FlutterLocalNotificationsPlugin
// // //       _flutterLocalNotificationsPlugin =
// // //       FlutterLocalNotificationsPlugin();

// // //   /// 🚀 INIT FCM
// // //   static Future<void> init() async {
// // //     /// Request permission (iOS)
// // //     await _firebaseMessaging.requestPermission(
// // //       alert: true,
// // //       badge: true,
// // //       sound: true,
// // //     );

// // //     /// Get token safely AFTER init
// // //     final token = await _firebaseMessaging.getToken();
// // //     print("🔥 FCM TOKEN: $token");

// // //     /// Foreground messages
// // //     FirebaseMessaging.onMessage.listen((RemoteMessage message) {
// // //       print("📩 Foreground Message: ${message.notification?.title}");

// // //       if (message.notification != null) {
// // //         showSimpleNotification(
// // //           title: message.notification!.title,
// // //           body: message.notification!.body,
// // //           payload: jsonEncode(message.data),
// // //         );
// // //       }
// // //     });

// // //     /// When user taps notification
// // //     FirebaseMessaging.onMessageOpenedApp.listen((message) {
// // //       print("📲 Notification Clicked: ${message.data}");
// // //     });
// // //   }

// // //   /// 🚀 LOCAL NOTIFICATION INIT
// // //   static Future<void> localNotiInit() async {
// // //     const AndroidInitializationSettings androidInit =
// // //         AndroidInitializationSettings('@mipmap/ic_launcher');

// // //     final DarwinInitializationSettings iosInit =
// // //         DarwinInitializationSettings();

// // //      InitializationSettings initSettings = InitializationSettings(
// // //       android: androidInit,
// // //       iOS: iosInit,
// // //     );

// // //     await _flutterLocalNotificationsPlugin.initialize(
// // //       initSettings,
// // //       onDidReceiveNotificationResponse: (details) {
// // //         print("🔔 Notification tapped: ${details.payload}");
// // //       },
// // //     );
// // //   }

// // //   /// 🚀 SHOW NOTIFICATION
// // //   static Future<void> showSimpleNotification({
// // //     String? title,
// // //     String? body,
// // //     String? payload,
// // //   }) async {
// // //     const AndroidNotificationDetails androidDetails =
// // //         AndroidNotificationDetails(
// // //       'channel_id',
// // //       'channel_name',
// // //       importance: Importance.max,
// // //       priority: Priority.high,
// // //     );

// // //     const NotificationDetails details = NotificationDetails(
// // //       android: androidDetails,
// // //       iOS: DarwinNotificationDetails(),
// // //     );

// // //     await _flutterLocalNotificationsPlugin.show(
// // //       0,
// // //       title,
// // //       body,
// // //       details,
// // //       payload: payload,
// // //     );
// // //   }
// // // }
// // // // import 'dart:convert';
// // // // import 'dart:io';

// // // // import 'package:firebase_messaging/firebase_messaging.dart';
// // // // import 'package:flutter/material.dart';
// // // // import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// // // // import 'package:merckfoundation_252026/const/GlobalLists.dart';


// // // // import '../main.dart';


// // // // class PushNotifications {
// // // //   static final _firebaseMessaging = FirebaseMessaging.instance;
// // // //   static final FlutterLocalNotificationsPlugin
// // // //       _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

// // // //   // request notification permission
// // // //   static Future init() async {
// // // //     NotificationSettings settings = await _firebaseMessaging.requestPermission(
// // // //       alert: true,
// // // //       announcement: true,
// // // //       badge: true,
// // // //       carPlay: false,
// // // //       criticalAlert: false,
// // // //       provisional: false,
// // // //       sound: true,
// // // //     );
// // // //     if (settings.authorizationStatus == AuthorizationStatus.authorized) {
// // // //       try {
// // // //         final token = await _firebaseMessaging.getToken();
// // // //         await Future.delayed(Duration(milliseconds: 1500));

// // // //         if (token == null) {
// // // //           GlobalLists.fcmtokenvalue = "";
// // // //         } else {
// // // //           GlobalLists.fcmtokenvalue = token;
// // // //           print("FCM TOKEN  ${GlobalLists.fcmtokenvalue}");
// // // //         }
// // // //       } catch (e) {
// // // //         print("FCM TOKEN $e");
// // // //       }
// // // //     } else {}
// // // //   }

// // // //   static Future localNotiInit() async {
// // // //     // initialise the plugin. app_icon needs to be a added as a drawable resource to the Android head project
// // // //     const AndroidInitializationSettings initializationSettingsAndroid =
// // // //         AndroidInitializationSettings('@mipmap/ic_launcher');
// // // //     final DarwinInitializationSettings initializationSettingsDarwin =
// // // //         DarwinInitializationSettings(
// // // //       onDidReceiveLocalNotification: (id, title, body, payload) async {
// // // //         // Handle notification tap
// // // //       },
// // // //     );
// // // //     final LinuxInitializationSettings initializationSettingsLinux =
// // // //         LinuxInitializationSettings(defaultActionName: 'Open notification');
// // // //     final InitializationSettings initializationSettings =
// // // //         InitializationSettings(
// // // //             android: initializationSettingsAndroid,
// // // //             iOS: initializationSettingsDarwin,
// // // //             linux: initializationSettingsLinux);
// // // //     _flutterLocalNotificationsPlugin.initialize(initializationSettings,
// // // //         onDidReceiveNotificationResponse: onNotificationTap,
// // // //         onDidReceiveBackgroundNotificationResponse: onNotificationTap);
// // // //     // Request notification permissions for iOS (important for iOS >= 10)
// // // //     if (Platform.isIOS) {
// // // //       await _flutterLocalNotificationsPlugin
// // // //           .resolvePlatformSpecificImplementation<
// // // //               IOSFlutterLocalNotificationsPlugin>()
// // // //           ?.requestPermissions(
// // // //             alert: true,
// // // //             badge: true,
// // // //             sound: true,
// // // //           );
// // // //     }
// // // //   }

// // // //   // on tap local notification in foreground
// // // //   static void onNotificationTap(NotificationResponse notificationResponse) {
// // // //     print("Ruchita onnotificationTap ${notificationResponse}");
// // // //     print("Notification tapped with response: $notificationResponse");

// // // //     final String payload = notificationResponse.payload!;
// // // //     if (payload != null && payload.isNotEmpty) {
// // // //       print("Notification payload: $payload");
// // // //       final data = jsonDecode(payload);
// // // //       print("Navigator state: ${navigatorKey.currentState}");
// // // //       if (data['room'] != null) {
// // // //         final roomId = data['room'].toString();
// // // //         // navigatorKey.currentState?.push(MaterialPageRoute(
// // // //         //   builder: (_) => NotiDetailpage(id: roomId),
// // // //         // ));
// // // //       }
// // // //     }
// // // //   }

// // // //   static Future showSimpleNotification({
// // // //     String? title,
// // // //     String? body,
// // // //     String? payload,
// // // //   }) async {
// // // //     // Android Notification details
// // // //     const AndroidNotificationDetails androidNotificationDetails =
// // // //         AndroidNotificationDetails(
// // // //       'your channel id',
// // // //       'your channel name',
// // // //       channelDescription: 'your channel description',
// // // //       importance: Importance.max,
// // // //       priority: Priority.high,
// // // //       ticker: 'ticker',
// // // //     );

// // // //     // iOS Notification details
// // // //     const DarwinNotificationDetails iOSNotificationDetails =
// // // //         DarwinNotificationDetails(
// // // //       interruptionLevel: InterruptionLevel.timeSensitive,
// // // //       presentSound: true,
// // // //       presentAlert: true,
// // // //       presentBadge: true,
// // // //     );

// // // //     // General Notification details
// // // //     const NotificationDetails notificationDetails = NotificationDetails(
// // // //       android: androidNotificationDetails,
// // // //       iOS: iOSNotificationDetails,
// // // //     );

// // // //     await _flutterLocalNotificationsPlugin.show(
// // // //       0,
// // // //       title,
// // // //       body,
// // // //       notificationDetails,
// // // //       payload: payload,
// // // //     );
// // // //   }
// // // // }
