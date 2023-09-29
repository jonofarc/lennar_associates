part of 'login_bloc.dart';

@immutable
abstract class LoginEvent {}

class LoginSubmit extends LoginEvent {
  final String userName;
  final String password;
  final PostLoginSubmit postLoginSubmit;

  LoginSubmit({
    required this.userName,
    required this.password,
    required this.postLoginSubmit,
  });
}
