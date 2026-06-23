import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portafolio_gabriel/languages/languages.dart';
import 'package:url_launcher/url_launcher.dart';

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
          color: themeColors.surface.withValues(alpha: 0.9),
        ),
        children: [
          Row(
            children: [
              Text(Languages.fab1()),
              const SizedBox(width: 20),
              FloatingActionButton.small(
                child: const FaIcon(FontAwesomeIcons.info),
                onPressed: () {
                  infoAlert(
                    context,
                    Languages.fab1(),
                    'Github/Acthel12\n0416-5963628\ngecgpro12@gmail.com',
                    Languages.copy(),
                  );
                },
              ),
            ],
          ),
          Row(
            children: [
              Text(Languages.fab2()),
              const SizedBox(width: 20),
              FloatingActionButton.small(
                child: const FaIcon(FontAwesomeIcons.phoneVolume),
                onPressed: () {
                  infoAlert(
                    context,
                    Languages.fab2(),
                    '0416-5963628',
                    Languages.copy(),
                  );
                },
              ),
            ],
          ),
          Row(
            children: [
              Text(Languages.fab3()),
              const SizedBox(width: 20),
              FloatingActionButton.small(
                child: const FaIcon(FontAwesomeIcons.envelope),
                onPressed: () {
                  infoAlert(
                    context,
                    Languages.fab3(),
                    'gecgpro12@gmail.com',
                    Languages.copy(),
                  );
                },
              ),
            ],
          ),
          Row(
            children: [
              const Text('Github'),
              const SizedBox(width: 20),
              FloatingActionButton.small(
                child: const FaIcon(FontAwesomeIcons.github),
                onPressed: () {
                  infoAlert(
                    context,
                    'Github',
                    'Github/Acthel12',
                    Languages.goTo(),
                  );
                },
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
                        borderRadius: const BorderRadius.all(
                          Radius.circular(30),
                        ),
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
                        backgroundImage: const AssetImage(
                          'assets/images/perfil.png',
                        ),
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

  Future<void> _openGitHub(BuildContext context) async {
    final Uri urlGitHub = Uri.parse('https://github.com/Acthel12');
    final scaffoldMessenger = ScaffoldMessenger.of(context);

    if (await canLaunchUrl(urlGitHub)) {
      await launchUrl(urlGitHub, mode: LaunchMode.externalApplication);
    } else {
      scaffoldMessenger.showSnackBar(
        SnackBar(
          content: Text(Languages.errorURL()),
          duration: const Duration(seconds: 3),
        ),
      );
    }
  }

  Future<dynamic> infoAlert(
    BuildContext context,
    String title,
    String content,
    String actions,
  ) {
    return showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Text(title),
        content: Text(content),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              if (actions == Languages.copy()) {
                Clipboard.setData(ClipboardData(text: content));
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(Languages.copyTextSuccess()),
                    duration: const Duration(seconds: 3),
                  ),
                );
              } else {
                _openGitHub(context);
              }
              Navigator.pop(context);
            },
            child: Text(actions),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child:  Text(Languages.exit()),
          ),
        ],
      ),
    );
  }
}
