part of 'home_bloc.dart';

@immutable
abstract class HomeState extends Equatable {
  const HomeState();
  @override
  List<Object> get props => [];
}

class HomeInitialState extends HomeState {
  const HomeInitialState();
}

class HomeLoading extends HomeState {
  const HomeLoading();
}

class HomeSuccess extends HomeState {
  final Photos photos;
  const HomeSuccess({required this.photos});
}

class HomeError extends HomeState {
  final String message;
  const HomeError({required this.message});
}
