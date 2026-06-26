import 'package:flutter/material.dart';
import 'package:portafolio_gabriel/database/comment_database.dart';
import 'package:portafolio_gabriel/languages/languages.dart';
import 'package:portafolio_gabriel/models/comment.dart';

class CommentScreen extends StatefulWidget {
  const CommentScreen({super.key});

  @override
  State<CommentScreen> createState() => _CommentScreenState();
}

class _CommentScreenState extends State<CommentScreen> {
 

  bool openInputScreen = false;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController commentController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    titleController.dispose();
    commentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final currentLanguageComments = CommentDatabase.comments
        .where(
          (comment) => comment.idlanguage == Languages.selectedLanguageIndex,
        )
        .toList();

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            openInputScreen = !openInputScreen;
          });
        },
        child: openInputScreen
            ? const Icon(Icons.close)
            : const Icon(Icons.add),
      ),
      body: Stack(
        children: [
          currentLanguageComments.isEmpty
              ? Center(
                  child: Text(
                    Languages.noComments(),
                    style: TextStyle(color: Theme.of(context).primaryColor),
                  ),
                )
              : ListView.builder(
                  itemCount: currentLanguageComments.length,
                  itemBuilder: (context, index) {
                    return CommentCard(comment: currentLanguageComments[index]);
                  },
                ),
          openInputScreen
              ? Container(
                  width: double.infinity,
                  height: double.infinity,
                  color: Colors.black.withValues(alpha: 0.5),
                )
              : const SizedBox.shrink(),
          openInputScreen
              ? Container(
                  width: double.infinity,
                  height: double.infinity,
                  margin: const EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 100,
                  ),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.surface,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(Languages.newComment()),
                              const SizedBox(height: 20),
                              Row(
                                children: [
                                  ValueListenableBuilder<TextEditingValue>(
                                    valueListenable: nameController,
                                    builder: (context, value, child) {
                                      final texto = value.text.trim();
                                      return CircleAvatar(
                                        child: Text(
                                          texto.isNotEmpty
                                              ? texto[0].toUpperCase()
                                              : '?',
                                        ),
                                      );
                                    },
                                  ),
                                  const SizedBox(width: 15),
                                  Expanded(
                                    child: TextField(
                                      controller: nameController,
                                      decoration: InputDecoration(
                                        labelText: Languages.nameLabel(),
                                        filled: true,
                                        border: const OutlineInputBorder(),
                                        hintText: Languages.nameHint(),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10),
                              TextField(
                                controller: titleController,
                                decoration: InputDecoration(
                                  labelText: Languages.titleLabel(),
                                  filled: true,
                                  border: const OutlineInputBorder(),
                                  hintText: Languages.titleHint(),
                                ),
                              ),
                              const SizedBox(height: 10),
                              TextField(
                                controller: commentController,
                                keyboardType: TextInputType.multiline,
                                maxLines: 4,
                                minLines: 1,
                                decoration: InputDecoration(
                                  labelText: Languages.commentLabel(),
                                  filled: true,
                                  border: const OutlineInputBorder(),
                                  hintText: Languages.commentHint(),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      ElevatedButton(
                        onPressed: () {
                          if (nameController.text.isNotEmpty &&
                              titleController.text.isNotEmpty &&
                              commentController.text.isNotEmpty) {
                            // Ocultar el teclado al presionar el botón
                            FocusManager.instance.primaryFocus?.unfocus();

                            setState(() {
                              CommentDatabase.comments.add(
                                Comment(
                                  name: nameController.text,
                                  title: titleController.text,
                                  comment: commentController.text,
                                  idlanguage: Languages.selectedLanguageIndex,
                                ),
                              );
                              nameController.clear();
                              titleController.clear();
                              commentController.clear();
                              openInputScreen = false;
                            });
                          }
                        },
                        child: Text(Languages.publishComment()),
                      ),
                    ],
                  ),
                )
              : const SizedBox.shrink(),
        ],
      ),
    );
  }
}

class CommentCard extends StatelessWidget {
  const CommentCard({super.key, required this.comment});

  final Comment comment;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            leading: CircleAvatar(child: Text(comment.name[0])),
            title: Text(comment.title),
            subtitle: Text(comment.name),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Text(comment.comment, textAlign: TextAlign.justify),
          ),
        ],
      ),
    );
  }
}
