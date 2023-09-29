part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class LoadHomeContent extends HomeEvent {
  LoadHomeContent();
}
