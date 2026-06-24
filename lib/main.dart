import 'package:flutter/material.dart';
import 'package:portafolio_gabriel/routes/app_routes.dart';
import 'package:portafolio_gabriel/themes/app_themes.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppThemes.mikuLightTheme,
      darkTheme: AppThemes.tetoDarkTheme,
      debugShowCheckedModeBanner: false,
      routes: AppRoutes.routes,
      initialRoute: AppRoutes.initialRoute,
    );
  }
}
