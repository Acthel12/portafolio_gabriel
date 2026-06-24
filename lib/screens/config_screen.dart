import 'package:flutter/material.dart';
import 'package:portafolio_gabriel/languages/languages.dart';

enum LanguageOptions { spanish, english }

class ConfigScreen extends StatefulWidget {
  final VoidCallback onLanguageChanged;

  const ConfigScreen({super.key, required this.onLanguageChanged});

  @override
  State<ConfigScreen> createState() => _ConfigScreenState();
}

class _ConfigScreenState extends State<ConfigScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      Languages.language(),
                      style: theme.textTheme.headlineSmall,
                    ),
                    const SizedBox(height: 20),
                    LanguagesMenu(
                      onLanguageChanged: () {
                        setState(() {});
                        widget.onLanguageChanged();
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class LanguagesMenu extends StatefulWidget {
  final VoidCallback onLanguageChanged;

  const LanguagesMenu({super.key, required this.onLanguageChanged});

  @override
  State<LanguagesMenu> createState() => _LanguagesMenuState();
}

class _LanguagesMenuState extends State<LanguagesMenu> {
  late Set<LanguageOptions> _selectedLanguage;

  @override
  void initState() {
    super.initState();
    _selectedLanguage = {
      Languages.selectedLanguageIndex == 0
          ? LanguageOptions.spanish
          : LanguageOptions.english,
    };
  }

  @override
  Widget build(BuildContext context) {
    return SegmentedButton<LanguageOptions>(
      segments: <ButtonSegment<LanguageOptions>>[
        ButtonSegment<LanguageOptions>(
          value: LanguageOptions.spanish,
          label: Text(Languages.spanish()),
          icon: const Icon(Icons.translate),
        ),
        ButtonSegment<LanguageOptions>(
          value: LanguageOptions.english,
          label: Text(Languages.english()),
          icon: const Icon(Icons.language),
        ),
      ],
      selected: _selectedLanguage,
      onSelectionChanged: (Set<LanguageOptions> newSelection) {
        setState(() {
          _selectedLanguage = newSelection;

          Languages.selectedLanguageIndex = newSelection.first.index;
        });
        widget.onLanguageChanged();
      },
    );
  }
}
