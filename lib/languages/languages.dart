class Languages {
  static int selectedLanguageIndex = 0;

  static String about() {
    return ['Acerca de mi', 'About me'][selectedLanguageIndex];
  }

  static String comments() {
    return ['Comentarios', 'Comments'][selectedLanguageIndex];
  }
  static String noComments() {
    return ['No hay comentarios', 'No comments'][selectedLanguageIndex];
  }

  static String config() {
    return ['Configuración', 'Config'][selectedLanguageIndex];
  }

  static String description() {
    return [
      'Me gusta programar aplicaciones en Flutter y se un poco de Python',
      'I like programming applications in Flutter and I know a little bit about Python',
    ][selectedLanguageIndex];
  }

  static String fab1() {
    return [
      'Informacion Completa',
      'Complete Information',
    ][selectedLanguageIndex];
  }

  static String fab2() {
    return ['Teléfono', 'Phone'][selectedLanguageIndex];
  }

  static String fab3() {
    return ['Correo', 'Mail'][selectedLanguageIndex];
  }

  static String copy() {
    return ['Copiar', 'Copy'][selectedLanguageIndex];
  }

  static String goTo() {
    return ['Ir a', 'Go to'][selectedLanguageIndex];
  }
  static String errorURL() {
    return ['Error al abrir la URL', 'Error opening URL'][selectedLanguageIndex];
  }
  static String copyTextSuccess() {
    return ['Texto copiado exitosamente', 'Text copied successfully'][selectedLanguageIndex];
  }
  static String exit() {
    return ['Salir', 'Exit'][selectedLanguageIndex];
  }
  static String language() {
    return ['Idioma', 'Language'][selectedLanguageIndex];
  }
  static String spanish() {
    return ['Español', 'Spanish'][selectedLanguageIndex];
  }
  static String english() {
    return ['Inglés', 'English'][selectedLanguageIndex];
  }
  static String dark() {
    return ['Oscuro','Dark'][selectedLanguageIndex];
  }
  static String light() {
    return ['Claro','Light'][selectedLanguageIndex];
  }
  static String theme() {
    return ['Tema','Theme'][selectedLanguageIndex];
  }

  static const List<List<String>> _hobbyTitles = [
    ['Música', 'Music'],
    ['Lectura', 'Reading'],
    ['Natación', 'Swimming'],
    ['Programación', 'Programming'],
    ['Videojuegos', 'Video games'],
  ];

  static const List<List<String>> _hobbySubtitles = [
    ['Escuchar y tocar', 'Listening and playing'],
    ['Viajar sin salir de casa', 'Travel without leaving home'],
    ['Ejercicio para mantener el cuerpo sano', 'Exercise to keep the body healthy'],
    ['Aprender y crear proyectos', 'Learning and creating projects'],
    ['Recreación en casa', 'Home recreation'],
  ];

  static const List<List<String>> _hobbyDescriptions = [
    [
      'Disfruto escuchar música mientras trabajo y también practico algún instrumento.',
      'I enjoy listening to music while I work and also playing an instrument.',
    ],
    ['Me gusta leer novelas, libros y mangas.', 'I like reading novels, books, and mangas.'],
    ['Practico natación de vez en cuando.', 'I practice swimming from time to time.'],
    [
      'Me gusta aprender a programar y crear proyectos; quiero llegar a hacer un videojuego algún día.',
      'I like learning to program and creating projects; I want to make a video game someday.',
    ],
    ['Me gusta jugar títulos como Minecraft, War Thunder y RimWorld.', 'I like playing titles such as Minecraft, War Thunder, and RimWorld.'],
  ];

  static String hobbyTitle(int id) {
    return _hobbyTitles[id - 1][selectedLanguageIndex];
  }

  static String hobbySubtitle(int id) {
    return _hobbySubtitles[id - 1][selectedLanguageIndex];
  }

  static String hobbyDescription(int id) {
    return _hobbyDescriptions[id - 1][selectedLanguageIndex];
  }

  static String close() {
    return ['Cerrar', 'Close'][selectedLanguageIndex];
  }

  static String newComment() {
    return ['Nuevo comentario', 'New comment'][selectedLanguageIndex];
  }

  static String nameLabel() {
    return ['Nombre', 'Name'][selectedLanguageIndex];
  }

  static String nameHint() {
    return ['Introduce tu nombre', 'Enter your name'][selectedLanguageIndex];
  }

  static String titleLabel() {
    return ['Título del comentario', 'Comment title'][selectedLanguageIndex];
  }

  static String titleHint() {
    return ['Introduce el título del comentario', 'Enter the comment title'][selectedLanguageIndex];
  }

  static String commentLabel() {
    return ['Comentario', 'Comment'][selectedLanguageIndex];
  }

  static String commentHint() {
    return ['Introduce tu comentario', 'Enter your comment'][selectedLanguageIndex];
  }

  static String publishComment() {
    return ['Publicar comentario', 'Publish comment'][selectedLanguageIndex];
  }
}
