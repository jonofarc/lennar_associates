import 'package:bloc/bloc.dart';

import 'package:flutter/material.dart';
import 'package:lennar_associates/shared/utils/log.dart';

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(const LoginInitial()) {
    on<LoginSubmit>(_onLoadCmsContent);
  }

  void _onLoadCmsContent(LoginSubmit event, Emitter<LoginState> emit) async {
    try {
      if (state is LoginLoading) {
        Log.debug("$runtimeType attempted to fetch data while loading");
        return;
      }

      emit(const LoginLoading());
      Log.debug("Attempting to login");
      //simulate login wait
      await Future.delayed(const Duration(seconds: 3));

      emit(const LoginSuccess());

      /*
      result.fold((error) {
        emit(ContentError(message: error.message));
      },
          (toolsCollectionItem) =>
              emit(ContentSuccess(toolscollectionitem: toolsCollectionItem)));

       */
    } catch (e) {
      Log.debug(e.toString());
      emit(LoginError(message: e.toString()));
    }
  }
}
