import 'package:flutter/material.dart';
import 'package:flutter_note/src/core/route/app_route.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Note Task',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          background: Colors.white,
          seedColor: Colors.pink,
        ),
        useMaterial3: true,
      ),
      onGenerateRoute: AppRoute.routes,
    );
  }
}
