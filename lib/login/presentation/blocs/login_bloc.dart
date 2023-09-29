import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import 'package:flutter/material.dart';
import 'package:lennar_associates/login/domain/usecases/login_submit.dart';
import 'package:lennar_associates/shared/utils/app_utils.dart';
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
      print("4444444444444");
      final result = await event.postLoginSubmit
          .execute(username: event.userName, password: event.password);

      // final result = Right(true);
      print("66666666666");
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
