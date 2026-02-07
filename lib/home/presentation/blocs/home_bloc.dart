import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:flutter/material.dart';
import 'package:lennar_associates/home/data/models/photos.dart';
import 'package:lennar_associates/home/domain/usecases/get_home_content.dart';
import 'package:lennar_associates/shared/injectable_init.dart';
import 'package:lennar_associates/shared/utils/log.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(const HomeInitialState()) {
    on<LoadHomeContent>(_onLoadHomeContent);
  }

  void _onLoadHomeContent(
      LoadHomeContent event, Emitter<HomeState> emit) async {
    final getHomeContent = serviceLocator<GetHomeContent>();

    try {
      if (state is HomeLoading) {
        Log.debug("$runtimeType attempted to fetch data while loading");
        return;
      }

      emit(const HomeLoading());
      Log.debug("fetching home content");

      final result = await getHomeContent.execute();

      result.fold((error) {
        emit(HomeError(message: error.message));
      }, (photos) => emit(HomeSuccess(photos: photos.shuffle())));
    } catch (e) {
      Log.debug(e.toString());
      emit(HomeError(message: e.toString()));
    }
  }
}
