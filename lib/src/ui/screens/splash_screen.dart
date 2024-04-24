import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
