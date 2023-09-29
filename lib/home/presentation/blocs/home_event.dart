part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class LoadHomeContent extends HomeEvent {
  final String userName;
  final String password;

  LoadHomeContent(
    this.userName,
    this.password,
  );
}
