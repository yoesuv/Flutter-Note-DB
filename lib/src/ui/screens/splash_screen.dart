import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_note/src/ui/screens/home_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  void _openHome(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Timer(const Duration(seconds: 2), () {
        Navigator.pushNamedAndRemoveUntil(
          context,
          HomeScreen.routeName,
          ModalRoute.withName('/'),
        );
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    _openHome(context);

    return Scaffold(
      body: Center(
        child: Text(
          "Flutter Note Task",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
      ),
      bottomNavigationBar: _buildVersion(),
    );
  }

  Widget _buildVersion() {
    return SizedBox(
      height: 33,
      child: Center(
        child: Text(
          "1.0.0",
          style: TextStyle(
            fontSize: 12,
          ),
        ),
      ),
    );
  }
}
