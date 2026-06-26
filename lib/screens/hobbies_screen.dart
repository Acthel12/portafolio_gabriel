import 'package:flutter/material.dart';
import 'package:portafolio_gabriel/languages/languages.dart';
import 'package:portafolio_gabriel/models/hobby.dart';

class HobbiesScreen extends StatefulWidget {
  const HobbiesScreen({super.key});

  @override
  State<HobbiesScreen> createState() => _HobbiesScreenState();
}

class _HobbiesScreenState extends State<HobbiesScreen> {
  int? _selectedCardId;

  static const List<Map<String, dynamic>> _hobbyData = [
    {
      'id': 1,
      'imagePath': 'assets/images/musica.jpg',
    },
    {
      'id': 2,
      'imagePath': 'assets/images/leer.png',
    },
    {
      'id': 3,
      'imagePath': 'assets/images/natación.jpg',
    },
    {
      'id': 4,
      'imagePath': 'assets/images/programación.jpg',
    },
    {
      'id': 5,
      'imagePath': 'assets/images/videojuegos.jpg',
    },
  ];

  List<Hobby> get hobbiesList => _hobbyData.map((hobbyData) {
        final id = hobbyData['id'] as int;
        return Hobby(
          id: id,
          title: Languages.hobbyTitle(id),
          subtitle: Languages.hobbySubtitle(id),
          imagePath: hobbyData['imagePath'] as String,
          description: Languages.hobbyDescription(id),
        );
      }).toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        padding: const EdgeInsets.all(15),
        itemCount: hobbiesList.length,
        itemBuilder: (context, index) {
          final hobby = hobbiesList[index];

          final isSelected = _selectedCardId == hobby.id;

          return Padding(
            padding: const EdgeInsets.only(bottom: 12.0),
            child: AnimatedCrossFade(
              duration: const Duration(milliseconds: 300),
              firstCurve: Curves.easeInOut,
              secondCurve: Curves.easeInOut,
              sizeCurve: Curves.easeInOut,

              firstChild: CardNonSelected(
                hobby: hobby,
                onTap: () {
                  setState(() {
                    _selectedCardId = hobby.id;
                  });
                },
              ),

              secondChild: CardSelected(
                hobby: hobby,
                onClose: () {
                  setState(() {
                    _selectedCardId = null;
                  });
                },
              ),

              crossFadeState: isSelected
                  ? CrossFadeState.showSecond
                  : CrossFadeState.showFirst,
            ),
          );
        },
      ),
    );
  }
}

class CardSelected extends StatelessWidget {
  const CardSelected({super.key, required this.hobby, required this.onClose});

  final Hobby hobby;
  final VoidCallback onClose;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      child: Column(
        children: [
          ListTile(
            title: Text(
              hobby.title,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            subtitle: Text(hobby.subtitle),
          ),
          Image.asset(
            hobby.imagePath,
            height: 200,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Text(hobby.description, textAlign: TextAlign.justify),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10, right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FilledButton(onPressed: onClose, child: Text(Languages.close())),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CardNonSelected extends StatelessWidget {
  final Hobby hobby;
  final VoidCallback onTap;

  const CardNonSelected({super.key, required this.hobby, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        hobby.title,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        hobby.subtitle,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: 80,
                child: Image.asset(hobby.imagePath, fit: BoxFit.cover),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
