import 'package:bloc/bloc.dart';

import 'package:flutter/material.dart';
import 'package:lennar_associates/home/domain/usecases/get_home_content.dart';
import 'package:lennar_associates/login/domain/usecases/login_submit.dart';
import 'package:lennar_associates/shared/utils/log.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(const HomeInitialState()) {
    on<LoadHomeContent>(_onLoadHomeContent);
  }

  void _onLoadHomeContent(
      LoadHomeContent event, Emitter<HomeState> emit) async {
    try {
      if (state is HomeLoading) {
        Log.debug("$runtimeType attempted to fetch data while loading");
        return;
      }

      emit(const HomeLoading());
      Log.debug("Attempting to login");

      final result = await GetHomeContent()
          .execute(username: event.userName, password: event.password);

      result.fold((error) {
        emit(HomeError(message: error.message));
      }, (toolsCollectionItem) => emit(const HomeSuccess()));
    } catch (e) {
      Log.debug(e.toString());
      emit(HomeError(message: e.toString()));
    }
  }
}