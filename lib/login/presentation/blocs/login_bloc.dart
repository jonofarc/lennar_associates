import 'package:bloc/bloc.dart';

import 'package:flutter/material.dart';
import 'package:lennar_associates/login/domain/usecases/login_submit.dart';
import 'package:lennar_associates/shared/utils/log.dart';

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(const LoginInitial()) {
    on<LoginSubmit>(_onLoginSubmit);
  }

  void _onLoginSubmit(LoginSubmit event, Emitter<LoginState> emit) async {
    try {
      if (state is LoginLoading) {
        Log.debug("$runtimeType attempted to fetch data while loading");
        return;
      }

      emit(const LoginLoading());
      Log.debug("Attempting to login");

      final result = await PostLoginSubmit()
          .execute(username: event.userName, password: event.password);

      // emit(const LoginSuccess());

      result.fold((error) {
        emit(LoginError(message: error.message));
      }, (toolsCollectionItem) => emit(const LoginSuccess()));
    } catch (e) {
      Log.debug(e.toString());
      emit(LoginError(message: e.toString()));
    }
  }
}
