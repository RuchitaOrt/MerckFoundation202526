import 'package:flutter/material.dart';
import 'package:merckfoundation_252026/screens/MainUIBody.dart/CommonContentPage.dart';
import 'package:merckfoundation_252026/screens/MainScreens/splashScreen.dart';
import 'package:merckfoundation_252026/widgets/formLabel.dart';

class Routers {
  // Create a static method to configure the router
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case SplashScreen.route:
        return MaterialPageRoute(
          builder: (_) => SplashScreen(),
        );
          case CommonContentPage.route:
        return MaterialPageRoute(
          builder: (_) => CommonContentPage(menuID: settings.arguments as String?,shareLink: settings.arguments as String?,),
        );

      default:
        return MaterialPageRoute(builder: (_) => SplashScreen());
    }
  }

 
}
