class Languages {
  static int selectedLanguageIndex = 0;

  static String about() {
    return ['Acerca de mi', 'About me'][selectedLanguageIndex];
  }
  static String comments() {
    return ['Comentarios', 'Comments'][selectedLanguageIndex];
  }
  static String config() {
    return ['Configuración', 'Config'][selectedLanguageIndex];
  }
  static String description() {
    return ['Me gusta programar aplicaciones en Flutter y se un poco de Python', 'I like programming applications in Flutter and I know a little bit about Python'][selectedLanguageIndex];
  }
  static String FAB1() {
    return ['Informacion Completa', 'Complete Information'][selectedLanguageIndex];
  }
  static String FAB2() {
    return ['Teléfono', 'Phone'][selectedLanguageIndex];
  }
  static String FAB3() {
    return ['Correo', 'Mail'][selectedLanguageIndex];
  }
}
