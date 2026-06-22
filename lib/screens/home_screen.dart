import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portafolio_gabriel/languages/languages.dart';
import 'package:portafolio_gabriel/screens/about_screen.dart';
import 'package:portafolio_gabriel/screens/comment_screen.dart';
import 'package:portafolio_gabriel/screens/config_screen.dart';
import 'package:portafolio_gabriel/screens/hobbies_screen.dart';
import 'package:portafolio_gabriel/widgets/widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentPageIndex = 0;
  final PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: <PreferredSizeWidget>[
        CustomAppBar(
          icon: FontAwesomeIcons.circleUser,
          text: Languages.about(),
        ),
        const CustomAppBar(icon: FontAwesomeIcons.heart, text: 'Hobbies'),
        CustomAppBar(
          icon: FontAwesomeIcons.commentDots,
          text: Languages.comments(),
        ),
        CustomAppBar2(icon: Icons.settings_outlined, text: Languages.config()),
      ][_currentPageIndex],
      body: Stack(
        children: [
          PageView(
            physics: const BouncingScrollPhysics(),
            controller: _pageController,
            onPageChanged: (index) {
              setState(() => _currentPageIndex = index);
            },
            children: [
              const AboutScreen(),
              const HobbiesScreen(),
              const CommentScreen(),
              const ConfigScreen(),
            ],
          ),
        ],
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _currentPageIndex,
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
            selectedIcon: const FaIcon(FontAwesomeIcons.solidCircleUser),
            icon: const FaIcon(FontAwesomeIcons.circleUser),
            label: Languages.about(),
          ),
          const NavigationDestination(
            selectedIcon: FaIcon(FontAwesomeIcons.solidHeart),
            icon: FaIcon(FontAwesomeIcons.heart),
            label: 'Hobbies',
          ),
          NavigationDestination(
            selectedIcon: const FaIcon(FontAwesomeIcons.solidCommentDots),
            icon: const FaIcon(FontAwesomeIcons.commentDots),
            label: Languages.comments(),
          ),
          NavigationDestination(
            icon: const Icon(Icons.settings_outlined),
            selectedIcon: const Icon(Icons.settings),
            label: Languages.config(),
          ),
        ],
      ),
    );
  }
}
