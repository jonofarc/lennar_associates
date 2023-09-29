// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';
import 'package:lennar_associates/login/domain/usecases/credentials_validation.dart';

void main() {
  group('CredentialValidation', () {
    final credentialValidation = CredentialValidation();

    test('validateUserName - valid username', () {
      final isValid =
          credentialValidation.validateUserName(username: 'john1234');
      expect(isValid, true);
    });

    test('validateUserName - invalid username (short)', () {
      final isValid = credentialValidation.validateUserName(username: 'abc');
      expect(isValid, false);
    });

    test('validateUserName - invalid username (long)', () {
      final isValid =
          credentialValidation.validateUserName(username: 'abcdefghijklmnop');
      expect(isValid, false);
    });

    test('validateUserName - invalid username (empty)', () {
      final isValid = credentialValidation.validateUserName(username: '');
      expect(isValid, false);
    });

    test('validatePassword - valid password', () {
      final isValid =
          credentialValidation.validatePassword(password: 'Password123!');
      expect(isValid, true);
    });

    test('validatePassword - invalid password (too short)', () {
      final isValid =
          credentialValidation.validatePassword(password: 'Pass123!');
      expect(isValid, false);
    });

    test('validatePassword - invalid password (no special character)', () {
      final isValid =
          credentialValidation.validatePassword(password: 'Password123');
      expect(isValid, false);
    });
  });
}
