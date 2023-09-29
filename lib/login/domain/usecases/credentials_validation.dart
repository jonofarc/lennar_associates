import 'package:dartz/dartz.dart';
import 'package:lennar_associates/login/domain/repositories/login_repository.dart';
import 'package:lennar_associates/shared/network/failures.dart';

//Class name could be renamed to something more appropiate
class CredentialValidation {
  CredentialValidation();

  bool validateUserName({required String username}) {
    var isValid = false;
    if (username.isNotEmpty && username.length >= 8 && username.length <= 12) {
      isValid = true;
    }
    return isValid;
  }

  bool validatePassword({required String password}) {
    // Define a regular expression pattern
    //string has from 8 to 12 characters and at least a non alphanumeric value
    final pattern = RegExp(r'^(?=.*[^a-zA-Z0-9]).{9,12}$');

    return pattern.hasMatch(password);
  }
}
