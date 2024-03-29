import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:flutter/material.dart';
import 'package:lennar_associates/login/domain/usecases/login_submit.dart';
import 'package:lennar_associates/shared/injectable_init.dart';
import 'package:lennar_associates/shared/utils/app_utils.dart';
import 'package:lennar_associates/shared/utils/log.dart';

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(const LoginInitial()) {
    on<LoginSubmit>(_onLoginSubmit);
  }

  void _onLoginSubmit(LoginSubmit event, Emitter<LoginState> emit) async {
    final postLoginSubmit = serviceLocator<PostLoginSubmit>();
    try {
      if (state is LoginLoading) {
        Log.debug("$runtimeType attempted to fetch data while loading");
        return;
      }

      emit(const LoginLoading());
      Log.debug("Attempting to login");

      final result = await postLoginSubmit.execute(
          username: event.userName, password: event.password);
      final appUtils = AppUtils();

      result.fold((error) {
        //an error occurred clear stored credentials
        appUtils.clearCredentials();
        emit(LoginError(message: error.message));
      }, (toolsCollectionItem) {
        //store credentials on successful login
        appUtils.storeCredentials(
            userName: event.userName, password: event.password);
        emit(const LoginSuccess());
      });
    } catch (e) {
      Log.debug(e.toString());
      emit(LoginError(message: e.toString()));
    }
  }
}
