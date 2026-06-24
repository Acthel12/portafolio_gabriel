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
}
