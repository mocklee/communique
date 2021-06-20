class InputValidator {
  static String validateName(String value) {
    if (value.isEmpty) {
      return 'Please enter your name.';
    }
    return null;
  }

  static String validateLocation(String value) {
    if (value.isEmpty) {
      return 'Let them know where you are!';
    }
    return null;
  }
}
