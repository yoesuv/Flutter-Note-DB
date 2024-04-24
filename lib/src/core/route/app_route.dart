import 'package:flutter/material.dart';
import 'package:flutter_note/src/ui/screens/splash_screen.dart';

class AppRoute {
  static Route<dynamic> routes(RouteSettings settings) {
    switch (settings.name) {
      case "/":
        return MaterialPageRoute(builder: (context) {
          return const SplashScreen();
        });
      default:
        return MaterialPageRoute(builder: (context) {
          return const Scaffold(
            body: Center(
              child: Text(
                "Page Not Found",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          );
        });
    }
  }
}
