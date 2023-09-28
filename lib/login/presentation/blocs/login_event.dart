part of 'login_bloc.dart';

@immutable
abstract class LoginEvent {}

class LoginSubmit extends LoginEvent {
  final String userName;
  final String password;

  LoginSubmit(
    this.userName,
    this.password,
  );
}
