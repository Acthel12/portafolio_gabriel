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
  final PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose(); 
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.red),
      body: Stack(
        children: [
          PageView(
            physics: const BouncingScrollPhysics(),
            controller: _pageController,
            onPageChanged: (index) {
              setState(() => currentPageIndex = index );
            },
            children: [
              const Text('A'),
              const Text('B '),
              const Text('C'),
              const Text('D'),
            ],
          ),
        ],
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: currentPageIndex,
        onDestinationSelected: (int index) {
          //Languages.selectedLanguageIndex = Languages.selectedLanguageIndex == 1 ? 0 : 1; // Prueba de cambio de idiomas
          _pageController.animateToPage(
            index,
            duration: const Duration(milliseconds: 400),
            curve: Curves.easeInOut,
          );
        },
        destinations: [
          NavigationDestination(
            icon: const FaIcon(FontAwesomeIcons.circleUser),
            label: Languages.about(),
          ),
          const NavigationDestination(
            icon: FaIcon(FontAwesomeIcons.heart),
            label: 'Hobbies',
          ),
          NavigationDestination(
            icon: const FaIcon(FontAwesomeIcons.commentDots),
            label: Languages.comments(),
          ),
          NavigationDestination(
            icon: const FaIcon(FontAwesomeIcons.gear),
            label: Languages.config(),
          ),
        ],
      ),
    );
  }
}
