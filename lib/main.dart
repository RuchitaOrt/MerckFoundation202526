import 'dart:convert';
import 'dart:io';

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import 'package:flutter/material.dart';
import 'package:merckfoundation_252026/Provider/AwardProvider.dart';
import 'package:merckfoundation_252026/Provider/CeoMessageProvider.dart';
import 'package:merckfoundation_252026/Provider/EpisodeProvider.dart';
import 'package:merckfoundation_252026/Provider/FilterProvider.dart';
import 'package:merckfoundation_252026/Provider/MediaProvider.dart';
import 'package:merckfoundation_252026/Provider/MediaListingProvider.dart';
import 'package:merckfoundation_252026/Provider/OurPartnersProvider.dart';
import 'package:merckfoundation_252026/Provider/PhotoAlbumProvider.dart';
import 'package:merckfoundation_252026/Provider/RashaInsightsProvider.dart';
import 'package:merckfoundation_252026/Provider/SearchProvider.dart';
import 'package:merckfoundation_252026/Provider/SocialProvider.dart';

import 'package:merckfoundation_252026/Provider/TestimonialProvider.dart';
import 'package:merckfoundation_252026/Provider/article_provider.dart';
import 'package:merckfoundation_252026/Provider/navbar_provider.dart';
import 'package:merckfoundation_252026/Utility/DefaultFirebaseOptions.dart';
import 'package:merckfoundation_252026/Utility/PushNotification.dart';

import 'package:merckfoundation_252026/Utility/UtilityFile.dart';

import 'package:merckfoundation_252026/Provider/CovidProvider.dart';
import 'package:merckfoundation_252026/Provider/PageProvider.dart';
import 'package:merckfoundation_252026/Provider/callforapplication_provider.dart';

import 'package:merckfoundation_252026/Provider/splash_provider.dart';
import 'package:merckfoundation_252026/routes/routers.dart';
import 'package:merckfoundation_252026/screens/MainScreens/splashScreen.dart';
import 'package:merckfoundation_252026/service/SocialMediaService.dart';
import 'package:provider/provider.dart';
final RouteObserver<ModalRoute<void>> routeObserver =
    RouteObserver<ModalRoute<void>>();
@pragma('vm:entry-point')
Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  print("Background message: ${message.notification?.title}");
}

final GlobalKey<NavigatorState> routeGlobalKey = GlobalKey();

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  // FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
   
  // await PushNotifications.localNotiInit();
  // await PushNotifications.init();
if(Platform.isAndroid){
   await Utility().loadAPIConfig();
}
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  bool isroomfound = false;
  String? roomid;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
     WidgetsBinding.instance.addPostFrameCallback((_) {
      _initializeServices();
    });
  }
@override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }
  Future<void> _initializeServices() async {
    try {
       await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
  if(Platform.isIOS){
       await Utility().loadAPIConfig();
  }

      debugPrint("INIT: API CONFIG DONE");
      debugPrint("INIT: local notification START");

      await PushNotifications.localNotiInit();

      debugPrint("INIT: local notification DONE");

      await PushNotifications.init();

      debugPrint("INIT: Push notification DONE");

  
    } catch (e, stackTrace) {
      debugPrint("INIT ERROR: $e");
      debugPrint("$stackTrace");
    }
  }
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SplashProvider()),
        ChangeNotifierProvider(create: (_) => SearchProvider()),

        /// ✅ ALSO KEEP THIS
        ChangeNotifierProvider(create: (_) => NavbarProvider()),
        ChangeNotifierProvider(
          create: (_) => SocialProvider(SocialMediaService()),
        ),

        ChangeNotifierProvider(create: (_) => ArticleProvider()),

        ChangeNotifierProvider(create: (_) => MediaProvider()),
        ChangeNotifierProvider(create: (_) => MediaListingProvider()),
        ChangeNotifierProvider(create: (_) => FilterProvider()),
        ChangeNotifierProvider(create: (_) => OurPartnersProvider()),
        ChangeNotifierProvider(create: (_) => TestimonialArticleProvider()),

        ChangeNotifierProvider(create: (_) => PhotoAlbumProvider()),
        ChangeNotifierProvider(create: (_) => EpisodeProvider()),
        ChangeNotifierProvider(create: (_) => AwardProvider()),
        ChangeNotifierProvider(create: (_) => CeoMessageProvider()),

        ChangeNotifierProvider(create: (_) => CallApplicationProvider()),
        ChangeNotifierProvider(create: (_) => PageProvider()),

        //---------------------------------------------------------------------
        ChangeNotifierProvider(
          create: (_) => CovidProvider()..loadInitialData(),
        ),
        ChangeNotifierProvider(
  create: (_) => RashaInsightsProvider(),
),
      ],
      child: MaterialApp(
          navigatorObservers: [
    routeObserver,
  ],

        title: 'Merck Foundation',
        debugShowCheckedModeBanner: false,
        builder: (context, child) {
          final data = MediaQuery.of(context);

          return MediaQuery(
            data: data.copyWith(
              textScaler: const TextScaler.linear(
                1.0,
              ), // 🔥 fixes Android font issue
            ),
            child: child!,
          );
        },
        theme: ThemeData(
          // textTheme: GoogleFonts.aBeeZeeTextTheme(),
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),

        // navigatorObservers: <NavigatorObserver>[observer],
        navigatorKey: routeGlobalKey,

        initialRoute: SplashScreen.route,
        onGenerateRoute: Routers.generateRoute,
      ),
    );
  }
}
