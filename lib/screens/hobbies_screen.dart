import 'package:flutter/material.dart';
import 'package:portafolio_gabriel/models/hobby.dart';

class HobbiesScreen extends StatefulWidget {
  const HobbiesScreen({super.key});

  @override
  State<HobbiesScreen> createState() => _HobbiesScreenState();
}

class _HobbiesScreenState extends State<HobbiesScreen> {
  int? _selectedCardId;

  final List<Hobby> hobbiesList = [
    Hobby(
      id: 1,
    title: 'Música',
    subtitle: 'Escuchar y tocar',
      imagePath: 'assets/images/musica.jpg',
    description:
      'Disfruto escuchar música mientras trabajo y también practico algún instrumento.',
    ),
    Hobby(
      id: 2,
      title: 'Lectura',
    subtitle: 'Viajar sin salir de casa',
      imagePath: 'assets/images/leer.png',
    description:
      'Me gusta leer novelas, libros y mangas.',
    ),
    Hobby(
      id: 3,
      title: 'Natación',
    subtitle: 'Ejercicio para mantener el cuerpo sano',
      imagePath: 'assets/images/natación.jpg',
    description:
      'Practico natación de vez en cuando.',
    ),
    Hobby(
      id: 4,
    title: 'Programación',
    subtitle: 'Aprender y crear proyectos',
      imagePath: 'assets/images/programación.jpg',
    description:
      'Me gusta aprender a programar y crear proyectos; quiero llegar a hacer un videojuego algún día.',
    ),
    Hobby(
      id: 5,
      title: 'Videojuegos',
    subtitle: 'Recreación en casa',
      imagePath: 'assets/images/videojuegos.jpg',
    description:
      'Me gusta jugar títulos como Minecraft, War Thunder y RimWorld.',
    ),
  ];

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
                FilledButton(onPressed: onClose, child: const Text('Cerrar')),
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
