import 'package:flutter/material.dart';
import 'package:portafolio_gabriel/screens/screens.dart';

class AppRoutes {
  static const initialRoute = '/home';

  static Map<String, Widget Function(BuildContext)> routes = {
     '/home' : (BuildContext context) => HomeScreen()
  };
}
