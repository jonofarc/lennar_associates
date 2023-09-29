import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:lennar_associates/login/domain/repositories/login_repository.dart';
import 'package:lennar_associates/login/domain/usecases/login_submit.dart';
import 'package:lennar_associates/login/presentation/blocs/login_bloc.dart';
import 'package:lennar_associates/shared/network/failures.dart';
import 'package:mockito/mockito.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mockito/annotations.dart';

import 'login_bloc_test.mocks.dart';

@GenerateMocks([LoginRepository, PostLoginSubmit])
void main() {
  WidgetsFlutterBinding.ensureInitialized();

  group('LoginBloc', () {
    late MockPostLoginSubmit mockPostLoginSubmit = MockPostLoginSubmit();

    blocTest<LoginBloc, LoginState>(
      'emits [LoginLoading, LoginSuccess] when LoginSubmit is added successfully',
      build: () {
        LoginBloc loginBloc = LoginBloc();
        when(mockPostLoginSubmit.execute(
                username: 'test', password: 'password'))
            .thenAnswer((_) async => Future.value(const Right(true)));

        return loginBloc;
      },
      act: (bloc) {
        bloc.add(LoginSubmit(
            userName: 'test',
            password: 'password',
            postLoginSubmit: mockPostLoginSubmit));
      },
      expect: () => [const LoginLoading(), const LoginSuccess()],
    );

    blocTest<LoginBloc, LoginState>(
      'emits [LoginLoading, LoginError] when LoginSubmit is added with an error',
      build: () {
        LoginBloc loginBloc = LoginBloc();
        when(mockPostLoginSubmit.execute(
                username: 'test', password: 'password'))
            .thenAnswer((_) => Future.value(Left(
                const LoginError(message: 'Test error')
                    as ServerFailure))); // Adjust the error as needed
        return loginBloc;
      },
      act: (bloc) => bloc.add(LoginSubmit(
          userName: 'test',
          password: 'password',
          postLoginSubmit: mockPostLoginSubmit)),
      expect: () => [
        const LoginLoading(),
        const LoginError(
          message: 'Test error',
        )
      ],
    );
  });
}
