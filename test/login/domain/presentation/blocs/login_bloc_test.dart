import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:lennar_associates/login/domain/repositories/login_repository.dart';
import 'package:lennar_associates/login/domain/usecases/login_submit.dart';
import 'package:lennar_associates/login/presentation/blocs/login_bloc.dart';
import 'package:lennar_associates/shared/network/failures.dart';
import 'package:lennar_associates/shared/utils/app_utils.dart';
import 'package:mockito/mockito.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'login_bloc_test.mocks.dart';

class MockBuildContext extends Mock implements BuildContext {}

class MockSharedPreferences extends Mock implements SharedPreferences {}

class MockLocalStorage extends Mock {}

class MockAppUtils extends Mock implements AppUtils {}

@GenerateMocks([LoginRepository, PostLoginSubmit])
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  final loginRepository = MockLoginRepository();

  group('LoginBloc', () {
    late LoginBloc loginBloc = LoginBloc();
    late MockAppUtils mockAppUtils = MockAppUtils();
    late MockPostLoginSubmit mockPostLoginSubmit = MockPostLoginSubmit();

    tearDown(() {
      loginBloc.close();
    });

    blocTest<LoginBloc, LoginState>(
      'emits [LoginLoading, LoginSuccess] when LoginSubmit is added successfully',
      /*
      build: () {
        print("1111111111");
        when(mockPostLoginSubmit.execute(
                username: 'test', password: 'password'))
            .thenAnswer((_) =>
                Future.value(Right(true))); // Ensure a non-null return value

        print("2222222222222222");
        return loginBloc;
      },

      */

      build: () {
        print("1111111111");
        when(mockPostLoginSubmit.execute(
                username: 'test', password: 'password'))
            .thenAnswer((_) async => Future.value(Right(true)));
        print("2222222222222222");
        return loginBloc;
      },
      act: (bloc) {
        print("33333333333");
        bloc.add(LoginSubmit(
            userName: 'test',
            password: 'password',
            postLoginSubmit: mockPostLoginSubmit));
        print("!!!!!!!!!!");
      },
      expect: () => [LoginLoading(), LoginSuccess()],
    );

    blocTest<LoginBloc, LoginState>(
      'emits [LoginLoading, LoginError] when LoginSubmit is added with an error',
      build: () {
        when(mockPostLoginSubmit.execute(
                username: 'test', password: 'password'))
            .thenAnswer((_) => Future.value(Left(
                LoginError(message: 'Test error')
                    as ServerFailure))); // Adjust the error as needed
        return loginBloc;
      },
      act: (bloc) => bloc.add(LoginSubmit(
          userName: 'test',
          password: 'password',
          postLoginSubmit: mockPostLoginSubmit)),
      expect: () => [LoginLoading(), LoginError(message: 'Test error')],
    );
  });
}
