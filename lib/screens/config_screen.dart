import 'package:flutter/material.dart';
import 'package:portafolio_gabriel/languages/languages.dart';
import 'package:portafolio_gabriel/main.dart';

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
    final mainAppState = MainApp.of(context);
    final currentMode = mainAppState?.themeMode ?? ThemeMode.system;
    final theme = Theme.of(context);

    return Scaffold(
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                const SizedBox(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      Languages.theme(),
                      style: theme.textTheme.headlineSmall,
                    ),
                    DropdownMenu<ThemeMode>(
                      dropdownMenuEntries: <DropdownMenuEntry<ThemeMode>>[
                        const DropdownMenuEntry<ThemeMode>(
                          value: ThemeMode.system,
                          label: 'Auto',
                        ),
                        DropdownMenuEntry<ThemeMode>(
                          value: ThemeMode.dark,
                          label: Languages.dark(),
                        ),
                        DropdownMenuEntry<ThemeMode>(
                          value: ThemeMode.light,
                          label: Languages.light(),
                        ),
                      ],
                      initialSelection: currentMode,
                      onSelected: (value) {
                        setState(() {});
                        if (value != null) {
                          mainAppState?.changeTheme(value);
                        }
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
