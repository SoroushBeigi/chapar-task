class Validator {
  static bool isEmailValid(String email) {
    //Using RegEX to validate email
    final bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
    return emailValid;
  }

  static bool isPasswordValid(String password) {
    //We are not going to overengineer User's password here (for obvious UX reasons),
    //So a basic length check is fine
    return password.length >= 4;
  }
}
