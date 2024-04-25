import 'package:flutter/material.dart';
import 'package:flutter_note/src/ui/screens/home_screen.dart';
import 'package:flutter_note/src/ui/screens/splash_screen.dart';

class AppRoute {
  static Route<dynamic> routes(RouteSettings settings) {
    switch (settings.name) {
      case "/":
        return MaterialPageRoute(builder: (context) {
          return const SplashScreen();
        });
      case HomeScreen.routeName:
        return MaterialPageRoute(builder: (context) {
          return const HomeScreen();
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
