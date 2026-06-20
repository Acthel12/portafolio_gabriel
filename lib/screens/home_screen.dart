import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portafolio_gabriel/languages/languages.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.red),
      body: Stack(
        children: [
          PageView(
            children: [
              Text('A'),
              Text('B ')
            ],
          )
        ],
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: currentPageIndex,
        onDestinationSelected: (int index) =>
            setState(() => currentPageIndex = index),
        destinations: [
          NavigationDestination(
            icon: FaIcon(FontAwesomeIcons.circleUser),
            label: Languages.about(),
          ),
          NavigationDestination(
            icon: FaIcon(FontAwesomeIcons.heart),
            label: 'Hobbies',
          ),
          NavigationDestination(
            icon: FaIcon(FontAwesomeIcons.commentDots),
            label: Languages.comments(),
          ),
          NavigationDestination(
            icon: FaIcon(FontAwesomeIcons.gear),
            label: 'Hobbies',
          ),
        ],
      ),
    );
  }
}
