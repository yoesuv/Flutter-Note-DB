import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_note/src/core/data/constants.dart';
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
      backgroundColor: Colors.white,
      body: const SafeArea(
        child: Center(
          child: Text(
            "Flutter Note Task",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
        ),
      ),
      bottomNavigationBar: _buildVersion(),
    );
  }

  Widget _buildVersion() {
    return SizedBox(
      height: Platform.isAndroid ? 50 : 60,
      child: const Center(
        child: Text(
          appVersion,
          style: TextStyle(color: Colors.black, fontSize: 14),
        ),
      ),
    );
  }
}
