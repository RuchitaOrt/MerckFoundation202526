import 'dart:io';

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';
import 'package:merckfoundation_252026/Utility/firebase_options_manual.dart';
import 'package:merckfoundation_252026/data/Repository/splashRepository.dart';

import 'package:merckfoundation_252026/providers/CovidProvider.dart';
import 'package:merckfoundation_252026/providers/callforapplication_provider.dart';
import 'package:merckfoundation_252026/providers/digital_library_provider.dart';
import 'package:merckfoundation_252026/providers/home_provider.dart';
import 'package:merckfoundation_252026/providers/newsrelease_provider.dart';
import 'package:merckfoundation_252026/providers/our_award_provider.dart';
import 'package:merckfoundation_252026/providers/ouractivities_provider.dart';
import 'package:merckfoundation_252026/providers/photogallery_provider.dart';
import 'package:merckfoundation_252026/providers/program_provider.dart';
import 'package:merckfoundation_252026/providers/splash_provider.dart';
import 'package:merckfoundation_252026/providers/stories_provider.dart';
import 'package:merckfoundation_252026/routes/routers.dart';
import 'package:merckfoundation_252026/screens/splashScreen.dart';
import 'package:provider/provider.dart';

final GlobalKey<NavigatorState> routeGlobalKey = GlobalKey();

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (Firebase.apps.isEmpty) {
    await Firebase.initializeApp(
      options: Platform.isAndroid ? DefaultFirebaseOptionsManual.android : null,
    );
  }

  //   await Firebase.initializeApp(
  //   options: DefaultFirebaseOptionsManual.android,
  // );

  FlutterError.onError = (FlutterErrorDetails details) {
    FlutterError.presentError(details);
  };

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  bool isroomfound = false;
  String? roomid;
  static FirebaseAnalytics analytics = FirebaseAnalytics.instance;
  static FirebaseAnalyticsObserver observer = FirebaseAnalyticsObserver(
    analytics: analytics,
  );

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => SplashProvider(SplashRepository()),
        ),
        ChangeNotifierProvider(create: (_) => HomeSliderProvider()),
        ChangeNotifierProvider(create: (_) => StoriesProvider()),
        ChangeNotifierProvider(create: (_) => ProgramProvider()),
        ChangeNotifierProvider(create: (_) => CallApplicationProvider()),
        ChangeNotifierProvider(create: (_) => DigitalLibraryProvider()),
        ChangeNotifierProvider(create: (_) => PhotoGalleryProvider()),
        ChangeNotifierProvider(create: (_) => NewsReleaseProvider()),
        ChangeNotifierProvider(create: (_) => OurActivityProvider()),
        ChangeNotifierProvider(create: (_) => OurAwardProvider()),
        ChangeNotifierProvider(
          create: (_) => CovidProvider()..loadInitialData(),
        ),
      ],
      child: MaterialApp(
        title: 'Merck Foundation',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        navigatorObservers: <NavigatorObserver>[observer],

        navigatorKey: routeGlobalKey,

        initialRoute: SplashScreen.route,
        onGenerateRoute: Routers.generateRoute,
      ),
    );
  }
}
