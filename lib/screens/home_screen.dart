import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatefulWidget {
   
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
      ),
      body: Center(
         child: Text('A'),
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: currentPageIndex,
        onDestinationSelected: (int index) => setState(() => currentPageIndex = index),
        destinations: [
          NavigationDestination(icon: FaIcon(FontAwesomeIcons.person), label:  'A'),
          NavigationDestination(icon: FaIcon(FontAwesomeIcons.person), label:  'A'),
        ],
      ),
    );
  }
}

