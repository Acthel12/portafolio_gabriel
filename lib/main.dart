import 'package:flutter/material.dart';
import 'package:portafolio_gabriel/routes/app_routes.dart';
import 'package:portafolio_gabriel/themes/app_themes.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => MainAppState();

  static MainAppState? of(BuildContext context) =>
    context.findAncestorStateOfType<MainAppState>();
  
}

class MainAppState extends State<MainApp> {
  ThemeMode themeMode = ThemeMode.system;

  void changeTheme(ThemeMode mode) {
    setState(() {
      themeMode = mode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: themeMode,
      theme: AppThemes.mikuLightTheme,
      darkTheme: AppThemes.tetoDarkTheme,
      debugShowCheckedModeBanner: false,
      routes: AppRoutes.routes,
      initialRoute: AppRoutes.initialRoute,
    );
  }
}
