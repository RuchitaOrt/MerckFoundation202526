import 'dart:io';

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';
import 'package:merckfoundation_252026/Provider/AwardProvider.dart';
import 'package:merckfoundation_252026/Provider/CeoMessageProvider.dart';
import 'package:merckfoundation_252026/Provider/EpisodeProvider.dart';
import 'package:merckfoundation_252026/Provider/FilterProvider.dart';
import 'package:merckfoundation_252026/Provider/MediaProvider.dart';
import 'package:merckfoundation_252026/Provider/MediaListingProvider.dart';
import 'package:merckfoundation_252026/Provider/OurPartnersProvider.dart';
import 'package:merckfoundation_252026/Provider/PhotoAlbumProvider.dart';

import 'package:merckfoundation_252026/Provider/TestimonialProvider.dart';
import 'package:merckfoundation_252026/Provider/article_provider.dart';
import 'package:merckfoundation_252026/Provider/navbar_provider.dart';
import 'package:merckfoundation_252026/Utility/firebase_options_manual.dart';
import 'package:merckfoundation_252026/Utility/UtilityFile.dart';

import 'package:merckfoundation_252026/Provider/CovidProvider.dart';
import 'package:merckfoundation_252026/Provider/PageProvider.dart';
import 'package:merckfoundation_252026/Provider/callforapplication_provider.dart';

import 'package:merckfoundation_252026/Provider/splash_provider.dart';
import 'package:merckfoundation_252026/routes/routers.dart';
import 'package:merckfoundation_252026/screens/MainScreens/splashScreen.dart';
import 'package:provider/provider.dart';

final GlobalKey<NavigatorState> routeGlobalKey = GlobalKey();

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (Firebase.apps.isEmpty) {
    await Firebase.initializeApp(
      options: Platform.isAndroid ? DefaultFirebaseOptionsManual.android : null,
    );
  }

  FlutterError.onError = (FlutterErrorDetails details) {
    FlutterError.presentError(details);
  };

  await Utility().loadAPIConfig();

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
        ChangeNotifierProvider(create: (_) => SplashProvider()),

        /// ✅ ALSO KEEP THIS
        ChangeNotifierProvider(create: (_) => NavbarProvider()),

        ChangeNotifierProvider(create: (_) => ArticleProvider()),
        ChangeNotifierProvider(create: (_) => NavbarProvider()),
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
      ],
      child: MaterialApp(
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
        navigatorObservers: <NavigatorObserver>[observer],

        navigatorKey: routeGlobalKey,

        initialRoute: SplashScreen.route,
        onGenerateRoute: Routers.generateRoute,
      ),
    );
  }
}
