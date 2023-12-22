import 'package:chapar_task/core/utils/validators.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Validator', () {
    test('Valid email should return true', () {
      const String validEmail = 'test@example.com';
      final bool result = Validator.isEmailValid(validEmail);
      expect(result, true);
    });

    test('Invalid email should return false', () {
      const String invalidEmail = 'invalid-email';
      final bool result = Validator.isEmailValid(invalidEmail);
      expect(result, false);
    });

    test('Empty email should return false', () {
      const String emptyEmail = '';
      final bool result = Validator.isEmailValid(emptyEmail);
      expect(result, false);
    });

    test('My email should return true', () {
      const String myEmail = 'sbeygi712@gmail.com';
      final bool result = Validator.isEmailValid(myEmail);
      expect(result, true);
    });
  });
}