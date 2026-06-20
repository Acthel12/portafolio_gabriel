class Languages {
  static int selectedLanguageIndex = 0;

  static String about() {
    return ['Acerca de mi', 'About me'][selectedLanguageIndex];
  }
  static String comments() {
    return ['Comentarios', 'Comments'][selectedLanguageIndex];
  }
}
