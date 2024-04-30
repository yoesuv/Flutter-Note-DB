import 'package:flutter/material.dart';
import 'package:flutter_note/src/core/route/app_route.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Note Task',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          color: Colors.pink,
          centerTitle: false,
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        colorScheme: ColorScheme.fromSeed(
          background: Colors.white,
          seedColor: Colors.pink,
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Colors.pink,
        ),
        useMaterial3: true,
      ),
      onGenerateRoute: AppRoute.routes,
      debugShowCheckedModeBanner: false,
    );
  }
}
