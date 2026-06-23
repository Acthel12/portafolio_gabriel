import 'package:flutter/material.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portafolio_gabriel/languages/languages.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeColors = Theme.of(context).colorScheme;
    

    return Scaffold(
      floatingActionButtonLocation: ExpandableFab.location,
      floatingActionButton: ExpandableFab(
        openButtonBuilder: RotateFloatingActionButtonBuilder(
          child: const FaIcon(FontAwesomeIcons.phone),
          fabSize: ExpandableFabSize.regular,
        ),
        childrenAnimation: ExpandableFabAnimation.none,
        type: ExpandableFabType.up,
        distance: 70,
        overlayStyle: ExpandableFabOverlayStyle(
          color: Colors.white.withValues(alpha: 0.9),
        ),
        children: [
          Row(
            children: [
              Text(Languages.FAB1()),
              const SizedBox(width: 20),
              FloatingActionButton.small(
                child: const FaIcon(FontAwesomeIcons.info),
                onPressed: () {},
              ),
            ],
          ),
          Row(
            children: [
              Text(Languages.FAB2()),
              const SizedBox(width: 20),
              FloatingActionButton.small(
                child: const FaIcon(FontAwesomeIcons.phoneVolume),
                onPressed: () {},
              ),
            ],
          ),
          Row(
            children: [
              Text(Languages.FAB3()),
              const SizedBox(width: 20),
              FloatingActionButton.small(
                child: const FaIcon(FontAwesomeIcons.envelope),
                onPressed: () {},
              ),
            ],
          ),
          Row(
            children: [
              const Text('Github'),
              const SizedBox(width: 20),
              FloatingActionButton.small(
                child: const FaIcon(FontAwesomeIcons.github),
                onPressed: () {},
              ),
            ],
          ),
        ],
      ),
      body: Stack(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.only(
                top: 150,
                bottom: 80,
                right: 50,
                left: 50,
              ),
              child: Stack(
                alignment: Alignment.topCenter,
                clipBehavior: Clip.none,
                children: [
                  SizedBox.expand(
                    child: Container(
                      padding: const EdgeInsets.only(top: 130),
                      decoration: BoxDecoration(
                        color: themeColors.surfaceContainerHighest,
                        borderRadius: const BorderRadius.all(Radius.circular(30)),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Text('Gabriel Carneiro'),
                          Text(
                            Languages.description(),
                            textAlign: TextAlign.center,
                          ),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              FaIcon(FontAwesomeIcons.flutter),
                              FaIcon(FontAwesomeIcons.python),
                              FaIcon(FontAwesomeIcons.github),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: -120,
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      height: 240,
                      width: 240,
                      decoration: BoxDecoration(
                        color: themeColors.surface,
                        shape: BoxShape.circle,
                      ),
                      child: CircleAvatar(
                        backgroundColor: themeColors.secondary,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
