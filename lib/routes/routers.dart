import 'package:flutter/material.dart';
import 'package:merckfoundation_252026/screens/WhoWeAreScreen.dart/CommonContentPage.dart';
import 'package:merckfoundation_252026/screens/splashScreen.dart';
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

  // Define an error route for handling unknown routes
  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title: FormLabel(
              text: "Error",
              fontweight: FontWeight.w700,
            ),
          ),
          body: Center(
            child: FormLabel(
              text: 'Error: Route not found!',
              fontweight: FontWeight.w700,
            ),
          ),
        );
      },
    );
  }
}
