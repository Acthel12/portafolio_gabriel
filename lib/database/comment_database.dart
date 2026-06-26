import 'package:portafolio_gabriel/models/comment.dart';

class CommentDatabase {
  static  List<Comment> comments = [
    Comment(
      name: 'John Doe',
      title: 'Great App',
      comment: 'I really like this app!',
      idlanguage: 1,
    ),
    Comment(
      name: 'Jane Smith',
      title: 'Excelente Aplicación',
      comment: '¡Me gusta mucho esta aplicación!',
      idlanguage: 0,
    ),
  ];
}